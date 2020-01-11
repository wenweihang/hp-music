<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/25
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>歌手专辑</title>
</head>
<body>
<div class="row" id="singerZJ">
    <c:forEach items="${singerSongZJList}" var="zj">
        <div class="col-md-2">
            <a href="#" class="a-zj"><img src="${zj.szj_imgAddress}" width="190" height="190"></a><br><br>
            <a href="#" class="a-zj"><span class="sp1">${zj.szj_title}</span></a><br>
            <span class="sp2">${zj.szj_releaseTime}</span>
            <div class="author" style="display: none">${zj.szj_author}</div>
            <div class="language" style="display: none">${zj.szj_language}</div>
            <div class="detail" style="display: none">${zj.szj_detail}</div>
        </div>
    </c:forEach>
</div>
<script>
    $(".a-zj").click(function () {
        var szj_imgAddress=$(this).parent().find("img").attr("src")
        var szj_title=$(this).parent().find(".sp1").text()
        var szj_author=$(this).parent().find(".author").text()
        var szj_language=$(this).parent().find(".language").text()
        var szj_releaseTime=$(this).parent().find(".sp2").text()
        var szj_detail=$(this).parent().find(".detail").text()
        $.get("singer/singerSongZJ.jsp",
            {
                szj_imgAddress:szj_imgAddress,
                szj_title:szj_title,
                szj_author:szj_author,
                szj_language:szj_language,
                szj_releaseTime:szj_releaseTime,
                szj_detail:szj_detail,
            },
            function (data) {
            $(".content").html(data)
        })
    })
</script>
</body>
</html>
