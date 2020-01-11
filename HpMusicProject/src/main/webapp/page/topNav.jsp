<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>导航栏</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">

    <style>
        body .admTips .layui-layer-btn a {
            background-color: rgb(255, 87, 34);
            border: 1px solid rgb(255, 87, 34);
            width: 100px;

        }
    </style>
</head>
<body>
<%--导航栏start--%>
<nav class="navbar navbar-expand-md navbar-light fixed-top" id="navCustom" style="padding: 0px 110px">
    <%--<div class="container-fluid">--%>
    <a id="nav-icon" class="navbar-brand" href="main.jsp">
        <img src="<%=path%>/images/main/icon.png" class="d-inline-block align-top">
        <font>
            <span class="english-font sp1">Qiaole</span><span class="sp2" style="font-family: 超世纪粗角报;">黑怕</span>
            <span class="english-font sp3">qiuqiaofang</span>
        </font>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ml-4" id="nav-ul">
            <li class="nav-item active changeColor">
                <a class="nav-link active a-son" href="#">
                    <span class="english-font">HP</span>音乐馆
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link a-son" href="#">排行榜</a>
            </li>
            <li class="nav-item" id="navSinger">
                <a class="nav-link a-son" href="#">音乐人</a>
            </li>
            <li class="nav-item pl-2" id="navSongList">
                <a class="nav-link a-son" href="#">歌单</a>
            </li>
        </ul>
        <%--搜索框--%>
        <input class="form-control mr-sm-2 w-25 ml-4" id="nav-search-box" type="search" placeholder="搜索音乐/歌手/歌单"
               aria-label="Search">

    </div>
    <%--我的音乐--%>
    <div id="nav-myMusic-div" class="mr-3">
        <a id="nav-myMusic-a" href="#">
            <img src="<%=path%>/images/main/myMusic2.png">
        </a>
    </div>
    <%--用户登录注册--%>
    <div id="navLogin">
        <jsp:include page="user/navLogin.jsp"/>
    </div>
    <%--购物车start--%>
    <a id="shopp-car" href="#">
        <i class="layui-icon layui-icon-cart"></i>
    </a>
    <%--购物车end--%>
    <%--</div>--%>
</nav>

<div class="empty">
    <%--<img src="<%=path%>/images/main/auc.jpg" style="width: 100%;height: 80px;">--%>
</div>
<%--导航栏end--%>
<script src="<%=path%>/js/jquery-3.3.1.js"></script>
<script src="<%=path%>/js/jquery.cookie.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script src="<%=path%>/layer/layer.js"></script>
<script src="<%=path%>/layui/layui.all.js"></script>
<script type="text/javascript">
    //搜索框
    $("#nav-search-box").keydown(function (e) {
        keyCod(e)
    })
    //changeColor
    $("#nav-ul>li").click(function () {
        var index = $(this).index()
        var page = new Array('musicHome.jsp', 'topList.jsp', 'singer.jsp','allSongList.jsp')
        $.get(page[index], function (data) {
            $(".content").html(data)
        })
        $(this).addClass("changeColor").siblings().removeClass("changeColor")
        $(this).children("a").css("color", "white")
        $(this).siblings().children("a").css("color", "rgb(105,105,105)")
    });
    //我的音乐
    $("#nav-myMusic-a").click(function () {
        $.get("user/myMusic.jsp", {navA: "myMusic"}, function (data) {
            $(".content").html(data)
            $("#nav-ul>li").removeClass("changeColor").children("a").css("color", "rgb(105,105,105)")
        })
    });

    //滚动导航栏变色
    $(document).ready(function () {
        var navOffest = $("#navCustom").offset().top;
        $(window).scroll(function () {
            var scroll = $(window).scrollTop()
            if (scroll > navOffest) {
                $("#navCustom").animate({}, 1000)
            } else {
                $("#navCustom").animate({}, 1000)
            }
        })
    });

    //我的音乐
    $("#nav-myMusic-div").mouseenter(function () {
        layer.tips('<span style="font-size: 16px;">我的音乐</span>', '#nav-myMusic-div', {
            tips: [4, 'rgba(77,77,77,0.5)'],
            time: 400,
        })
    });

    //注册按钮
    $("#nav-bt-register").click(function () {
        layer.open({
            type: 2,
            title: false,
            closeBtn: 2, //不显示关闭按钮
            shade: [0.7],
            area: ['600px', '500px'],
            offset: '100px', //弹出位置
            time: 0, //2秒后自动关闭
            anim: 0,
            content: ['<%=path%>/page/user/register.jsp', 'no'], //iframe的url，no代表不显示滚动条
        })
    });
    //登录按钮
    $("#nav-bt-login").click(function () {
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
    })

    //js
    function keyCod(e) {
        var e = e.keyCode
        switch (e) {
            case 13:
                search()
                break
            case 108:
                search()
                break
            default:
                break
        }
    }

    function search() {
        var text=$("#nav-search-box").val()
        $.ajax({
            type: 'post',
            url: '<%=path%>/songInfo/getSongInfoByText',
            data: {
                text: text,
            },
            dataType: 'json',
            success: function (data) {
                if(data.stateGetSearchSongs.trim()==='1'){
                    $.get("<%=path%>/page/search/search.jsp",
                        {
                            text:text
                        },
                        function (data) {
                            $(".content").html(data)
                        })
                }
            }
        })
    }
</script>
</body>
</html>
