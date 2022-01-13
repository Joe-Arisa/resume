package com.test.ssm.domain;

import org.springframework.stereotype.Component;

@Component  // 将这个实体类加入到Spring容器
public class Picture {
    private Long id;
    private String email;
    private String image;

    public Picture() {
    }

    public Picture(String email) {
        this.email = email;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }


    @Override
    public String toString() {
        return "Picture{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", image=" + image +
                '}';
    }
}
