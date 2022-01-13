package com.test.ssm.service.impl;

import com.test.ssm.dao.PictureDao;
import com.test.ssm.domain.Picture;
import com.test.ssm.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PictureServiceImpl implements PictureService {

    private PictureDao pictureDao;

    @Autowired
    public void setPictureDao(PictureDao pictureDao) {
        this.pictureDao = pictureDao;
    }

    /**
     * 1.查找照片，并返回Picture实体对象
     *
     * @param email
     * @return
     */
    @Override
    public Picture findPictureByEmail(String email) {
        Picture pic = pictureDao.selectPictureByEmail(email);
        return pictureDao.selectPictureByEmail(email);
    }

    /**
     * 2.存入照片
     */
    @Override
    public int addPicture(String email, String picture) {
        System.out.println("PictureServiceImpl addPicture() email: " + email);
        return pictureDao.insertPicture(email, picture);
    }

    /**
     * 3.修改图片
     */
    public void alterPicture(String email, String picture) {
        pictureDao.updatePicture(email, picture);
    }
}
