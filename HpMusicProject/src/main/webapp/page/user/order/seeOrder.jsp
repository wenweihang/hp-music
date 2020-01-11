<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/21
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>订单详情</title>
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">
    <script src="<%=path%>/js/jquery-3.3.1.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <div id="seeOrder">
        <div class="row row1">
            <div class="col-md col1 pt-3 pb-3 pl-2">
                <font id="orderNumber11">订单号：</font><span>${param.orderNumber}</span>
            </div>
        </div>
        <div class="row row2 mt-3">
            <div class="col-md-1">
            </div>
            <div class="col-md pl-0">
                <span>用户下单</span>
            </div>
            <div class="col-md pr-0 text-right">
                <span>交易完成</span>
            </div>
            <div class="col-md-1">
            </div>
        </div>
        <div class="row row3 mt-4">
            <div class="col-md-1">
            </div>
            <div class="col-md col1">
                <div class="layui-progress ">
                    <c:if test="${param.state=='等待买家付款'}">
                        <div class="layui-progress-bar layui-bg-blue" lay-percent="50%"></div>
                    </c:if>
                    <c:if test="${param.state=='已付款'}">
                        <div class="layui-progress-bar layui-bg-blue" lay-percent="100%"></div>
                    </c:if>
                    <img class="img1" src="<%=path%>/images/order/seeOrder-yes.png">
                    <img class="img2" src="<%=path%>/images/order/seeOrder-yes.png">
                </div>
            </div>
            <div class="col-md-1">
            </div>
        </div>
        <div class="row row4 mt-4">
            <div class="col-md-2 text-right pr-0">
                <span>${param.orderTime}</span>
            </div>
            <div class="col-md">
            </div>
            <div class="col-md">
            </div>
            <div class="col-md-2 pl-0">
                <c:if test="${param.finishTime=='null'}">
                    <span></span>
                </c:if>
                <c:if test="${param.finishTime!='null'}">
                    <span>${param.finishTime}</span>
                </c:if>
            </div>
        </div>
        <div class="row row5 mt-4" style="border: 1px solid rgb(220,220,220);">
            <div class="col-md">
                <div class="row row51">
                    <div class="col-md col2 pt-3 pb-3 pl-2">
                        <span>订单详情：</span>
                    </div>
                </div>
                <div class="row row52 mt-3">
                    <div class="col-md-4 col1 pl-2">
                        <font>下单用户：</font><span class="seeOrder-orderNumber">${logUser.uer_name}</span>
                    </div>
                    <div class="col-md col2 pl-2">
                        <font>付款金额：</font><span class="seeOrder-price">${param.price}</span><font> 元</font>
                    </div>
                </div>
                <div class="row row53 mt-2">
                    <div class="col-md-4 col1 pl-2">
                        <font>商品类型：</font><span>${param.commodityType}</span>
                    </div>
                    <div class="col-md-4 col2 pl-2">
                        <font>下单时间：</font><span>${param.orderTime}</span>
                    </div>
                </div>
                <div class="row row54 mt-2">
                    <div class="col-md-4 pl-2">
                        <font>xxx：</font>
                        <span>${memberOrder.uor_detail}</span>
                    </div>
                </div>
                <div class="row row55 mt-2 pb-3">
                    <div class="col-md-6 pl-2">
                        <font>温馨提示：</font>
                        <c:if test="${param.state=='等待买家付款'}">
                            <span>您还未完成付款，请在24小时内完成付款。超过24小时,系统将自动为你取消订单。如若有问题，请及时询问客服。</span>
                        </c:if>
                        <c:if test="${param.state=='已付款'}">
                            <span>您已经完成付款，订单即刻生效。如若有问题，请及时询问客服。</span>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
        <div class="row row6 mt-4 " style="border: 1px solid rgb(220,220,220);">
            <div class="col-md">
                <table class="table table-borderless">
                    <thead>
                    <tr>
                        <th scope="col" class="th1" id="tt"></th>
                        <th scope="col" class="th2">商品名称</th>
                        <th scope="col" class="th3">单价（元）</th>
                        <th scope="col" class="th4">商品优惠</th>
                        <th scope="col" class="th5">数量</th>
                        <th scope="col" class="th6">交易状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <img src="<%=path%>/images/order/seeOrder-vip.png">
                        </td>
                        <td>${param.type}</td>
                        <td>${param.price}</td>
                        <td></td>
                        <td>1</td>
                        <td>${param.state}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row row7 mt-3 ">
            <div class="col-md">
                <a href="tencent://message/?uin=1078216013&Site=Sambow&Menu=yes" class="text-decoration-none">
                    <img src="<%=path%>/images/order/seeOrder-service.png"><span> 联系客服</span>
                </a>
            </div>
        </div>
        <div class="row row7 mt-3 ">
            <div class="col-md-10">
            </div>
            <div class="col-md">
                <a id="btSeeoBack" class="btn btn-primary" href="#">返回</a>
            </div>
        </div>
    </div>
</div>
<script src="<%=path%>/layui/layui.all.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    $(function () {
        <%--alert(${param.state})--%>
        $("#btSeeoBack").click(function () {
            $.get("<%=path%>/page/user/myOrder.jsp", function (data) {
                $(".content").html(data)
            })
        })
    })
</script>
</body>
</html>
