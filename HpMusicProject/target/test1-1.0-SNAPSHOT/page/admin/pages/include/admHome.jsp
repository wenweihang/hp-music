<%@ page import="java.nio.file.Path" %><%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/24
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>首页</title>
    <style>
        body{
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<!-- 内容头部 -->
<section class="content-header">
    <h4 style="font-size: 17px">
        <img src="<%=path%>/images/admin/adm1.gif" style="width: 50px;height: 50px;">
        欢迎使用Qiaole黑怕网站后台管理系统
    </h4>
</section>
<!-- 内容头部 /-->
<!-- 正文区域 -->
<section class="content">
<div style="height: 635px">
    <img src="<%=path%>/images/admin/admHomeBackg.jpg" width="100%" height="100%">
</div>
</section>
<script src="<%=path%>/js/jquery.cookie.js"></script>
</body>
</html>
