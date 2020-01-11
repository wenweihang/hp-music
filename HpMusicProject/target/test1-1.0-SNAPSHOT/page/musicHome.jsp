<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>H-P音乐馆</title>
</head>
<body>
<!--轮翻图开始-->
<div class="container-fluid">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="<%=path%>/images/music-home/rf-4.jpg" class="d-block w-100" height="360">
            </div>
            <div class="carousel-item">
                <img src="<%=path%>/images/music-home/rf-1.jpg" class="d-block w-100" height="360">
            </div>
            <div class="carousel-item">
                <img src="<%=path%>/images/music-home/rf-2.jpg" class="d-block w-100" height="360">
            </div>
            <div class="carousel-item">
                <img src="<%=path%>/images/music-home/rf-3.jpg" class="d-block w-100" height="360">
            </div>
            <div class="carousel-item">
                <img src="<%=path%>/images/music-home/rf-5.jpg" class="d-block w-100" height="360">
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
</div>
<!--轮翻图结束-->
<!--歌曲介绍-->
<div class="container-fluid mt-5">
    <div class="row" id="SongListMain">
        <div class="col-md-12" style="color: white">
            <!--H-P精品歌单-->
            <div class="row">
                <div class="col-md-6" style="padding-bottom: 20px;">
                    <h3 class="font-h3">
                        <span id="HP" class="english-font"><strong>HP</strong></span>
                        <div id="font-jpgd"><b>精品歌单</b></div>
                    </h3>
                </div>
                <div class="col-md col2">
                    <a id="allSongList" href="#">
                        <div class="all">全部</div>
                        <div class="divImg"><img src="<%=path%>/images/main/all-more.png"></div>
                    </a>
                </div>
                <div class="col-md-5"></div>
            </div>
            <!--firstCols-->
            <div class="row mt-4">
                <c:forEach varStatus="i" items="${songListMain}" var="slMain">
                    <div class="col-md" style="padding-bottom: 10px;">
                        <div class="card" id="zj-card">
                            <a href="#" class="sl text-decoration-none" id="${i.index}">
                                <img class="card-img" src="${slMain.sl_imgAddress}"/>
                                <div class="bt-songList-play">
                                    <img class="play-img" src="<%=path%>/images/music-home/play.png">
                                </div>
                                <div id="sl_id" style="display: none">${slMain.sl_id}</div>
                                <div id="sl_name" style="display: none;">${slMain.sl_name}</div>
                                <div id="sl_detail" style="display: none;">${slMain.sl_detail}</div>
                                <div id="collect" style="display: none;">${slMain.collect}</div>
                            </a>
                            <div class="card-body">
                                <h6 class="card-title"><b>${slMain.sl_title}</b></h6>
                                <p class="card-text">${slMain.sl_tag}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div id="newSong" class="mt-5">
        <div class="row row1 pt-4 pl-5">
            <div class="col-md-2 col1 pt-2 pl-4">
                <font class="english-font">新歌</font>
            </div>
            <div class="col-md col2 pl-0 pt-2">
                <ul class="layui-nav">
                    <li class="layui-nav-item layui-this li-region"><a >推荐</a></li>
                    <li class="layui-nav-item li-region"><a >华语</a></li>
                    <li class="layui-nav-item li-region"><a >欧美</a></li>
                    <li class="layui-nav-item li-region"><a >韩语</a></li>
                    <li class="layui-nav-item li-region"><a >日语</a></li>
                </ul>
            </div>
        </div>
        <div id="newSong-content">
           <jsp:include page="music/tableNewSongs.jsp"/>
        </div>
    </div>
    <!--热门艺人-->
    <div class="row mt-5" id="hotSinger">
        <div class="col-md-6 pt-1" style="padding-bottom: 20px;">
            <h3 class="font-h3 " style="font-size: 25px;color: rgb(40,40,40);">
                <b>热门艺人</b>
            </h3>
        </div>
        <div class="col-md col2">
            <a id="allSinger" href="#">
                <div class="all">全部</div>
                <div class="divImg"><img src="<%=path%>/images/main/all-more.png"></div>
            </a>
        </div>
        <div class="col-md-5"></div>
    </div>
    <div class="row singer-content mt-4 mb-5">

    </div>
    <!--热门MV-->
    <%--<div class="row mt-5" id="hotMV">--%>
        <%--<div class="col-md-6" style="padding-bottom: 20px;">--%>
            <%--<h3 class="font-h3" style="font-size: 25px;color: rgb(40,40,40);">--%>
                <%--<b>热门MV</b>--%>
            <%--</h3>--%>
        <%--</div>--%>
        <%--<div class="col-md col2">--%>
            <%--<div id="allMV">--%>
                <%--<div class="all">全部</div>--%>
                <%--<div class="divImg"><img src="<%=path%>/images/main/all-more.png"></div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="col-md-5"></div>--%>
    <%--</div>--%>
    <div class="row mv-content mt-2 mb-5">

    </div>
