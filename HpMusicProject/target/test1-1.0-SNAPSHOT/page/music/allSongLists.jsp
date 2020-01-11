<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2020/1/2
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>推荐歌单</title>
</head>
<body>
<div class="row mt-4 pb-5" id="allSongLists">
    <c:forEach items="${allSongLists}" var="allSongList" varStatus="i">
        <div class="col-md mt-3">
            <div class="card" id="zj-card">
                <a href="#" class="sl text-decoration-none" id="${i.index}">
                    <img class="card-img" src="${allSongList.sl_imgAddress}"/>
                    <div class="bt-songList-play">
                        <img class="play-img" src="<%=path%>/images/music-home/play.png">
                    </div>
                    <div id="sl_id" style="display: none">${allSongList.sl_id}</div>
                    <div id="sl_name" style="display: none;">${allSongList.sl_name}</div>
                    <div id="sl_detail" style="display: none;">${allSongList.sl_detail}</div>
                    <%--<div id="collect" style="display: none;">${allSongList.collect}</div>--%>
                </a>
                <div class="card-body">
                    <h6 class="card-title"><b>${allSongList.sl_title}</b></h6>
                    <p class="card-text">${allSongList.sl_tag}</p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<script>
    //悬停歌单封面放大
    $(".sl>img").mouseenter(function () {
        $(this).css({"transition": "all 0.5s", "-moz-transform": "scale(1.1)", "-webkit-transform": "scale(1.1)"})
    })
    $(".sl").mouseleave(function () {
        $(this).children("img").css({
            "transition": "all 0.5s",
            "-moz-transform": "scale(1)",
            "-webkit-transform": "scale(1)"
        })
    })
    //悬停出现播放按钮
    $(".sl").hover(function () {
        $(this).children(".bt-songList-play").show()
    }, function () {
        $(this).children(".bt-songList-play").hide()
    })
    $(".sl>img").click(function () {
        var sl_id = $(this).siblings("#sl_id").text()
        var sg_songList = $(this).siblings("#sl_name").text()
        var sl_title = $(this).parent().siblings(".card-body").children(".card-title").text()
        var sl_tag = $(this).parent().siblings(".card-body").children(".card-text").text()
        var sl_imgAddress = $(this).attr("src")
        var sl_detail = $(this).siblings("#sl_detail").text()
        var collect = $(this).siblings("#collect").text()
        // alert(sg_songList)
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

    //中间圆形播放按钮
    $(".bt-songList-play").click(function () {
        var sg_songList = $(this).siblings("#sl_name").text()
        $.ajax({
            type: 'post',
            url: '<%=path%>/songInfo/getSongs',
            content: this,
            data: {
                sg_songList: sg_songList,
            },
            dataType: 'json',
            success: function (data) {
                var songs = data.songs
                $(songs).each(function (i, n) {
                    var sg_name = n.sg_name
                    var sg_author = n.sg_author
                    var sg_imgAddress = n.sg_imgAddress
                    var sg_address = n.sg_address
                    ap.list.add([{
                        title: sg_name,
                        author: sg_author,
                        url: sg_address,
                        pic: sg_imgAddress
                    }])
                })
                //播放
                ap.play()
            }
        })
    })
</script>
</body>
</html>
