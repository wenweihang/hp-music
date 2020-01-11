<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>解绑邮箱账号</title>
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/css/video-js.min.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">
    <script src="<%=path%>/js/jquery-3.3.1.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <script src="<%=path%>/js/video.min.js"></script>
</head>
<body>
<div id="emailUnBind-left-content">
    <video id="my-video" class="video-js" preload="auto"
           autoplay="true" loop="true"
           style="height: 100%;width: 212px;  object-fit:fill"
           poster="MY_VIDEO_POSTER.jpg" data-setup="{}">
        <source src="<%=path%>/images/mv/mv1.mp4" type="video/mp4">
    </video>
</div>

<div id="emailUnBind-right-content">
    <div id="title" class="pt-4">
        <h5><strong>解绑邮箱账号</strong></h5>
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
            <c:if test="${!empty stateEmBid}">
            <input type="text" class="form-control" id="uer_emailAddress" name="uer_emailAddress"
                   value="${emBindUser.uer_emailAddress}" readonly>
            </c:if>
            <c:if test="${empty stateEmBid}">
                <input type="text" class="form-control" id="uer_emailAddress" name="uer_emailAddress"
                       value="${logUser.uer_emailAddress}" readonly>
            </c:if>
        </div>
    </div>
    <!--验证码-->
    <div class="form-group row mt-3">
        <div class="col-md-5">
            <label for="emailUnBindCode" class="col-form-label "><strong>验证码</strong></label>
        </div>
        <div class="input-group col-md-7">
            <div id="display-pwd" class="input-group-prepend">
                <div class="prepend">
                    <img src="<%=path%>/images/main/safe.png">
                </div>
            </div>
            <input type="password" class="form-control reg-text" id="emailUnBindCode"
                   name="emailUnBindCode" placeholder="请输入6位验证码">
            <div id="sendEmailCode" class="input-group-prepend">
                <input type="button" class="btn btn-primary" value="发送验证码">
            </div>
        </div>
    </div>
    <!--完成按钮-->
    <div class="form-group row mt-5 pt-2">
        <div class="col-md ">
            <button type="button" id="bt-emailUnBind" class="btn btn-primary"><strong>完成</strong></button>
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
            $.ajax({
                type: 'post',
                url: '<%=path%>/user/emailUnBindCheckCode',
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
        })
        //完成绑定
        $("#bt-emailUnBind").click(function () {
            var emailUnBindCode = $("#emailUnBindCode").val();
            if (emailUnBindCode === "") {
                layer.msg('<span style="font-size:17px">验证码为空,请输入</span>', {
                    offset: '150px',
                    anim: 6,
                    time: 1200,
                });
            } else {
                $.ajax({
                    type: 'post',
                    url: '<%=path%>/user/emailUnBind',
                    data: {
                        emailUnBindCode: emailUnBindCode,
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.stateEmUnBind.trim() === "1") {
                            layer.msg('<span style="font-size:17px">解绑成功</span>', {
                                icon: 1,
                                offset: '150px',
                                anim: 6,
                                time: 1200,
                            });
                            setTimeout(function () {
                                parent.layer.close(index);
                                parent.location.reload();
                            }, 1200);
                        }
                        if (data.stateEmUnBind.trim() === "0") {
                            layer.msg('<span style="font-size:17px">验证码不正确</span>', {
                                offset: '150px',
                                anim: 6,
                                time: 1200,
                            });
                        }
                        if (data.stateEmUnBind.trim() === "404") {
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
