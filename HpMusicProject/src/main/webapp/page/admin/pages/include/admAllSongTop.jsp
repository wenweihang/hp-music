<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2020/1/4
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>歌曲排行列表</title>
</head>
<body>
<!-- 内容头部 -->
<section class="content-header">
    <h1>
        歌曲排行管理
        <small>歌曲排行列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i>歌曲排行管理</a></li>
        <li class="active">歌曲排行列表</li>
    </ol>
</section>
<!-- 内容头部 /-->
<!-- 正文区域 -->
<section class="content">
    <!-- .box-body -->
    <div class="box box-primary">

        <div class="box-body">
            <!-- 数据表格 -->
            <div class="table-box">
                <!--工具栏-->
                <%--<div class="pull-left">--%>
                <%--<div class="form-group form-inline">--%>
                <%--<div class="btn-group">--%>
                <%--<button type="button" class="btn btn-default" title="新建"><i class="fa fa-file-o"></i> 新建</button>--%>
                <%--<button type="button" class="btn btn-default" title="删除"><i class="fa fa-trash-o"></i> 删除</button>--%>
                <%--<button type="button" class="btn btn-default" title="开启"><i class="fa fa-check"></i> 开启</button>--%>
                <%--<button type="button" class="btn btn-default" title="屏蔽"><i class="fa fa-ban"></i> 屏蔽</button>--%>
                <%--<button type="button" class="btn btn-default" title="刷新"><i class="fa fa-refresh"></i> 刷新</button>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                        <input type="text" class="form-control input-sm" placeholder="搜索">
                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    </div>
                </div>
                <!--工具栏/-->

                <!--数据列表-->
                <table id="dataList" class="table table-bordered  table-hover dataTable">
                    <thead>
                    <tr>
                        <th class="" width="10" style="padding-right: 7px">ID</th>
                        <th class="" width="70" style="padding-right: 7px">歌曲封面</th>
                        <th class="" width="150">歌曲名称</th>
                        <th class="" width="100">歌曲作者</th>
                        <th class="" width="70" style="padding-right: 0px">所属歌单</th>
                        <th class="" width="70" style="padding-right: 0px">所属专辑</th>
                        <th class="" width="70" style="padding-right: 7px">歌曲热度</th>
                        <th class="" width="70" style="padding-right: 7px">歌曲新度</th>
                        <th class="" width="70" style="padding-right: 7px">歌曲排行</th>
                        <th class="" width="70" style="padding-right: 7px">歌曲流行</th>
                        <th class="text-center" width=150">操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    </tbody>
                </table>
                <!--数据列表/-->
            </div>
            <!-- 数据表格 /-->
        </div>
        <!-- /.box-body -->
        <!-- .box-footer-->
        <div class="box-footer">
            <div class="box-tools pull-right" id="user-paging">
                <ul class="pagination">
                    <li>
                        <a id="homePage" href="#" aria-label="Previous">首页</a>
                    </li>
                    <li><a id="Previous" href="#">上一页</a></li>
                    <%--<li><a href="#">2</a></li>--%>
                    <li id="Next"><a href="#">下一页</a></li>
                    <li>
                        <a id="trailerPage" href="#" aria-label="Next">尾页</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.box-footer-->
    </div>
