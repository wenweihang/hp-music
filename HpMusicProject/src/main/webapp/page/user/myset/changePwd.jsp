<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/5
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>修改密码-用户安全中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">
    <style>
        body {
            height: 100%;
        }

        .wrapper {
            min-height: 100%;
            position: relative;
        }

        .content {
            /*footer的高度*/
            padding-bottom: 300px;
        }

        .footer {
            width: 100%;
            height: 300px;
            color: #fff;
            background-color: rgb(51, 51, 51);
            position: absolute;
            bottom: 0;
        }

    </style>
</head>
<body>
<div class="wrapper">
    <%--导航栏start--%>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="changePwd-navCustom"
         style="padding: 0px 180px">
        <%--<div class="container-fluid">--%>
        <a id="nav-icon" class="navbar-brand" href="changePwd.jsp">
            <img src="<%=path%>/images/main/cpwd-icon.png" class="d-inline-block align-top">
            <font>
                <span class="sp1">黑怕</span><span class="sp2">安全中心</span>
            </font>
        </a>

        <%--用户登录注册start--%>
        <c:if test="${empty logUser}">
            <div id="changePwd-user-register">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="changePwd-nav-log-reg" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="layui-icon layui-icon-username" id="changePwd-i-log-reg">
                            <span style="font-size:15px;">
                                我的<span class="english-font" style="font-size: 17px">Qiaole</span>黑怕
                            </span>
                        </i>
                        <div id="dropdown-menu-myqiaole" class="dropdown-menu dropdown-menu-right pt-0 pb-0"
                             aria-labelledby="nav-log-reg" style="width:280px;height: 230px">
                            <div class="card w-100 h-100" id="dropdown-menu-card">
                                <div class="card-body text-center ">
                                    <h3 class="card-title">登录
                                        <span class="english-font" style="font-size: 27px">MY<br>QIAOLE</span>黑怕安全中心
                                    </h3>
                                    <p class="card-text">
                                        "我的<span class="english-font">Qiaole</span>黑怕"可以让你感受到嘻哈的文<br>
                                        &nbsp;&nbsp;化,全世界爱好嘻哈文化都在这聚集。立<br>
                                        &nbsp;&nbsp;&nbsp;即登录账户,来管理你的安全信息吧。
                                    </p>
                                    <div class="dropdown-divider"></div>
                                    <p></p>
                                    <p></p>
                                    <button type="button" id="changePwd-nav-bt-log" class="btn btn-primary">
                                    <span>
                                        <strong>登录</strong>
                                    </span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </a>
                </li>
            </div>
            <%--用户登录注册end--%>
        </c:if>
        <c:if test="${!empty logUser}">
            <div class="dropdown mr-2" id="changePwd-nav-loginSuccess">
                <a class="nav-link mt-2" href="#" role="button" id="userNameAct" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <c:if test="${empty stateUpd}">
                        <span>${logUser.uer_name}(${logUser.uer_act})</span>
                    </c:if>
                    <c:if test="${!empty stateUpd}">
                        ${updUser.uer_name}(${logUser.uer_act})
                    </c:if>
                </a>
                <div id="changePwd-dropdown-menu" class="dropdown-menu dropdown-menu-right text-right" aria-labelledby="userNameAct">
                    <a class="dropdown-item" id="changePwd-log-myExit" href="<%=path%>/user/loginOut">退出</a>
                </div>
            </div>
        </c:if>
        <%--</div>--%>
    </nav>
    <div class="empty">
        <%--<img src="<%=path%>/images/main/auc.jpg" style="width: 100%;height: 80px;">--%>
    </div>
    <%--导航栏end--%>
    <div class="content">
        <%--修改密码--%>
        <div class="container mb-3 mt-3" id="chg-pwd-title" >
            <div class="row no-gutters">
                <div class="col1">
                    <img src="<%=path%>/images/main/changePwd.png">
                </div>
                <div class="col-md-2 pl-0 pt-1">
                    <h5>修改密码</h5>
                </div>
            </div>
        </div>
        <div class="container" style="padding: 0px 180px">
            <div class="card text-center" style="height: 420px;" id="user-chg-pwd">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" id="old-chg-pwd-a" href="#">修改密码</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="em-chg-pwd-a" href="#">邮箱修改密码</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="ph-chg-pwd-a" href="#">手机号修改密码</a>
                        </li>
                    </ul>
                </div>
                <%--旧密码改密码--%>
                <div class="card-body " id="old-chg-pwd">
                    <!--旧密码-->
                    <div class="form-group row mt-4">
                        <div class="col-md-3">
                            <label for="oldPwd" class="col-form-label pl-4">&nbsp;&nbsp;&nbsp;&nbsp;旧密码</label>
                        </div>
                        <div class="input-group col-md-5">
                            <input type="password" class="form-control" name="uer_oldPwd" id="oldPwd"
                                   placeholder="请输入旧密码">
                            <div id="oldPwd-prepend" class="input-group-prepend">
                                <div class="input-group-text">
                                    <a href="#">
                                        <img src="<%=path%>/images/main/view_off.png" style="height: 22px;">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--新密码-->
                    <div class="form-group row">
                        <div class="col-md-3">
                            <label for="newPwd2" class="col-form-label pl-4">&nbsp;<span style="color: red;">* </span>新密码</label>
                        </div>
                        <div class="input-group col-md-5">
                            <input type="password" class="form-control" name="uer_pwd" id="newPwd2"
                                   placeholder="8-16位英文、数字等">
                            <div id="newPwd2-prepend" class="input-group-prepend">
                                <div class="input-group-text">
                                    <a href="#">
                                        <img src="<%=path%>/images/main/view_off.png" style="height: 22px;">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--新密码确认-->
                    <div class="form-group row row3">
                        <div class="col-md-3">
                            <label for="renewPwd2" class="col-form-label">
                                <span style="color: red;">* </span>新密码确认
                            </label>
                        </div>
                        <div class="input-group col-md-5 ">
                            <input type="password" class="form-control" name="reuer_pwd" id="renewPwd2"
                                   placeholder="确认新密码">
                            <div id="renewPwd2-prepend" class="input-group-prepend">
                                <div class="input-group-text">
                                    <a href="#">
                                        <img src="<%=path%>/images/main/view_off.png" style="height: 22px;">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col3 pl-0">
                            <label class="col-form-label pwdUnlike">
                                <i class="layui-icon layui-icon-face-cry" style="font-size: 15px;"></i>
                                <span>两次密码输入不一致</span>
                            </label>
                        </div>
                    </div>
                    <!--完成修改按钮-->
                    <div class="form-group row">
                        <div class="col-md">
                            <button type="button" id="changePwd-finish-old" class="btn btn-primary"><strong>完成</strong></button>
                        </div>
                    </div>
                </div>
                <%--邮箱改密码--%>
                <div class="card-body" id="em-chg-pwd" style="display: none">
                    <!--邮箱地址-->
                    <div class="form-group row mt-3">
                        <div class="col-md-3">
                            <label for="uer_emailAddress" class="col-form-label pl-4">&nbsp;邮箱地址</label>
                        </div>
                        <div class="input-group col-md-5">
                            <c:if test="${empty stateEmUnBid}">
                                <c:if test="${empty stateEmBid}">
                                    <input type="text" id="uer_emailAddress" name="uer_emailAddress"
                                           value="${logUser.uer_emailAddress}" readonly style="border: none">
                                </c:if>
                                <c:if test="${!empty stateEmBid}">
                                    <input type="text" id="uer_emailAddress" name="uer_emailAddress"
                                           value="${emBindUser.uer_emailAddress}" readonly style="border: none">
                                </c:if>
                            </c:if>
                            <c:if test="${!empty stateEmUnBid}">
                                <input type="text" id="uer_emailAddress" name="uer_emailAddress"
                                       value="${emUnBindUser.uer_emailAddress}" readonly style="border: none">
                            </c:if>
                        </div>
                        <div class="input-group col-md-3">
                            <input type="button" class="btn btn-primary" id="changePwd-getCheckCode" value="发送验证码">
                        </div>
                    </div>
                    <!--验证码-->
                    <div class="form-group row">
                        <div class="col-md-3 ">
                            <label for="emailCode" class="col-form-label pl-4">&nbsp;&nbsp;&nbsp;验证码</label>
                        </div>
                        <div class="input-group col-md-5">
                            <input type="text" class="form-control" name="emailCode" id="emailCode"
                                   placeholder="请输入4位验证码">
                        </div>
                    </div>
                    <!--新密码-->
                    <div class="form-group row">
                        <div class="col-md-3">
                            <label for="newPwd" class="col-form-label pl-4"><span
                                    style="color: red;">* </span>新密码</label>
                        </div>
                        <div class="input-group col-md-5">
                            <input type="password" class="form-control" name="uer_pwd" id="newPwd"
                                   placeholder="8-16位英文、数字等">
                            <div id="newPwd-prepend" class="input-group-prepend">
                                <div class="input-group-text">
                                    <a href="#">
                                        <img src="<%=path%>/images/main/view_off.png" style="height: 22px;">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--新密码确认-->
                    <div class="form-group row row4">
                        <div class="col-md-3">
                            <label for="renewPwd" class="col-form-label"><span
                                    style="color: red;">* </span>新密码确认</label>
                        </div>
                        <div class="input-group col-md-5">
                            <input type="password" class="form-control" name="reuer_pwd" id="renewPwd"
                                   placeholder="确认新密码">
                            <div id="renewPwd-prepend" class="input-group-prepend">
                                <div class="input-group-text">
                                    <a href="#">
                                        <img src="<%=path%>/images/main/view_off.png" style="height: 22px;">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col3 pl-0">
                            <label class="col-form-label pwdUnlike">
                                <i class="layui-icon layui-icon-face-cry" style="font-size: 15px;"></i>
                                <span>两次密码输入不一致</span>
                            </label>
                        </div>
                    </div>
                    <!--完成修改按钮-->
                    <div class="form-group row">
                        <div class="col-md">
                            <button type="button" id="changePwd-finish" class="btn btn-primary"><strong>完成</strong></button>
                        </div>
                    </div>
                </div>
                <%--手机号改密码--%>
                <div class="card-body" id="ph-chg-pwd" style="display: none">
                    <h5 class="card-title">1111111t</h5>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
        <div class="empty">
            <%--<img src="<%=path%>/images/main/auc.jpg" style="width: 100%;height: 80px;">--%>
        </div>
    </div>

    <div class="footer">
        <jsp:include page="../../bomContent.jsp"/>
    </div>
