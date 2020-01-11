<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/16
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>添加歌曲</title>
</head>
<body>
<div id="addSong" style="padding: 0 10%">
    <div id="title">
        <h3>添加歌曲</h3>
    </div>
    <form id="addSong-form" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">歌曲名称</label>
            <div class="layui-input-block">
                <input type="text" name="sg_name" lay-verify="title" autocomplete="off" placeholder="请输入歌曲名"
                       class="layui-input txt" id="sg_name">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">歌手姓名</label>
            <div class="layui-input-block">
                <select name="sg_author" lay-filter="aihao" id="sg_author" lay-search>
                    <option value="">请选择歌手</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">歌曲时长</label>
            <div class="layui-input-inline">
                <input type="text" name="sg_time" lay-verify="required" id="sg_time" placeholder="请输入歌曲时长"
                       autocomplete="off" class="layui-input txt">
            </div>
            <label class="layui-form-label">是否热门</label>
            <div class="layui-input-inline">
                <select name="sg_hot" lay-filter="aihao" id="sg_hot">
                    <option value="">请选择</option>
                    <option value="yes">yes</option>
                    <option value="no">no</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属专辑</label>
            <div class="layui-input-inline">
                <input type="text" name="szj_id" lay-verify="required" id="szj_id" placeholder="请输入所属专辑"
                       autocomplete="off" class="layui-input txt">
            </div>
            <label class="layui-form-label">语种类型</label>
            <div class="layui-input-inline">
                <select name="sg_language" lay-filter="aihao" id="sg_language">
                    <option value="">请选择</option>
                    <option value="华语">华语</option>
                    <option value="欧美">欧美</option>
                    <option value="韩语">韩语</option>
                    <option value="日语">日语</option>
                </select>
            </div>
        </div>
        <div class="layui-upload">
            <button type="button" class="layui-btn layui-btn-normal" id="testList">选择歌曲封面和文件</button>
            <div class="layui-upload-list">
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>文件名</th>
                        <th>大小</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="demoList"></tbody>
                </table>
            </div>
            <audio id="audioMusic" style="display: none"></audio>
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
            $("#sg_author").append('<option value="' + n.name + '">' + n.name + '</option>')
            renderForm()
        })
    })
    //立即添加
    $("#btAdd").click(function () {
        var sg_name = $("#sg_name").val();
        var sg_author = $("#sg_author").val();
        var sg_time = $("#sg_time").val()
        var sg_hot = $("#sg_hot").val()
        var szj_id = $("#szj_id").val()
        var sg_language = $("#sg_language").val()
        var uploadFile=$("#demoList").html();
        if (sg_name === "") {
            // alert($("#songListName").attr("value"))
            layer.msg('<span style="font-size:17px;">请输入歌曲名称</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (sg_author === "") {
            layer.msg('<span style="font-size:17px;">请输入歌手姓名</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (sg_time === "") {
            layer.msg('<span style="font-size:17px;">请输入歌曲时长</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (sg_hot === "") {
            layer.msg('<span style="font-size:17px;">请输入歌曲热门</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (szj_id === "") {
            layer.msg('<span style="font-size:17px;">请输入歌曲所属专辑</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if (sg_language === "") {
            layer.msg('<span style="font-size:17px;">请输入歌曲语种类型</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else if(uploadFile===""){
            layer.msg('<span style="font-size:17px;">请选择歌曲封面和文件</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
            });
        } else {
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/adminSongInfo/addSongInfo',
                data: $("#addSong-form").serialize(),
                dataType: 'json',
                success: function (data) {
                    if (data.stateAddSong.trim() === "1") {
                        layer.load()
                        setTimeout(function () {
                            layer.closeAll('loading')
                            layer.msg('<span style="font-size:17px;">添加成功</span>', {
                                offset: '150px',
                                anim: 6,
                                time: 1200,
                            });
                            $("#addSong-form .txt").val("")
                            $("#demo1").prop("src", "")
                        }, 1200)
                    }
                }
            })
        }
    });
    //重置
    $("#btReset").click(function () {
        $("#addSong-form .txt").val("")
    })
    //上传文件
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;
        //多文件列表示例
        var demoListView = $('#demoList')
            , uploadListIns = upload.render({
            elem: '#testList'
            , url: '<%=path%>/adminSongInfo/addSongInfoFile'
            , accept: 'file'
            , multiple: true
            , number: 2
            , auto: false
            , bindAction: '#btAdd'
            , choose: function (obj) {
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                //读取本地文件
                obj.preview(function (index, file, result) {
                    var tr = $(['<tr id="upload-' + index + '">'
                        , '<td>' + file.name + '</td>'
                        , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                        , '<td>等待上传</td>'
                        , '<td>'
                        , '<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                        , '<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                        , '</td>'
                        , '</tr>'].join(''));

                    //单个重传
                    tr.find('.demo-reload').on('click', function () {
                        obj.upload(index, file);
                    });

                    //删除
                    tr.find('.demo-delete').on('click', function () {
                        delete files[index]; //删除对应的文件
                        tr.remove();
                        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                    });
                    demoListView.append(tr);
                    var filename=file.name
                    if(filename.search(".mp3")!=-1){
                        var index=filename.indexOf("-")
                        var endIndex=filename.indexOf(".mp3")
                        filename=filename.substring(index+2,endIndex)
                        $("#sg_name").val(filename);
                    }
                });
            }
            , done: function (res, index, upload) {
                if (res.stateAddSongInfoFile.trim() == '1') { //上传成功
                    var tr = demoListView.find('tr#upload-' + index)
                        , tds = tr.children();
                    tds.eq(2).html('<span style="color: blue;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
                this.error(index, upload);
            }
            , error: function (index, upload) {
                var tr = demoListView.find('tr#upload-' + index)
                    , tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
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
