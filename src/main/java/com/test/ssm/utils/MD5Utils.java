package com.test.ssm.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 密码加密测试成功！！！
 */

public class MD5Utils {

    public static String str2MD5(String strs) {

        /**
         *加密需要使用JDK提供的类
         */
        StringBuffer stringBuffer = new StringBuffer();
        try {
            /*MessageDigest类：单向文本加密，不论输入的文本多长，输出固定长度的hash值*/
            MessageDigest digest = MessageDigest.getInstance("MD5");
            /*调用digest()方法后，会将MessgeDigest对象的状态重置为初始化状态*/
            byte[] bs = digest.digest(strs.getBytes());

            for (byte b : bs) {
                int x = b & 255;
                String s = Integer.toHexString(x);
                if (x < 16) {
                    stringBuffer.append("0");
                }
                stringBuffer.append(s);
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        System.out.println("1111111111111111111111111111111111111111111");
        return stringBuffer.toString();
    }


}
