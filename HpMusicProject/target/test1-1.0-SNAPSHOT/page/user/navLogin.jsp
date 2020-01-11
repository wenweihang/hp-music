<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/13
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>登录刷新</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">
    <style>
        .layui-layer-demo {
            width: 350px;
            height: 214px;
            font-size: 17px;
            /*text-align: center;*/
        }

        #tipFont {
            margin: 0 16px 0 24px;
            /*margin-right: 10px;*/
        }
        #signin-yes{
            margin-left: 8px;
        }
        #continueDay {
            font-size: 25px;
            color: rgb(190, 50, 50);
        }

        #laybt {
            color: white;
            font-weight: bold;
            font-size: 15px;
            background-color: rgb(190, 50, 50);
            padding: 10px 55px;
            border: none;
            margin-left: 30%;
            border-radius: 25px;
        }
        #mheadCir {
            position: absolute;
            top: 16px;
            left: 7px;
        }

        #mheadCir img {
            margin-top: -4px;
            margin-left: 70px;
            width: 32px;
            height: 18px;
        }
        #mcir-box>img {
            width: 40px;
            height: 40px;
            margin-top: 0px;
            margin-left: 85px;
            background-size: cover;
            border-radius: 50%;
            background-clip: padding-box;
            background-repeat: no-repeat;
            -webkit-border-radius: 100px;
            -moz-border-radius: 100px;
        }
        #mcir-box>#muserAct{
            color: rgb(70,70,70);
            font-size: 17px;
            padding: 20px 30px 20px 15px;
        }
        #mcir-box>div>.img2{
            width: 40px;
            height: 16px;
            margin-top: 17px;
            margin-left: 160px;
        }
    </style>
</head>
<body>
<%--用户登录注册start--%>
<c:if test="${empty logUser}">
    <div id="user-register" class="mr-3">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="nav-log-reg" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="layui-icon layui-icon-username" id="i-log-reg">
                    <span style="font-size:15px;">
                        我的<span class="english-font" style="font-size: 17px">Qiaole</span>黑怕
                    </span>
                </i>
                <div id="dropdown-menu-myqiaole" class="dropdown-menu dropdown-menu-right pt-0 pb-0"
                     aria-labelledby="nav-log-reg">
                    <div class="card w-100 h-100" id="dropdown-menu-card">
                        <div class="card-body text-center ">
                            <h3 class="card-title">登录以开始使用
                                <span class="english-font" style="font-size: 27px">MY<br>QIAOLE</span>黑怕
                            </h3>
                            <p class="card-text">
                                "我的<span class="english-font">Qiaole</span>黑怕"可以让你感受到嘻哈的文<br>
                                &nbsp;&nbsp;化,全世界爱好嘻哈文化都在这聚集。立<br>
                                &nbsp;&nbsp;即登录或创建账户,一起加入到嘻哈<br>
                                的大家庭吧。
                            </p>
                            <div class="dropdown-divider"></div>
                            <p></p>
                            <p></p>
                            <button type="button" id="nav-bt-register" class="btn btn-primary">
                                <span>
                                    <strong>创建一个账户</strong>
                                </span>
                            </button>
                            <br><br>
                            已经有账号了<i class="layui-icon layui-icon-help"></i>
                            <button type="button" id="nav-bt-login">
                                    <%--<a href="#" id="test2" class="btn btn-primary bt2" role="button">----%>
                                <span>登录</span>
                                    <%--</a>----%>
                            </button>
                        </div>
                    </div>
                </div>
            </a>
        </li>
    </div>
</c:if>

