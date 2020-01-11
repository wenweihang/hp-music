<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>歌单</title>
    <style>

    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row pb-5">
        <%--左边--%>
        <div class="col-md-3 pt-4" id="songList-left">
            <div id="slName" style="display: none;">${param.sl_name}</div>
            <div class="row row1">
                <div class="col-md pl-5">
                    <div id="slImg">
                        <img src="${param.sl_imgAddress}" width="248" height="249"/>
                    </div>
                    <div class="d2"></div>
                    <div class="d3"></div>
                </div>
            </div>
            <div class="row row2 ">
                <div class="col-md pl-5 ">
                    <div class="pt-4 pr-4">
                        <h4>歌单介绍</h4><br>
                        <span id="detail"></span>
                    </div>
                </div>
            </div>
            <div class="row ml-5 mt-5 row2">
            </div>
        </div>
        <%--右边--%>
        <div class="col-md" id="songList-right">
            <div class="row mt-4 pr-5 row1">
                <div class="col-md pl-4">
                    <h3 id="slTitle">${param.sl_title}</h3>
                </div>
            </div>
            <div class="row mt-3 pr-5 row2">
                <div class="col-md pl-4">
                    <span id="slTag">${param.sl_tag}</span>
                </div>
            </div>
            <div class="row mt-5 pr-5 row3 ">
                <div class="col-md-2.5 pl-4">
                    <button type="button" class="btn" id="playAll">
                        <img src="<%=path%>/images/songList/songList-play.png">全部播放
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
            </div>
            <div class="row mt-4 pr-5 row4 ">
                <div class="col-md pl-4">
                    <div id="table-songs">
                        <%--<img src="<%=path%>/images/main/main-sl-act.gif">--%>
                        <jsp:include page="slTableSongs.jsp"/>
                    </div>
                </div>
            </div>
            <div class="row mt-5 pr-5 row5 ">
                <div class="col-md pl-4">
                    <h4 id="comment-title">评论</h4>
                </div>
            </div>
            <div class="row mt-4 pr-5 row6 ">
                <c:if test="${empty stateUpHeImg}">
                    <c:if test="${!empty logUser}">
                        <div class="col-md-1 pl-4">
                            <div class="cir-box-comment">
                                <img src="${logUser.uer_headImg}">
                            </div>
                        </div>
                    </c:if>
                </c:if>
                <c:if test="${!empty stateUpHeImg}">
                    <div class="col-md-1 pl-4">
                        <div class="cir-box-comment">
                            <img src="${serverPath}">
                        </div>
                    </div>
                </c:if>
                <div class="col-md pl-4">
                    <textarea class="form-control" id="songList-comment" name="" rows="3"
                              placeholder="期待你的神评论.."></textarea>
                </div>
            </div>
            <div class="row mt-3 pr-5 row7 ">
                <div class="col-md pl-4">
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
            <div class="row mt-3 pr-5 row8 ">
                <div class="col-md-1.5 pl-4">
                    <h4>最新评论</h4>
                </div>
                <div class="col-md pl-3">
                    <span>999条</span>
                </div>
            </div>
            <div class="row mt-3 pr-5 row9 ">
                <div class="col-md pl-4">
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
    $(function () {
        var tdetail = '${param.sl_detail}'
        var hdetail = tdetail.replace(/\n/g, "<br/><br/>")
        // alert(hdetail)
        $("#detail").html(hdetail)

        //全部播放
        $("#playAll").click(function () {
            //去除重复的歌曲
            var arr = ap.list.audios
            var rows = $("#tbody").find("tr").length
            if (arr.length == 0) {
                for (var j = 0; j < rows - 1; j++) {
                    var sg_name = $(".song" + j).find(".ctb-name>span:first-child").text()
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
                for (var j = 0; j < rows - 1; j++) {
                    var sg_name = $(".song" + j).find(".ctb-name>span:first-child").text()
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
        //歌单收藏判断
        if(${!empty param.collect}){
            $("#collect>img").attr("src", "<%=path%>/images/songList/songList-collect2.png")
        }
        //歌单收藏
        $("#collect").click(function () {
            var sl_id = '${param.sl_id}'
            if ($(this).find("img").attr("src") == "<%=path%>/images/songList/songList-collect.png") {
                $.ajax({
                    type: 'post',
                    url: '<%=path%>/collect/addCollectSongList',
                    data: {
                        sl_id: sl_id,
                    },
                    context: this,
                    dataType: 'json',
                    success: function (data) {
                        if (data.stateCollectSongList.trim() === "1") {
                            $(this).find("img").attr("src", "<%=path%>/images/songList/songList-collect2.png")
                            layer.msg('<span style="font-size:17px">歌单收藏成功</span>', {
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
                    url: '<%=path%>/collect/deleteCollectSongList',
                    data: {
                        sl_id: sl_id,
                    },
                    context: this,
                    dataType: 'json',
                    success: function (data) {
                        if (data.stateDelCollectSongList.trim() === "1") {
                            $(this).find("img").attr("src","<%=path%>/images/songList/songList-collect.png")
                            layer.msg('<span style="font-size:17px">取消歌单收藏</span>', {
                                offset: '220px',
                                anim: 6,
                                time: 1200,
                            });
                        }
                    }
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
    });
</script>
</body>
</html>
