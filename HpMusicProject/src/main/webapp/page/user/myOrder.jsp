<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/17
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>我的订单</title>
</head>
<body>
<div style="background-color: rgb(240,240,240);">
    <div class="container">
        <div id="myOrder">
            <div class="row row1">
                <div class="col-md">
                    <div class="headCir">
                        <img src="<%=path%>/images/main/headCir.png" style="display: none">
                    </div>
                    <div id="myOrder-cir-box">
                        <c:if test="${empty stateUpHeImg}">
                            <img class="img1" src="${logUser.uer_headImg}">
                            <div>
                                <c:if test="${empty stateUpd}">
                                    <span class="sp1"> &nbsp;&nbsp;${logUser.uer_name}</span>
                                </c:if>
                                <c:if test="${!empty stateUpd}">
                                    <span class="sp1"> &nbsp;&nbsp;${updUser.uer_name}</span>
                                </c:if><br>
                                <img class="img2" src="<%=path%>/images/main/vip-no.png">
                            </div>
                        </c:if>
                        <c:if test="${!empty stateUpHeImg}">
                            <img class="img1" src="${serverPath}">
                            <div>
                                <c:if test="${empty stateUpd}">
                                    <span class="sp1"> &nbsp;&nbsp;${logUser.uer_name}</span>
                                </c:if>
                                <c:if test="${!empty stateUpd}">
                                    <span class="sp1"> &nbsp;&nbsp;${updUser.uer_name}</span>
                                </c:if><br>
                                <img class="img2" src="<%=path%>/images/main/vip-no.png">
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="row row2 mt-5">
                <div class="col-md text-backg">
                    <img/>
                    <div class="row row21 mt-3 pl-2">
                        <div class="col-md">
                            <h4>我的订单记录</h4>
                        </div>
                    </div>
                    <div class="row row22 mt-3">
                        <div class="col-md">
                            <table class="table">
                                <thead class="" style="">
                                <tr>
                                    <th scope="col" class="th1 pl-5">订单编号</th>
                                    <th scope="col" class="th2 text-left">商品类型</th>
                                    <th scope="col" class="th3 text-left">下单时间</th>
                                    <th scope="col" class="th4 text-left">数量</th>
                                    <th scope="col" class="text-left">交易状态</th>
                                    <th scope="col" class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody id="tbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row row23 " id="myOrder-paging">
                        <div class="col-md">
                            <nav aria-label="Page navigation example" class="text-center">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link prev-next" id="Previous" aria-label="Previous" href="#">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <%--<li class="page-item"><a class="page-link aShow">1</a></li>--%>
                                    <li class="page-item" id="forward">
                                        <a class="page-link prev-next" id="Next" aria-label="Next" href="#">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        //判断是否为会员用户
        if(${!empty memberInfoList}||${!empty updMemberInfo}){
            $(".headCir>img").show()
            $("#myOrder-cir-box .img1").css("border","3px solid rgb(252,193,45)")
            $("#myOrder-cir-box .img2").attr("src","<%=path%>/images/main/vip-yes.png")
        }
        //默认初始化数据
        var currPage = 1
        var orderList, sumPage, sumCount, orderNumber, price, commodityType, orderTime, finishTime, type, state
        $.ajax({
            async: false,
            type: 'post',
            url: '<%=path%>/user/orderPaging',
            data: {
                currPage: currPage,
            },
            dataType: 'json',
            success: function (data) {
                orderList = data.page.lists //获取历史记录集合
                sumPage = data.page.sumPage    //获取总页数
                sumCount = data.page.sumCount    //获取总数
                if (sumCount <= 7) {
                    $("#myOrder-paging").empty() //分页为空
                } else {
                    for (var m = 1; m <= sumPage; m++) {
                        if (m == 1) {
                            $("#forward").before('<li class="page-item" id="liShow1"><a class="page-link aShow" id="aShow1" href="#">' + m + '</a></li>')
                        } else {
                            $("#forward").before('<li class="page-item liShow"><a class="page-link aShow" href="#">' + m + '</a></li>')
                        }
                    }
                }
                //获取订单信息
                getTable(orderList, orderNumber, price, commodityType, orderTime, finishTime, type, state)
            }
        })
        //如果不存在订单,插入背景
        if (sumCount==0) {
            $(".text-backg>img").attr("src", "<%=path%>/images/order/myOrder-font.png")
        }
        //查看订单详情按钮
        btSeeClick(".myOrder-detail")
        //付款按钮
        btPayClick(".myOrder-pay")
        //给默认页加颜色
        $("#aShow1").css("color", "red")
        $(".aShow").click(function () {
            currPage = $(this).text()
            //切换颜色
            if (currPage == 1) {
                $("#Previous").attr("disabled", "true");
                $("#Previous>span").css({"color": "rgb(200,200,200)"});
                $("#Previous").css({"cursor": "not-allowed"})
            } else {
                $("#Previous").attr("disabled", "false");
                $("#Previous>span").css({"color": ""});
                $("#Previous").css({"cursor": "pointer"})
            }
            if (currPage == sumPage) {
                $("#Next").attr("disabled", "true");
                $("#Next>span").css({"color": "rgb(200,200,200)"});
                $("#Next").css({"cursor": "not-allowed"})
            } else {
                $("#Next").attr("disabled", "false");
                $("#Next>span").css({"color": ""});
                $("#Next").css({"cursor": "pointer"})
            }
            $(this).css("color", "red")
            $(this).parent().siblings().children(".aShow").css("color", "")
            // alert(currPage)
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/user/orderPaging',
                data: {
                    currPage: currPage,
                },
                dataType: 'json',
                success: function (data) {
                    $("#tbody>tr").empty()
                    var orderList = data.page.lists  //获取订单集合
                    //获取订单信息
                    getTable(orderList)
                }
            })
            //查看订单详情按钮
            btSeeClick(".myOrder-detail")
            //付款按钮
            btPayClick(".myOrder-pay")
        })
        //后退
        if (currPage == 1) {
            $("#Previous").attr("disabled", "true");
            $("#Previous>span").css({"color": "rgb(200,200,200)"});
            $("#Previous").css({"cursor": "not-allowed"})
        }
        $("#Previous").click(function () {
            var prev = currPage - 2;
            $(".aShow:eq('" + prev + "')").click()
        })
        //前进
        $("#Next").click(function () {
            var next = currPage;
            $(".aShow:eq('" + next + "')").click()
        })
    });

    //js
    //遍历订单信息
    function getTable(orderList, orderNumber, price, commodityType, orderTime, finishTime, type, state) {
        $(orderList).each(function (i) {
            orderNumber = this.uor_orderNumber
            price = this.uor_price
            commodityType = this.uor_commodityType
            orderTime = this.uor_orderTime
            finishTime = this.uor_finishTime
            type = this.uor_type
            state = this.uor_state
            var td = '<td scope="row" class="thOrderNumber">' + orderNumber + '</td><td class="tdCommodityType">'
                + commodityType + '</td>' + '<td class="tdOrderTime">' + orderTime + '</td><td class="tdType">'
                + type + '</td><td class="tdState">' + state + '</td>'
            var val = '<div class="divPrice" style="display: none">' + price + '</div>' +
                '<div class="divFinishTime" style="display: none">' + finishTime + '</div>'
            if (state == "已付款") {
                $("#tbody").append('<tr class="tr2">' + td + '<td class="text-center"><a class="myOrder-detail" href="#">订单详情' + val + '</a><br><span>交易成功</span></td></tr>')
            } else {
                $("#tbody").append('<tr class="tr2">' + td + '<td class="td-myOrder-pay text-center"><a class="myOrder-detail" href="#">订单详情' + val + '</a><br><a class="myOrder-pay">付款</a></td></tr>')

            }
        })
    };
    //查看订单详情按钮
    function btSeeClick(obj) {
        $(obj).click(function () {
            //获取每一行的数据
            var thOrderNumber = $(this).parent().siblings(".thOrderNumber").text()
            var divPirce = $(this).children(".divPrice").text()
            var tdCommodityType = $(this).parent().siblings(".tdCommodityType").text()
            var tdOrderTime = $(this).parent().siblings(".tdOrderTime").text()
            var divFinishTime = $(this).children(".divFinishTime").text()
            var tdType = $(this).parent().siblings(".tdType").text()
            var tdState = $(this).parent().siblings(".tdState").text()
            $(".content").load("<%=path%>/page/user/order/seeOrder.jsp",
                {
                    orderNumber: thOrderNumber,
                    price: divPirce,
                    commodityType: tdCommodityType,
                    orderTime: tdOrderTime,
                    finishTime: divFinishTime,
                    type: tdType,
                    state: tdState
                },
                function () {

                })
        })
    };
    //付款按钮
    function btPayClick(obj) {
        $(obj).click(function () {
            var thOrderNumber = $(this).parent().siblings(".thOrderNumber").text()
            var divPirce = $(this).siblings().children(".divPrice").text()
            layer.open({
                type: 2,
                title: false,
                closeBtn: 2, //不显示关闭按钮
                shade: [0.7],
                area: ['600px', '500px'],
                offset: '100px', //右下角弹出
                time: 0, //2秒后自动关闭
                anim: 0,
                content: ['<%=path%>/page/user/order/orderPay.jsp?price=' + divPirce + '&orderNumber=' + thOrderNumber, 'no'], //iframe的url，no代表不显示滚动条
            })
        })
    };

</script>
</body>
</html>
