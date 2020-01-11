<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/12
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>歌手信息</title>
    <script src="<%=path%>/js/jquery-3.3.1.js"></script>
</head>
<body>
<!-- 内容头部 -->
<section class="content-header">
    <h1>
        歌手管理
        <small>歌手列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i>歌手管理</a></li>
        <li class="active">歌手列表</li>
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
                        <input type="text" class="form-control input-sm" id="singerSearch" placeholder="搜索">
                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    </div>
                </div>
                <!--工具栏/-->

                <!--数据列表-->
                <table id="dataList" class="table table-bordered  table-hover dataTable">
                    <thead>
                    <tr>
                        <th class="" width="10" style="padding-right: 7px">ID</th>
                        <th class="" width="70" style="padding-right: 7px">歌手照片</th>
                        <th class="" width="150">歌手姓名</th>
                        <th class="" width="40">性别</th>
                        <th class="">歌手信息</th>
                        <th class="" width="40">热门</th>
                        <th class="" width="50" style="padding-right: 7px">首字母</th>
                        <th class="" width="50" style="padding-right: 7px">地区</th>
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
        //搜索
        $("#singerSearch").keydown(function (e) {
            keyCod(e)
        })
        //默认初始化数据
        var currPage = 1
        var singerInfo, sumPage, sumCount
        $.ajax({
            async: false,
            type: 'post',
            url: '<%=path%>/adminSingerInfo/getSingerInfoPage',
            data: {
                currPage: currPage,
            },
            dataType: 'json',
            success: function (data) {
                singerInfo = data.page.lists //获取歌手集合
                sumPage = data.page.sumPage    //获取总页数
                sumCount = data.page.sumCount    //获取总数
                if (sumCount <= 36) {
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
                //获取歌手信息
                getTable(singerInfo, currPage)
            }
        })
        //点击显示隐藏的专辑描述
        btBack()
        //修改歌手信息按钮
        btUpd(".edit")
        //删除歌手信息按钮
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
                url: '<%=path%>/singerInfo/getSingerInfoPage',
                data: {
                    currPage: currPage,
                },
                dataType: 'json',
                success: function (data) {
                    $("#tbody>tr").empty()
                    var singerInfo = data.page.lists  //获取歌手信息集合
                    //获取歌手信息
                    getTable(singerInfo, currPage)
                }
            })
            //点击显示隐藏的专辑描述
            btBack()
            //修改歌手信息按钮
            btUpd(".edit")
            //删除歌手信息按钮
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
    function keyCod(e) {
        var e = e.keyCode
        switch (e) {
            case 13:
                singerSearch()
                break
            case 108:
                singerSearch()
                break
            default:
                break
        }
    }

    function singerSearch() {
        var currPage = 1
        var text = $("#singerSearch").val()
        $.ajax({
            async: false,
            type: 'post',
            url: '<%=path%>/adminSingerInfo/getSingerInfoByText',
            data: {
                text: text,
                currPage: currPage
            },
            dataType: 'json',
            success: function (data) {
                $("#tbody>tr").empty()
                var singerInfo = data.page.lists //获取歌手集合
                var sumPage = data.page.sumPage    //获取总页数
                var sumCount = data.page.sumCount    //获取总数
                if (sumCount <= 36) {
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
                //获取信息
                getTable(singerInfo, currPage)
            }
        })
        //点击显示隐藏的专辑描述
        btBack()
        //修改歌手信息按钮
        btUpd(".edit")
        //删除歌手信息按钮
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
                url: '<%=path%>/singerInfo/getSingerInfoPage',
                data: {
                    text: text,
                    currPage: currPage,
                },
                dataType: 'json',
                success: function (data) {
                    $("#tbody>tr").empty()
                    var singerInfo = data.page.lists  //获取歌手信息集合
                    //获取歌手信息
                    getTable(singerInfo, currPage)
                }
            })
            //点击显示隐藏的专辑描述
            btBack()
            //修改歌手信息按钮
            btUpd(".edit")
            //删除歌手信息按钮
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
    }

    //遍历歌手信息
    function getTable(singerInfo, currPage) {
        $(singerInfo).each(function (i) {
            var id = this.sgr_id
            var imgAddress = this.sgr_imgAddress
            var name = this.sgr_name
            var sex = this.sgr_sex
            var detail = this.sgr_detail
            var hot = this.sgr_hot
            var firstLetter = this.sgr_firstLetter
            var region = this.sgr_region
            if (detail.length > 80) {
                var detailSimple = detail.substring(0, 80) + "...."
                var td = '<td>' + ((currPage - 1) * 36 + i + 1) + '</td>' + '<td class="imgAddress"><img src="' + imgAddress + '" width="70" height="70"></td>' +
                    '<td class="name">' + name + '</td>' + '<td class="sex">' + sex + '</td>' +
                    '<td class="detailSimple">' + '<span>' + detailSimple + '</span>' + '<a class="back" style="cursor: pointer;color:#005cbf;display: none">[收回]</a>' + '</td>' +
                    '<td class="hot"><input type="text" name="sgr_hot" value="' + hot + '" disabled style="border: none;background-color:rgba(255,255,255,0);width: 60px "></td>' +
                    '<td class="firstLetter">' + firstLetter + '</td>' + '<td class="region">' + region + '</td>' +
                    '<td class="id" style="display: none">' + id + '</td>' +
                    '<td class="hotDao" style="display: none">' + hot + '</td>' +
                    '<td class="detail" style="display: none">' + detail + '</td>' +
                    '<td class="detail2" style="display: none">' + detailSimple + '</td>' +
                    '<td class="text-center">' +
                    ' <button type="button" class="btn bg-olive btn-xs edit">编辑</button>' +
                    ' <button type="button" class="btn bg-olive btn-xs cancel" style="display: none">取消</button>' +
                    ' <button type="button" class="btn bg-olive btn-xs del">删除</button>' +
                    '</td>'
            } else {
                var td = '<td>' + ((currPage - 1) * 36 + i + 1) + '</td>' + '<td class="imgAddress"><img src="' + imgAddress + '" width="70" height="70"></td>' +
                    '<td class="name">' + name + '</td>' + '<td class="sex">' + sex + '</td>' +
                    '<td class="detail">' + '<span>' + detail + '</span>' + '</td>' +
                    '<td class="hot"><input type="text" name="sgr_hot" value="' + hot + '" disabled style="border: none;background-color:rgba(255,255,255,0);width: 60px "></td>' +
                    '<td class="firstLetter">' + firstLetter + '</td>' + '<td class="region">' + region + '</td>' +
                    '<td class="id" style="display: none">' + id + '</td>' +
                    '<td class="hotDao" style="display: none">' + hot + '</td>' +
                    '<td class="text-center">' +
                    ' <button type="button" class="btn bg-olive btn-xs edit">编辑</button>' +
                    ' <button type="button" class="btn bg-olive btn-xs cancel" style="display: none">取消</button>' +
                    ' <button type="button" class="btn bg-olive btn-xs del">删除</button>' +
                    '</td>'
            }

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
            var input = $(this).parent().siblings(".hot").find("input")
            var sgr_id = $(this).parent().siblings(".id").text()
            var hotDao = $(this).parent().siblings(".hotDao").text()
            var sgr_hot = input.val()
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
                    input.val(hotDao)
                })
            } else {
                if (hotDao == sgr_hot) {
                    layer.msg('<span style="font-size:17px;">您尚未修改任何数据</span>', {
                        offset: '150px',
                        anim: 6,
                        time: 1200,
                    });
                } else {
                    $.ajax({
                        type: 'post',
                        url: '<%=path%>/adminSingerInfo/updSingerInfo',
                        data: {
                            sgr_id: sgr_id,
                            sgr_hot: sgr_hot
                        },
                        dataType: 'json',
                        success: function (data) {
                            if (data.stateUpdSingerInfo.trim() === "1") {
                                layer.load()
                                setTimeout(function () {
                                    layer.closeAll('loading')
                                    layer.msg('<span style="font-size:17px;">修改成功</span>', {
                                        offset: '150px',
                                        anim: 6,
                                        time: 1200,
                                    });
                                    $(".content-wrapper").load("include/admAllSingerInfo.jsp", function () {

                                    })
                                }, 1000)
                            }
                            if (data.stateUpdSingerInfo.trim() === "0") {
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
                var sgr_name = $(this).parent().siblings(".name").text()
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
                    '亲！您正在删除该歌手的所有信息<br>请确认无误再点击确认哦。否则将会造成不利的影响。</div>',
                    yes: function () {
                        $.ajax({
                            type: 'post',
                            url: '<%=path%>/adminSingerInfo/deleteSingerInfo',
                            data: {
                                sgr_name: sgr_name,
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