</section>
<!-- 正文区域 /-->
<script src="<%=path%>/js/jquery.cookie.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    $(function () {
        //默认初始化数据
        var currPage = 1
        var songInfo, sumPage, sumCount
        $.ajax({
            async: false,
            type: 'post',
            url: '<%=path%>/adminSongInfo/getSongInfoTopPage',
            data: {
                currPage: currPage,
            },
            dataType: 'json',
            success: function (data) {
                songInfo = data.page.lists //获取歌曲集合
                sumPage = data.page.sumPage    //获取总页数
                sumCount = data.page.sumCount    //获取总数
                if (sumCount <= 5) {
                    $("#user-paging").empty() //分页为空
                } else {
                    for (var m = 1; m <= sumPage; m++) {
                        if (m == 1) {
                            $("#Next").before('<li><a class="aShow" id="aShow1" href="#">' + m + '</a></li>')
                        } else {
                            $("#Next").before('<li><a class="aShow" href="#">' + m + '</a></li>')
                        }
                    }
                }
                //获取歌曲信息
                getTable(songInfo, currPage)
            }
        })
        //点击显示隐藏的专辑描述
        btBack()
        //修改歌曲信息按钮
        btUpd(".edit")
        //删除歌曲信息按钮
        btDel(".del", currPage)
        //给默认页加颜色
        $("#aShow1").css("color", "rgb(255,87,34)")
        $(".aShow").click(function () {
            currPage = $(this).text()
            $(this).css("color", "rgb(255,87,34)")
            $(this).parent().siblings().children(".aShow").css("color", "")
            // alert(currPage)
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/adminSongInfo/getSongInfoTopPage',
                data: {
                    currPage: currPage,
                },
                dataType: 'json',
                success: function (data) {
                    $("#tbody>tr").empty()
                    var songInfo = data.page.lists  //获取歌曲信息集合
                    //获取歌曲信息
                    getTable(songInfo, currPage)
                }
            })
            //点击显示隐藏的专辑描述
            btBack()
            //修改歌曲信息按钮
            btUpd(".edit")
            //删除歌曲信息按钮
            btDel(".del", currPage)
        })
        $("#homePage").click(function () {
            $(".aShow:eq(0)").click()   //eq从0开始
        })
        $("#Previous").click(function () {
            if (currPage != 1) {
                var prev = currPage - 2
                $(".aShow:eq('" + prev + "')").click() //eq从0开始
            }
        })
        $("#Next").click(function () {
            var trailer = $(".aShow").last().text()
            if (currPage != trailer) {
                var next = currPage
                $(".aShow:eq('" + next + "')").click() //eq从0开始
            }
        })
        $("#trailerPage").click(function () {
            var trailer = $(".aShow").last().text()
            $(".aShow:eq('" + (parseInt(trailer) - 1) + "')").click() //eq从0开始
        })
    });


    //js
    //遍历歌曲信息
    function getTable(songInfo, currPage) {
        $(songInfo).each(function (i) {
            var id = this.sg_id
            var imgAddress = this.sg_imgAddress
            var name = this.sg_name
            var author = this.sg_author
            var songList = this.sg_songList
            var zj = this.szj_id
            var hot = this.sg_hot
            var $new = this.sg_new
            var topList = this.sg_topList
            var pop = this.sg_pop
            var td = '<td>' + ((currPage - 1) * 5 + i + 1) + '</td>' + '<td class="imgAddress"><img src="' + imgAddress + '" width="70" height="70"></td>' +
                '<td class="name">' + name + '</td>' + '<td class="author">' + author + '</td>' +
                '<td class="songList"><input type="text" name="sg_songList" value="' + songList + '" disabled style="border: none;background-color:rgba(255,255,255,0);width: 60px "></td>' +
                '<td class="zj"><input type="text" name="szj_id" value="' + zj + '" disabled style="border: none;background-color:rgba(255,255,255,0);width: 60px "></td>' +
                '<td class="hot"><input type="text" name="sg_hot" value="' + hot + '" disabled style="border: none;background-color:rgba(255,255,255,0);width: 60px "></td>' +
                '<td class="new"><input type="text" name="sg_new" value="' + $new + '" disabled style="border: none;background-color:rgba(255,255,255,0);width: 60px "></td>' +
                '<td class="topList"><input type="text" name="sg_topList" value="' + topList + '" disabled style="border: none;background-color:rgba(255,255,255,0);width: 60px "></td>' +
                '<td class="pop"><input type="text" name="sg_pop" value="' + pop + '" disabled style="border: none;background-color:rgba(255,255,255,0);width: 60px "></td>' +
                '<td class="id" style="display: none"><input type="text" name="sg_id" value="' + id + '" disabled style="border: none;background-color:rgba(255,255,255,0);width: 60px "></td>' +
                '<td class="songListDao" style="display: none">' + songList + '</td>' +
                '<td class="zjDao" style="display: none">' + zj + '</td>' +
                '<td class="hotDao" style="display: none">' + hot + '</td>' +
                '<td class="newDao" style="display: none">' + $new + '</td>' +
                '<td class="topListDao" style="display: none">' + topList + '</td>' +
                '<td class="popDao" style="display: none">' + pop + '</td>' +
                '<td class="text-center">' +
                ' <button type="button" class="btn bg-olive btn-xs edit">编辑</button>' +
                ' <button type="button" class="btn bg-olive btn-xs cancel" style="display: none">取消</button>' +
                ' <button type="button" class="btn bg-olive btn-xs del">删除</button>' +
                '</td>'

            $("#tbody").append('<tr>' + td + '</tr>')
        })
    };

    function btBack() {
        $(".detailSimple>span").click(function () {
            $(this).text($(this).parent().siblings(".detail").text())
            $(this).siblings("a").show()
        })
        $(".back").click(function () {
            $(this).siblings("span").text($(this).parent().siblings(".detail2").text())
            $(this).hide()
        })
    }

    function btUpd(obj) {
        $(obj).click(function () {
            var text = $(this).text()
            var sg_songList = $(this).parent().siblings(".songList").find("input")
            var szj_id = $(this).parent().siblings(".zj").find("input")
            var sg_hot = $(this).parent().siblings(".hot").find("input")
            var sg_new = $(this).parent().siblings(".new").find("input")
            var sg_topList = $(this).parent().siblings(".topList").find("input")
            var sg_pop = $(this).parent().siblings(".pop").find("input")
            var songListDao = $(this).parent().siblings(".songListDao").text()
            var zjDao = $(this).parent().siblings(".zjDao").text()
            var hotDao = $(this).parent().siblings(".hotDao").text()
            var newDao = $(this).parent().siblings(".newDao").text()
            var topListDao = $(this).parent().siblings(".topListDao").text()
            var popDao = $(this).parent().siblings(".popDao").text()
            var sg_idVal = $(this).parent().siblings(".id").find("input").val()
            var sg_songListVal = sg_songList.val()
            var szj_idVal = szj_id.val()
            var sg_hotVal = sg_hot.val()
            var sg_newVal = sg_new.val()
            var sg_topListVal = sg_topList.val()
            var sg_popVal = sg_pop.val()
            if (text == "编辑") {
                $(this).text("修改")
                $(this).siblings(".cancel").show()
                sg_songList.prop("disabled", false)
                sg_songList.css("border", "1px solid black")
                szj_id.prop("disabled", false)
                szj_id.css("border", "1px solid black")
                sg_hot.prop("disabled", false)
                sg_hot.css("border", "1px solid black")
                sg_new.prop("disabled", false)
                sg_new.css("border", "1px solid black")
                sg_topList.prop("disabled", false)
                sg_topList.css("border", "1px solid black")
                sg_pop.prop("disabled", false)
                sg_pop.css("border", "1px solid black")
                $(this).siblings(".cancel").click(function () {
                    $(this).hide()
                    $(this).siblings(".edit").text("编辑")
                    sg_songList.prop("disabled", true)
                    sg_songList.css("border", "none")
                    sg_songList.val(songListDao)
                    szj_id.prop("disabled", true)
                    szj_id.css("border", "none")
                    szj_id.val(zjDao)
                    sg_hot.prop("disabled", true)
                    sg_hot.css("border", "none")
                    sg_hot.val(hotDao)
                    sg_new.prop("disabled", true)
                    sg_new.css("border", "none")
                    sg_new.val(newDao)
                    sg_topList.prop("disabled", true)
                    sg_topList.css("border", "none")
                    sg_topList.val(topListDao)
                    sg_pop.prop("disabled", true)
                    sg_pop.css("border", "none")
                    sg_pop.val(popDao)
                })
            } else {
                if (songListDao == sg_songListVal && zjDao == szj_idVal && hotDao == sg_hotVal && newDao == sg_newVal && topListDao == sg_topListVal && popDao == sg_popVal) {
                    layer.msg('<span style="font-size:17px;">您尚未修改任何数据</span>', {
                        offset: '150px',
                        anim: 6,
                        time: 1200,
                    });
                } else {
                    $.ajax({
                        type: 'post',
                        url: '<%=path%>/adminSongInfo/updateSongInfoTop',
                        data: {
                            sg_id: sg_idVal,
                            sg_songList: sg_songListVal,
                            szj_id: szj_idVal,
                            sg_hot: sg_hotVal,
                            sg_new: sg_newVal,
                            sg_topList: sg_topListVal,
                            sg_pop: sg_popVal
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.stateUpdSongInfoTop.trim() === "1") {
                                layer.load()
                                setTimeout(function () {
                                    layer.closeAll('loading')
                                    layer.msg('<span style="font-size:17px;">修改成功</span>', {
                                        offset: '150px',
                                        anim: 6,
                                        time: 1200,
                                    });
                                    $(".content-wrapper").load("include/admAllSongTop.jsp", function () {

                                    })
                                }, 1000)
                            }
                            if (data.stateUpdSongInfoTop.trim() === "0") {
                                layer.load()
                                setTimeout(function () {
                                    layer.closeAll('loading')
                                    layer.msg('<span style="font-size:17px;">修改失败</span>', {
                                        offset: '150px',
                                        anim: 6,
                                        time: 1200,
                                    });
                                }, 1000)
                            }
                        }
                    })
                }
            }
        })
    }

    function btDel(obj, currPage) {
        $(obj).click(function () {
            var edit = $(".edit").text()
            if (edit.indexOf("修改") != -1) {
                layer.msg('<span style="font-size:17px;">请先完成修改操作</span>', {
                    offset: '150px',
                    anim: 6,
                    time: 1200,
                })
            } else {
                var sg_id = $(this).parent().siblings(".id").text()
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
                    content: '<div style="padding: 30px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">' +
                    '亲！您正在删除该歌曲<br>请确认无误再点击确认哦。否则将会造成不利的影响。</div>',
                    yes: function () {
                        $.ajax({
                            type: 'post',
                            url: '<%=path%>/adminSongInfo/deleteSongInfoTop',
                            data: {
                                sg_id: sg_id,
                            },
                            dataType: 'json',
                            success: function (data) {
                                if (data.stateDel.trim() === "1") {
                                    layer.load();
                                    setTimeout(function () {
                                        layer.closeAll('loading');
                                        layer.closeAll();
                                        parent.layer.msg('<span style="font-size:17px;">删除成功</span>', {
                                            icon: 1,
                                            offset: '150px',
                                            anim: 6,
                                            time: 1500,
                                        })
                                        //刷新页面
                                        $(".aShow:eq('" + (currPage - 1) + "')").click()
                                    }, 1200)

                                }
                            }
                        })
                    },
                    btn2: function () {
                        layer.closeAll();
                    }
                })
            }
        })
    };


</script>
</body>
</html>
