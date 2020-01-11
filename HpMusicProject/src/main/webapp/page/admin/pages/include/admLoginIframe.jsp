<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/25
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>Qiaole黑怕-管理员登录界面</title>
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/css/video-js.min.css">
    <link rel="stylesheet" href="<%=path%>/css/admstyle.css">
    <script src="<%=path%>/js/jquery-3.3.1.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <script src="<%=path%>/layer/layer.js"></script>
    <script src="<%=path%>/js/video.min.js"></script>
</head>
<style>
    /*layer skin*/
    body .myStyle {
        background-color: rgba(0, 0, 0, 0.5);
        color: white;
        border: none;
    }
</style>
<body>
<div id="admLogin-left-content">
    <video id="my-video" class="video-js" autoplay="true" loop="true"
           style="height: 100%;width: 170px;object-fit:fill"
           poster="MY_VIDEO_POSTER.jpg" data-setup="{}">
        <source src="<%=path%>/images/mv/mv1.mp4" type="video/mp4">
    </video>
</div>

<div id="admLogin-right-content">
    <!--Qiaole图标-->
    <div id="headIcon" align="center">
        <img src="<%=path%>/images/admin/admUser.png" width="44" height="42">
    </div>
    <hr>

    <!--帐号-->
    <div class="form-group row login-text">
        <div class="col-md-5">
            <label for="loginAct" class="col-form-label"><strong>帐号</strong></label>
        </div>

        <div class="col-md-7">
            <input type="text" class="form-control log-text" id="loginAct" name="admuer_act" placeholder="请输入账号">
        </div>
    </div>
    <!--密码-->
    <div class="form-group row login-text">
        <div class="col-md-5">
            <label for="loginPwd" class="col-form-label "><strong>密码</strong></label>
        </div>
        <div class="input-group col-md-7">
            <input type="password" class="form-control log-text" id="loginPwd" name="admuer_pwd"
                   placeholder="请输入密码">
        </div>
    </div>
    <!--验证码-->
    <div class="form-group row login-text">
        <div class="col-md-5">
            <label for="verificationCode" class="col-form-label"><strong>验证码</strong></label>
        </div>
        <div class="input-group col-md-7">
            <input type="text" class="form-control log-text" id="verificationCode"
                   placeholder="请输入右侧的验证码">
            <div id="verifCode" class="input-group-prepend">
                <a class="changeCode" href="#">
                    <img src="<%=path%>/admin/CheckCode" style="height:38px">
                </a>
            </div>
        </div>
    </div>
    <!--登录按钮-->
    <div class="form-group row">
        <div class="col-md ">
            <button type="button" id="bt-login" class="btn btn-primary"><strong>登录</strong></button>
        </div>
    </div>
</div>

<div id="log-icon2">
    <img src="<%=path%>/images/main/icon2.png">
</div>

<script src="<%=path%>/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        // 登录
        $("#bt-login").click(function () {
            login()
        })
        $("#loginAct").keydown(function (e) {
            keyCod(e)
        })
        $("#loginPwd").keydown(function (e) {
            keyCod(e)
        })
        $("#verificationCode").keydown(function (e) {
            keyCod(e)
        })

        //切换验证码
        $(".changeCode").click(function () {
            $(".changeCode img").attr("src", "<%=path%>/admin/CheckCode?" + new Date().getTime())
        })
    })

    //js
    function keyCod(e) {
        var e = e.keyCode
        switch (e) {
            case 13:
                login()
                break
            case 108:
                login()
                break
            default:
                break
        }
    }

    function login() {
        var admuer_act = $('#loginAct').val();
        var admuer_pwd = $('#loginPwd').val();
        var verifContent = $("#verificationCode").val();
        if (admuer_act === '' || admuer_pwd === '') {
            layer.msg('<span style="font-size:17px">帐号或密码为空,请重新输入</span>', {
                offset: '100px',
                anim: 6,
                time: 1200,
                skin: 'myStyle'
            });
        } else if (verifContent === '') {
            layer.msg('<span style="font-size:17px;margin-left: 18px;">请输入验证码</span>', {
                offset: '100px',
                anim: 6,
                time: 1200,
                skin: 'myStyle'
            });
        } else {
            $.ajax({
                type: 'post',
                url: '<%=path%>/admin/loginAdminUser',
                data: {
                    admuer_act: admuer_act,
                    admuer_pwd: admuer_pwd,
                    verifContent: verifContent
                },
                dataType: 'json',
                success: function (data) {
                    if (data.stateCode.trim() === "null") {
                        layer.msg('<span style="font-size:17px">账号不存在</span>', {
                            offset: '80px',
                            anim: 6,
                            time: 1200,
                        });
                    }
                    if (data.stateCode.trim() === "0") {
                        layer.msg('<span style="font-size:17px">账号或密码错误,请重新输入</span>', {
                            offset: '100px',
                            anim: 6,
                            time: 1200,
                            skin: 'myStyle'
                        });
                    }
                    if (data.stateCode.trim() === "1") {
                        layer.load();
                        setTimeout(function () {
                            layer.closeAll('loading');
                            parent.location.href='<%=path%>/page/admin/pages/admMain.jsp'
                        }, 1200);

                    }
                    if (data.stateCode.trim() === "codeError") {
                        layer.msg('<span style="font-size:17px">验证码错误,请重新输入</span>', {
                            offset: '100px',
                            anim: 6,
                            time: 1200,
                            skin: 'myStyle'
                        });
                    }
                    if (data.stateCode.trim() === "404") {
                        parent.location.href = "<%=path%>/page/error/serviceError.jsp"
                    }
                }
            })
        }
    }
</script>
</body>
</html>

