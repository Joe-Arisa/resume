package com.test.ssm.dao;

import com.test.ssm.domain.Picture;
import org.apache.ibatis.annotations.Param;

public interface PictureDao {

    /**
     * 1.查询图片
     */
    Picture selectPictureByEmail(String email);

    /**
     * 2.存入图片
     */
    int insertPicture(@Param("email") String email, @Param("image")String image);

    /**
     * 3.替换图片
     */
    int updatePicture(@Param("email") String email, @Param("image")String image);
}
