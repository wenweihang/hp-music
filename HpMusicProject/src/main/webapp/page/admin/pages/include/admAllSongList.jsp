<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/28
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>歌单列表</title>
</head>
<body>
<!-- 内容头部 -->
<section class="content-header">
    <h1>
        歌单管理
        <small>歌单列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i>歌单管理</a></li>
        <li class="active">歌单列表</li>
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
                <table id="dataList" class="table table-bordered table-hover dataTable">
                    <thead>
                    <tr>
                        <th width="10" style="padding-right: 7px">ID</th>
                        <th width="70" style="padding-right: 0">歌单封面</th>
                        <th width="50" style="padding-right: 5px">歌单名</th>
                        <th width="70" style="padding-right: 0px">歌单首页</th>
                        <th width="150">歌单标题</th>
                        <th width="70" style="padding-right: 0px">歌单标签</th>
                        <th>歌单描述</th>
                        <th width="70" style="padding-right: 3px">播放次数</th>
                        <th class="text-center" width="80">操作</th>
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
            <div class="box-tools pull-right" id="paging">
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
<script src="<%=path%>/js/jquery-3.3.1.js"></script>
<script src="<%=path%>/js/jquery.cookie.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    $(function () {
        //默认初始化数据
        var currPage = 1
        var songList, sumPage, sumCount
        $.ajax({
            async: false,
            type: 'post',
            url: '<%=path%>/adminSongList/getAllSongList',
            data: {
                currPage: currPage,
            },
            dataType: 'json',
            success: function (data) {
                songList = data.page.lists //获取歌单中的歌曲集合
                sumPage = data.page.sumPage    //获取总页数
                sumCount = data.page.sumCount    //获取总数
                if (sumCount <= 5) {
                    $("#paging").empty() //分页为空
                } else {
                    for (var m = 1; m <= sumPage; m++) {
                        if (m == 1) {
                            $("#Next").before('<li><a class="aShow" id="aShow1" href="#">' + m + '</a></li>')
                        } else {
                            $("#Next").before('<li><a class="aShow" href="#">' + m + '</a></li>')
                        }
                    }
                }
                //获取歌单
                getTable(songList, currPage)
            }
        })
        //修改歌单信息按钮
        btUpd(".edit")
        //删除歌单按钮
        btDel(".del", currPage)
        //查看歌单
        see()
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
                url: '<%=path%>/adminSongList/getAllSongList',
                data: {
                    currPage: currPage,
                },
                dataType: 'json',
                success: function (data) {
                    $("#tbody>tr").empty()
                    var songList = data.page.lists  //获取歌单集合
                    //获取歌单信息
                    getTable(songList, currPage)
                }
            })
            //修改歌单信息按钮
            btUpd(".edit")
            //删除歌单按钮
            btDel(".del", currPage)
            //查看歌单
            see()
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

    //遍历歌单信息
    function getTable(songList, currPage) {
        $(songList).each(function (i) {
            var id = this.sl_id
            var name = this.sl_name
            var img = this.sl_imgAddress
            var main = this.sl_main
            var title = this.sl_title
            var tag = this.sl_tag
            var detail = this.sl_detail
            var td = '<td>' + ((currPage - 1) * 5 + i + 1) + '</td>' + '<td class="img"><img src="' + img + '" width="70" height="70"></td>' +
                '<td class="name">' + name + '</td>' + '<td class="main"><input type="text" name="sgr_hot" value="' + main + '" disabled style="border: none;background-color:rgba(255,255,255,0);width: 60px "></td>' +
                '<td class="title">' + title + '</td>' + '<td class="tag">' + tag + '</td>' +
                '<td class="detail">' + detail + '</td>' + '<td class="playCount">773</td>' +
                '<td class="mainDao" style="display: none;">' + main + '</td>' +
                '<td class="id" style="display: none;">' + id + '</td>' +
                '<td class="text-center">' +
                ' <button type="button" class="btn bg-olive btn-xs see" href="#">查看</button>' +
                ' <button type="button" class="btn bg-olive btn-xs del" style="margin-top: 10px">删除</button>' +
                ' <button type="button" class="btn bg-olive btn-xs edit" style="margin-top: 10px">编辑</button>' +
                ' <button type="button" class="btn bg-olive btn-xs cancel" style="margin-top: 10px;display: none">取消</button>' +
                '</td>'
            $("#tbody").append('<tr>' + td + '</tr>')
        })
    };

    function btUpd(obj) {
        $(obj).click(function () {
            var text = $(this).text()
            var input = $(this).parent().siblings(".main").find("input")
            var sl_id = $(this).parent().siblings(".id").text()
            var mainDao = $(this).parent().siblings(".mainDao").text()
            var sl_main = input.val()
            if (text == "编辑") {
                $(this).text("修改")
                $(this).siblings(".cancel").show()
                input.prop("disabled", false)
                input.css("border", "1px solid black")
                $(this).siblings(".cancel").click(function () {
                    $(this).hide()
                    $(this).siblings(".edit").text("编辑")
                    input.prop("disabled", true)
                    input.css("border", "none")
                    input.val(mainDao)
                })
            } else {
                if (mainDao == sl_main) {
                    layer.msg('<span style="font-size:17px;">您尚未修改任何数据</span>', {
                        offset: '150px',
                        anim: 6,
                        time: 1200,
                    });
                } else {
                    $.ajax({
                        type: 'post',
                        url: '<%=path%>/adminSongList/updSongList',
                        data: {
                            sl_id: sl_id,
                            sl_main: sl_main
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.stateUpdSongList.trim() === "1") {
                                layer.load()
                                setTimeout(function () {
                                    layer.closeAll('loading')
                                    layer.msg('<span style="font-size:17px;">修改成功</span>', {
                                        offset: '150px',
                                        anim: 6,
                                        time: 1200,
                                    });
                                    $(".content-wrapper").load("include/admAllSongList.jsp", function () {

                                    })
                                }, 1000)
                            }
                            if (data.stateUpdSongList.trim() === "0") {
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
                var sl_name = $(this).parent().siblings(".name").text()
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
                    '亲！您正在删除 ' + sl_name + ' 歌单<br>请确认无误再点击确认哦。否则将会造成不利的影响。</div>',
                    yes: function () {
                        $.ajax({
                            type: 'post',
                            url: '<%=path%>/adminSongList/deleteSongList',
                            data: {
                                sl_name: sl_name,
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
                                            time: 1200,
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

    function see() {
        $(".see").click(function () {
            var edit = $(".edit").text()
            if (edit.indexOf("修改") != -1) {
                layer.msg('<span style="font-size:17px;">请先完成修改操作</span>', {
                    offset: '150px',
                    anim: 6,
                    time: 1200,
                })
            } else {
                var sl_name = $(this).parent().siblings(".name").text()
                $.get("include/admSongList.jsp"
                    , {
                        sl_name: sl_name,
                    }
                    , function (data) {
                        $(".content-wrapper").html(data)
                    })
            }
        })
    };
</script>
</body>
</html>

