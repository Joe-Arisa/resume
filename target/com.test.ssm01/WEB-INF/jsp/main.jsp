<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8" />
    <title>Resume</title>
    <link rel="shortcut icon" href="../../resources/img/favicon.png" type="image/png"/>

    <!-- Meta Data -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="format-detection" content="telephone=no"/>
    <meta name="format-detection" content="address=no"/>
    <meta name="author" content="ArtTemplate" />
    <meta name="description" content="resume" />

    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="../../resources/css/style.css"/>

</head>
<body class="bg-triangles" onload="loadResumeData()">
    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader__wrap">
            <div class="circle-pulse">
                <div class="circle-pulse__1"></div>
                <div class="circle-pulse__2"></div>
            </div>
            <div class="preloader__progress"><span></span></div>
        </div>
    </div>

    <main class="main">
        <div class="container gutter-top">
            <div class="row sticky-parent">
                <!-- Sidebar -->
                <aside class="col-12 col-md-12 col-xl-3">
                    <div class="sidebar box pb-0 sticky-column">
                        <svg class="avatar avatar--180" viewBox="0 0 188 188">
                            <g class="avatar__box">
                                <image xlink:href="../../resources/img/avatar-1.png" id="zeroImg" style="height:100%;width:100%"></image>
                            </g>
                        </svg>

                        <div class="sidebar__info box-inner box-inner--rounded">
                            <a class="btn btn--blue-gradient" style="margin-bottom: 20px;" href="#" onclick="downloadPDF()"><i class="font-icon icon-download"></i> 下载简历</a>
<%--                            <a class="btn btn--blue-gradient" style="margin-bottom: 20px;" href="#" onclick="saveResume()"><i class="font-icon icon-send"></i>保存简历</a>--%>
                            <a class="btn btn--blue-gradient" href="#" id="load"><i class="font-icon icon-send"></i>上传头像</a>
                            <div id="tip_div" style="width: 50%"></div>
<%--                            <input type="file" id="imgFile" name="img" value="" style="visibility:hidden" accept="image/png, image/jpeg, image/gif, image/jpg" onchange="changePic()">--%>
                        </div>
                    </div>
                </aside>

                <!-- Content -->
                <div class="col-12 col-md-12 col-xl-9">
                    <div class="box">
                        <div class="download">
                            <div style="width: 100%; display: table-cell;">
                                <!-- About -->
                                <div class="pb-2" style="display: inline-block;">
                                    <h1 class="title title--h1 title__separate">个人简历</h1>
                                </div>
