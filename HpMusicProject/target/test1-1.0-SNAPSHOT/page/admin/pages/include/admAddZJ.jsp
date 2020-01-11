<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/17
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>添加专辑</title>
</head>
<body>
<div id="addZJ" style="padding: 0 10%">
    <div id="title">
        <h3>添加专辑信息</h3>
    </div>
    <form id="addZJ-form" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">专辑标题</label>
            <div class="layui-input-block">
                <input type="text" name="szj_title" lay-verify="required" placeholder="请输入专辑标题"
                       id="szj_title" autocomplete="off" class="layui-input txt">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">发布时间</label>
            <div class="layui-input-block">
                <input type="text" name="szj_releaseTime" lay-verify="required" placeholder="请输入发布时间"
                       id="szj_releaseTime" autocomplete="off" class="layui-input txt">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属歌手</label>
            <div class="layui-input-inline">
                <select name="szj_author" lay-filter="aihao" id="szj_author" lay-search>
                    <option value="">请选择歌手</option>
                </select>
            </div>
            <label class="layui-form-label">所属语言</label>
            <div class="layui-input-inline">
                <select name="szj_language" lay-filter="aihao" id="szj_language">
                    <option value="">请选择</option>
                    <option value="华语">华语</option>
                    <option value="欧美">欧美</option>
                    <option value="韩国">韩国</option>
                    <option value="日本">日本</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">专辑描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea txt" name="szj_detail" id="szj_detail"></textarea>
            </div>
        </div>
        <div class="layui-upload" id="uploadImg">
            <button type="button" class="layui-btn" id="test1">专辑封面</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1">
            </div>
        </div>
    </form>
    <div class="layui-form-item" id="bt">
        <div class="layui-input-block">
            <button type="button" class="layui-btn layui-btn-primary btC" id="btAdd" lay-filter="demo1">立即添加</button>
            <button type="button" class="layui-btn layui-btn-primary btC" id="btReset">重置</button>
        </div>
    </div>
</div>
<script src="<%=path%>/js/jquery-3.3.1.js"></script>
<script src="<%=path%>/js/jquery.cookie.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script>
    //循环添加歌手名
    $.getJSON("<%=path%>/js/Singer.json", function (data) {
        $(data).each(function (i, n) {
            $("#szj_author").append('<option value="' + n.name + '">' + n.name + '</option>')
            renderForm()
        })
    })
    //立即添加
    $("#btAdd").click(function () {
        var szj_title = $("#szj_title").val();
        var szj_releaseTime = $("#szj_releaseTime").val();
        var szj_author = $("#szj_author").val()
        var szj_language = $("#szj_language").val()
        var szj_detail = $("#szj_detail").val()
        var uploadImg = $("#demo1").attr("src");
        if (szj_title === "") {
            // alert($("#songListName").attr("value"))
            layer.msg('<span style="font-size:17px;">请输入专辑标题</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (szj_releaseTime === "") {
            layer.msg('<span style="font-size:17px;">请输入专辑发布时间</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (szj_author === "") {
            layer.msg('<span style="font-size:17px;">请输入所属歌手</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (szj_language === "") {
            layer.msg('<span style="font-size:17px;">请输入所属语言</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (szj_detail === "") {
            layer.msg('<span style="font-size:17px;">请输入专辑描述</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (typeof(uploadImg) == "undefined") {
            layer.msg('<span style="font-size:17px;">请添加专辑封面图</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else {
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/adminSongZJ/addSongZJ',
                data: $("#addZJ-form").serialize(),
                dataType: 'json',
                success: function (data) {
                    if (data.stateAddSongZJ.trim() === "1") {
                        layer.load()
                        setTimeout(function () {
                            layer.closeAll('loading')
                            layer.msg('<span style="font-size:17px;">添加成功</span>', {
                                offset: '150px',
                                anim: 6,
                                time: 1200,
                            });
                            $("#addZJ-form .txt").val("")
                            $("#demo1").prop("src", "")
                            renderForm()
                        }, 1200)
                    }
                }
            })
        }
    });
    //重置
    $("#btReset").click(function () {
        $("#addZJ-form .txt").val("")
        $("#demo1").prop("src", "")
        $("#szj_author>option:first-child").prop("selected", true)
        $("#szj_language>option:first-child").prop("selected", true)
        renderForm()
    })
    //上传文件
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: '<%=path%>/adminSongZJ/addSongZJImg'
            , auto: false //选择文件后不自动上传
            , bindAction: '#btAdd'
            , choose: function (obj) {
                parent.layer.load()
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                    parent.layer.closeAll('loading'); //关闭loading
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
