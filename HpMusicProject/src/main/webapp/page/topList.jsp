<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/10/27
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>排行榜</title>
    <style>
    </style>
</head>
<body>
<div class="container-fluid">
    <div id="topList">
        <div id="top10" class="pt-2">
            <div class="row row1 pl-5">
                <div class="col-md-2 col1 pt-2 pl-4">
                    <font class="english-font">黑怕TOP10榜</font>
                </div>
                <div class="col-md col2 pl-0 pt-2">
                    <ul class="layui-nav">
                        <li class="layui-nav-item layui-this li-type" value="new"><a href="#">新歌</a></li>
                        <li class="layui-nav-item li-type" value="hot"><a href="#">热歌</a></li>
                        <li class="layui-nav-item li-type" value="pop"><a href="#">流行</a></li>
                    </ul>
                </div>
            </div>
            <div id="top10-content">
                <jsp:include page="music/tableTopSongs.jsp"/>
            </div>
        </div>
        <%--全球地区排行--%>
        <div id="globalList">
            <div class="row row1">
                <%--第一行第一列--%>
                <div class="col-md-4 col1">
                    <div class="backgChina">
                        <div>
                            <div class="row row11">
                                <div class="col-md-6">
                                    <img class="img1" src="<%=path%>/images/topList/backgChina.png">
                                </div>
                                <div class="col-md">
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <div class="tag-backg">
                                                    <span>每天更新</span>
                                                </div>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--第一行第二列--%>
                <div class="col-md-4">
                    <div class="backgEnglish">
                        <div>
                            <div class="row row12">
                                <div class="col-md-6">
                                    <img class="img1" src="<%=path%>/images/topList/backgEnglish.png">
                                </div>
                                <div class="col-md">
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <div class="tag-backg">
                                                    <span>每天更新</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--第一行第三列--%>
                <div class="col-md-4 pl-0">
                    <div class="backgKorea">
                        <div>
                            <div class="row row13">
                                <div class="col-md-6">
                                    <img class="img1" src="<%=path%>/images/topList/backgKorea.png">
                                </div>
                                <div class="col-md">
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <div class="tag-backg">
                                                    <span>每天更新</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=path%>/layui/layui.all.js"></script>
<script>
    //详情
    $(".more").click(function () {

    })

    //获取top10新歌歌曲
    $.ajax({
        type: 'post',
        url: '<%=path%>/songInfo/getTopNewSongs',
        data:{
            sg_new:'new'
        },
        dataType: 'json',
        success: function (data) {
            if(data.stateGetTopSongs.trim()==="1"){
                $.get("<%=path%>/page/music/tableTopSongs.jsp",function (data2) {
                    $("#top10-content").html(data2)
                })
            }
        }
    })
    //获取top10歌曲
    $(".li-type").click(function () {
        var type=$(this).attr("value")
        if(type=='new'){
            $.ajax({
                type: 'post',
                url: '<%=path%>/songInfo/getTopNewSongs',
                data:{
                    sg_new:type
                },
                dataType: 'json',
                success: function (data) {
                    if(data.stateGetTopSongs.trim()==="1"){
                        $.get("<%=path%>/page/music/tableTopSongs.jsp",function (data2) {
                            $("#top10-content").html(data2)
                        })
                    }
                }
            })
        }
        if(type=='hot'){
            $.ajax({
                type: 'post',
                url: '<%=path%>/songInfo/getTopHotSongs',
                data:{
                    sg_hot:type
                },
                dataType: 'json',
                success: function (data) {
                    if(data.stateGetTopSongs.trim()==="1"){
                        $.get("<%=path%>/page/music/tableTopSongs.jsp",function (data2) {
                            $("#top10-content").html(data2)
                        })
                    }
                }
            })
        }
        if(type=='pop') {
            $.ajax({
                type: 'post',
                url: '<%=path%>/songInfo/getTopPopSongs',
                data: {
                    sg_pop: type
                },
                dataType: 'json',
                success: function (data) {
                    if (data.stateGetTopSongs.trim() === "1") {
                        $.get("<%=path%>/page/music/tableTopSongs.jsp", function (data2) {
                            $("#top10-content").html(data2)
                        })
                    }
                }
            })
        }
    })
    //获取华语排行榜
    $.ajax({
        type: 'post',
        url: '<%=path%>/songInfo/getTopFourSongs',
        data: {
            sg_language:'华语'
        },
        dataType: 'json',
        success: function (data) {
            var topChinaList=data.topFourList
            $(topChinaList).each(function (i,n) {
                var htm='<tr><th width="11px" style="padding-left: 5px">'+(i+1)+'</th><td style="padding-left: 10px"><span class="name">'+n.sg_name+'</span><br><span class="author">'+n.sg_author+'</span></td></tr>'
                $(".backgChina tbody").append(htm)
            })
        }
    })
    //获取欧美排行榜
    $.ajax({
        type: 'post',
        url: '<%=path%>/songInfo/getTopFourSongs',
        data: {
            sg_language:'欧美'
        },
        dataType: 'json',
        success: function (data) {
            var topEnglishList=data.topFourList
            $(topEnglishList).each(function (i,n) {
                var htm='<tr><th width="11px" style="padding-left: 5px">'+(i+1)+'</th><td style="padding-left: 10px"><span class="name">'+n.sg_name+'</span><br><span class="author">'+n.sg_author+'</span></td></tr>'
                $(".backgEnglish tbody").append(htm)
            })
        }
    })
    //获取韩语排行榜
    $.ajax({
        type: 'post',
        url: '<%=path%>/songInfo/getTopFourSongs',
        data: {
            sg_language:'韩语'
        },
        dataType: 'json',
        success: function (data) {
            var topKoreaList=data.topFourList
            $(topKoreaList).each(function (i,n) {
                var htm='<tr><th width="11px" style="padding-left: 5px">'+(i+1)+'</th><td style="padding-left: 10px"><span class="name">'+n.sg_name+'</span><br><span class="author">'+n.sg_author+'</span></td></tr>'
                $(".backgKorea tbody").append(htm)
            })
        }
    })
</script>
</body>
</html>
