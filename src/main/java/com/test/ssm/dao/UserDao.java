package com.test.ssm.dao;

import com.test.ssm.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Dao：对数据库的操作
 */
//UserDao不会被加入到容器，Spring会帮我们自动创建一个UserDao的实现类加入到容器中
public interface UserDao {
    /**
     * 1.查找用户名和密码,用于登录
     */
    User findByEmail(String email);

    /**
     * 2.注册用户
     */
    void regist(User user);
}
