<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/29
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>排行榜TOP10</title>
</head>
<body>
<div class="row row1">
    <div class="col-md-4">
        <img class="topListImg1 shadow bg-dark rounded" src="">
        <img class="topListImg2 shadow bg-dark rounded" src="">
        <img class="topListImg3 shadow bg-dark rounded" src="">
    </div>
    <div class="col-md">
        <div class="row row11">
            <div class="col-md-1 col1">
            </div>
            <div class="col-md-8 col2">
                <button type="button" class="btn" id="playAll">
                    <img src="<%=path%>/images/songList/songList-play.png">全部播放
                </button>
            </div>
            <div class="col-md-2 col3">
                <div id="allMV">
                    <div class="all">详情</div>
                    <div class="divImg"><img src="<%=path%>/images/main/all-more.png"></div>
                </div>
            </div>
        </div>
        <div class="row row12">
            <div class="col-md-1">
            </div>
            <div class="col-md top10List">
                <div class="row mt-2">
                    <c:forEach items="${topSongList}" var="topSong" varStatus="i">
                        <div class="col-md-6 pl-0 pr-0">
                            <div class="top10-backg topSong${i.index}" index="${i.index}">
                                <span class="sp1">${i.index+1}</span>
                                <img class="top10-img" src="${topSong.sg_imgAddress}" width="40" height="40">
                                <span class="sp2 top10-name">${topSong.sg_name}</span>
                                <div class="id" style="display: none;">${topSong.sg_id}</div>
                                <div class="author" style="display: none;">${topSong.sg_author}</div>
                                <div class="musAddress" style="display: none;">${topSong.sg_address}</div>
                                <div class="collect" style="display: none;">${topSong.collect}</div>
                                <div class="language" style="display: none;">${topSong.sg_language}</div>
                                <div class="szj_title" style="display: none;">${topSong.szj_title}</div>
                                <div class="szj_detail" style="display: none;">${topSong.szj_detail}</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-1">
            </div>
        </div>
    </div>
