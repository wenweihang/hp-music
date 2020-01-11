<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2020/1/2
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>歌单</title>
</head>
<body>
<div id="navSongList">
    <div class="container-fluid">
        <div class="row row1 mt-5">
            <div class="col1">
                <span class="sp1">全部歌单</span>
            </div>
            <div class="col-md col2">
                <ul class="layui-nav">
                    <li class="layui-nav-item layui-this li-type" value="main"><a href="#">推荐</a></li>
                    <li class="layui-nav-item li-type" value="new"><a href="#">最新</a></li>
                    <li class="layui-nav-item li-type" value="hot"><a href="#">最热</a></li>
                </ul>
            </div>
        </div>
        <div id="navSongList-content">
            <jsp:include page="music/allSongLists.jsp"/>
        </div>
    </div>
</div>
<script src="<%=path%>/layui/layui.all.js"></script>
<script>
    //获取所有歌单
    $.ajax({
        type: 'post',
        url: '<%=path%>/songList/getAllSongLists',
        dataType: 'json',
        success: function (data) {
            if (data.stateGetAllSongLists.trim() === '1') {
                $("#navSongList-content").load('<%=path%>/page/music/allSongLists.jsp', function () {
                })
            }
        }
    })
    //点击获取最新或最热
    $(".li-type").click(function () {
        var type = $(this).attr("value")
        if (type == 'main') {
            $.ajax({
                type: 'post',
                url: '<%=path%>/songList/getAllSongLists',
                dataType: 'json',
                success: function (data) {
                    if (data.stateGetAllSongLists.trim() === '1') {
                        $("#navSongList-content").load('<%=path%>/page/music/allSongLists.jsp', function () {
                        })
                    }
                }
            })
        }

        if (type == 'new') {
            $.ajax({
                type: 'post',
                url: '<%=path%>/songList/getNewSongLists',
                data: {
                    sl_new: type
                },
                dataType: 'json',
                success: function (data) {
                    if (data.stateGetNewSongLists.trim() === '1') {
                        $("#navSongList-content").load('<%=path%>/page/music/newSongLists.jsp', function () {
                        })
                    }
                }
            })
        }

        if (type == 'hot') {
            $.ajax({
                type: 'post',
                url: '<%=path%>/songList/getHotSongLists',
                data: {
                    sl_hot: type
                },
                dataType: 'json',
                success: function (data) {
                    if (data.stateGetHotSongLists.trim() === '1') {
                        $("#navSongList-content").load('<%=path%>/page/music/hotSongLists.jsp', function () {
                        })
                    }
                }
            })
        }
    })
</script>
</body>
</html>