</div>
<script src="<%=path%>/layui/layui.all.js"></script>
<script type="text/javascript">
    $(function () {
        //3秒后点击轮播图next
        setInterval(function () {
            $(".carousel-control-next").click()
        }, 4500)
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
        //获取全部歌单
        $("#allSongList").click(function () {
            $.get("<%=path%>/page/allSongList.jsp", function (data) {
                $(".content").html(data)
                $("#navSongList").addClass("changeColor").siblings().removeClass("changeColor")
                $("#navSongList").children("a").css("color", "white")
                $("#navSongList").siblings().children("a").css("color", "rgb(105,105,105)")
            })
        })
        //新歌地区点击切换
        $(".li-region").click(function () {
            var sg_language=$(this).text()
            if(sg_language=='推荐'){
                $.ajax({
                    type: 'post',
                    url: '<%=path%>/songInfo/getNewSongs',
                    dataType: 'json',
                    success: function (data) {
                        if(data.stateGetNewSongs.trim()==="1"){
                            $.get("<%=path%>/page/music/tableNewSongs.jsp",function (data2) {
                                $("#newSong-content").html(data2)
                            })
                        }
                    }
                })
            }else{
                $.ajax({
                    type: 'post',
                    url: '<%=path%>/songInfo/getNewSongsByRG',
                    data:{
                      sg_language:sg_language
                    },
                    dataType: 'json',
                    success: function (data) {
                        if(data.stateGetNewSongsByRG.trim()==="1"){
                            $.get("<%=path%>/page/music/tableNewSongs.jsp",function (data2) {
                                $("#newSong-content").html(data2)
                            })
                        }
                    }
                })

            }
        })

        //获取音乐人
        $.ajax({
            async:false,
            type: 'post',
            url: '<%=path%>/singerInfo/getSingerInfoPageMain',
            dataType: 'json',
            success: function (data) {
                var singerInfoMain = data.listMain
                $(singerInfoMain).each(function (i, n) {
                    var htm = '<div class="col-md-2 text-center mycol" >' +
                        '<a href="#" class="imgAddress"><img style="width: 175px;height: 175px;border-radius: 100%" src="' + n.sgr_imgAddress + '" ></a><br><br>' +
                        '<a href="#" class="name text-decoration-none" style="font-size: 17px;">' + n.sgr_name + '</a>' +
                        '<div class="sex" style="display: none">' + n.sgr_sex + '</div>' +
                        '<div class="detail" style="display: none">' + n.sgr_detail + '</div>' +
                        '</div>'
                    $(".singer-content").append(htm)
                    $(".mycol:eq(0)").css("padding-left", "0px")
                    $(".mycol:eq(1)").css("padding-left", "9px")
                    $(".mycol:eq(2)").css("padding-left", "19px")
                    $(".mycol:eq(3)").css("padding-left", "24px")
                    $(".mycol:eq(4)").css("padding-left", "29px")
                    $(".mycol:eq(5)").css("padding-left", "34px")

                })
            }
        })
        //歌手点击跳转
        $(".imgAddress").click(function () {
            var sgr_name=$(this).siblings(".name").text()
            var sgr_imgAddress=$(this).find("img").attr("src")
            var sgr_detail=$(this).siblings(".detail").text()
            $.ajax({
                async:false,
                type: 'post',
                url: '<%=path%>/songInfo/getSongInfoByName',
                data: {
                    sg_author: sgr_name,
                },
                dataType: 'json',
                success: function (data) {
                    if(data.stateGetSongsByName.trim()==="1"){
                        $.get("<%=path%>/page/singer/singerInfo.jsp",
                            {
                                sgr_name:sgr_name,
                                sgr_imgAddress:sgr_imgAddress,
                                sgr_detail:sgr_detail
                            },
                            function (data2) {
                                $(".content").html(data2)
                            })
                    }
                }
            })
        })
        //获取全部歌手
        $("#allSinger").click(function () {
            $.get("<%=path%>/page/singer.jsp", function (data) {
                $(".content").html(data)
                $("#navSinger").addClass("changeColor").siblings().removeClass("changeColor")
                $("#navSinger").children("a").css("color", "white")
                $("#navSinger").siblings().children("a").css("color", "rgb(105,105,105)")
            })
        })
    });


</script>
</body>
</html>
