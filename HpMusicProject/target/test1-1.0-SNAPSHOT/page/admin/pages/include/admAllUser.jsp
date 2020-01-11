<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/26
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>用户列表</title>
</head>
<body>
<!-- 内容头部 -->
<section class="content-header">
    <h1>
        用户管理
        <small>用户列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i>用户管理</a></li>
        <li class="active">用户列表</li>
    </ol>
</section>
<!-- 内容头部 /-->

<!-- 正文区域 -->
<section class="content">
    <!-- .box-body -->
    <div class="box box-primary">

        <div class="box-body">
            <!-- 数据表格 -->
            <div class="table-box" style="height: 500px">
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
                        <th width="70" style="padding-right: 0">用户头像</th>
                        <th >用户昵称</th>
                        <th width="150">用户帐号</th>
                        <th width="40">类型</th>
                        <th width="35">性别</th>
                        <th width=120">注册时间</th>
                        <th width=150">邮箱地址</th>
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
<script src="<%=path%>/js/jquery-3.3.1.js"></script>
<script src="<%=path%>/js/jquery.cookie.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    $(function () {
        //默认初始化数据
        var currPage = 1
        var userList, sumPage, sumCount
        $.ajax({
            async: false,
            type: 'post',
            url: '<%=path%>/admin/getAllUser',
            data: {
                currPage: currPage,
            },
            dataType: 'json',
            success: function (data) {
                userList = data.page.lists //获取用户集合
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
                //获取用户信息
                getTable(userList,currPage)
            }
        })
        //删除用户按钮
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
                url: '<%=path%>/admin/getAllUser',
                data: {
                    currPage: currPage,
                },
                dataType: 'json',
                success: function (data) {
                    $("#tbody>tr").empty()
                    var userList = data.page.lists  //获取订单集合
                    //获取用户信息
                    getTable(userList,currPage)
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
    });


    //js
    //遍历订单信息
    function getTable(userList,currPage) {
        $(userList).each(function (i) {
            var id = this.uer_id
            var headImg = this.uer_headImg
            var name = this.uer_name
            var act = this.uer_act
            var sex = this.uer_sex
            var create = this.uer_create
            var emailAddress = this.uer_emailAddress
            var td = '<td class="id">' + ((currPage-1)*5+i+1) + '</td>' + '<td class="headImg"><img src="' + headImg + '" width="70" height="70"></td>' +
                '<td class="name">' + name + '</td>' + '<td class="act">' + act + '</td>' +
                '<td class="type">黑怕VIP</td>' + '<td class="sex">' + sex + '</td>' +
                '<td class="create">' + create + '</td>' + '<td class="emailAddress">' + emailAddress + '</td>' +
                '<td class="text-center">' +
                ' <button type="button" class="btn bg-olive btn-xs">查看</button>' +
                ' <button type="button" class="btn bg-olive btn-xs del">删除</button>' +
                ' <button type="button" class="btn bg-olive btn-xs ban">禁用</button>' +
                '</td>'
            $("#tbody").append('<tr>' + td + '</tr>')
        })
    };

    function btDel(obj, currPage) {
        $(obj).click(function () {
            var uer_act = $(this).parent().siblings(".act").text()
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
                '亲！您正在删除该用户<br>请确认无误再点击确认哦。否则将会造成不利的影响。</div>',
                yes: function () {
                    $.ajax({
                        type: 'post',
                        url: '<%=path%>/admin/deleteUser',
                        data: {
                            uer_act: uer_act,
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
