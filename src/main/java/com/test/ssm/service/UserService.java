package com.test.ssm.service;

import com.test.ssm.domain.User;

import java.util.List;

//写一个Service层的接口 目的： 解耦和，只需要知道Service提供什么方法即可
public interface UserService {

    /**
     * 1.login用户登录
     */
    Boolean checkLogin(String email, String password);

    /**
     * 2.用户注册
     */
    int regist(User user, String vfCode);

    /**
     * 发送验证码
     */
    Boolean sendCode(String email);
}
