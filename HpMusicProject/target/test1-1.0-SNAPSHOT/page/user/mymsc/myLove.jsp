<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/7
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>我的喜欢</title>
</head>
<body>
<div class="container-fluid pb-5" id="myLove">
    <div class="row row1 pt-4 pl-5">
        <div class="col-md-2 col1 pt-2 pl-4">
            <font class="english-font">我喜欢</font>
        </div>
        <div class="col-md col2 pl-0 pt-2">
            <ul class="layui-nav">
                <li class="layui-nav-item layui-this"><a href="#">歌曲</a></li>
                <li class="layui-nav-item"><a href="#">专辑</a></li>
                <li class="layui-nav-item"><a href="#">MV</a></li>
            </ul>
        </div>
    </div>
    <div id="myLove-content" class="ml-5 mr-5">
        <div class="row row1 mt-4">
            <div class="col-md">
                <button type="button" class="btn" id="playAll">
                    <img src="<%=path%>/images/songList/songList-play.png">全部播放
                </button>
            </div>
        </div>
        <div class="row row2 mt-3 mb-5">
            <div class="col-md">
                <table class="table table-borderless table-hover">
                    <thead>
                    <tr>
                        <td scope="col" id="tb-num" class="text-center">序号</td>
                        <td scope="col" id="tb-song">歌曲</td>
                        <td scope="col" id="tb-author">歌手</td>
                        <td scope="col" id="tb-zj">专辑</td>
                        <td scope="col" id="tb-icon"></td>
                        <td scope="col" id="tb-time">时长</td>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    <tr style="height: 15px"></tr>
                    <c:forEach items="${collectSongList}" var="collectSong" varStatus="i">
                        <tr class="tr-song song${i.index}">
                            <th scope="row" class="ctb-num text-center">
                                <span>${i.index+1}</span>
                                <img style='margin-top:5px;display: none' src='<%=path%>/images/main/main-sl-act.gif'>
                            </th>
                            <td class="ctb-name">${collectSong.sg_name}</td>
                            <td class="ctb-author">${collectSong.sg_author}</td>
                            <td class="ctb-zj">111</td>
                            <td class="ctb-icon">
                                <a class="sl-play">
                                    <img src="<%=path%>/images/main/main-sl-play.png" width="24" height="24"
                                         style="display: none">&emsp;
                                </a>
                                <a class="sl-add">
                                    <c:if test="${empty collectSong.collect}">
                                        <img src="<%=path%>/images/main/main-sl-add.png" width="20" height="20"
                                             style="display: none">&emsp;
                                    </c:if>
                                    <c:if test="${!empty collectSong.collect}">
                                        <img src="<%=path%>/images/main/main-sl-add-color2.png" width="20"
                                             height="20"
                                             style="display: none">&emsp;
                                    </c:if>
                                </a>
                                <a class="sl-download">
                                    <img src="<%=path%>/images/main/main-sl-download.png" width="22" height="22"
                                         style="display: none">
                                </a>
                            </td>
                            <td class="ctb-time">${collectSong.sg_time}</td>
                            <td class="id" style="display: none;">${collectSong.sg_id}</td>
                            <td class="imgAddress" style="display: none;">${collectSong.sg_imgAddress}</td>
                            <td class="musAddress" style="display: none;">${collectSong.sg_address}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="<%=path%>/layui/layui.all.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    $(function () {
        //tr背景
        $(".tr-song:even").css("background-color", "rgb(247,247,247)")
        //歌曲播放,收藏,下载图标
        $(".tr-song").hover(function () {
            $(this).css("background-color", "rgb(233,235,235)")
            $(this).css("color", "rgb(100,100,100)")
            $(this).find(".ctb-icon>a>img").show()
        }, function () {
            if ($(this).index() % 2 == 0) {
                $(this).css("background-color", "")
            } else {
                $(this).css("background-color", "rgb(247,247,247)")
            }
            $(this).find(".ctb-icon>a>img").hide()
        })
        //歌曲播放,收藏,下载图标变色
        $(".sl-play").hover(function () {
            $(this).find("img").attr("src", "<%=path%>/images/main/main-sl-play-color.png")
        }, function () {
            $(this).find("img").attr("src", "<%=path%>/images/main/main-sl-play.png")
        })
        $(".sl-add").hover(function () {
            if ($(this).find("img").attr("src") == "<%=path%>/images/main/main-sl-add.png") {
                $(this).find("img").attr("src", "<%=path%>/images/main/main-sl-add-color.png")
            }
        }, function () {
            if ($(this).find("img").attr("src") == "<%=path%>/images/main/main-sl-add-color.png") {
                $(this).find("img").attr("src", "<%=path%>/images/main/main-sl-add.png")
            }
        })
        $(".sl-download").hover(function () {
            $(this).find("img").attr("src", "<%=path%>/images/main/main-sl-download-color.png")
        }, function () {
            $(this).find("img").attr("src", "<%=path%>/images/main/main-sl-download.png")
        })
        $(".sl-play").click(function () {
            singleClick($(this).parent().parent())
            if (!ap.audio.paused) {
                $(this).parent().siblings(".ctb-num").children("img").show()
                $(this).parent().siblings(".ctb-num").children("span").hide()
                $(this).parent().parent().siblings().find(".ctb-num>span").show()
                $(this).parent().parent().siblings().find(".ctb-num>img").hide()
                $(this).parent().siblings("td").css("color", "rgb(190,50,50)")
                $(this).parent().parent().siblings().find("td").css("color", "")
            }
        })
        $(".tr-song").dblclick(function () {
            singleClick($(this))
            if (!ap.audio.paused) {
                $(this).find(".ctb-num>img").show()
                $(this).find(".ctb-num>span").hide()
                $(this).siblings().find(".ctb-num>span").show()
                $(this).siblings().find(".ctb-num>img").hide()
                $(this).children("td").css("color", "rgb(190,50,50)")
                $(this).siblings().find("td").css("color", "")
            }
        })
        //当前播放变色效果
        changeCSS()
        $(".aplayer-icon-play").click(function () {
            changeCSS()
        })
        //列表播放暂停变色
        $(".aplayer-list ").click(function () {
            // //当音乐播放条音乐播放时
            var url = decodeURI(ap.audio.src)
            $(".tr-song").each(function (i, n) {
                var sg_name = $(n).find(".ctb-name").text()
                if (url.indexOf(sg_name) != -1) {
                    // alert(url+"=?"+sg_name)
                    $(n).find(".ctb-num>img").show()
                    $(n).find(".ctb-num>span").hide()
                    $(n).siblings().find(".ctb-num>span").show()
                    $(n).siblings().find(".ctb-num>img").hide()
                    $(n).find("td").css("color", "rgb(190,50,50)")
                    $(n).siblings().find("td").css("color", "")
                }
            })
        })

        $("#playAll").click(function () {
            //去除重复的歌曲
            var arr = ap.list.audios
            var rows = $("#tbody").find("tr").length
            if (arr.length == 0) {
                for (var j = 0; j < rows; j++) {
                    var sg_name = $(".song" + j).children(".ctb-name").text()
                    var sg_author = $(".song" + j).children(".ctb-author").text()
                    var sg_imgAddress = $(".song" + j).children(".imgAddress").text()
                    var sg_address = $(".song" + j).children(".musAddress").text()
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
                for (var j = 0; j < rows; j++) {
                    var sg_name = $(".song" + j).children(".ctb-name").text()
                    var sg_author = $(".song" + j).children(".ctb-author").text()
                    var sg_imgAddress = $(".song" + j).children(".imgAddress").text()
                    var sg_address = $(".song" + j).children(".musAddress").text()
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
    });
    //取消收藏歌曲
    $(".sl-add").click(function () {
        var sg_id = $(this).parent().siblings(".id").text()
        $.ajax({
            type: 'post',
            url: '<%=path%>/collect/deleteCollectSong',
            data: {
                sg_id: sg_id
            },
            context: this,
            dataType: 'json',
            success: function (data) {
                if (data.stateDelCollectSong.trim() === "1") {
                    layer.msg('<span style="font-size:17px">取消收藏</span>', {
                        offset: '220px',
                        anim: 6,
                        time: 1200,
                    });
                    //刷新收藏的歌曲
                    $.ajax({
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
                }
            }
        })
    })
    //下载歌曲
    $(".sl-download").click(function () {
        var sg_name = $(this).parent().siblings(".ctb-name").find("span:first-child").text()
        var sg_author = $(this).parent().siblings(".ctb-author").text()
        var sg_address = $(this).parent().siblings(".musAddress").text()
        var sg_imgAddress = $(this).parent().siblings(".imgAddress").text()
        var htm = '<div style="padding: 10px 50px 0 50px">' +
            '<div class="row">' +
            '<div class="col-md-3"><img src="' + sg_imgAddress + '" style="width: 80px;height: 80px;"></div>' +
            '<div class="col-md"><span style="font-weight: bold;">' + sg_name + '</span><br><br><span>' + sg_author + '</span></div>' +
            '</div>' +
            '<div class="row mt-5">' +
            '<div class="col-md" style="border-right:1px solid rgb(220,220,220)">' +
            '<div id="payDownload" style="width: 150px;height: 45px;background-color: rgba(220,220,220,0.5);padding:10px 0 10px 24px;cursor:pointer;color:rgb(120,120,120)"><span style="color:rgb(250, 50, 50)">2￥</span> 点击下载</div><br>' +
            '<a id="freeDownload" style="width: 150px;height: 45px;background-color: rgb(250, 50, 50);padding:12px 41px;color:white;cursor:pointer;text-decoration:none;">免费下载</a>' +
            '</div>' +
            '<div class="col-md ml-4"><span style="font-weight: bold;font-size: 17px;color: rgb(70,70,70);">充值Qiaole黑怕</span><img src="<%=path%>/images/myVip/myVip-vip3.png" style="width:20px;height:20px"><br><span style="color: rgb(150,150,150);font-size: 13px;font-weight: bold">即可享受每月300次的免费下载次数</span><br><br>' +
            '<button type="button" id="payVIP" style="width:100px;height:30px;text-decoration:none;background-color:rgb(250, 50, 50);color:white;border:none; border-radius: 30px;margin-left:30px;margin-top:-8px;font-size:15px">充值会员</button>' +
            '</div>' +
            '</div>' +
            '<div id="dlAddress" style="display:none">' + sg_address + '</div>' +
            '</div>'
        layer.open({
            type: 1,
            title: '下载',
            offset: ['160px'],
            skin: 'layui-layer-demo', //样式类名
            closeBtn: 1, //不显示关闭按钮
            area: ['500px', '310px'],
            anim: 2,
            content: htm,
        })
        //付费下载变色
        $("#payDownload").hover(function () {
            $(this).css("background-color", "rgba(200,200,200,0.5)")
        }, function () {
            $(this).css("background-color", "rgba(220,220,220,0.5)")
        })
        //免费下载变色
        $("#freeDownload").hover(function () {
            $(this).css("background-color", "rgb(232,50,50")
        }, function () {
            $(this).css("background-color", "rgb(250,50,50)")
        })
        //付费下载跳转
        $("#payDownload").click(function () {
            btPayClick(sg_address)
        })
        //免费下载跳转
        $("#freeDownload").click(function () {
            if (${!empty memberInfoList}||${!empty updMemberInfo}) {
                var dlAddress = $("#dlAddress").text()
                dlAddress = "<%=path%>/download/fileDownload?sg_address=" + dlAddress
                $(this).attr("href", dlAddress).click()
            } else {
                layer.msg('<span style="font-size:17px">您不是会员用户，请成为会员后再操作</span>', {
                    offset: '240px',
                    anim: 6,
                    time: 1200,
                });
            }
        })
        //充值会员变色
        $("#payVIP").hover(function () {
            $(this).css("background-color", "rgb(232,50,50")
        }, function () {
            $(this).css("background-color", "rgb(250,50,50)")
        })
        //跳转充值会员页面
        $("#payVIP").click(function () {
            layer.closeAll()
            $.get("user/myVip.jsp", function (data) {
                $(".content").html(data)
                $("#nav-ul>li:last").prevAll().removeClass("changeColor").children("a").css("color", "rgb(50,50,50)")
            })
        })
    })

    //js
    function singleClick($this) {
        //index是从0开始
        var currSong = $this.index()
        var sg_name = $this.children(".ctb-name").text()
        var sg_author = $this.children(".ctb-author").text()
        var sg_imgAddress = $this.children(".imgAddress").text()
        var sg_address = $this.children(".musAddress").text()
        if ($this.attr("id") == null) {
            // alert(ap.list.audios.length)
            $this.attr("id", ap.list.audios.length)
        }
        // else{
        //     alert("已存在id="+$(this).attr("id"))
        // }
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
            $("#tbody").find(".ctb-num>img").hide()
            $("#tbody").find(".ctb-num>span").show()
            $("#tbody").find("td").css("color", "")
        } else {
            //当音乐播放条音乐播放时
            var url = decodeURI(ap.audio.src)
            $(".tr-song").each(function (i, n) {
                var sg_name = $(n).find(".ctb-name").text()
                if (url.indexOf(sg_name) != -1) {
                    $(n).find(".ctb-num>img").show()
                    $(n).find(".ctb-num>span").hide()
                    $(n).find("td").css("color", "rgb(190,50,50)")
                }
            })
        }
    }
    //付款按钮
    function btPayClick() {
        // var divPirce = $(this).siblings().children(".divPrice").text()
        layer.open({
            type: 2,
            title: false,
            closeBtn: 2, //不显示关闭按钮
            shade: [0.7],
            area: ['600px', '500px'],
            offset: '100px', //右下角弹出
            time: 0, //2秒后自动关闭
            anim: 0,
            content: ['<%=path%>/page/user/order/orderPay.jsp', 'no'], //iframe的url，no代表不显示滚动条
        })
    };
</script>
</body>
</html>
