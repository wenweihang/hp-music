<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/17
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>支付成功</title>
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">
    <script src="<%=path%>/js/jquery-3.3.1.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
</head>
<body>
<div id="paySuccess" align="center">
    <div class="row row1 mt-5">
        <div class="col-md">
            <img src="<%=path%>/images/order/orderSuccess-yes.png">
        </div>
    </div>
    <div class="row row2 mt-2">
        <div class="col-md">
            <span>支付成功</span>
        </div>
    </div>
    <div class="row row3 mt-4">
        <div class="col-md">
            <font>您的订单<span class="orderNumber"></span>已经支付成功,感谢您的支持。</font>
        </div>
    </div>
    <div class="row row4 mt-5">
        <div class="col-md">
            <button type="button" id="btFinal" class="btn btn-primary">完成</button>
        </div>
    </div>
</div>
<script src="<%=path%>/layer/layer.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    $(function () {
        var url = location.search
        var index = url.indexOf("=")
        var orderNumber = url.substring(index + 1)
        $(".orderNumber").text(orderNumber)
        var index = parent.layer.getFrameIndex(window.name);
        $("#btFinal").click(function () {
            parent.layer.load()
            parent.layer.msg('<span style="font-size:17px;margin-left: 10px;">亲!正在为您跳转到首页界面哦</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
            setTimeout(function () {
                parent.layer.closeAll('loading');
                parent.layer.close(index)
                parent.location.reload()
            }, 1200)

        })
    })
</script>
</body>
</html>
