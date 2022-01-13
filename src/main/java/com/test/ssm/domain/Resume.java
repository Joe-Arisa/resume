package com.test.ssm.domain;

import org.springframework.stereotype.Component;

/**
 * @author ：Arisa
 * @description：TODO
 * @date ：2022/1/6 9:01
 */
@Component
public class Resume {
    private String userEmail;
    private String userName;
    private String gender;
    private String years;
    private String phone;
    private String email;
    private String personalMessage;
    private String university;
    private String profession;
    private String learnDegree;
    private String company;
    private String station;
    private String projectExperience;
    private String expectStation;
    private String expectWage;

    public Resume() {
    }

    public Resume(String userEmail, String userName, String gender, String years, String phone, String email, String personalMessage, String university, String profession, String learnDegree, String company, String station, String projectExperience, String expectStation, String expectWage) {
        this.userEmail = userEmail;
        this.userName = userName;
        this.gender = gender;
        this.years = years;
        this.phone = phone;
        this.email = email;
        this.personalMessage = personalMessage;
        this.university = university;
        this.profession = profession;
        this.learnDegree = learnDegree;
        this.company = company;
        this.station = station;
        this.projectExperience = projectExperience;
        this.expectStation = expectStation;
        this.expectWage = expectWage;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getYears() {
        return years;
    }

    public void setYears(String years) {
        this.years = years;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPersonalMessage() {
        return personalMessage;
    }

    public void setPersonalMessage(String personalMessage) {
        this.personalMessage = personalMessage;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getLearnDegree() {
        return learnDegree;
    }

    public void setLearnDegree(String learnDegree) {
        this.learnDegree = learnDegree;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getStation() {
        return station;
    }

    public void setStation(String station) {
        this.station = station;
    }

    public String getProjectExperience() {
        return projectExperience;
    }

    public void setProjectExperience(String projectExperience) {
        this.projectExperience = projectExperience;
    }

    public String getExpectStation() {
        return expectStation;
    }

    public void setExpectStation(String expectStation) {
        this.expectStation = expectStation;
    }

    public String getExpectWage() {
        return expectWage;
    }

    public void setExpectWage(String expectWage) {
        this.expectWage = expectWage;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    @Override
    public String toString() {
        return "Resume{" +
                "userEmail='" + userEmail + '\'' +
                ", userName='" + userName + '\'' +
                ", gender='" + gender + '\'' +
                ", years='" + years + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", personalMessage='" + personalMessage + '\'' +
                ", university='" + university + '\'' +
                ", profession='" + profession + '\'' +
                ", learnDegree='" + learnDegree + '\'' +
                ", company='" + company + '\'' +
                ", station='" + station + '\'' +
                ", projectExperience='" + projectExperience + '\'' +
                ", expectStation='" + expectStation + '\'' +
                ", expectWage='" + expectWage + '\'' +
                '}';
    }
}