</div>
<script>
    //新歌前三图片
    var topListImg1=$(".topSong0").find("img").prop("src");
    var topListImg2=$(".topSong1").find("img").prop("src");
    var topListImg3=$(".topSong2").find("img").prop("src");
    $(".topListImg1").prop("src",topListImg1)
    $(".topListImg2").prop("src",topListImg2)
    $(".topListImg3").prop("src",topListImg3)
    //表格隔行变色
    $(".top10-backg:eq(2)").css("background-color", "rgba(235,235,235,0.5)")
    $(".top10-backg:eq(3)").css("background-color", "rgba(235,235,235,0.5)")
    $(".top10-backg:eq(6)").css("background-color", "rgba(235,235,235,0.5)")
    $(".top10-backg:eq(7)").css("background-color", "rgba(235,235,235,0.5)")
    //最后一个歌曲左移
    $(".top10-backg").last().css("padding-left","12px")
    //表格hover
    $(".top10-backg").hover(function () {
        $(this).css("background-color", "rgb(250,250,250)")
    }, function () {
        if ($(this).attr("index") == '2' || $(this).attr("index") == '3' || $(this).attr("index") == '6' || $(this).attr("index") == '7') {
            $(this).css("background-color", "rgba(235,235,235,0.5)")
        } else {
            $(this).css("background-color", "")
        }
    })
    //点击图片跳转
    $(".top10-img").click(function () {
        toSongInfo($(this))
    })

    //点击歌曲跳转
    $(".top10-name").click(function () {
        toSongInfo($(this))
    })
    //top榜双击播放
    $(".top10-backg").dblclick(function () {
        singleClick($(this))
        if (!ap.audio.paused) {
            $(this).find(".sp2").css("color", "rgb(190,50,50)")
            $(this).parent().siblings().children().find(".sp2").css("color", "")
        }
    })

    //全部播放
    $("#playAll").click(function () {
        //去除重复的歌曲
        var arr = ap.list.audios
        var rows = $(".top10-backg").length
        if (arr.length == 0) {
            for (var j = 0; j < rows - 1; j++) {
                var sg_name = $(".topSong" + j).find(".sp2").text()
                var sg_author = $(".topSong" + j).find(".author").text()
                var sg_imgAddress = $(".topSong" + j).find("img").prop("src")
                var sg_address = $(".topSong" + j).find(".musAddress").text()
                var equal
                ap.list.add([{
                    title: sg_name,
                    author: sg_author,
                    url: sg_address,
                    pic: sg_imgAddress
                }])
                //播放
                ap.play()
                changeCSS()
            }
        } else {
            for (var j = 0; j < rows - 1; j++) {
                var sg_name = $(".topSong" + j).find(".sp2").text()
                var sg_author = $(".topSong" + j).find(".author").text()
                var sg_imgAddress = $(".topSong" + j).find("img").prop("src")
                var sg_address = $(".topSong" + j).find(".musAddress").text()
                var equal
                for (var i = 0; i < arr.length; i++) {
                    // alert(sg_name + "=?" + arr[i].name)
                    if (sg_name == arr[i].name) {
                        equal = 0
                        break
                    } else {
                        equal = 1;
                    }
                }
                if (equal == 1) {
                    ap.list.add([{
                        title: sg_name,
                        author: sg_author,
                        url: sg_address,
                        pic: sg_imgAddress
                    }])
                }
            }
        }
    })
    changeCSS()
    $(".aplayer-icon-play").click(function () {
        changeCSS()
    })
    //js
    function singleClick($this) {
        var sg_name = $this.find(".sp2").text()
        var sg_author = $this.find(".author").text()
        var sg_imgAddress = $this.find("img").prop("src")
        var sg_address = $this.find(".musAddress").text()
        if ($this.attr("id") == null) {
            // alert(ap.list.audios.length)
            $this.attr("id", ap.list.audios.length)
        }
        ap.list.add([{
            title: sg_name,
            author: sg_author,
            url: sg_address,
            pic: sg_imgAddress
        }])
        var index = $this.attr("id")
        //歌曲列表是从0开始算起
        ap.list.switch(index)
        ap.play()
        //去除重复的歌曲
        var arr = ap.list.audios
        for (var i = 0; i < arr.length - 1; i++) {
            if (sg_name == arr[i].name) {
                // alert((i+1)+"."+arr[i].name+"歌曲重复了")
                ap.list.remove(arr.length - 1)
            }
        }
    }
    //当前播放变色
    function changeCSS() {
        //当音乐播放条音乐暂停时
        if (ap.audio.paused) {
            $(".top10-backg>.sp2").css("color", "")
        } else {
            //当音乐播放条音乐播放时
            var url = decodeURI(ap.audio.src)
            $(".top10-backg").each(function (i, n) {
                var sg_name = $(n).find(".sp2").text()
                if (url.indexOf(sg_name.trim()) != -1) {
                    $(n).find(".sp2").css("color", "rgb(190,50,50)")
                }
            })
        }
    }
    function toSongInfo(obj) {
        var id=obj.siblings(".id").text()
        var author=obj.siblings(".author").text()
        var musAddress=obj.siblings(".musAddress").text()
        var collect=obj.siblings(".collect").text()
        var language=obj.siblings(".language").text()
        var szj_title=obj.siblings(".szj_title").text()
        var szj_detail=obj.siblings(".szj_detail").text()

        if(obj.attr("class").indexOf("top10-img")!=-1){
            var name=obj.siblings(".top10-name").text()
            var imgAddress=obj.attr("src")
        }else{
            var name=obj.text()
            var imgAddress=obj.siblings(".top10-img").attr("src")
        }

        $.get('music/songInfo.jsp',
            {
                name:name,
                id:id,
                author:author,
                imgAddress:imgAddress,
                musAddress:musAddress,
                collect:collect,
                language:language,
                szj_title:szj_title,
                szj_detail:szj_detail,
            },
            function (data) {
                $(".content").html(data)
            })
    }
</script>
</body>
</html>
