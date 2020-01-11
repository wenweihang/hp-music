<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/18
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>专辑歌曲</title>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
</head>
<body>
<!-- 内容头部 -->
<section class="content-header">
    <h1>
        专辑${param.szj_id}
        <small>歌曲列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i>专辑管理</a></li>
        <li class="active">专辑列表</li>
        <li class="active">专辑${param.szj_id}</li>
    </ol>
</section>
<!-- 内容头部 /-->

<!-- 正文区域 -->
<section class="content">
    <!-- .box-body -->
    <div class="box box-primary">

        <div class="box-body">
            <!-- 数据表格 -->
            <div class="table-box" style="height: 530px">
                <!--工具栏-->
                <div class="pull-left">
                    <div class="form-group form-inline">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default" id="addSongToZJ" title="添加歌曲"><i
                                    class="fa fa-plus-square"></i> 添加歌曲
                            </button>
                            <button type="button" class="btn btn-default" id="refresh" title="刷新"><i
                                    class="fa fa-refresh"></i> 刷新
                            </button>
                        </div>
                    </div>
                </div>
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
                        <th width="70" style="padding-right: 0">歌曲图片</th>
                        <th width="240">歌曲名</th>
                        <th width="130">创作人</th>
                        <th width="150">语言</th>
                        <th width="130">歌曲时间</th>
                        <th width="70">播放次数</th>
                        <th class="text-center">操作</th>
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
<script src="<%=path%>/layer/layer.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    $(function () {
        //默认初始化数据
        var currPage = 1
        var szj_id = '${param.szj_id}'
        var songs, sumPage, sumCount
        $.ajax({
            async: false,
            type: 'post',
            url: '<%=path%>/adminSongZJ/getSongInfo',
            data: {
                currPage: currPage,
                szj_id: szj_id,
            },
            dataType: 'json',
            success: function (data) {
                songs = data.page.lists //获取专辑中的歌曲集合
                sumPage = data.page.sumPage    //获取总页数
                sumCount = data.page.sumCount    //获取总数
                for (var m = 1; m <= sumPage; m++) {
                    if (m == 1) {
                        $("#Next").before('<li><a class="aShow" id="aShow1" href="#">' + m + '</a></li>')
                    } else {
                        $("#Next").before('<li><a class="aShow" href="#">' + m + '</a></li>')
                    }
                }

                //获取歌曲信息
                getTable(songs, currPage)
            }
        })
        //删除歌曲按钮
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
                url: '<%=path%>/adminSongList/getSongInfo',
                data: {
                    currPage: currPage,
                    sg_songList: sg_songListName,
                },
                dataType: 'json',
                success: function (data) {
                    $("#tbody>tr").empty()
                    var songs = data.page.lists  //获取歌曲集合
                    //获取歌曲信息
                    getTable(songs, currPage)
                }
            })
            //删除用户按钮
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
        //添加歌曲
        $("#addSongToZJ").click(function () {
            layer.open({
                type: 2,
                title: '添加歌曲',
                shade: [0.7],
                area: ['520px', '460px'],
                offset: ['120px', '540px'],
                time: 0, //2秒后自动关闭
                anim: 0,
                content: ['include/admAddSongToZJ.jsp?szj_id=' + szj_id, 'no'], //iframe的url，no代表不显示滚动条
            });
        })
        //刷新
        $("#refresh").click(function () {
            $(".content-wrapper").load("include/admSongZJ.jsp"
                , {
                    szj_id: szj_id,
                }
                ,
                function () {
                })
        })
    });

    //遍历歌曲信息
    function getTable(songs, currPage) {
        $(songs).each(function (i) {
            var id = this.sg_id
            var img = this.sg_imgAddress
            var name = this.sg_name
            var author = this.sg_author
            var language = this.sg_language
            var time = this.sg_time
            var td = '<td class="id">' + ((currPage - 1) * 5 + i + 1) + '</td>' + '<td class="img"><img src="' + img + '" width="70" height="70"></td>' +
                '<td class="name">' + name + '</td>' + '<td class="author">' + author + '</td>' +
                '<td class="language">' + language + '</td>' + '<td class="time">' + time + '</td>' +
                '<td class="palyCount">773</td>' +
                '<td class="text-center">' +
                ' <button type="button" class="btn bg-olive btn-xs">查看</button>' +
                ' <button type="button" class="btn bg-olive btn-xs del">删除</button>' +
                '</td>'
            $("#tbody").append('<tr>' + td + '</tr>')
        })
    };

    function btDel(obj, currPage) {
        $(obj).click(function () {
            var sg_name = $(this).parent().siblings(".name").text()
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
                '亲！您正在删除 ' + sg_name + '.mp3<br>请确认无误再点击确认哦。否则将会造成不利的影响。</div>',
                yes: function () {
                    $.ajax({
                        type: 'post',
                        url: '<%=path%>/adminSongList/deleteSongInfo',
                        data: {
                            sg_name: sg_name,
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
        })
    };
</script>
</body>
</html>
