<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/31
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>歌曲信息</title>
</head>
<body>
<div class="container-fluid">
    <div class="row pb-5">
        <%--左边--%>
        <div class="col-md-4 pt-4 " id="songInfo-left">
            <div class="row row1">
                <div class="col-md pl-5">
                    <div id="slImg">
                        <img src="${param.imgAddress}" width="248" height="249"/>
                    </div>
                </div>
            </div>
            <div class="row row2">
                <div class="col-md pl-5">
                    <div class="pt-4 zj-detail">
                        <h4>专辑简介</h4><br>
                        <span id="detail">${param.szj_detail}</span>
                    </div>
                </div>
            </div>
            <div class="row ml-5 mt-5 row2">
            </div>
        </div>
        <%--右边--%>
        <div class="col-md" id="songInfo-right">
            <div class="row mt-4 pr-5 row1">
                <div class="col-md pl-0">
                    <h3 id="slTitle">${param.name}</h3>
                </div>
            </div>
            <div class="row mt-3 pr-5 row2">
                <div class="col-md pl-0">
                    <span>${param.author}</span>
                </div>
            </div>
            <div class="row mt-3 pr-5 row3">
                <div class="col-md-2 pl-0">
                    <span class="sp1">语种：</span>
                    <span class="sp2">${param.language}</span>
                </div>
                <div class="col-md">
                    <span class="sp3">专辑：</span>
                    <span class="sp4">${param.szj_title}</span>
                </div>
            </div>
            <div class="row pr-5 row4">
                <div class="col-md-2.5">
                    <button type="button" class="btn" id="play">
                        <img src="<%=path%>/images/songList/songList-play.png">立即播放
                    </button>
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn" id="collect">
                        <img src="<%=path%>/images/songList/songList-collect.png">收藏
                    </button>
                </div>
                <div class="col-md-2">
                    <a href="#comment-title">
                        <button type="button" class="btn bt-other" id="comment">
                            <img src="<%=path%>/images/songList/songList-comment.png">评论
                        </button>
                    </a>
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn" id="download">
                        <img src="<%=path%>/images/main/main-sl-download.png">下载
                    </button>
                </div>
            </div>
            <div class="row mt-4 pr-5 row5 ">
                <div class="col-md">
                    <div id="table-songs">
                        <%--<img src="<%=path%>/images/main/main-sl-act.gif">--%>

                    </div>
                </div>
            </div>
            <div class="row mt-5 pr-5 row6 ">
                <div class="col-md pl-0">
                    <h4 id="comment-title">评论</h4>
                </div>
            </div>
            <div class="row mt-4 pr-5 row7 ">
                <c:if test="${empty stateUpHeImg}">
                    <c:if test="${!empty logUser}">
                        <div class="col-md-1">
                            <div class="cir-box-comment">
                                <img src="${logUser.uer_headImg}">
                            </div>
                        </div>
                    </c:if>
                </c:if>
                <c:if test="${!empty stateUpHeImg}">
                    <div class="col-md-1">
                        <div class="cir-box-comment">
                            <img src="${serverPath}">
                        </div>
                    </div>
                </c:if>
                <div class="col-md">
                    <textarea class="form-control" id="songList-comment" name="" rows="3"
                              placeholder="期待你的神评论.."></textarea>
                </div>
            </div>
            <div class="row mt-3 pr-5 row8 ">
                <div class="col-md">
                </div>
                <div class="col-md-1 sp">
                    <span>0/300</span>
                </div>
                <div class="col-md-1.8 pr-3">
                    <button type="button" class="btn" id="comment2">
                        评论
                    </button>
                </div>
            </div>
            <div class="row mt-3 pr-5 row9">
                <div class="col-md-1.5">
                    <h4>最新评论</h4>
                </div>
                <div class="col-md pl-3">
                    <span>999条</span>
                </div>
            </div>
            <div class="row mt-3 pr-5 row10">
                <div class="col-md">
                    <div class="commentArea mb-5">
                        <table border="0">
                            <tbody>
                            <tr>
                                <td rowspan="2" width="55px" height="60px">
                                    <c:if test="${empty stateUpHeImg}">
                                        <c:if test="${!empty logUser}">
                                            <div id="cir-box-comment2">
                                                <img src="${logUser.uer_headImg}">
                                            </div>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${!empty stateUpHeImg}">
                                        <div id="cir-box-comment2">
                                            <img src="${serverPath}">
                                        </div>
                                    </c:if>
                                </td>
                                <td class="commentName">
                                    <c:if test="${empty stateUpd}">
                                        ${logUser.uer_name}:
                                    </c:if>
                                    <c:if test="${!empty stateUpd}">
                                        ${updUser.uer_name}:
                                    </c:if>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">Thorntonasdasdasdsadsadsadsadasdasdasdasdasdasdasdsadasssssssss</td>
                            </tr>
                            <tr style="min-height: 30px;max-height: 300px">
                                <td></td>
                                <td>
                                    <div class="row row91">
                                        <div class="col-md pl-2">
                                            <span>&nbsp;11月14日</span>
                                        </div>
                                        <div class="col-md-0.8">
                                            <div id="clickGood">
                                                <img src="<%=path%>/images/songList/songList-clickGood.png">
                                                <span>(0)</span>
                                            </div>
                                        </div>
                                        <div class="col-md-1 pl-4">
                                            <div id="replay">
                                                <img src="<%=path%>/images/songList/songList-replay.png">
                                            </div>
                                        </div>
                                    </div>
                                    <div id="replayText" class="row row92 mt-4 pr-5 " style="display: none">
                                        <div class="col-md-1 pl-4">
                                            <c:if test="${empty stateUpHeImg}">
                                                <c:if test="${!empty logUser}">
                                                    <div id="cir-box-comment3">
                                                        <img src="${logUser.uer_headImg}">
                                                    </div>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${!empty stateUpHeImg}">
                                                <div id="cir-box-comment3">
                                                    <img src="${serverPath}">
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="col-md pl-4">
                                            <textarea class="form-control" id="songList-comment3" name="" rows="3"
                                                      placeholder="期待你的神评论.."></textarea>
                                        </div>
                                    </div>
                                    <div id="btRepCal" class="row row93 mt-3 pb-3 pr-5" style="display: none">
                                        <div class="col-md pl-4">
                                        </div>
                                        <div class="col-md-1 sp">
                                            <span>0/300</span>
                                        </div>
                                        <div class="col-md-1.8 pr-3">
                                            <button type="button" class="btn" id="comment3">
                                                评论
                                            </button>
                                        </div>
                                        <div class="col-md-1.8 pr-3">
                                            <button type="button" class="btn" id="cancel">
                                                取消
                                            </button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div></div>
                    <div></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="botmplayer" class="aplayer"></div>
