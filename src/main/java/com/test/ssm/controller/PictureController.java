package com.test.ssm.controller;

import com.test.ssm.domain.AjaxResult;
import com.test.ssm.domain.Picture;
import com.test.ssm.domain.User;
import com.test.ssm.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;

@Controller
@RequestMapping("/picture")
public class PictureController {
    @Autowired
    private PictureService pictureService;

    /**
     * 1.查找图片，接收来自后端的照片，并转换成图片传给前端
     */
    @GetMapping("/query")
    public void query(HttpServletRequest request, HttpServletResponse response) {
        User user;
        user = (User)request.getSession().getAttribute("user");
        String email = user.getEmail();
        try {
            Picture picture = pictureService.findPictureByEmail(email);

            String img = picture.getImage();
            //java8解码使用
            Base64.Decoder decoder1 = Base64.getDecoder();
            byte[] bytes = decoder1.decode(img);
            for (int i = 0; i < bytes.length; i++) {
                if (bytes[i] < 0) {
                    bytes[i] += 256;
                }
            }
            response.setContentType("img/jpeg");
            ServletOutputStream out = response.getOutputStream();
            out.write(bytes);
            out.flush();
            out.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 3.修改或新增图片
     */
    @PostMapping("/save")
    public void save(HttpServletRequest request,@RequestParam("file") MultipartFile file) throws Exception {
        User user;
        user = (User)request.getSession().getAttribute("user");
        Picture picture = new Picture(user.getEmail());

        if (!file.isEmpty()) {
            //java8编码使用
            Base64.Encoder encoder1 = Base64.getEncoder();
            //编码
            String img = encoder1.encodeToString(file.getBytes());

            picture.setImage(img);

            Picture pic = pictureService.findPictureByEmail(picture.getEmail());
            if(pic != null){
                pictureService.alterPicture(picture.getEmail(),picture.getImage());
            }else{
                int rows = pictureService.addPicture(picture.getEmail(),picture.getImage());
                System.out.println("PictureController uploadPic() rows:" + rows);
            }
        }
    }

}
