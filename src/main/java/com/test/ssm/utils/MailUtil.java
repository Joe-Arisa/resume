package com.test.ssm.utils;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

public class MailUtil {

    private static String myEmailAccount = "";//这里需要写入自己的邮箱服务器
    private static String authorizationCode = "IZNFEXFOYVBQNDHW";
    private static String myEmailSMTPHost = "smtp.126.com";
    private static String msgTitle = "智慧简历生成系统注册验证码";

    private static boolean isSendEmail = false;
    private String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public MailUtil() {
    }

    public Boolean sendEMail(String email) {
        System.out.println("进入MailUtils层");
        Boolean success = false;
        //1.创建参数配置，用于连接邮件服务器的参数配置
        Properties props = new Properties();
        //发送协议名称
        props.setProperty("mail.transport.protocol", "smtp");
//        props.put("mail.smtp.ssl.enable", true);
        //设置邮箱服务器主机名
        props.setProperty("mail.smtp.host", myEmailSMTPHost);
        props.setProperty("mail.smtp.auth", "true");

        /**SSL认证，注意腾讯邮箱是基于SSL的，所以需要开启才可以使用**/
        MailSSLSocketFactory sf = null;
        try {
            sf = new MailSSLSocketFactory();
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        }
        sf.setTrustAllHosts(true);
        //设置是否使用ssl安全连接（一般都使用）
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.socketFactory", sf);

        //2.根据配置创建会话对象，用于和邮件服务器交互
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("liyuancloud", authorizationCode);
            }
        });
        // 设置为debug模式，可以查看详细的发生log
        session.setDebug(true);

        //3.创建一封邮件
        MimeMessage message = null;
        try {
            message = createMimeMessage(session, myEmailAccount,email);
            if (message != null) {
                System.out.println("信息发送成功");
                isSendEmail = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        //4.根据Session获取邮件传输对象
//        Transport transport = session.getTransport();

        //5.使用邮箱账号和密码连接邮件服务器，这里认证的邮箱必须与message中的发件人邮箱一致
//        transport.connect(myEmailAccount, myEmailPassword);

        //6.发送邮件   message.getAllRecipients()获取道德是在创建邮件对象时添加的所有收件人
        if (isSendEmail) {
            try {

                Transport.send(message, message.getAllRecipients());
            } catch (MessagingException e) {
                e.printStackTrace();
            }
            return true;
        } else {
            return false;
        }

    }

    private MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail) {
        //1.创建一封邮件
        MimeMessage message = new MimeMessage(session);

        //2.From:发件人
        try {
            message.setFrom(new InternetAddress(sendMail, "蓝岛环境数据平台", "UTF-8"));
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        //3.To:收件人
        try {
            message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "landao用户", "UTF-8"));
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        //4.Subject:邮件主题
        try {
            message.setSubject(msgTitle, "UTF-8");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        //5.Content:邮件正文
        try {
            code = getContent();
            message.setContent(code , "text/html;charset=UTF-8");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        //6.设置发件时间
        try {
            message.setSentDate(new Date());
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        //7.保存设置
        try {
            message.saveChanges();
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return message;
    }

    /**
     * 这个是得到的随机数；
     *
     * @return
     */
    public static String getContent() {
        Random r = new Random();
        String a = Integer.toString(r.nextInt(1000) + 9000);
        return a;
    }
}
