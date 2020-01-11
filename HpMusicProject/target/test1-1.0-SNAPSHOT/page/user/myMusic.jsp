<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/10/26
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>myMusic</title>
    <style>
        div {
            /*border: 1px solid red;*/
        }
    </style>
</head>
<body>
<c:if test="${empty logUser}">
    <div id="loginRemind">
        <font id="loginRemind-font1" style="font-family: 方正兰亭超细黑简体;display: none">
            <span class="sp1">KEEP REAL</span>,<span class="sp2">听我想听的歌</span>
        </font>
        <font id="loginRemind-font2" style="font-family: 方正兰亭超细黑简体;display: none">
            <span class="sp3">登录管理我的黑怕,呼吸不停说唱不止</span>
        </font>
        <button type="button" id="immedLogin" style="display: none">立即登录</button>
    </div>
</c:if>
<c:if test="${!empty logUser}">
    <div class="container-fluid" id="loginSuccess">
        <div class="row">
                <%--左边--%>
            <div class="col-md-3 pt-5" id="logSuc-left">
                <div class="row row1">
                    <div class="col-md" align="center">
                        <div class="headCir">
                            <img src="<%=path%>/images/main/headCir.png" style="display: none">
                        </div>
                        <div id="myMusic-cir-box">
                            <c:if test="${empty stateUpHeImg}">
                                <img src="${logUser.uer_headImg}">
                            </c:if>
                            <c:if test="${!empty stateUpHeImg}">
                                <img src="${serverPath}">
                            </c:if>
                        </div>
                        <div class="pt-2" align="center">
                            <span><strong>
                                <c:if test="${empty stateUpd}">
                                    ${logUser.uer_name}
                                </c:if>
                                <c:if test="${!empty stateUpd}">
                                    ${updUser.uer_name}
                                </c:if>
                            </strong></span>
                        </div>
                    </div>
                </div>
                <div class="row ml-5 mt-5 row2">
                    <div class="col-md pr-5">
                        <span class="pr-4">
                            <c:if test="${!empty stateUpd}">
                                ${updUser.uer_signature}
                            </c:if>
                            <c:if test="${empty stateUpd}">
                                ${logUser.uer_signature}
                            </c:if>
                        </span><br><br>
                    </div>
                </div>
                <div class="row ml-5 row3">
                    <div class="col-md  pr-5">
                        <font class="pr-2">
                            <c:if test="${!empty stateUpd}">
                                来自${updUser.uer_address}的${updUser.uer_constellation},${logUser.uer_create}加入<br><br>
                                已连续签到 <span id="signInDay"></span> 天<br><br>
                            </c:if>
                            <c:if test="${empty stateUpd}">
                                来自${logUser.uer_address}的${logUser.uer_constellation},${logUser.uer_create}加入<br><br>
                                已连续签到 <span id="signInDay"></span> 天<br><br>
                            </c:if>
                        </font>
                    </div>
                </div>
                <div class="row ml-4 mt-3 pr-4 row4">
                    <div class="col-md p-0">
                        <div align="center">
                            <a href="">
                                <span><strong>20</strong></span><br>
                                累计播放
                            </a>
                        </div>
                    </div>
                    <div class="col-md p-0">
                        <div align="center">
                            <a href="">
                                <span><strong>0</strong></span><br>
                                关注
                            </a>
                        </div>
                    </div>
                    <div class="col-md p-0">
                        <div align="center">
                            <a href="">
                                <span><strong>0</strong></span><br>
                                粉丝
                            </a>
                        </div>
                    </div>
                </div>
            </div>
                <%--右边--%>
            <div class="col-md" id="logSuc-right">
                <div class="row mt-5 row1">
                    <div class="col-md-4">
                        <a href="">
                            <i class="layui-icon layui-icon-log mr-4"></i>
                            <font>
                                <span>20</span><br>
                                最近播放
                            </font>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="#" id="mylove">
                            <i class="layui-icon layui-icon-star mr-4"></i>
                            <font>
                                <span>9</span><br>
                                我的喜欢
                            </font>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="">
                            <i class="layui-icon layui-icon-cart mr-4"></i>
                            <font>
                                <span>0</span><br>
                                已购音乐
                            </font>
                        </a>
                    </div>
                </div>
                <div class="row mt-5 row2">
                    <div class="col-md">
                        <span>创建的歌单</span>
                    </div>
                </div>
                <div class="row mt-4 row3 ">
                    <div class="col-md">
                        <a class="mySongList" href="#">
                            <div class="d1"></div>
                            <div class="d2"></div>
                            <div class="d3">
                                <i class="layui-icon layui-icon-add-1 mt-1"></i>
                            </div>
                            <div style="clear: both;height: 6px;"></div>
                            <span></span>
                        </a>
                    </div>
                </div>
                <div class="row mt-5 row4">
                    <div class="col-md">
                        <span>收藏的歌单</span>
                    </div>
                </div>
                <div class="row mt-4 row5" id="collectSL">

                </div>
            </div>
        </div>
    </div>