<script>
    //歌曲按钮播放
    $("#play").click(function () {
        singleClick($(this).find("img"))
        if (!ap.audio.paused) {
            // $(this).parent().siblings(".ctb-num").children("img").show()
            // $(this).parent().siblings(".ctb-num").children("span").hide()
            // $(this).parent().parent().siblings().find(".ctb-num>span").show()
            // $(this).parent().parent().siblings().find(".ctb-num>img").hide()
            // $(this).parent().siblings("td").css("color", "rgb(190,50,50)")
            // $(this).parent().parent().siblings().find("td").css("color", "")
        }
    })
    //歌曲收藏判断
    if (${!empty param.collect}) {
        $("#collect>img").attr("src", "<%=path%>/images/songList/songList-collect2.png")
    }
    //歌曲收藏
    $("#collect").click(function () {
        var sg_id = '${param.id}'
        if ($(this).find("img").attr("src") == "<%=path%>/images/main/main-sl-add-color.png") {
            $.ajax({
                type: 'post',
                url: '<%=path%>/collect/addCollectSong',
                data: {
                    sg_id: sg_id
                },
                context: this,
                dataType: 'json',
                success: function (data) {
                    if (data.stateCollectSong.trim() === "1") {
                        $(this).find("img").attr("src", "<%=path%>/images/main/main-sl-add-color2.png")
                        $(this).unbind("mouseenter").unbind("mouseleave");
                        layer.msg('<span style="font-size:17px">收藏成功</span>', {
                            offset: '220px',
                            anim: 6,
                            time: 1200,
                        });
                    }
                }
            })
        } else {
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
                        $(this).find("img").attr("src", "<%=path%>/images/main/main-sl-add.png")
                        layer.msg('<span style="font-size:17px">取消收藏</span>', {
                            offset: '220px',
                            anim: 6,
                            time: 1200,
                        });
                    }
                }
            })
        }
    })
    //歌曲下载
    $("#download").click(function () {
        if (${empty logUser}) {
            $.ajax({
                type: 'post',
                url: '<%=path%>/download/fileDownload',
                success: function (data) {

                }
            })
        } else {
            var sg_name = '${param.name}'
            var sg_author = '${param.author}'
            var sg_address = '${param.musAddress}'
            var sg_imgAddress = '${param.imgAddress}'
            var htm = '<div style="padding: 15px 50px 0 50px">' +
                '<div class="row">' +
                '<div class="col-md-3"><img src="' + sg_imgAddress + '" style="width: 80px;height: 80px;"></div>' +
                '<div class="col-md"><span style="font-weight: bold;">' + sg_name + '</span><br><br><span>' + sg_author + '</span></div>' +
                '</div>' +
                '<div class="row" style="margin-top:40px">' +
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
                area: ['500px', '320px'],
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
        }
    })

    //点赞图标切换
    $("#clickGood").click(function () {
        var img = $(this).children("img")
        if (img.attr("src") == "<%=path%>/images/songList/songList-clickGood.png") {
            img.attr("src", "<%=path%>/images/songList/songList-clickGood2.png")
        } else {
            img.attr("src", "<%=path%>/images/songList/songList-clickGood.png")
        }
    })
    //点击回复
    var replay = $("#replayText")
    var btRepCal = $("#btRepCal")
    $("#replay").click(function () {
        if (replay.css("display") == "none") {
            replay.show()
            btRepCal.show()
        } else {
            replay.hide()
            btRepCal.hide()
        }
    })
    //点击回复后取消
    $("#cancel").click(function () {
        replay.hide()
        btRepCal.hide()
    })

    //js
    function singleClick($this) {
        //index是从0开始
        var currSong = $this.index()
        var sg_name = '${param.name}'
        var sg_author = '${param.author}'
        var sg_imgAddress = '${param.imgAddress}'
        var sg_address = '${param.musAddress}'
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
        // alert(index)
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
</script>
</body>
</html>
