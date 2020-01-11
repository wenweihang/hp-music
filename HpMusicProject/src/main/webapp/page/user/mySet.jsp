<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/5
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>设置个人安全信息</title>
    <style>
        div {
            border: 0px solid red;
        }
    </style>
</head>
<body>
<div class="container-fluid pb-5">
    <div class="row row1 ml-2" id="mySet-title">
        <div class="pl-2">
            <img src="<%=path%>/images/mySet/myset.png">
        </div>
        <div class="col-md-2 pl-0">
            <span>设置</span>
        </div>
    </div>
    <div class="row pb-5">
        <%--左边--%>
        <div class="col-md-6" id="mySet-left">
            <div class="row row2 ml-3 mb-2">
                <div class="col-md">
                    <span>密码设置</span>
                </div>
            </div>
            <div class="row row3 mt-4 ml-3">
                <div class="col-md-10 ">
                    <div id="cir-box-setLog">
                        <c:if test="${empty stateUpHeImg}">
                            <img src="${logUser.uer_headImg}">
                        </c:if>
                        <c:if test="${!empty stateUpHeImg}">
                            <img src="${serverPath}">
                        </c:if>
                        <span class="ml-3 sp1">登录密码</span>
                    </div>
                </div>
                <div class="col-md-2 pt-3">
                    <a class="text-decoration-none" href="<%=path%>/page/user/myset/changePwd.jsp" target="_blank">
                        <span class="sp2">修改</span>
                    </a>
                </div>
            </div>
            <div class="row row4 ml-3">
                <div class="col-md">
                    <span>绑定设置</span>
                </div>
            </div>
            <div class="row row5 ml-3 mt-4 pb-1">
                <div class="col-md-10">
                    <img src="<%=path%>/images/main/phone.png">
                    <span class="ml-3 sp1">手机</span>
                </div>
                <div class="col-md-2 pt-2">
                    <a class="text-decoration-none" href="<%=path%>/page/user/myset/changePwd.jsp" target="_blank">
                        <span class="sp2">绑定</span>
                    </a>
                </div>
            </div>
            <div class="row row6 ml-3 mt-4 pb-5">
                <div class="col-md-10">
                    <img src="<%=path%>/images/main/email.png">
                    <span class="ml-3 sp1">邮箱</span>
                    <c:if test="${empty stateEmUnBid}">
                        <c:if test="${empty stateEmBid}">
                            <c:if test="${empty logUser.uer_emailAddress}">
                                <span class="spEmAd">(*************)</span>
                            </c:if>
                            <c:if test="${!empty logUser.uer_emailAddress}">
                                <span class="spEmAd">(${logUser.uer_emailAddress})</span>
                            </c:if>
                        </c:if>
                        <c:if test="${!empty stateEmBid}">
                            <span class="spEmAd">(${emBindUser.uer_emailAddress})</span>
                        </c:if>
                    </c:if>
                    <c:if test="${!empty stateEmUnBid}">
                        <span class="spEmAd">(*************)</span>
                    </c:if>
                </div>
                <div class="col-md-2 pt-2">
                    <c:if test="${empty stateEmUnBid}">
                        <c:if test="${empty stateEmBid}">
                            <c:if test="${empty logUser.uer_emailAddress}">
                                <a class="text-decoration-none emailBind" href="#">
                                    <span class="sp2">绑定</span>
                                </a>
                            </c:if>
                            <c:if test="${!empty logUser.uer_emailAddress}">
                                <a class="text-decoration-none emUnBind" href="#">
                                    <span class="sp3">解绑</span>
                                </a>
                            </c:if>
                        </c:if>
                        <c:if test="${!empty stateEmBid}">
                            <a class="text-decoration-none emUnBind" href="#">
                                <span class="sp3">解绑</span>
                            </a>
                        </c:if>
                    </c:if>
                    <c:if test="${!empty stateEmUnBid}">
                        <a class="text-decoration-none emailBind" href="#">
                            <span class="sp2">绑定</span>
                        </a>
                    </c:if>
                </div>
            </div>
        </div>

        <%--右边--%>
        <div class="col-md-6 pr-5 pt-1" id="mySet-right">
            <div class="row row1 ml-2">
                <div class="col-md">
                    <span>登录历史</span>
                </div>
            </div>
            <div class="row row2 ml-2">
                <div class="col-md">
                    <font>以下为您最近一个月的登录记录，若存在异常情况，请在核实后尽快<span>修改密码</span></font>
                </div>
            </div>
            <div class="row row3 ml-2 mt-3">
                <div class="col-md">
                    <table class="table" border="0">
                        <thead class="thead-light">
                        <tr>
                            <th scope="col">序号</th>
                            <th scope="col">IP</th>
                            <th scope="col">地点</th>
                            <th scope="col">时间</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row row4 mt-4" id="mySet-paging">
                <div class="col-md ">
                    <nav aria-label="Page navigation example" class="text-center">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link prev-next" id="Previous" aria-label="Previous" href="#">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <%--<li class="page-item"><a class="page-link aShow">1</a></li>--%>
                            <li class="page-item" id="forward">
                                <a class="page-link prev-next" id="Next"  aria-label="Next" href="#">
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
<script>
    $(function () {
        //默认初始化数据
        var currPage = 1
        var sumPage
        var sumCount
        $.ajax({
            async: false,
            type: 'post',
            url: '<%=path%>/user/paging',
            data: {
                currPage: currPage,
            },
            dataType: 'json',
            success: function (data) {
                var historyList = data.page.lists //获取历史记录集合
                sumPage = data.page.sumPage    //获取总页数
                sumCount = data.page.sumCount    //获取总数
                if (sumCount <= 5) {
                    $("#mySet-paging").empty() //分页为空
                } else {
                    for (var m = 1; m <= sumPage; m++) {
                        if (m == 1) {
                            $("#forward").before('<li class="page-item" id="liShow1"><a class="page-link aShow" id="aShow1" href="#">' + m + '</a></li>')
                        } else {
                            $("#forward").before('<li class="page-item liShow"><a class="page-link aShow" href="#">' + m + '</a></li>')
                        }
                    }
                }
                //遍历记录
                $(historyList).each(function (i) {
                    $("#tbody").append('<tr class="tr2">' +
                        '<th scope="row">' + (i + 1) + '</th>' +
                        '<td>' + this.ulh_ip + '</td>' +
                        '<td>' + this.ulh_address + '</td>' +
                        '<td>' + this.ulh_time + '</td></tr>')
                })
            }
        })
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
                type: 'post',
                url: '<%=path%>/user/paging',
                data: {
                    currPage: currPage,
                },
                dataType: 'json',
                success: function (data) {
                    $("#tbody>tr").empty()
                    var historyList = data.page.lists  //获取历史记录集合
                    var id = 5 * currPage - 4;
                    $(historyList).each(function (i) {
                        $("#tbody").append('<tr class="tr2">' +
                            '<th scope="row">' + (i + id) + '</th>' +
                            '<td>' + this.ulh_ip + '</td>' +
                            '<td>' + this.ulh_address + '</td>' +
                            '<td>' + this.ulh_time + '</td></tr>')
                    })
                }
            })
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
        //邮箱绑定
        $(".emailBind").click(function () {
            layer.open({
                type: 2,
                title: false,
                closeBtn: 2, //不显示关闭按钮
                shade: [0.7],
                area: ['600px', '500px'],
                offset: '100px', //右下角弹出
                time: 0, //2秒后自动关闭
                anim: 0,
                content: ['<%=path%>/page/user/myset/emailBind.jsp', 'no'], //iframe的url，no代表不显示滚动条
            });
        })
        //邮箱解绑
        $(".emUnBind").click(function () {
            layer.open({
                type: 2,
                title: false,
                closeBtn: 2, //不显示关闭按钮
                shade: [0.7],
                area: ['600px', '500px'],
                offset: '100px', //右下角弹出
                time: 0, //2秒后自动关闭
                anim: 0,
                content: ['<%=path%>/page/user/myset/emailUnBind.jsp', 'no'], //iframe的url，no代表不显示滚动条
            });
        })
    })
</script>
</body>
</html>
