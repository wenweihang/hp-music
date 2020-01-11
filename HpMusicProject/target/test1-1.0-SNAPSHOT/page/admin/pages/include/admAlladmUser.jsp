<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2020/1/4
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>管理员账号</title>
</head>
<body>
<!-- 内容头部 -->
<section class="content-header">
    <h1>
        管理员用户管理
        <small>管理员用户列表</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-user"></i>管理员用户管理</a></li>
        <li class="active">管理员用户列表</li>
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
                        <th width="70">管理员头像</th>
                        <th width="150">管理员昵称</th>
                        <th width="150">管理员帐号</th>
                        <th width="150">管理员密码</th>
                        <th class="text-center" width=150">操作</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    <c:forEach items="${adminUserList}" var="adminUser">
                        <tr>
                            <td class="id">${adminUser.admuer_id}</td>
                            <td class="headImg"><img src="${adminUser.admuer_headImg}"></td>
                            <td class="name">${adminUser.admuer_name}</td>
                            <td class="act">${adminUser.admuer_act}</td>
                            <td class="pwd">${adminUser.admuer_pwd}</td>
                            <td class="pwd text-center">
                                <button type="button" class="btn bg-olive btn-xs del">删除</button>
                                <button type="button" class="btn bg-olive btn-xs ban">禁用</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!--数据列表/-->
            </div>
            <!-- 数据表格 /-->
        </div>
        <!-- /.box-body -->
    </div>
</section>
<!-- 正文区域 /-->
<script src="<%=path%>/js/jquery-3.3.1.js"></script>
<script src="<%=path%>/js/jquery.cookie.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    //删除管理员用户
    btDel()

    function btDel() {
        $(".del").click(function () {
            var admuer_act = $(this).parent().siblings(".act").text()
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
                '亲！您正在删除该管理员用户<br>请确认无误再点击确认哦。否则将会造成不利的影响。</div>',
                yes: function () {
                    $.ajax({
                        type: 'post',
                        url: '<%=path%>/admin/deleteAdmUser',
                        data: {
                            admuer_act: admuer_act,
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
