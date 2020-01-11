<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/28
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>添加歌单</title>
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
</head>
<body>
<div id="addSongList" style="padding: 0 10%">
    <div id="title">
        <h3>添加歌单</h3>
    </div>
    <form id="addSongList-form" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">歌单名</label>
            <div class="layui-input-block">
                <input type="text" name="sl_name" lay-verify="title" autocomplete="off" placeholder="请输入歌单名"
                       class="layui-input txt">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">歌单标题</label>
            <div class="layui-input-block">
                <input type="text" name="sl_title" lay-verify="required" placeholder="请输入歌单标题"
                       autocomplete="off" class="layui-input txt">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">歌单描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea txt" name="sl_detail"></textarea>
            </div>
        </div>
        <div class="layui-upload" id="uploadImg">
            <button type="button" class="layui-btn" id="test1">封面图片</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1">
            </div>
        </div>
    </form>
    <div class="layui-form-item" id="bt">
        <div class="layui-input-block">
            <button type="button" class="layui-btn layui-btn-primary btC" id="btAdd" lay-filter="demo1">立即添加</button>
            <button type="reset" class="layui-btn layui-btn-primary btC" id="btReset">重置</button>
        </div>
    </div>
</div>
<script src="<%=path%>/js/jquery-3.3.1.js"></script>
<script src="<%=path%>/js/jquery.cookie.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    $("#btAdd").click(function () {
        $.ajax({
            async:false,
            type: 'post',
            url: '<%=path%>/adminSongList/addSongList',
            data: $("#addSongList-form").serialize(),
            dataType: 'json',
            success: function (data) {
                if (data.stateAddSongList.trim() === "1") {
                    layer.msg('<span style="font-size:17px;">添加成功</span>', {
                        offset: '150px',
                        anim: 6,
                        time: 1200,
                    });
                    $.get("include/admAddSongList.jsp", function (data) {
                        $(".content-wrapper").html(data)
                    })
                }
            }
        })
    });
    //重置
    $("#btReset").click(function () {
        $("#addSongList-form .txt").val("")
        $("#demo1").attr("src","")
    })
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: '<%=path%>/adminSongList/addSongListImg'
            , auto: false //选择文件后不自动上传
            , bindAction: '#btAdd'
            , choose: function (obj) {
                //将每次选择的文件追加到文件队列
                var files = obj.pushFile();
                layer.load()
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                    layer.closeAll('loading'); //关闭loading
                });

            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
            }
        })
    });
</script>
</body>
</html>