<%--                                <img src="../../resources/img/avatar-11.jpg" id="file" height="15%" width="15%" style="display: inline-block; float: right; border-radius: 0.937rem;"/>--%>
                                <img src="http://localhost:8080/picture/query" id="file" height="15%" width="15%" style="display: inline-block; float: right; border-radius: 0.937rem;"/>

                            </div>

                            <!-- 个人信息 -->
                            <h2 class="title title--h3" >个人信息</h2>

                            <div>
                                <div>
                                    <label >姓名:</label>
                                    <input class="input form-control" id="name" placeholder="Name" onblur="saveResume()">
                                </div>
                                <div>
                                    <label >性别:</label>
                                    <input class="input form-control" id="gender" placeholder="Gender" onblur="saveResume()">
                                </div>
                                <div>
                                    <label >年龄:</label>
                                    <input class="input form-control" id="years" placeholder="Years" onblur="saveResume()">
                                </div>
                                <div>
                                    <label >电话:</label>
                                    <input class="input form-control" id="phone" placeholder="Phone" onblur="saveResume()">
                                </div>
                                <div>
                                    <label >邮箱:</label>
                                    <input class="input form-control" id="email" placeholder="Email" onblur="saveResume()">
                                </div>
                                <div>
                                    <label >个人简介:</label>
                                    <textarea class="textarea form-control" id="personalMessage" name="messageContact" placeholder="Personal Message"  rows="5" required="required" onblur="saveResume()"></textarea>
                                </div>
                            </div>

                            <!-- 教育背景 -->
                            <br>
                            <h2 class="title title--h3">教育背景</h2>
                            <div>
                                <div>
                                    <label >就读学校:</label>
                                    <input class="input form-control" id="university" placeholder="University" onblur="saveResume()">
                                </div>
                                <div>
                                    <label >所学专业:</label>
                                    <input class="input form-control" id="profession" placeholder="Profession" onblur="saveResume()">
                                </div>
                                <div>
                                    <label >学历学位:</label>
                                    <input class="input form-control" id="degree" placeholder="Degree" onblur="saveResume()">
                                </div>
                            </div>

                            <!-- 工作经历 -->
                            <br>
                            <h2 class="title title--h3">工作经历</h2>
                            <div>
                                <div>
                                    <label >曾就职公司:</label>
                                    <input class="input form-control" id="company" placeholder="Company" onblur="saveResume()">
                                </div>
                                <div>
                                    <label >曾就职岗位:</label>
                                    <input class="input form-control" id="station" placeholder="Station" onblur="saveResume()">
                                </div>
                                <div>
                                    <label >项目经验:</label>
                                    <textarea class="textarea form-control" id="projectExperience" name="messageContact" placeholder="Project Experience"  rows="5" required="required" onblur="saveResume()"></textarea>
                                </div>
                            </div>

                            <!-- 求职意向 -->
                            <br>
                            <h2 class="title title--h3">求职意向</h2>
                            <div>
                                <div>
                                    <label >求职岗位:</label>
                                    <input class="input form-control" id="expectStation" placeholder="Expect Station" onblur="saveResume()">
                                </div>
                                <div>
                                    <label >期望月薪:</label>
                                    <input class="input form-control" id="expectWage" placeholder="Expect Wage" onblur="saveResume()">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                    </div>
                    <!-- Footer -->
                    <footer class="footer">&nbsp;</footer>
                </div>
            </div>
        </div>
    </main>

    <!-- SVG masks -->
    <svg class="svg-defs">
        <clipPath id="avatar-box">
            <path d="M1.85379 38.4859C2.9221 18.6653 18.6653 2.92275 38.4858 1.85453 56.0986.905299 77.2792 0 94 0c16.721 0 37.901.905299 55.514 1.85453 19.821 1.06822 35.564 16.81077 36.632 36.63137C187.095 56.0922 188 77.267 188 94c0 16.733-.905 37.908-1.854 55.514-1.068 19.821-16.811 35.563-36.632 36.631C131.901 187.095 110.721 188 94 188c-16.7208 0-37.9014-.905-55.5142-1.855-19.8205-1.068-35.5637-16.81-36.63201-36.631C.904831 131.908 0 110.733 0 94c0-16.733.904831-37.9078 1.85379-55.5141z"/>
        </clipPath>
        <clipPath id="avatar-hexagon">
            <path d="M0 27.2891c0-4.6662 2.4889-8.976 6.52491-11.2986L31.308 1.72845c3.98-2.290382 8.8697-2.305446 12.8637-.03963l25.234 14.31558C73.4807 18.3162 76 22.6478 76 27.3426V56.684c0 4.6805-2.5041 9.0013-6.5597 11.3186L44.4317 82.2915c-3.9869 2.278-8.8765 2.278-12.8634 0L6.55974 68.0026C2.50414 65.6853 0 61.3645 0 56.684V27.2891z"/>
        </clipPath>
    </svg>

