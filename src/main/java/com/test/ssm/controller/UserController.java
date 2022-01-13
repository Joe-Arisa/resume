package com.test.ssm.controller;

import com.test.ssm.domain.AjaxResult;
import com.test.ssm.domain.User;
import com.test.ssm.service.PictureService;
import com.test.ssm.service.UserService;
import com.test.ssm.utils.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller //将该控制器的一个实体加入到容器
@RequestMapping("/user")    //请求路径的映射
public class UserController {

    @Autowired  //自动注入
    UserService userService;

    @Autowired  //自动注入
    PictureService pictureService;

    private String sendEmail;

    /**
     * 返回到主界面
     */
    @RequestMapping("/main")
    public String main() {
        return "main";
    }

    /**
     * 返回新增界面
     */
    @RequestMapping("/addPage")
    public String addPage() {
        return "addPage";
    }


    /*表单提交的路径，检查密码是否正确；*/
    @PostMapping("/login")
    @ResponseBody
    public AjaxResult checkLogin(HttpServletRequest request, User user) {
        //调用service方法
        Boolean flag = userService.checkLogin(user.getEmail(), user.getPassword());
        AjaxResult ajax = AjaxResult.success();

        if (flag) {
            ajax.put("isLogin", true);
            request.getSession().setAttribute("user",user);
//            session.setAttribute("user",user);
//            session.setAttribute("user",user.getEmail());
        }else{
            ajax.put("isLogin", false);
        }
        return ajax;
    }

    /**
     * 2.用户注册
     *
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult add(User user, String vfCode) {
        System.out.println("UserController add() user: " + user.toString());
        System.out.println("UserController add() vfCode: " + vfCode);
        sendEmail = user.getEmail();
        int res = userService.regist(user, vfCode);
        AjaxResult ajax = AjaxResult.success();

        if (res == 0) {
            ajax.put("result","系统异常");
        } else if (res == 1) {
            ajax.put("result","注册成功");
        } else if (res == 2) {
            ajax.put("result","该邮箱已被注册");
        } else if(res == 3){
            ajax.put("result","验证码错误");
        }
        return ajax;
    }

    /**
     * 用户注册用于进行发送email进行验证码,用来调用方法
     */
    public String email() {
        return sendEmail;
    }

    /**
     * 用户注册用于进行发送email进行验证码,用来调用方法
     */
    @RequestMapping("/sendCode")
    @ResponseBody
    public AjaxResult sendCode(String email) {
        Boolean flag = userService.sendCode(email);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("isSend", flag);
        return ajax;
    }
}
