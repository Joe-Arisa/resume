<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />

    <!-- import CSS -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resume</title>
    <link rel="shortcut icon" href="../../resources/img/favicon.png" type="image/png"/>
    <link rel="stylesheet" href="resources/css/index_style.css">
    <link rel="stylesheet" href="resources/iconfont/iconfont.css">
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
</head>
<body>
<div class='container' id='container'>
    <div class="form-container sign-up-container">
        <!-- 注册 -->
        <form action="#">
            <h1>用户注册</h1>
            <input type="text" id="reg_email" placeholder="邮箱" onblur="checkMail('reg_email', 'reg_div_email')"/>
            <div id="reg_div_email" style="width: 90%"></div>
            <input id="reg_password" type="password" placeholder="输入长度为6至16位英文数字组合密码" onblur="checkPassword('reg_password', 'reg_div_password')">
            <div id="reg_div_password" style="width: 90%"></div>
            <input id="re_password" type="password" placeholder="再次输入密码" onblur="checkRePassword('reg_password', 're_password', 're_div_password')">
            <div id="re_div_password" style="width: 90%"></div>
            <button type="button" id="send_code" onclick="sendVFCode()">发送验证码</button>
            <div id="send_btn_div" style="width: 90%"></div>
            <input  id="code" type="email"placeholder="验证码">
            <div id="send_code_div" style="width: 90%"></div>
            <button type="button" id="register" onclick="toRegister()">注册</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <!-- 登陆 -->
        <form>
            <h1>用户登陆</h1>
            <input type="text" id="email" placeholder="邮箱" onblur="checkMail('email', 'div_email')"/>
            <div id="div_email" style="width: 90%"></div>
            <input type="password" id="password"placeholder="密码"/>
            <div id="div_password" style="width: 90%"></div>
<%--            <a href="#">忘记密码？</a>--%>
            <button id="login" onclick="toLogin()" type="button">登陆</button>
        </form>
    </div>
    <!-- 侧边栏内容 -->
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>已有帐号？</h1>
                <p>点我前往登录！</p>
                <button class='ghost' id="signIn">前往登陆</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>没有帐号？</h1>
                <p>点击注册去注册一个属于你的账号！</p>
                <button class='ghost' id="signUp" type="button">前往注册</button>
            </div>
        </div>
    </div>
</div>
</body>