<%--用户登录注册end--%>
<c:if test="${!empty logUser}">
    <div class="dropdown" id="nav-loginSuccess">
        <a class="nav-link mt-1" href="#" role="button" id="userHeadIcon" data-toggle="dropdown"
           aria-haspopup="true" aria-expanded="false">
            <div class="headCir">
                <img src="<%=path%>/images/main/headCir.png" style="display: none">
            </div>
            <div id="cir-box">
                <c:if test="${empty stateUpHeImg}">
                    <img src="${logUser.uer_headImg}">
                    <div>
                        <img class="img2" src="<%=path%>/images/main/vip-no.png">
                    </div>
                </c:if>
                <c:if test="${!empty stateUpHeImg}">
                    <img src="${serverPath}">
                    <div>
                        <img class="img2" src="<%=path%>/images/main/vip-no.png">
                    </div>
                </c:if>
            </div>
        </a>
        <div id="dropdown-menu-userinfo" class="dropdown-menu" aria-labelledby="userHeadIcon">
            <a class="dropdown-item pl-2" id="log-myInfo" href="#">
                <div id="cir-box-menu" style="overflow: hidden ;">
                    <c:if test="${empty stateUpHeImg}">
                        <img src="${logUser.uer_headImg}">
                    </c:if>
                    <c:if test="${!empty stateUpHeImg}">
                        <img src="${serverPath}">
                    </c:if>
                    <span>
                        <c:if test="${empty stateUpd}">
                             ${logUser.uer_name}
                        </c:if>
                        <c:if test="${!empty stateUpd}">
                            ${updUser.uer_name}
                        </c:if>
                    </span>
                </div>
            </a>
            <a class="dropdown-item a-son" id="log-myVip" href="#">我的会员</a>
            <a class="dropdown-item a-son" id="log-myOrder" href="#">我的订单</a>
            <a class="dropdown-item a-son" id="log-mySet" href="#">设置</a>
            <a class="dropdown-item a-son" id="log-myExit" href="<%=path%>/user/loginOut">退出</a>
        </div>
    </div>
