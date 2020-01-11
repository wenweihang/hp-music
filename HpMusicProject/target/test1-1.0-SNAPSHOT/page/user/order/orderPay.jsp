<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/17
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>订单付款</title>
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">
    <script src="<%=path%>/js/jquery-3.3.1.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <style>
        .layui-tab-brief > .layui-tab-title .layui-this{
            color: rgb(70,70,70);
        }
        .layui-tab-brief > .layui-tab-title .layui-this:after {
            margin-top: 3px;
            margin-left: 22px;
            border: none;
            width: 45px;
            border-radius: 0;
            border-bottom: 4px solid rgb(255, 85, 82);
        }
    </style>
</head>
<body>
<div id="orderPay">
    <div class="row row1 mt-3 pb-1">
        <div class="col-md col2">
            <img src="<%=path%>/images/order/orderPay-pay.png"><span> 请您尽快付款</span>
        </div>
    </div>
    <div class="row row2 mt-3">
        <div class="col-md-4 col1">
            <font>您需要支付：</font><span class="orderPayPrice"></span><span> 元</span>
        </div>
    </div>
    <div class="row row3">
        <div class="col-md">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">微信支付</li>
                    <li>支付宝支付</li>
                </ul>
                <div class="layui-tab-content" style="height: 220px;">
                    <div class="layui-tab-item layui-show ">
                        <img class="mt-2" src="<%=path%>/images/pay/wechat.png">
                    </div>
                    <div class="layui-tab-item">
                        <img class="mt-2" src="<%=path%>/images/pay/alipay.jpg">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row row4">
        <div class="col-sm-3 pl-5">

        </div>
        <div class="col-sm-2 col1 pt-2">
            <span>付款码:</span>
        </div>
        <div class="col-sm col2 pl-0">
            <input type="password" class="form-control" id="payCode" placeholder="请输入付款码" >
        </div>
    </div>
    <div class="row row5 mt-3">
        <div class="col-md text-center">
            <button type="button" id="btOrderPay" class="btn btn-primary">付款</button>
        </div>
    </div>
</div>
<script src="<%=path%>/layui/layui.all.js"></script>
<script src="<%=path%>/layer/layer.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    $(function () {
        // 页面传值
        var url = location.search
        var sArr = url.split("&")
        var index = sArr[0].indexOf("=")
        var price = sArr[0].substring(index + 1)
        var index2 = sArr[1].indexOf("=")
        var uor_orderNumber = sArr[1].substring(index2 + 1)
        $(".orderPayPrice").text(price)
        $("#payCode").focus()
        //付款
        $("#btOrderPay").click(function () {
            var payCode = $("#payCode").val()
            pay(uor_orderNumber,payCode)
        })
        $("#payCode").keydown(function (e) {
            var payCode = $("#payCode").val()
            keyCod(e,uor_orderNumber,payCode)
        })
    })

    //js
    function keyCod(e,uor_orderNumber,payCode) {
        var e=e.keyCode
        switch (e){
            case 13:
                pay(uor_orderNumber,payCode)
                break
            case 108:
                pay(uor_orderNumber,payCode)
                break
            default:break
        }
    }

    function pay(uor_orderNumber,payCode) {
        if (payCode === '') {
            layer.msg('<span style="font-size:17px">付款码不能为空</span>', {
                offset: '180px',
                anim: 6,
                time: 1200,
            });
        } else {
            $.ajax({
                type: 'post',
                url: '<%=path%>/member/updMemOrder',
                data: {
                    uor_orderNumber: uor_orderNumber,
                    payCode: payCode
                },
                dataType: 'json',
                success: function (data) {
                    if (data.statePay.trim() === "1") {
                        layer.load()
                        setTimeout(function () {
                            layer.closeAll()
                            location.href = "paySuccess.jsp?uor_orderNumber=" + uor_orderNumber
                        }, 1000)
                    }
                    if (data.statePay.trim() === "0") {
                        layer.msg('<span style="font-size:17px">付款码错误</span>', {
                            offset: '180px',
                            anim: 6,
                            time: 1200,
                        });
                    }
                }
            })
        }
    }
</script>
</body>
</html>