</c:if>
<script>
    //显示信息
    $("#loginRemind-font1").show(function () {
    })
    $("#loginRemind-font2").show(function () {
    })
    $("#immedLogin").show(function () {
    })
    //判断是否为会员用户
    if (${!empty memberInfoList}||${!empty updMemberInfo}) {
        $("#logSuc-left .headCir>img").show()
        $("#myMusic-cir-box>img").css("border", "2px solid rgb(252,193,45)")
        $("#logSuc-left>.row1 span").css("color", "rgb(193,39,45)")
    }
    //我的喜欢
    $("#mylove").click(function () {
        //获取收藏的歌曲
        $.ajax({
            async:false,
            type: 'post',
            url: '<%=path%>/collect/getCollectSongs',
            dataType: 'json',
            success: function (data) {
                if (data.stateGetCollectSongs.trim() === "1") {
                    $.get("<%=path%>/page/user/mymsc/myLove.jsp", function (data) {
                        $(".content").html(data)
                    })
                }
                if (data.stateGetCollectSongs.trim() === "0") {
                    $.get("<%=path%>/page/user/mymsc/myLove.jsp", function (data) {
                        $(".content").html(data)
                    })
                }
            }
        })
    })
    //获取收藏的歌单
    if (${!empty logUser}) {
        //获取签到天数
        $.ajax({
            type: 'post',
            url: '<%=path%>/cookies/getSignInDay',
            dataType: 'json',
            success: function (data) {
                var day = data.usi_continueDay
                $("#signInDay").text(day)
            }
        })
        var length;
        $.ajax({
            async: false,
            type: 'post',
            url: '<%=path%>/collect/getCollectSongLists',
            dataType: 'json',
            success: function (data) {
                var collectSongList = data.collectSongLists
                length=collectSongList.length
                $(collectSongList).each(function (i, n) {
                    var html = '<div class="col-md-2.5 div-col"><a class="collectSongList" href="#">' +
                        '<div class="d1" ><img src="' + n.sl_imgAddress + '" ></div><div class="d2" ></div><div class="d3"></div></a>' +
                        '<div style="clear: both;height: 6px;"></div>' + '<div class="title">' + n.sl_title + '</div>' +
                        '<div class="tag">' + n.sl_tag + '</div>' + '<div class="id" style="display: none;">' + n.sl_id + '</div>' +
                        '<div class="name" style="display: none;">'+n.sl_name+'</div>'+
                        '<div class="detail" style="display: none;">'+n.sl_detail+'</div>'+
                        '<div class="collect" style="display: none;">'+n.collect+'</div>'+
                        '</div>'
                    $("#collectSL").append(html)
                })
                $(".div-col").first().siblings().css("margin-left", "30px")
            }
        })
        if(length==0){
            var noCollect='<br><div class="ml-3" style="color: rgb(120,120,120);font-size: 16px">您还没有收藏任何歌单</div>'
            $("#collectSL").append(noCollect)
            $("#logSuc-right > .row5").css("height","150px")
        }
        $(".collectSongList").click(function () {
            var sl_id = $(this).siblings(".id").text()
            var sg_songList=$(this).siblings(".name").text()
            var sl_title = $(this).siblings(".title").text()
            var sl_tag = $(this).siblings(".tag").text()
            var sl_imgAddress = $(this).find("img").attr("src")
            var sl_detail = $(this).siblings(".detail").text()
            var collect=$(this).siblings(".collect").text()
            $.ajax({
                async:false,
                type: 'post',
                url: '<%=path%>/songInfo/getSongs',
                content: this,
                data: {
                    sg_songList: sg_songList,
                },
                dataType: 'json',
                success: function (data) {
                    //歌单点击
                    $.get("<%=path%>/page/music/songList.jsp"
                        , {
                            sl_id: sl_id,
                            sl_name: sg_songList,
                            sl_title: sl_title,
                            sl_tag: sl_tag,
                            sl_imgAddress: sl_imgAddress,
                            sl_detail: sl_detail,
                            collect: collect,
                        }
                        , function (page) {
                            $(".content").html(page)
                        })
                }
            })
        })
    }
    //登录按钮
    $("#immedLogin").click(function () {
        var navA = '${param.navA}'
        layer.open({
            type: 2,
            title: false,
            closeBtn: 2, //不显示关闭按钮
            shade: [0.7],
            area: ['600px', '500px'],
            offset: '100px', //弹出位置
            time: 0, //2秒后自动关闭
            anim: 0,
            content: ['<%=path%>/page/user/login.jsp?nav_a=' + navA, 'no'], //iframe的url，no代表不显示滚动条
        })
    })
</script>
</body>
</html>
