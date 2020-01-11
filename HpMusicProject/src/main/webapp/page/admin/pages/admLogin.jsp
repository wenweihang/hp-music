<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/25
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>Qiaole黑怕-管理员登录界面</title>
    <link rel="stylesheet" href="<%=path%>/css/admstyle.css">
    <script src="<%=path%>/js/jquery-3.3.1.js"></script>
    <style>


    </style>
</head>
<body style='background: url("<%=path%>/images/admin/admLoginBackg.jpg")'>
<div style="text-align: center;padding-top: 50px">
    <div class="bg">
        <span class="english-font" style="font-size: 39px;color: rgb(255,87,34)"><strong>Qiaole</strong></span>
        <span style="font-size: 34px;color: white;">黑怕后台管理系统</span>
    </div>
</div>
<script src="<%=path%>/layer/layer.js"></script>
<script>
    layer.open({
        type: 2,
        title: false,
        closeBtn: 0, //不显示关闭按钮
        shade: [0],
        area: ['530px', '400px'],
        offset: '140px', //右下角弹出
        time: 0, //2秒后自动关闭
        anim: 0,
        content: ['<%=path%>/page/admin/pages/include/admLoginIframe.jsp', 'no'], //iframe的url，no代表不显示滚动条
    });

</script>
</body>
</html>