</div>
<script src="<%=path%>/js/jquery-3.3.1.js"></script>
<script src="<%=path%>/js/jquery.cityselect.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>
<script src="<%=path%>/layer/layer.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    $(function () {
        // 我的qiaole黑怕
        $("#changePwd-i-log-reg").mouseenter(function () {
            $("#dropdown-menu-myqiaole").slideDown(300);
        });
        $("#changePwd-nav-log-reg").mouseleave(function () {
            $("#dropdown-menu-myqiaole").hide(600);
        });
        // 登录成功
        $("#userNameAct").mouseenter(function () {
            $("#changePwd-dropdown-menu").slideDown(300);
        });
        $("#changePwd-nav-loginSuccess").mouseleave(function () {
            $("#changePwd-dropdown-menu").hide(600);
        })
        //切换修改
        $("#old-chg-pwd-a").click(function () {
            $(this).addClass("active");
            $(this).parent().siblings().children("a").removeClass("active")
            $("#old-chg-pwd").show();
            $("#em-chg-pwd").hide();
            $("#ph-chg-pwd").hide();
        })
        $("#em-chg-pwd-a").click(function () {
            $(this).addClass("active");
            $(this).parent().siblings().children("a").removeClass("active")
            $("#em-chg-pwd").show();
            $("#old-chg-pwd").hide();
            $("#ph-chg-pwd").hide();
        })
        $("#ph-chg-pwd-a").click(function () {
            $(this).addClass("active");
            $(this).parent().siblings().children("a").removeClass("active")
            $("#ph-chg-pwd").show();
            $("#old-chg-pwd").hide();
            $("#em-chg-pwd").hide();
        })
        //发送邮件验证码
        $("#changePwd-getCheckCode").click(function () {
            var uer_emailAddress = $("#uer_emailAddress").val();
            if (uer_emailAddress === "") {
                layer.msg('<span style="font-size:17px">您还未绑定邮箱帐号,请勿重复操作</span>', {
                    offset: '150px',
                    anim: 6,
                    time: 1200,
                });
            } else {
                $.ajax({
                    type: 'post',
                    url: '<%=path%>/user/emailCheckCode',
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
                        if (data.stateSendEm.trim() === "404") {
                            parent.location.href = "../../error/serviceError.jsp"
                        }
                    }
                })
            }
        })
        //邮件修改密码
        $("#changePwd-finish").click(function () {
            var emailCode = $("#emailCode").val();
            var uer_pwd = $("#newPwd").val();
            var reuer_pwd = $("#renewPwd").val();
            if (emailCode === "") {
                layer.msg('<span style="font-size:17px">验证码不能为空</span>', {
                    offset: '210px',
                    anim: 6,
                    time: 1200,
                });
            } else if (uer_pwd === "" || reuer_pwd === "") {
                layer.msg('<span style="font-size:17px">密码不能为空</span>', {
                    offset: '210px',
                    anim: 6,
                    time: 1200,
                });
            } else if(uer_pwd!==reuer_pwd){
                layer.msg('<span style="font-size:17px">请根据要求填写</span>', {
                    offset: '210px',
                    anim: 6,
                    time: 1200,
                });
            }else {
                $.ajax({
                    type: 'post',
                    url: '<%=path%>/user/changePwdByEm',
                    data: {
                        emailCode: emailCode,
                        uer_pwd: uer_pwd
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.stateChgPwd.trim() === "1") {
                            layer.load();
                            setTimeout(function () {
                                layer.closeAll('loading');
                                layer.msg('<span style="font-size:17px">修改成功,3秒后自动转入主页面</span>', {
                                    icon: 1,
                                    offset: '150px',
                                    anim: 6,
                                    time: 3000,
                                });
                                setTimeout("location.href='<%=path%>/page/main.jsp'", 3000)
                            },1200)
                        }
                        if (data.stateChgPwd.trim() === "0") {
                            layer.msg('<span style="font-size:17px">验证码不正确</span>', {
                                offset: '210px',
                                anim: 6,
                                time: 1200,
                            });
                        }
                        if (data.stateChgPwd.trim() === "404") {
                            parent.location.href = "<%=path%>/page/error/serviceError.jsp"
                        }
                    }
                })
            }
        })

        // 旧密码更改密码
        $("#changePwd-finish-old").click(function () {
            var uer_oldPwd = $("#oldPwd").val()
            var uer_pwd = $("#newPwd2").val()
            var reuer_pwd = $("#renewPwd2").val()
            if (uer_oldPwd === "") {
                layer.msg('<span style="font-size:17px">旧密码不能为空</span>', {
                    offset: '210px',
                    anim: 6,
                    time: 1200,
                });
            } else if (uer_pwd === ""||reuer_pwd=== "") {
                layer.msg('<span style="font-size:17px">新密码不能为空</span>', {
                    offset: '210px',
                    anim: 6,
                    time: 1200,
                });
            } else if(uer_pwd!==reuer_pwd){
                layer.msg('<span style="font-size:17px">请根据要求填写</span>', {
                    offset: '210px',
                    anim: 6,
                    time: 1200,
                });
            }else {
                $.ajax({
                    type: 'post',
                    url: '<%=path%>/user/changePwdByOld',
                    data: {
                        uer_oldPwd: uer_oldPwd,
                        uer_pwd: uer_pwd
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.stateChgPwd.trim() === "1") {
                            layer.load();
                            setTimeout(function () {
                                layer.closeAll('loading');
                                layer.msg('<span style="font-size:17px">修改成功,3秒后自动转入主页面</span>', {
                                    icon: 1,
                                    offset: '150px',
                                    anim: 6,
                                    time: 3000,
                                });
                                setTimeout("location.href='<%=path%>/page/main.jsp'", 3000)
                            },1200)
                        }
                        if (data.stateChgPwd.trim() === "0") {
                            layer.msg('<span style="font-size:17px">旧密码不正确</span>', {
                                offset: '210px',
                                anim: 6,
                                time: 1500,
                            });
                        }
                        if (data.stateChgPwd.trim() === "re") {
                            layer.msg('<span style="font-size:17px">新密码不能与旧密码相同</span>', {
                                offset: '210px',
                                anim: 6,
                                time: 1500,
                            });
                        }
                    }
                })
            }

        })
        //点击显示隐藏密码
        //旧密码
        $("#oldPwd-prepend a").click(function () {
            var op = $("#oldPwd")
            if (op.hasClass("block")) {
                $(this).children("img").attr("src", "<%=path%>/images/main/view_off.png")
                op.attr("type", "password")
                op.removeClass("block")
                op.css("color", "rgb(80,80,80)")
            } else {
                $(this).children("img").attr("src", "<%=path%>/images/main/view.png")
                op.attr("type", "text")
                op.addClass("block")
                op.css("color", "rgb(80,80,80)")
            }
        })
        //新密码
        $("#newPwd2-prepend a").click(function () {
            var np = $("#newPwd2")
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
        //新密码确认
        $("#renewPwd2-prepend a").click(function () {
            var rnp = $("#renewPwd2")
            if (rnp.hasClass("block")) {
                $(this).children("img").attr("src", "<%=path%>/images/main/view_off.png")
                rnp.attr("type", "password")
                rnp.removeClass("block")
                rnp.css("color", "rgb(80,80,80)")
            } else {
                $(this).children("img").attr("src", "<%=path%>/images/main/view.png")
                rnp.attr("type", "text")
                rnp.addClass("block")
                rnp.css("color", "rgb(80,80,80)")
            }
        })
        //邮件新密码
        $("#newPwd-prepend a").click(function () {
            var np = $("#newPwd")
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
        //邮件新密码确认
        $("#renewPwd-prepend a").click(function () {
            var rnp = $("#renewPwd")
            if (rnp.hasClass("block")) {
                $(this).children("img").attr("src", "<%=path%>/images/main/view_off.png")
                rnp.attr("type", "password")
                rnp.removeClass("block")
                rnp.css("color", "rgb(80,80,80)")
            } else {
                $(this).children("img").attr("src", "<%=path%>/images/main/view.png")
                rnp.attr("type", "text")
                rnp.addClass("block")
                rnp.css("color", "rgb(80,80,80)")
            }
        })

        //显示提示信息
        $("#renewPwd2").blur(function () {
            var newPwd2 = $("#newPwd2").val()
            var renewPwd2=$("#renewPwd2").val()
            if(newPwd2!==renewPwd2){
                $(".pwdUnlike").show()
            }else{
                $(".pwdUnlike").hide()
            }
        })
        $("#renewPwd").blur(function () {
            var newPwd = $("#newPwd").val()
            var renewPwd=$("#renewPwd").val()
            if(newPwd!==renewPwd){
                $(".pwdUnlike").show()
            }else{
                $(".pwdUnlike").hide()
            }
        })

        //登录
        $("#changePwd-nav-bt-log").click(function () {
            layer.open({
                type: 2,
                title: false,
                closeBtn: 2, //不显示关闭按钮
                shade: [0.7],
                area: ['600px', '500px'],
                offset: '100px', //右下角弹出
                time: 0, //2秒后自动关闭
                anim: 0,
                content: ['<%=path%>/page/user/login.jsp', 'no'], //iframe的url，no代表不显示滚动条
            });
        })
    })

    //js
    var wait = 60

    function Twait(tis) {
        if (wait == 0) {
            tis.removeAttribute("disabled");
            tis.value = "发送验证码";
            wait = 60;
            return
        } else {
            tis.setAttribute("disabled", true);
            tis.value = "重新发送(" + wait + ")";
            wait--;
        }
        // setTimeout() 方法用于在指定的毫秒数后调用函数或计算表达式
        setTimeout(function () {         // 定时执行
            Twait(tis);
        }, 1000);
    }
</script>
</body>
</html>
