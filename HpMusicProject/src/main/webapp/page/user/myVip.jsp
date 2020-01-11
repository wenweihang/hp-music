<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/15
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>Qiaole黑怕会员中心</title>
</head>
<body>
<!--轮翻图开始-->
<div style="background-color: rgb(240,240,240)">
    <div id="carouselExampleIndicators" class="carousel slide carousel-fade " data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="<%=path%>/images/myVip/myVip-rf1.jpg" class="d-block w-100" height="400">
            </div>
            <div class="carousel-item" data-interval="2000">
                <img src="<%=path%>/images/myVip/myVip-rf2.jpg" class="d-block w-100" height="400">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!--轮翻图结束-->

    <div class="container mt-5 ">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" id="myVip">
            <ul class="layui-tab-title text-center">
                <li class="layui-this">
                    <img src="<%=path%>/images/myVip/myVip-recom.png">黑怕VIP
                </li>
                <li>开通</li>
            </ul>
            <div class="layui-tab-content text-backg mt-3">
                <div class="layui-tab-item layui-show mtext1">
                    <div class="row row1">
                        <div class="col-md col1">
                            <div>
                                <div class="row row11">
                                    <div class="col-md-4 col11">
                                        <c:if test="${empty stateUpHeImg}">
                                            <div id="myVip-divCir">
                                                <img class="img1" src="${logUser.uer_headImg}">
                                            </div>
                                        </c:if>
                                        <c:if test="${!empty stateUpHeImg}">
                                            <div id="myVip-divCir">
                                                <img class="img1" src="${serverPath}">
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="col-md col12 pt-4 pl-0">
                                        <c:if test="${empty stateUpd}">
                                            <span class="sp1"> &nbsp;&nbsp;${logUser.uer_name}</span>
                                        </c:if>
                                        <c:if test="${!empty stateUpd}">
                                            <span class="sp1"> &nbsp;&nbsp;${updUser.uer_name}</span>
                                        </c:if>
                                        <img class="mVvip-no" src="<%=path%>/images/main/vip-no.png"><br>
                                        <c:if test="${!empty memberInfoList}">
                                            <div class="pt-4">
                                                <span class="sp2 ml-2">您已开通黑怕VIP</span>
                                            </div>
                                            <div class="pt-4">
                                                <span class="sp2 ml-2">${end_timeDao}到期</span>
                                            </div>
                                        </c:if>
                                        <c:if test="${empty memberInfoList}">
                                            <c:if test="${empty updMemberInfo}">
                                                <div class="pt-4">
                                                    <span class="sp2 ml-2">您当前还未开通</span>
                                                </div>
                                            </c:if>
                                            <c:if test="${!empty updMemberInfo}">
                                                <div class="pt-4">
                                                    <span class="sp2 ml-2">您已开通黑怕VIP</span>
                                                </div>
                                                <div class="pt-4">
                                                    <span class="sp2 ml-2">${updMemberInfo.end_time}到期</span>
                                                </div>
                                            </c:if>
                                        </c:if>
                                    </div>
                                    <div class="col-md-3 col13 pt-3 text-center">
                                        <a class="paySong" href="#">我购买的单曲 ></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col2 pl-0">
                            <img src="<%=path%>/images/myVip/myVip-img3.png">
                        </div>
                    </div>
                    <div class="row row2 mt-3">
                        <div class="col-md col1 pl-5">
                            <hr class="ml-4" style="height: 3px;">
                        </div>
                        <div class="col-md-1.5 col2">
                            <span>黑怕VIP特权</span>
                        </div>
                        <div class="col-md col3 pr-5">
                            <hr class="mr-4" style="height: 3px;">
                        </div>
                    </div>
                    <div class="row row3 mt-2">
                        <div class="col-md pt-5 pb-5">

                        </div>
                        <div class="col-md pt-5 pb-5 col1 privHover" id="iden">
                            <img src="<%=path%>/images/myVip/myVip-vip.png"><br><br>
                            <span>尊贵身份标识</span>
                        </div>
                        <div class="col-md pt-5 pb-5 col2 privHover" id="freeDown">
                            <img src="<%=path%>/images/myVip/myVip-download.png"><br><br>
                            <span>免费歌曲下载</span>
                        </div>
                        <div class="col-md pt-5 pb-5 col3 privHover" id="noAD">
                            <img src="<%=path%>/images/myVip/myVip-ad.png"><br><br>
                            <span>免广告</span>
                        </div>
                        <div class="col-md pt-5 pb-5 col4 privHover" id="bService">
                            <img src="<%=path%>/images/myVip/myVip-service.png"><br><br>
                            <span>专属客服</span>
                        </div>
                        <div class="col-md pt-5 pb-5 ">

                        </div>
                    </div>
                    <div class="row row4">
                        <div class="col-md pt-5 pb-5">

                        </div>
                        <div class="col-md pt-5 pb-5 col1 privHover" id="discount">
                            <img src="<%=path%>/images/myVip/myVip-discount.png"><br><br>
                            <span>消费折扣</span>
                        </div>
                        <div class="col-md pt-5 pb-5 col2 privHover" id="gxFont">
                            <img src="<%=path%>/images/myVip/myVip-font.png"><br><br>
                            <span>个性字体</span>
                        </div>
                        <div class="col-md pt-5 pb-5 col3 privHover" id="bHeadCir">
                            <img src="<%=path%>/images/myVip/myVip-headCir.png"><br><br>
                            <span>专属黑怕框</span>
                        </div>
                        <div class="col-md pt-5 pb-5 col4 privHover" id="freeMV">
                            <img src="<%=path%>/images/myVip/myVip-mv.png"><br><br>
                            <span>免费MV下载</span>
                        </div>
                        <div class="col-md pt-5 pb-5">

                        </div>
                    </div>
                    <hr class="ml-5 mr-5" style="height: 2px;">
                    <div class="myVipcontent">
                        <div class="mcontent iden">
                            <div class="row row1">
                                <div class="col-md">
                                    <img src="<%=path%>/images/myVip/myVip-vip2.png">&nbsp;
                                    <span>尊贵身份标识</span>
                                </div>
                            </div>
                            <div class="row row2">
                                <div class="col-md-1">
                                </div>
                                <div class="col-md">
                                    <span>
                                     独一无二的黑怕VIP标识，彰显尊贵身份。当您登录后，您将会看到VIP闪耀标识，
                                     散发出你与众不同的音乐气质，让你在音乐世界中更加出众耀眼！
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item mtext2">
                    <div class="row row1 mt-2">
                        <div class="col-md-1 pl-5">
                            <img src="<%=path%>/images/myVip/myVip-vip3.png">
                        </div>
                        <div class="col-md pl-0">
                            <h4>开通黑怕VIP</h4>
                        </div>
                    </div>
                    <div class="row row2 mt-3">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md pl-0">
                            <span>
                                目前我们仅支持微信支付和支付宝支付，如果你不懂如何去完成会员充值的操作，<br>
                                记得联系客服解决哦！
                            </span>
                        </div>
                    </div>
                    <div class="row row3 mt-3">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md pl-0">
                            <span>
                                要开通的账号为:${logUser.uer_act}
                            </span>
                        </div>
                    </div>
                    <div class="row row4 mt-5">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md pl-0">
                            <span>
                                要开通的时长为:
                            </span>
                        </div>
                    </div>
                    <div class="row row5 mt-3">
                        <div class="col-md-2">
                        </div>
                        <div class="col-md">
                            <div class="mouth-backg" id="mouth1">
                                <br>
                                <h4 class="pb-2" name="uor_type">1个月</h4>
                                <p></p>
                                <span name="uor_price">9.9</span><font>元</font>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="mouth-backg">
                                <br>
                                <h4 class="pb-2" name="uor_type">6个月</h4>
                                <p></p>
                                <span name="uor_price">49.9</span><font>元</font>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="mouth-backg">
                                <br>
                                <h4 class="pb-2" name="uor_type">12个月</h4>
                                <p></p>
                                <span name="uor_price">99.9</span><font>元</font>
                            </div>
                        </div>
                        <div class="col-md-2">
                        </div>
                    </div>
                    <div class="row row6 mt-5">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md pl-0">
                            <font>
                                应付金额为:
                                <span id="payMoney"> 9.9元</span>
                            </font>
                        </div>
                    </div>
                    <div class="row row7 mt-4 pb-5">
                        <div class="col-md text-center">
                            <button type="button" id="btmyVip-order" class="btn btn-primary">下单</button>
                        </div>
                    </div>
                    <div class="row row8 mt-4 pb-5">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md">
                            <span>-下单后请及时付款,如若在24小时内没能完成付款,系统将自动为您取消订单</span><br><br>
                            <span>-如若出现下单失败等错误,请及时联系客服。</span><br>
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
        if (${!empty memberInfoList}||${!empty updMemberInfo}) {
            $(".mVvip-no").attr("src", "<%=path%>/images/main/vip-yes.png")
            $(".text-backg .col12 .sp1").css("color", "rgb(193,39,45)")
        }
        //鼠标放上变化
        $(".privHover").hover(function () {
            $(this).addClass("shadow bg-white rounded")
        }, function () {
            $(this).removeClass("shadow bg-white rounded")
        })
        //点击显示所对应的特权说明
        $(".privHover").click(function () {
            var id = $(this).attr("id")
            $.get('user/myVipChange.jsp', function (data) {
                    var test = $(data).find("#" + id).html() //需要在获取到的id外面在加个div
                    // alert(test)
                    $(".myVipcontent").html(test);
                }
            )
        })
        //会员价格切换
        $("#mouth1").css("border", "2px solid rgb(255,85,82)")
        // $("#mouth1").attr("")
        $(".mouth-backg").click(function () {
            var $this = $(this)
            var id = $this.attr("id")
            if (!id) {
                var payMoney = $this.children("span").text()
                $this.css("border", "2px solid rgb(255,85,82)")
                $this.parent().siblings().children(".mouth-backg").attr("id", "")
                if (payMoney == '9.9') {
                    $this.attr("id", "mouth1")
                }
                if (payMoney == '49.9') {
                    $this.attr("id", "mouth6")
                }
                if (payMoney == '99.9') {
                    $this.attr("id", "mouth12")
                }
                $this.parent().siblings().children(".mouth-backg").css("border", " 2px solid rgb(232,232,232)")
                $("#payMoney").text(payMoney + "元")
            }
        })
        //----------------下单-----------------
        $("#btmyVip-order").click(function () {
            var uer_act =
            ${logUser.uer_act}
            var uor_type = null
            var uor_price = null;
            if ($("#mouth1").attr("id")) {
                uor_type = $("#mouth1").children("h4").text()
                uor_price = $("#mouth1").children("span").text()
            }
            if ($("#mouth6").attr("id")) {
                uor_type = $("#mouth6").children("h4").text()
                uor_price = $("#mouth6").children("span").text()
            }
            if ($("#mouth12").attr("id")) {
                uor_type = $("#mouth12").children("h4").text()
                uor_price = $("#mouth12").children("span").text()
            }
            // alert(uer_act+".."+uor_type+".."+uor_price)
            layer.open({
                type: 1,
                title: false,
                closeBtn: false,
                offset: '210px',
                area: '300px;',
                shade: 0.8,
                id: 'LAY_layuipro', //设定一个id，防止重复弹出
                resize: false,
                btn: ['确定', '取消'],
                btnAlign: 'c',
                moveType: 1,//拖拽模式，0或者1
                content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">' +
                '亲！您正在请求下单操作中<br>如若无误请点击确认哦，否则点击取消将关闭此次操作。</div>',
                yes: function () {
                    $.ajax({
                        type: 'post',
                        url: '<%=path%>/member/memOrder',
                        data: {
                            uer_act: uer_act,
                            uor_type: uor_type,
                            uor_price: uor_price
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.stateOrder.trim() === "1") {
                                layer.load();
                                setTimeout(function () {
                                    layer.closeAll('loading');
                                    $.get("user/order/orderSuccess.jsp", function (data) {
                                        $(".content").html(data)
                                    })
                                    layer.closeAll();
                                }, 1200)
                            }
                            if (data.stateOrder.trim() === "0") {
                                layer.closeAll();
                                layer.msg('<span style="font-size:17px">你已存在一个会员订单,请勿重复操作,请点击完成付款</span>', {
                                    icon: 9,
                                    offset: '180px',
                                    anim: 6,
                                    time: 0,
                                    btn: ['进入支付页面', '关闭'],
                                    yes: function () {
                                        layer.load();
                                        setTimeout(function () {
                                            layer.closeAll('loading');
                                            $.get("user/myOrder.jsp", function (data) {
                                                $(".content").html(data)
                                            })
                                            layer.closeAll();
                                        }, 1000)
                                    }
                                });
                            }
                        }
                    })
                },
                btn2: function () {
                    layer.closeAll();
                }
            });
        })

    })

</script>
</body>
</html>
