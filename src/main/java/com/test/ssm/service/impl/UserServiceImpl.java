package com.test.ssm.service.impl;

import com.test.ssm.dao.UserDao;
import com.test.ssm.domain.User;
import com.test.ssm.service.UserService;
import com.test.ssm.utils.MD5Utils;
import com.test.ssm.utils.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired  //自动从Spring容器中获取匹配的JavaBean放入
    private UserDao userDao;

    MailUtil mailUtil = new MailUtil();

    /**
     * 1.登录check user login,判断用户是否存在,判断的是加密完成的。
     */
    public Boolean checkLogin(String email, String password) {
        User user = userDao.findByEmail(email);
        if (user != null && user.getPassword().equals(MD5Utils.str2MD5(password))) {
            return true;
        } else {
            return false;
        }
//        System.out.println("UserServiceImpl checkLogin() equalResult:" + user.getPassword().equals(password));
//        if (user != null && user.getPassword().equals(password)) {
//            return true;
//        } else {
//            return false;
//        }
    }

    /**
     * 2.注册用户
     *
     * @param user
     * @return
     */
    @Override
    public int regist(User user, String vfCode) {
        User user1 = userDao.findByEmail(user.getEmail());
        int success = 0;
        /**
         * 先判断该用户是否已经存在,并且判断验证码是否正确
         */
        System.out.println("user1: " + user1);
        System.out.println(user1!=null);
        System.out.println(mailUtil.getCode());
        System.out.println(vfCode);

        if(user1!=null){
            success = 2;
        }else{
            if(mailUtil.getCode().equals(vfCode)){
                success = 1;
                user.setPassword(MD5Utils.str2MD5(user.getPassword()));
                userDao.regist(user);
            }else{
                success = 3;
            }
        }

        return success;
    }

    @Override
    public Boolean sendCode(String email) {
        Boolean flag = true;
        try{
            flag = mailUtil.sendEMail(email);
        } catch (Exception e){
            System.out.println(e);
        }
        return flag;
    }
}
