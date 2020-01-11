<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/17
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>下单成功</title>
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">
    <script src="<%=path%>/js/jquery-3.3.1.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <script src="<%=path%>/layui/layui.all.js"></script>
</head>
<body>

<div class="container pb-5 mb-5" style="border: 1px solid rgb(220,220,220);">
    <div id="orderSuccess">
        <div class="row row1 pt-3 pb-3">
            <div class="col1 pl-3 mr-3">
                <img src="<%=path%>/images/order/orderSuccess-yes.png">
            </div>
            <div class="col-md col2 pt-1 pl-0">
                <span>订单提交成功，请您尽快付款!</span>
            </div>
        </div>
        <div class="row row2 mt-3">
            <div class="col-md-4 col1">
                <font>订单号：</font><span class="orderSuccess-orderNumber">${memberOrder.uor_orderNumber}</span>
            </div>
            <div class="col-md col2">
                <font>应付金额：</font><span class="orderSuccess-price">${memberOrder.uor_price}</span><font> 元</font>
            </div>
        </div>
        <div class="row row3 mt-3">
            <div class="col-md-4 col1">
                <font>购买帐号：</font><span>${logUser.uer_act}</span>
            </div>
            <div class="col-md-4 col2">
                <font>下单时间：</font><span>${memberOrder.uor_orderTime}</span>
            </div>
        </div>
        <div class="row row4 mt-2">
            <div class="col-md-4">
                <font>订单详情：</font>
                <span>${memberOrder.uor_detail}</span>
            </div>
        </div>
        <div class="row row5 mt-2">
            <div class="col-md-4">
                <font>温馨提示：</font>
                <span>请您在24小时内完成付款，否则系统将会自动取消您的订单。</span>
            </div>
        </div>
        <div class="row row6 mt-3 ">
            <div class="col-md">
                <a href="tencent://message/?uin=1078216013&Site=Sambow&Menu=yes" class="text-decoration-none">
                    <img src="<%=path%>/images/order/seeOrder-service.png"><span> 联系客服</span>
                </a>
            </div>
        </div>
        <div class="row row7 mt-5">
            <div class="col-md text-center">
                <button type="button" id="btMemberPay" class="btn btn-primary">付款</button>
            </div>
        </div>
    </div>
</div>

<script src="<%=path%>/layer/layer.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    $(function () {
        $("#btMemberPay").click(function () {
            var price = $(".orderSuccess-price").text()
            var orderNumber = $(".orderSuccess-orderNumber").text()
            // alert(orderNumber)
            layer.open({
                type: 2,
                title: false,
                closeBtn: 2, //不显示关闭按钮
                shade: [0.7],
                area: ['600px', '500px'],
                offset: '100px', //右下角弹出
                time: 0, //2秒后自动关闭
                anim: 0,
                content: ['<%=path%>/page/user/order/orderPay.jsp?price=' + price + '&orderNumber=' + orderNumber, 'no'], //iframe的url，no代表不显示滚动条
            });
        })
    })
</script>
</body>
</html>