</c:if>
<script src="<%=path%>/js/jquery-3.3.1.js"></script>
<script src="<%=path%>/js/jquery.cookie.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    //签到
    if (${!empty logUser}) {
        if (${!empty memberInfoList}) {
            signInTips("member")
        }
        if (${empty memberInfoList}) {
            signInTips("common")
        }
    }
    ;
    $("#laybt").click(function () {
        layer.closeAll()
    });

    //js
    function signInTips(type) {
        //获取用户帐号
        var uer_act = "${logUser.uer_act}"
        if ($.cookie(uer_act + "1") == null) {
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/cookies/signInDay',
                data: {},
                dataType: 'json',
                success: function (data) {
                    if (data.userSignIn == null) {
                        parent.location.href = "<%=path%>/page/error/serviceError.jsp"
                    }
                    var code = '    <div id="mheadCir">' +
                        '                    <img src="<%=path%>/images/main/headCir.png" style="display: none">' +
                        '                </div>' +
                        '                <div id="mcir-box">' +
                        '                        <img src="${logUser.uer_headImg}">' +
                        '                        <font id="muserAct">${logUser.uer_name}</font>' +
                        '                </div>'
                    var userSignIn = data.userSignIn
                    var day=userSignIn.usi_continueDay
                    if (type == 'member') {
                        //会员用户提示
                        layer.open({
                            type: 1,
                            title: false,
                            offset: ['180px','590px'],
                            skin: 'layui-layer-demo', //样式类名
                            closeBtn: 0, //不显示关闭按钮
                            anim: 2,
                            content: '<br>' + code + '<br><div id="tipFont">尊敬的会员用户，欢迎来到Qiaole黑怕。' +
                            '<img id="signin-yes" src="<%=path%>/images/main/signin-yes.png"> &nbsp;签到成功，' +
                            ' 您已连续登录<span id="continueDay"> ' + day + ' </span>天！</div><br>' +
                            '<button id="laybt">确定</button>'
                        })
                        $("#mheadCir>img").show()
                        $("#mcir-box>img").css("border", "2px solid rgb(252,193,45)")
                        $("#muserAct").css("color", "rgb(193,39,45)")
                    }
                    if (type == 'common') {
                        //普通用户提示
                        layer.open({
                            type: 1,
                            title: false,
                            offset: ['180px','590px'],
                            skin: 'layui-layer-demo', //样式类名
                            closeBtn: 0, //不显示关闭按钮
                            anim: 2,
                            content: '<br>' + code + '<br><div id="tipFont">亲爱的黑怕用户，欢迎来到Qiaole黑怕。' +
                            '<img id="signin-yes" src="<%=path%>/images/main/signin-yes.png"> &nbsp;签到成功，' +
                            ' 您已连续登录<span id="continueDay"> ' + day + ' </span>天！</div><br>' +
                            '<button id="laybt">确定</button>'
                        })
                    }
                }
            })
        }
        //限制从当前时间开始到凌晨不访问服务器,因为今天已经登录了,过了凌晨就是第二天了
        var secondTime = new Date()
        secondTime.setHours(23)
        secondTime.setMinutes(59)
        secondTime.setSeconds(59)
        //给cookie设置存活时间
        $.cookie(uer_act + "1", uer_act+ "1", {expires:secondTime,path:"/"})
    };

    //判断是否为会员
    if (${!empty memberInfoList}||${!empty updMemberInfo}) {
        $("#userHeadIcon>.headCir>img").show()
        $("#cir-box>img").css("border", "1px solid rgb(252,193,45)")
        $("#cir-box-menu>span").css("color", "rgb(193,39,45)")
        $("#myInfo-name-input").css("color", "rgb(252,193,45)")
        $("#cir-box .img2").attr("src", "<%=path%>/images/main/vip-yes.png")
    }
    //开通会员
    $("#cir-box .img2").click(function () {
        $(".content").load('<%=path%>/page/user/myVip.jsp', function () {

        })
    });
    //用户信息
    $("#log-myInfo").click(function () {
        <%--if(${empty logUser}){--%>
        <%--location.href="<%=path%>/page/error/serviceError"--%>
        <%--}--%>
        $.get("user/myInfo.jsp", function (data) {
            $(".content").html(data)
            $("#nav-ul>li:last").prevAll().removeClass("changeColor").children("a").css("color", "rgb(50,50,50)")
        })
    })
    $("#log-myVip").click(function () {
        $.get("user/myVip.jsp", function (data) {
            $(".content").html(data)
            $("#nav-ul>li:last").prevAll().removeClass("changeColor").children("a").css("color", "rgb(50,50,50)")
        })
    });
    $("#log-mySet").click(function () {
        <%--if(${empty logUser}){--%>
        <%--location.href="<%=path%>/page/error/serviceError"--%>
        <%--}--%>
        $.get("user/mySet.jsp", function (data) {
            $(".content").html(data)
            $("#nav-ul>li:last").prevAll().removeClass("changeColor").children("a").css("color", "rgb(50,50,50)")
        })
    });
    $("#log-myOrder").click(function () {
        <%--if(${empty logUser}){--%>
        <%--location.href="<%=path%>/page/error/serviceError"--%>
        <%--}--%>
        $.get("user/myOrder.jsp", function (data) {
            $(".content").html(data)
            $("#nav-ul>li:last").prevAll().removeClass("changeColor").children("a").css("color", "rgb(50,50,50)")
        })
    });
    $("#log-myExit").click(function () {
        <%--$.removeCookie(${logUser.uer_act})--%>
        layer.load();
    });
    // 我的qiaole黑怕
    $("#i-log-reg").mouseenter(function () {
        $("#dropdown-menu-myqiaole").slideDown(300)
    });
    $("#nav-log-reg").mouseleave(function () {
        $("#dropdown-menu-myqiaole").hide(600)
    });
    // 登录成功
    $("#userHeadIcon").mouseenter(function () {
        $("#dropdown-menu-userinfo").slideDown(300)
    });
    $("#nav-loginSuccess").mouseleave(function () {
        $("#dropdown-menu-userinfo").hide(600)
    });

    //js
    function noUser() {
        if (${empty logUser}) {
            layer.open({
                type: 1,
                title: false,
                closeBtn: false,
                offset: '180px',
                area: '300px;',
                shade: 0.8,
                id: 'LAY_layuipro', //设定一个id，防止重复弹出
                resize: false,
                btn: ['登录'],
                skin: 'admTips',
                btnAlign: 'c',
                moveType: 1,//拖拽模式，0或者1
                content: '<div style="font-size:17px;padding: 20px 40px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;text-align:center">' +
                '<img src="<%=path%>/images/admin/admError.png" style="width:36px;height:34px">' + '<br><br>' +
                '您当前状态为未登录，请登录再进行相关操作。</div>',
                yes: function () {
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
                    })
                }
            })
        }
    };
</script>
</body>
</html>