<%--<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>--%>
<!-- JavaScripts -->
<script src="../../resources/js/jquery-3.4.1.min.js"></script>
<!-- import Vue before Element -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<!-- import JavaScript -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="resources/js/3.1.1/layer.js"></script>
<script>
    const container2 = document.querySelector('#container');
    const signInButton2 = document.querySelector('#signIn');
    const signUpButton2 = document.querySelector('#signUp');
    signUpButton2.addEventListener('click', () => container2.classList.add
    ('right-panel-active'));
    signInButton2.addEventListener('click', () => container2.classList.remove
    ('right-panel-active'));

    /**
     *密码校验
     **/
    function checkPassword(elementId, divId){
        //获取密码输入
        var pwd = document.getElementById(elementId).value;
        var span = document.getElementById(divId);

        if(elementId = 'reg_password'){
            checkRePassword('reg_password', 're_password', 're_div_password')
        }

        if(pwd!=""){
            var strRegex = /(?=.{6,16})(?=.*\d)(?=.*[a-z])[\x20-\x7f]*/i;
            if(!strRegex.test(pwd)){
                document.getElementById(elementId).style.border = "1px solid red";
                document.getElementById(elementId).style.borderLeft = "none";
                document.getElementById(elementId).style.borderRight = "none";
                document.getElementById(elementId).style.borderTop = "none";
                span.innerHTML = "<font color='red' size='1'>密码为6至16位英文数字组合</font>";
                return false;
            }
            document.getElementById(elementId).style.border = "1px solid #ccc";
            document.getElementById(elementId).style.borderLeft = "none";
            document.getElementById(elementId).style.borderRight = "none";
            document.getElementById(elementId).style.borderTop = "none";
            span.innerHTML = "<font color='red' size='1'></font>";
            return true;
        }
    }

    /**
     *确认密码校验
     **/
    function checkRePassword(elementId, reElementId, divId){
        //获取密码输入
        var uPass = document.getElementById(elementId).value;

        //获取确认密码输入
        var uRePass = document.getElementById(reElementId).value;


        var div = document.getElementById(divId);

        //对密码输入进行校验
        if(uPass != uRePass){
            div.innerHTML = "<font color='red' size='1'>两次密码不一致</font>";
            return false;
        }else{
            div.innerHTML = "";
            return true;
        }
    }

    /**
     *正则校验邮箱
     **/
    function checkEmail(mail){//校验邮箱
        if(mail!=""){
            var strRegex = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
            if(!strRegex.test(mail)){
                return false;
            }
        }
        return true;
    }

    /**
     *校验邮箱
     **/
    function checkMail(elementId, divId){
        var email = document.getElementById(elementId).value;

        var flag = checkEmail(email);

        var div = document.getElementById(divId);
        //对邮箱输入进行校验
        if(!flag){
            document.getElementById(elementId).style.border = "1px solid red";
            document.getElementById(elementId).style.borderLeft = "none";
            document.getElementById(elementId).style.borderRight = "none";
            document.getElementById(elementId).style.borderTop = "none";
            div.innerHTML = "<font color='red' size='1'>邮箱格式错误</font>";
            return false;
        }else{
            document.getElementById(elementId).style.border = "1px solid #ccc";
            document.getElementById(elementId).style.borderLeft = "none";
            document.getElementById(elementId).style.borderRight = "none";
            document.getElementById(elementId).style.borderTop = "none";
            div.innerHTML = "<font color='red' size='1'></font>";
            return true;
        }
    }

    /**
     * 登录前检测
     */
    function checkLogin(){
        let flag =  true;
        if(document.getElementById('email').value == ""){
            document.getElementById('div_email').innerHTML = "<font color='red' size='1'>邮箱不可为空</font>";
            flag = false;
        }
        if(document.getElementById('password').value == ""){
            document.getElementById('div_password').innerHTML = "<font color='red' size='1'>密码不可为空</font>";
            flag = false;
        }
        return flag;
    }

    /**
     * 注册前检测
     */
    function checkRegister(){
        let flag = true;
        if(!(checkMail('reg_email', 'reg_div_email')
            && checkPassword('reg_password', 'reg_div_password')
            && checkRePassword('reg_password', 're_password', 're_div_password'))){
            flag = false;
        }

        if(document.getElementById('reg_email').value == ""){
            document.getElementById("reg_div_email").innerHTML = "<font color='red' size='1'>邮箱不可为空</font>";
            flag = false;
        }
        if(document.getElementById('reg_password').value == ""){
            document.getElementById('reg_div_password').innerHTML = "<font color='red' size='1'>密码不可为空</font>";
            flag = false;
        }
        if(document.getElementById('code').value == ""){
            document.getElementById('send_code_div').innerHTML = "<font color='red' size='1'>验证码不可为空</font>";
            flag = false;
        }

        return flag
    }

    toLogin = function(){
        if(!checkLogin()){
            window.event.returnValue = false;
            return false
        }
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;
        var data={"email":email, "password":password}
        $.ajax({
            type: "post",
            url: "http://localhost:8080/user/login",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            data: data,
            success: function (res) {
                res = JSON.parse(res)
                if(res.isLogin == true){
                    window.location.href = '/user/main';
                }else{
                    layer.open({
                        content: '邮箱或密码不正确',
                    });
                }
            },error:function (res){
                layer.open({
                    content: '登录失败，请检查网络',
                });
            }
        });
    };

    toRegister = function(){
        if(!checkRegister()){
            return false;
        }
        var email = document.getElementById('reg_email').value;
        var password = document.getElementById('reg_password').value;
        var vfCode = document.getElementById('code').value;
        var data={"email":email, "password":password, "vfCode":vfCode}
        $.ajax({
            type: "post",
            url: "http://localhost:8080/user/add",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            data: data,
            success: function (res) {
                res = JSON.parse(res)
                if(res.result == "注册成功"){
                    layer.open({
                        content: '注册成功',
                        time:5,
                    });
                    window.location.href = 'http://localhost:8080';
                }else {
                    layer.open({
                        content: res.result,
                    });
                }
            },error:function (res){
                layer.open({
                    content: '注册成功，请检查网络',
                });
            }
        });
    }

    function uploadFile() {
        let myForm = new FormData();
        myForm.append('file', '../../resources/img/avatar-11.jpg');
        myForm.entries = 'multipart/form-data';
        console.log(myForm)
        $.ajax({
            url: "http://localhost:8080/picture/save",
            type: "POST",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: myForm,
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data);
            },
            error: function (data) {
                console.log(data)
            }
        });
    }

    sendVFCode = function () {
        if (document.getElementById('reg_email').value == "") {
            layer.open({
                content: '请填写邮箱',
            });
            return false;
        }

        setTime(document.getElementById("send_btn_div"));
        document.getElementById("send_code").style.display = 'none'

        let data = {"email": document.getElementById('reg_email').value}
        $.ajax({
            type: "post",
            url: "http://localhost:8080/user/sendCode",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: data,
            success: function (res) {
                res = JSON.parse(res)
                if (res.isSend == true) {

                } else {
                    layer.open({
                        content: '发送失败，请重新尝试！'
                    });
                }
            }, error: function (res) {
                layer.open({
                    content: '发送失败，请检查网络！'
                });
            }
        });
    }

    let countdown = 10;

    function setTime(val) {
        if (countdown == 0) {
            console.log("setTime=0")
            document.getElementById("send_code").style.display = 'block'
            val.innerHTML = "<font color='blue' size='1'></font>";
            countdown = 10;
        } else {
            if (countdown == 10) {
                val.innerHTML = "<font color='blue' size='1'>请10秒后重新发送</font>";
            } else if (countdown == 9) {
                val.innerHTML = "<font color='blue' size='1'>请9秒后重新发送</font>";
            } else if (countdown == 8) {
                val.innerHTML = "<font color='blue' size='1'>请8秒后重新发送</font>";
            } else if (countdown == 7) {
                val.innerHTML = "<font color='blue' size='1'>请7秒后重新发送</font>";
            } else if (countdown == 6) {
                val.innerHTML = "<font color='blue' size='1'>请6秒后重新发送</font>";
            }else if (countdown == 5) {
                val.innerHTML = "<font color='blue' size='1'>请5秒后重新发送</font>";
            } else if (countdown == 4) {
                val.innerHTML = "<font color='blue' size='1'>请4秒后重新发送</font>";
            } else if (countdown == 3) {
                val.innerHTML = "<font color='blue' size='1'>请3秒后重新发送</font>";
            } else if (countdown == 2) {
                val.innerHTML = "<font color='blue' size='1'>请2秒后重新发送</font>";
            } else if (countdown == 1) {
                val.innerHTML = "<font color='blue' size='1'>请1秒后重新发送</font>";
            }

            countdown--;
            setTimeout(function () {
                setTime(val)
            }, 1000)
        }
    }
</script>
</html>
