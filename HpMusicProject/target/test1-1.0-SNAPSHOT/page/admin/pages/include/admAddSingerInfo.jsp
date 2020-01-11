<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/12
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>添加歌手信息</title>
</head>
<body>
<div id="addSingerInfo" style="padding: 0 10%">
    <div id="title">
        <h3>添加歌手信息</h3>
    </div>
    <form id="addSingerInfo-form" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">歌手姓名</label>
            <div class="layui-input-block">
                <select name="sgr_name" lay-filter="aihao" id="sgr_name" lay-search>
                    <option value="">请选择歌手</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">歌手性别</label>
            <div class="layui-input-inline">
                <select name="sgr_sex" lay-filter="aihao" id="sgr_sex">
                    <option value="">请选择性别</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
            <label class="layui-form-label">歌手热门</label>
            <div class="layui-input-inline">
                <select name="sgr_hot" lay-filter="aihao" id="sgr_hot">
                    <option value="">请选择</option>
                    <option value="yes">yes</option>
                    <option value="no">no</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">首字母</label>
            <div class="layui-input-inline">
                <select name="sgr_firstLetter" lay-filter="aihao" id="sgr_firstLetter">
                    <option value="">请选择</option>
                </select>
            </div>
            <label class="layui-form-label">地区</label>
            <div class="layui-input-inline">
                <select name="sgr_region" lay-filter="aihao" id="sgr_region">
                    <option value="">请选择</option>
                    <option value="华语">华语</option>
                    <option value="欧美">欧美</option>
                    <option value="韩国">韩国</option>
                    <option value="日本">日本</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">歌手描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea txt" name="sgr_detail" id="sgr_detail"></textarea>
            </div>
        </div>
        <div class="layui-upload" id="uploadImg">
            <button type="button" class="layui-btn" id="test1">歌手封面</button>
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
    //循环添加26个字母
    var letter = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
    $(letter).each(function (i, n) {
        $("#sgr_firstLetter").append('<option value="' + n + '">' + n + '</option>')
        renderForm()
    })
    //循环添加歌手名
    $.getJSON("<%=path%>/js/Singer.json", function (data) {
        $(data).each(function (i, n) {
            $("#sgr_name").append('<option value="' + n.name + '">' + n.name + '</option>')
            renderForm()
        })
    })
    //立即添加
    $("#btAdd").click(function () {
        var sgr_name = $("#sgr_name").val();
        var sgr_sex = $("#sgr_sex").val();
        var sgr_hot = $("#sgr_hot").val()
        var sgr_firstLetter = $("#sgr_firstLetter").val()
        var sgr_region = $("#sgr_region").val()
        var sgr_detail = $("#sgr_detail").val()
        var uploadImg = $("#demo1").attr("src");
        if (sgr_name === "") {
            // alert($("#songListName").attr("value"))
            layer.msg('<span style="font-size:17px;">请输入歌手名</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (sgr_sex === "") {
            layer.msg('<span style="font-size:17px;">请输入歌手性别</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (sgr_hot === "") {
            layer.msg('<span style="font-size:17px;">请输入歌手热门</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (sgr_firstLetter === "") {
            layer.msg('<span style="font-size:17px;">请输入歌手首字母</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (sgr_region === "") {
            layer.msg('<span style="font-size:17px;">请输入歌手地区</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (sgr_detail === "") {
            layer.msg('<span style="font-size:17px;">请输入歌手描述</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if(typeof(uploadImg)=="undefined"){
            layer.msg('<span style="font-size:17px;">请添加歌手封面图</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else {
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/adminSingerInfo/addSingerInfo',
                data: $("#addSingerInfo-form").serialize(),
                dataType: 'json',
                success: function (data) {
                    if (data.stateAddSingerInfo.trim() === "1") {
                        layer.load()
                        setTimeout(function () {
                            layer.closeAll('loading')
                            layer.msg('<span style="font-size:17px;">添加成功</span>', {
                                offset: '150px',
                                anim: 6,
                                time: 1200,
                            });
                            $("#addSingerInfo-form .txt").val("")
                            $("#demo1").prop("src", "")
                            $("#sgr_name>option:first-child").prop("selected", true)
                            renderForm()
                        }, 1200)
                    }
                }
            })
        }
    });
    //重置
    $("#btReset").click(function () {
        $("#addSingerInfo-form .txt").val("")
        $("#demo1").prop("src", "")
        $("#sgr_name>option:first-child").prop("selected", true)
        $("#sgr_sex>option:first-child").prop("selected", true)
        $("#sgr_hot>option:first-child").prop("selected", true)
        renderForm()
    })
    //上传文件
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: '<%=path%>/adminSingerInfo/addSingerInfoImg'
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
