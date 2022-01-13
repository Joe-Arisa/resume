package com.test.ssm.service;

import com.test.ssm.domain.Picture;

public interface PictureService {
    /**
     * 1.查找照片，并返回照片
     *
     * @param email
     * @return
     */

    Picture findPictureByEmail(String email);


    /**
     * 2.保存照片
     */
    int addPicture(String email, String picture);

    /**
     * 3.修改图片
     */
    public void alterPicture(String email, String picture);
}
