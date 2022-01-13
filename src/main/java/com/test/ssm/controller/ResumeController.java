package com.test.ssm.controller;

import com.test.ssm.domain.AjaxResult;
import com.test.ssm.domain.Resume;
import com.test.ssm.domain.User;
import com.test.ssm.service.ResumeService;
import com.test.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author ：Arisa
 * @description：TODO
 * @date ：2022/1/5 10:15
 */
@Controller
@RequestMapping("/resume")
public class ResumeController {

    @Autowired
    private ResumeService resumeService;

    /**
     * 保存简历
     */
    @PostMapping("/save")
    @ResponseBody
    public AjaxResult save(HttpServletRequest request, Resume resume){
        int rows = 0;

        User user;
        user = (User) request.getSession().getAttribute("user");
        Resume resume1 = resumeService.findResume(user.getEmail());
        if(resume1!=null){
            resume.setUserEmail(user.getEmail());
            rows = resumeService.saveResume(resume);
        }else{
            resume.setUserEmail(user.getEmail());
            rows = resumeService.addResume(resume);
        }

        AjaxResult ajax = AjaxResult.success();
        if(rows==0){
            ajax.put("isSave", false);
        }else{
            ajax.put("isSave", true);
        }

        return ajax;
    }

    /**
     * 获取简历
     */
    @GetMapping("/get")
    @ResponseBody
    public AjaxResult get(HttpServletRequest request){
        User user;
        user = (User) request.getSession().getAttribute("user");
        Resume resume = resumeService.findResume(user.getEmail());

        AjaxResult ajax = AjaxResult.success();
        ajax.put("resume", resume);
        return ajax;
    }
}
