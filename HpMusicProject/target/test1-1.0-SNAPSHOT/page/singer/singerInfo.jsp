<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/20
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>歌手信息</title>
</head>
<body >
<div id="singerInfo-top">
    <div class="container-fluid" >
        <div class="row pt-5" >
            <div class="col-md-2">
                <img class="imgAddress" src="${param.sgr_imgAddress}">
            </div>
            <div class="col-md pl-5">
                <div class="row row1 mt-3">
                    <div class="col-md">
                        <span>${param.sgr_name}</span>
                    </div>
                </div>
                <div class="row row2 mt-3">
                    <div class="col-md-10">
                        <div>${param.sgr_detail}</div>
                    </div>
                </div>
                <div class="row row3 mt-4">
                    <div class="col-md-2">
                        <button type="button" class="btn" id="playAll">
                            <img src="<%=path%>/images/songList/songList-play.png">播放全部歌曲
                        </button>
                    </div>
                    <div class="col-md pl-5">
                        <button type="button" class="btn" id="collect">
                            <img src="<%=path%>/images/main/singerInfo-add.png">关注
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div id="singerInfo">
        <div class="row row1">
            <div class="col-md">
                <ul class="layui-nav pl-0" id="ul-nav">
                    <li class="layui-nav-item layui-this singerClick"><a href="#" id="sSong">单曲</a></li>
                    <li class="layui-nav-item singerClick"><a href="#" id="sZJ">专辑</a></li>
                    <%--<li class="layui-nav-item singerClick"><a href="#" id="sMV">MV</a></li>--%>
                </ul>
            </div>
        </div>
        <div id="singerInfo-content" class="mt-2">
            <jsp:include page="singerSongContent.jsp"/>
        </div>
    </div>
</div>
<script src="<%=path%>/layui/layui.all.js"></script>
<script>
    //单曲默认加粗
    $("#ul-nav>li:first-child").css("font-weight","bold")
    $(".singerClick").click(function () {
        $(this).css("font-weight","bold")
        $(this).siblings().css("font-weight","normal")
        var index=$(this).index()
        var htmArr=new Array("singerSongContent.jsp","singerZJContent.jsp","singerMVContent.jsp")
        var szj_author='${param.sgr_name}';
        if(index==1){
            $.ajax({
                type: 'post',
                url: '<%=path%>/songZJ/getSongZJByName',
                data: {
                    szj_author: szj_author
                },
                dataType: 'json',
                success: function (data) {
                    if(data.stateGetSongZJByName.trim()==="1"){
                        $.get("singer/"+htmArr[index],function (data) {
                            $("#singerInfo-content").html(data)
                        })
                    }
                }
            })
        }
        $.get("singer/"+htmArr[index],function (data) {
            $("#singerInfo-content").html(data)
        })

    })
</script>
</body>
</html>
