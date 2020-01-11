<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/css/video-js.min.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">
    <script src="<%=path%>/js/jquery-3.3.1.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <script src="<%=path%>/js/video.min.js"></script>
    <style>
        /*layer skin*/
        body .myStyle {
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
        }
    </style>
</head>
<body>
<div id="register-left-content">
    <video id="my-video" class="video-js" preload="auto"
           autoplay="true" loop="true"
           style="height: 100%;width: 212px;  object-fit:fill"
           poster="MY_VIDEO_POSTER.jpg" data-setup="{}">
        <source src="<%=path%>/images/mv/mv1.mp4" type="video/mp4">
    </video>
</div>

<div id="register-right-content">
    <div id="title">
        <h5><strong>新用户注册</strong></h5>
    </div>
    <hr>
    <!--帐号-->
    <div class="form-group row">
        <div class="col-md-5">
            <label for="registerAct" class="col-form-label"><strong>帐号</strong></label>
        </div>
        <div class="input-group col-md-7">
            <div id="display-act" class="input-group-prepend">
                <div class="prepend">
                    <img src="<%=path%>/images/main/user2.png">
                </div>
            </div>
            <input type="text" class="form-control reg-text" id="registerAct" name="uer_act"
                   placeholder="请输入账号">
        </div>
    </div>
    <!--密码-->
    <div class="form-group row">
        <div class="col-md-5">
            <label for="registerPwd" class="col-form-label "><strong>设置密码</strong></label>
        </div>
        <div class="input-group col-md-7">
            <div id="display-pwd" class="input-group-prepend">
                <div class="prepend">
                    <img src="<%=path%>/images/main/pwd.png">
                </div>
            </div>
            <input type="password" class="form-control reg-text" id="registerPwd"
                   name="uer_pwd" placeholder="8-16位英文、数字等">
            <div id="regPwd-prepend" class="input-group-prepend">
                <div class="input-group-text">
                    <a href="#">
                        <img src="<%=path%>/images/main/view_off.png" style="height: 22px;">
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!--验证码-->
    <div class="form-group row">
        <div class="col-md-5">
            <label for="verificationCode" class="col-form-label"><strong>验证码</strong></label>
        </div>
        <div class="input-group col-md-7">
            <div id="display-verif" class="input-group-prepend">
                <div class="prepend">
                    <img src="<%=path%>/images/main/safe.png">
                </div>
            </div>
            <input type="text" class="form-control reg-text" id="verificationCode"
                   placeholder="请输入右侧的验证码">
            <div id="verifCode" class="input-group-prepend">
                <a class="changeCode" href="#">
                    <img src="<%=path%>/user/CheckCode" style="height:38px">
                </a>
            </div>
        </div>
    </div>
    <!--注册按钮-->
    <div class="form-group row">
        <div class="col-md">
            <button type="button" id="bt-register" class="btn btn-primary" disabled="false"><strong>注册</strong></button>
        </div>
    </div>
    <!--服务协议-->
    <div id="serviceH">
        <div class="custom-control custom-checkbox">
            <input class="custom-control-input" type="checkbox" id="agreeCheck">
            <label class="custom-control-label" for="agreeCheck">
                <p>
                    <span>我同意 </span><a href="">Qiaole黑怕用户服务协议</a><br>
                    <span>及 </span><a href="">隐私权政策</a>
                </p>
            </label>
        </div>
    </div>
    <!--已有账号,立即登录-->
    <div id="reLogion" align="center">
        <p>
            <span>已有账号?</span>
            <a href="<%=path%>/page/user/login.jsp">立即登录</a>
        </p>
    </div>
</div>
<div id="reg-icon2">
    <img src="<%=path%>/images/main/icon2.png">
</div>
<script src="<%=path%>/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        $("#agreeCheck").click(function () {
            if (this.checked == false) {
                $("#bt-register").attr("disabled", true);
            } else {
                $("#bt-register").attr("disabled", false);
                //注册
                $("#bt-register").click(function () {
                    register()
                })
                $("#registerAct").keydown(function (e) {
                    keyCod(e)
                })
                $("#registerPwd").keydown(function (e) {
                    keyCod(e)
                })
                $("#verificationCode").keydown(function (e) {
                    keyCod(e)
                })
            }
        })

        //密码显示隐藏
        $("#regPwd-prepend a").click(function () {
            var np = $("#registerPwd")
            if (np.hasClass("block")) {
                $(this).children("img").attr("src", "<%=path%>/images/main/view_off.png")
                np.attr("type", "password")
                np.removeClass("block")
                np.css("color", "rgb(80,80,80)")
            } else {
                $(this).children("img").attr("src", "<%=path%>/images/main/view.png")
                np.attr("type", "text")
                np.addClass("block")
                np.css("color", "rgb(80,80,80)")
            }
        })
        $(".changeCode").click(function () {
            $(".changeCode img").attr("src", "<%=path%>/user/CheckCode?" + new Date().getTime())
        })
    });

    //js
    function keyCod(e) {
        var e = e.keyCode
        switch (e) {
            case 13:
                register()
                break
            case 108:
                register()
                break
            default:
                break
        }
    }

    function register() {
        // 获取弹窗这个窗口
        var index = parent.layer.getFrameIndex(window.name);
        var uer_act = $('#registerAct').val();
        var uer_pwd = $('#registerPwd').val();
        var verifContent = $("#verificationCode").val();
        if (uer_act === '' || uer_pwd === '') {
            layer.msg('<span style="font-size:17px">帐号或密码为空,请重新输入</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
                skin: 'myStyle'
            });
        } else if (verifContent === '') {
            layer.msg('<span style="font-size:17px;margin-left: 18px;">请输入验证码</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
                skin: 'myStyle'
            });
        } else {
            $.ajax({
                type: 'post',
                url: '<%=path%>/user/registerUser',
                data: {
                    uer_act: uer_act,
                    uer_pwd: uer_pwd,
                    verifContent: verifContent
                },
                dataType: 'json',
                success: function (data) {
                    if (data.stateCode.trim() === "0") {
                        layer.msg('<span style="font-size:17px">该账号已存在,请重新输入</span>', {
                            offset: '150px',
                            anim: 6,
                            time: 1200,
                            skin: 'myStyle'
                        });
                    }
                    if (data.stateCode.trim() === "1") {
                        layer.load();
                        setTimeout(function () {
                            layer.closeAll('loading');
                            parent.layer.msg('<span style="font-size:17px">亲！恭喜你注册成功<br>请点击右上角登录Qiaole黑怕吧</span>', {
                                icon: 1,
                                offset: '100px',
                                anim: 6,
                                time: 1500,
                            });
                            //注册后关闭
                            parent.layer.close(index);
                        }, 1200);

                    }
                    if (data.stateCode.trim() === "codeError") {
                        layer.msg('<span style="font-size:17px">验证码错误,请重新输入</span>', {
                            offset: '150px',
                            anim: 6,
                            time: 1200,
                            skin: 'myStyle'
                        });
                    }
                }
            })
            //alert("AJAX结束了")
        }
    }
</script>
</body>
</html>
