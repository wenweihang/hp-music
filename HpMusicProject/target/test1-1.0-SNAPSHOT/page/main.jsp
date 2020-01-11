<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>Qiaole黑怕-硬核说唱</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/css/APlayer.min.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">

    <style>
        /*main*/
        body {
            height: 100%;
            /*overflow-x: hidden !important;*/
        }

        .wrapper {
            min-height: 100%;
            position: relative;
        }

        .content {
            /*footer的高度*/
            padding-bottom: 380px;

        }

        .footer {
            width: 100%;
            height: 380px;
            color: #fff;
            background-color: rgb(51, 51, 51);
            position: absolute;
            bottom: 0;
        }


        /*main*/
    </style>
</head>
<body>
<div class="wrapper">
    <%--导航栏部分start--%>
    <div class="top">
        <jsp:include page="topNav.jsp"/>
    </div>
    <%--导航栏部分end--%>

    <%--中间内容部分start--%>
    <div class="content">

    </div>
    <%--中间内容部分end--%>

    <%--底部介绍栏start--%>
    <div class="footer">
        <jsp:include page="bomContent.jsp"/>
    </div>
    <%--底部介绍栏end--%>
    <jsp:include page="audio/BotmAudio.jsp"/>
</div>
<script src="<%=path%>/js/jquery-3.3.1.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script src="<%=path%>/layer/layer.js"></script>
<script src="<%=path%>/layui/layui.all.js"></script>
<script>
    //默认初始化musicHome歌单数据
    $.ajax({
        async: false,
        type: 'post',
        url: '<%=path%>/songList/getSongListMain',
        data: {},
        dataType: 'json',
        success: function (result) {
            $.get("musicHome.jsp", function (data) {
                $(".content").html(data)
            })
        }
    })
    //获取新歌
    $.ajax({
        type: 'post',
        url: '<%=path%>/songInfo/getNewSongs',
        dataType: 'json',
        success: function (data) {
        }
    })

</script>
</body>
</html>