</body>
<!-- JavaScripts -->
<script src="../../resources/js/jquery-3.4.1.min.js"></script>
<!-- 下面这俩是导出PDF用的 -->
<script src="https://cdn.bootcss.com/html2canvas/0.5.0-beta4/html2canvas.js"></script>
<script src="https://cdn.bootcss.com/jspdf/1.3.4/jspdf.debug.js"></script>
<script src="../../resources/js/3.1.1/layer.js"></script>
<script>

    /*#load:为按钮,点击后生成一个隐藏的input file标签*/
    $('#load').after('<input type="file" id="load_xls" name="file" style="display:none" onchange ="uploadFile()">');
    $('#load').click(function(){
        document.getElementById("load_xls").click();
    });
    function uploadFile() {
        let myForm = new FormData();
        myForm.append('file', $("#load_xls")[0].files[0]);
        myForm.entries = 'multipart/form-data';
        console.log(myForm)
        $.ajax({
            url: "http://localhost:8080/picture/save",
            type: "POST",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            data: myForm,
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data);
            },
            error:function(data){
                console.log(data)
            }
        });

        let reads= new FileReader();
        f=document.getElementById('load_xls').files[0];
        reads.readAsDataURL(f);

        reads.onload=function (e) {
            document.getElementById('file').src=this.result;
            console.log(this.result)
        };
    }

    /**
     * 加载简历和头像数据
     **/
    loadResumeData = function (){
        $.ajax({
            type: "get",
            url: "http://localhost:8080/resume/get",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            success: function (res) {
                res = JSON.parse(res)
                putData(res.resume);
            },error:function (res){
                alert("网络异常!")
            }
        });
    }

    /**
     * 传入数据
     **/
    function putData(resume){
        assign('name', resume.userName);
        assign('gender', resume.gender);
        assign('years', resume.years);
        assign('phone', resume.phone);
        assign('email', resume.email);
        assign('personalMessage', resume.personalMessage);

        assign('university', resume.university);
        assign('profession', resume.profession);
        assign('degree', resume.learnDegree);

        assign('company', resume.company);
        assign('station', resume.station);
        assign('projectExperience', resume.projectExperience);

        assign('expectStation', resume.expectStation);
        assign('expectWage', resume.expectWage);
    }

    /**
     * 传入时判定
     **/
    function assign(name, value){
        if(value !== undefined){
            document.getElementById(name).value = value
        }
    }

    //导出PDF方法
    function downloadPDF() {
        //先找到要导出表格的父元素:right-aside,其他啥也不用改了，点击按钮调用这个方法就可以了
        var target = document.getElementsByClassName("box")[1];
        target.style.background = "#FFFFFF";

        html2canvas(target, {
            onrendered: function (canvas) {
                var contentWidth = canvas.width;
                var contentHeight = canvas.height;

                //一页pdf显示html页面生成的canvas高度;
                var pageHeight = contentWidth / 592.28 * 841.89;
                //未生成pdf的html页面高度
                var leftHeight = contentHeight;
                //页面偏移
                var position = 0;
                //a4纸的尺寸[595.28,841.89]，html页面生成的canvas在pdf中图片的宽高
                var imgWidth = 595.28;
                var imgHeight = 592.28 / contentWidth * contentHeight;

                var pageData = canvas.toDataURL('image/jpeg', 1.0);

                var pdf = new jsPDF('', 'pt', 'a4');

                //有两个高度需要区分，一个是html页面的实际高度，和生成pdf的页面高度(841.89)
                //当内容未超过pdf一页显示的范围，无需分页
                if (leftHeight < pageHeight) {
                    pdf.addImage(pageData, 'JPEG', 0, 0, imgWidth, imgHeight);
                } else {
                    while (leftHeight > 0) {
                        pdf.addImage(pageData, 'JPEG', 0, position, imgWidth, imgHeight)
                        leftHeight -= pageHeight;
                        position -= 841.89;
                        //避免添加空白页
                        if (leftHeight > 0) {
                            pdf.addPage();
                        }
                    }
                }

                pdf.save("resume.pdf");
            }
        })
    }

    /**
     * 保存简历
     */
    function saveResume(){
        document.getElementById('tip_div').innerHTML = "<font color='#87ceeb' size='2' style='text-align:center'>正在保存简历...</font>";
        let userName = document.getElementById('name').value;
        let gender = document.getElementById('gender').value;
        let years = document.getElementById('years').value;
        let phone = document.getElementById('phone').value;
        let email = document.getElementById('email').value;
        let personalMessage = document.getElementById('personalMessage').value;

        let university = document.getElementById('university').value;
        let profession = document.getElementById('profession').value;
        let learnDegree = document.getElementById('degree').value;

        let company = document.getElementById('company').value;
        let station = document.getElementById('station').value;
        let projectExperience = document.getElementById('projectExperience').value;

        let expectStation = document.getElementById('expectStation').value;
        let expectWage = document.getElementById('expectWage').value;

        let data = {"userName":userName, "gender":gender, "years":years, "phone":phone
                    ,"personalMessage":personalMessage, "university":university, "profession":profession
                    ,"learnDegree":learnDegree, "company":company, "station":station, "projectExperience":projectExperience
                    ,"expectStation":expectStation, "expectWage":expectWage, "email":email}
        $.ajax({
            type: "post",
            url: "http://localhost:8080/resume/save",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            data: data,
            success: function (res) {
                res = JSON.parse(res)
                if(res.isSave == true){
                    document.getElementById('tip_div').innerHTML = "<font color='#87ceeb' size='2' style='text-align:center'>简历已保存</font>";
                }else{
                    alert("自动保存失败，请检查网络")
                }
            },error:function (res){
                alert("自动保存失败，请检查网络")
            }
        });
    }

</script>
<script src="../../resources/js/plugins.js"></script>
<script src="../../resources/js/common.js"></script>

</html>
