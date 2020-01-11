<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/31
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>搜索</title>
</head>
<body>
<div id="tit" style="display: none">搜索</div>
<div id="search-top">
    <%--搜索框--%>
    <input class="form-control mr-sm-2" id="search-box" type="search" placeholder="搜索音乐/歌手/歌单"
           aria-label="Search" value="${param.text}">
</div>
<div id="search-text">
    <div class="container-fluid">
        <div class="row row1 mt-5">
            <div class="col1">
                <span class="sp1">搜索结果</span>
            </div>
            <div class="col-md">
                <ul class="layui-nav">
                    <li class="layui-nav-item layui-this li-type"><a href="#">单曲</a></li>
                    <li class="layui-nav-item li-type"><a href="#">专辑</a></li>
                    <li class="layui-nav-item li-type"><a href="#">歌单</a></li>
                    <li class="layui-nav-item li-type"><a href="#">歌手</a></li>
                </ul>
            </div>
        </div>
        <div id="search-content" class="mt-3">
            <jsp:include page="searchSongs.jsp"/>
        </div>
    </div>
</div>
<script src="<%=path%>/layui/layui.all.js"></script>
<script>
    $(".li-type").click(function () {
        var type=$(this).text()

    })

    //搜索框
    $("#search-box").keydown(function (e) {
        keyCod(e)
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
        var text=$("#search-box").val()
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
