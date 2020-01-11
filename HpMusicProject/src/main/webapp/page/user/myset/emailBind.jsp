<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/7
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>绑定邮箱账号</title>
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/css/video-js.min.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">
    <script src="<%=path%>/js/jquery-3.3.1.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <script src="<%=path%>/js/video.min.js"></script>
</head>
<body>
<div id="emailBind-left-content">
    <video id="my-video" class="video-js" preload="auto" autoplay="true"
           style=" height: 100%;width: 212px;object-fit:fill;" loop="true"
           poster="MY_VIDEO_POSTER.jpg" data-setup="{}">
        <source src="<%=path%>/images/mv/mv1.mp4" type="video/mp4">
    </video>
</div>

<div id="emailBind-right-content">
    <div id="title" class="pt-4">
        <h5><strong>绑定邮箱账号</strong></h5>
    </div>
    <hr>
    <!--邮箱地址-->
    <div class="form-group row mt-5">
        <div class="col-md-3">
            <label for="uer_emailAddress" class="col-form-label"><strong>邮箱地址</strong></label>
        </div>
        <div class="input-group col-md-2">
            <div id="display-act" class="input-group-prepend">
                <div class="prepend">
                    <img src="<%=path%>/images/main/email-icon.png">
                </div>
            </div>
            <input type="text" class="form-control" id="uer_emailAddress" name="uer_emailAddress"
                   placeholder="请输入邮箱地址">
        </div>
    </div>
    <!--验证码-->
    <div class="form-group row mt-3">
        <div class="col-md-5">
            <label for="emailBindCode" class="col-form-label "><strong>验证码</strong></label>
        </div>
        <div class="input-group col-md-7">
            <div id="display-pwd" class="input-group-prepend">
                <div class="prepend">
                    <img src="<%=path%>/images/main/safe.png">
                </div>
            </div>
            <input type="password" class="form-control reg-text" id="emailBindCode"
                   name="emailBindCode" placeholder="请输入6位验证码">
            <div id="sendEmailCode" class="input-group-prepend">
                <input type="button" class="btn btn-primary" value="发送验证码">
            </div>
        </div>
    </div>
    <!--完成按钮-->
    <div class="form-group row mt-5 pt-2">
        <div class="col-md ">
            <button type="button" id="bt-emailBind" class="btn btn-primary"><strong>完成</strong></button>
        </div>
    </div>
</div>
<div id="reg-icon2">
    <img src="<%=path%>/images/main/icon2.png">
</div>
<script src="<%=path%>/layer/layer.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script type="text/javascript">
    $(function () {
        //发送验证码
        var index = parent.layer.getFrameIndex(window.name);
        $("#sendEmailCode input").click(function () {
            var uer_emailAddress = $("#uer_emailAddress").val();
            if (uer_emailAddress === "") {
                layer.msg('<span style="font-size:17px">邮箱地址为空,请输入</span>', {
                    offset: '150px',
                    anim: 6,
                    time: 1200,
                });
            } else {
                $.ajax({
                    type: 'post',
                    url: '<%=path%>/user/emailBindCheckCode',
                    context: this,
                    data: {
                        uer_emailAddress: uer_emailAddress
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.stateSendEm.trim() === "1") {
                            layer.msg('<span style="font-size:17px">发送成功</span>', {
                                offset: '150px',
                                anim: 6,
                                time: 1200,
                            });
                            Twait(this)
                        }
                        if (data.stateSendEm.trim() === "0") {
                            layer.msg('<span style="font-size:17px">该邮箱已被绑定,请重新输入</span>', {
                                offset: '150px',
                                anim: 6,
                                time: 1200,
                            });
                        }
                        if (data.stateSendEm.trim() === "404") {
                            parent.location.href = "../../error/serviceError.jsp"
                        }
                    }
                })
            }
        })
        //完成绑定
        $("#bt-emailBind").click(function () {
            var emailBindCode = $("#emailBindCode").val();
            var uer_emailAddress = $("#uer_emailAddress").val();
            if (emailBindCode === "") {
                layer.msg('<span style="font-size:17px">验证码为空,请输入</span>', {
                    offset: '150px',
                    anim: 6,
                    time: 1200,
                });
            } else {
                $.ajax({
                    type: 'post',
                    url: '<%=path%>/user/emailBind',
                    data: {
                        emailBindCode: emailBindCode,
                        uer_emailAddress: uer_emailAddress
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.stateEmBind.trim() === "1") {
                            layer.msg('<span style="font-size:17px">绑定成功</span>', {
                                icon: 1,
                                offset: '150px',
                                anim: 6,
                                time: 1200,
                            });
                            setTimeout(function(){
                                parent.layer.close(index);
                                parent.location.reload();
                            }, 1200);
                        }
                        if (data.stateEmBind.trim() === "0") {
                            layer.msg('<span style="font-size:17px">验证码不正确</span>', {
                                offset: '150px',
                                anim: 6,
                                time: 1200,
                            });
                        }
                        if (data.stateEmBind.trim() === "404") {
                            parent.location.href = "../../error/serviceError.jsp"
                        }
                    }
                })
            }
        })
    })

    //js
    //验证码倒计时
    var wait = 60;
    function Twait(tis) {
        if (wait == 0) {
            tis.removeAttribute("disabled");
            tis.value="发送验证码";
            wait = 60;
            return
        } else {
            tis.setAttribute("disabled", true);
            tis.value="重新发送("+wait+")";
            wait--;
        }
        // setTimeout() 方法用于在指定的毫秒数后调用函数或计算表达式
        setTimeout(function() {         // 定时执行
            Twait(tis);
        }, 1000);
    }
</script>
</body>
</html>
