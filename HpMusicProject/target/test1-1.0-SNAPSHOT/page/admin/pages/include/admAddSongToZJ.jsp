<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/18
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>专辑添加歌曲</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/css/admstyle.css">
</head>
<body>
<div id="addSongToZJ" style="padding: 0 20% 0 10%;margin-top: 20px">
    <form class="layui-form" action="" enctype="multipart/form-data">
        <div class="layui-form-item">
            <label class="layui-form-label">专辑ID</label>
            <div class="layui-input-block">
                <input type="text" name="szj_id" lay-verify="title" autocomplete="off" id="szj_id"
                       class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">歌曲</label>
            <div class="layui-input-block">
                <select name="sg_name" lay-filter="aihao" id="sg_name" lay-search>
                    <option value="">请选择歌曲</option>
                </select>
            </div>
        </div>
    </form>
    <div class="layui-form-item" id="bt">
        <div class="layui-input-block">
            <button type="button" class="layui-btn layui-btn-primary btC" id="btAdd" lay-filter="demo1">立即添加</button>
        </div>
    </div>
</div>
<script src="<%=path%>/js/jquery-3.3.1.js"></script>
<script src="<%=path%>/js/jquery.cookie.js"></script>
<script src="<%=path%>/layui/layui.all.js"></script>
<script src="<%=path%>/layer/layer.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    //获取所有歌曲名称
    $.ajax({
        async:false,
        type:'post',
        url:'<%=path%>/adminSongZJ/getAllSongInfo',
        dataType:'json',
        success:function (data) {
            var sg_namelist=data.lists
            $(sg_namelist).each(function (i, n) {
                $("#sg_name").append('<option value="' + n+ '">' + n + '</option>')
                renderForm()
            })
        }
    })
    var url = location.search;
    var index = url.indexOf("=")
    var szj_id = url.substring(index + 1)
    //设置专辑默认值
    $("#szj_id").attr("value", szj_id)
    $("#btAdd").click(function () {
        var sg_name = $("#sg_name").val()
        if (sg_name === "") {
            layer.msg('<span style="font-size:17px;">请选择歌曲</span>', {
                offset: '50px',
                anim: 6,
                time: 1200,
            });
        } else {
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/adminSongZJ/addSongInfo',
                data: $("#addSongToZJ>form").serialize(),
                dataType: 'json',
                success: function (data) {
                    if (data.stateAddSongToZJ.trim() === "1") {
                        layer.load();
                        setTimeout(function () {
                            layer.closeAll('loading');
                            layer.msg('<span style="font-size:17px;">添加歌曲成功</span>', {
                                offset: '150px',
                                anim: 6,
                                time: 1200,
                            });
                        }, 1200)
                    }
                }
            })

        }
    })

    //重新渲染表单
    function renderForm() {
        layui.use('form', function () {
            var form = layui.form;//高版本建议把括号去掉，有的低版本，需要加()
            form.render();
        });
    }
</script>
</body>
</html>
