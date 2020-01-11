<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/css/video-js.min.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">
    <script src="<%=path%>/js/jquery-3.3.1.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <script src="<%=path%>/layer/layer.js"></script>
    <script src="<%=path%>/js/video.min.js"></script>
</head>
<style>
    /*layer skin*/
    body .myStyle {
        background-color: rgba(0, 0, 0, 0.5);
        color: white;
        border: none;
    }
</style>
<body>
<div id="login-left-content">
    <video id="my-video" class="video-js" autoplay="true" loop="true"
           style="height: 100%;width: 212px;object-fit:fill"
           poster="MY_VIDEO_POSTER.jpg" data-setup="{}">
        <source src="<%=path%>/images/mv/mv1.mp4" type="video/mp4">
    </video>
</div>

<div id="login-right-content">
    <!--Qiaole图标-->
    <div id="headIcon" align="center">
        <img src="<%=path%>/images/main/logUser.png" width="56" height="56">
    </div>
    <hr>

    <!--帐号-->
    <div class="form-group row login-text">
        <div class="col-md-5">
            <label for="loginAct" class="col-form-label"><strong>帐号</strong></label>
        </div>

        <div class="col-md-7">
            <input type="text" class="form-control log-text" id="loginAct" name="uer_act" placeholder="请输入账号">
        </div>
    </div>
    <!--密码-->
    <div class="form-group row login-text">
        <div class="col-md-5">
            <label for="loginPwd" class="col-form-label "><strong>密码</strong></label>
        </div>
        <div class="input-group col-md-7">
            <input type="password" class="form-control log-text" id="loginPwd" name="uer_pwd"
                   placeholder="请输入密码">
            <div id="forgetPwd" class="input-group-prepend">
                <div class="input-group-text">
                    <div class="">
                        <a href="<%=path%>/page/user/myset/changePwd.jsp" target="_blank">忘记密码</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--验证码-->
    <div class="form-group row login-text">
        <div class="col-md-5">
            <label for="verificationCode" class="col-form-label"><strong>验证码</strong></label>
        </div>
        <div class="input-group col-md-7">
            <input type="text" class="form-control log-text" id="verificationCode"
                   placeholder="请输入右侧的验证码">
            <div id="verifCode" class="input-group-prepend">
                <a class="changeCode" href="#">
                    <img src="<%=path%>/user/CheckCode" style="height:38px">
                </a>
            </div>
        </div>
    </div>
    <!--登录按钮-->
    <div class="form-group row">
        <div class="col-md ">
            <button type="button" id="bt-login" class="btn btn-primary"><strong>登录</strong></button>
        </div>
    </div>
    <!--没有账号,立即注册-->
    <div id="reRegister" align="center">
        <p>
            <span>没有账号?</span>
            <a href="<%=path%>/page/user/register.jsp">立即注册</a>
        </p>
    </div>
</div>

<div id="log-icon2">
    <img src="<%=path%>/images/main/icon2.png">
</div>

<script src="<%=path%>/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {

        // 登录
        $("#bt-login").click(function () {
            login()
        })
        $("#loginAct").keydown(function (e) {
            keyCod(e)
        })
        $("#loginPwd").keydown(function (e) {
            keyCod(e)
        })
        $("#verificationCode").keydown(function (e) {
            keyCod(e)
        })

        //切换验证码
        $(".changeCode").click(function () {
            $(".changeCode img").attr("src", "<%=path%>/user/CheckCode?" + new Date().getTime())
        })
    })

    //js
    function keyCod(e) {
        var e = e.keyCode
        switch (e) {
            case 13:
                login()
                break
            case 108:
                login()
                break
            default:
                break
        }
    }

    function login() {
        var url = location.search
        var index = url.indexOf("=")
        var navA = url.substring(index + 1)
        var uer_act = $('#loginAct').val();
        var uer_pwd = $('#loginPwd').val();
        var verifContent = $("#verificationCode").val();
        var index = parent.layer.getFrameIndex(window.name);
        if (uer_act === '' || uer_pwd === '') {
            layer.msg('<span style="font-size:17px">帐号或密码为空,请重新输入</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
                skin: 'myStyle'
            });
        } else if (verifContent === '') {
            layer.msg('<span style="font-size:17px;margin-left: 18px;">请输入验证码</span>', {
                offset: '150px',
                anim: 6,
                time: 1200,
                skin: 'myStyle'
            });
        } else {
            $.ajax({
                type: 'post',
                url: '<%=path%>/user/loginUser',
                data: {
                    uer_act: uer_act,
                    uer_pwd: uer_pwd,
                    verifContent: verifContent
                },
                dataType: 'json',
                success: function (data) {
                    if (data.stateCode.trim() === "null") {
                        layer.msg('<span style="font-size:17px">账号不存在,请点击注册</span>', {
                            icon: 9,
                            offset: '150px',
                            anim: 6,
                            time: 0,
                            btn: ['注册', '关闭'],
                            success: function (layero) {
                                var btn = layero.find('.layui-layer-btn');
                                btn.find('.layui-layer-btn0').attr({
                                    href: 'register.jsp'
                                });
                            }
                        });
                    }
                    if (data.stateCode.trim() === "0") {
                        layer.msg('<span style="font-size:17px">账号或密码错误,请重新输入</span>', {
                            offset: '150px',
                            anim: 6,
                            time: 1200,
                            skin: 'myStyle'
                        });
                    }
                    if (data.stateCode.trim() === "1") {
                        layer.load();
                        setTimeout(function () {
                            layer.closeAll('loading');
                            parent.layer.close(index);
                            $.get(navA + ".jsp", function (data) {
                                parent.$(".content").html(data)
                            })
                            $.get("navLogin.jsp", function (data) {
                                parent.$("#navLogin").html(data)
                            })
                            if (parent.$(".content").find("title").text() == 'myMusic') {
                                $.get("<%=path%>/page/user/myMusic.jsp", function (data) {
                                    parent.$(".content").html(data)
                                })
                            }
                            if (parent.$(".content").find("title").text() == '歌单歌单列表') {
                                parent.$(".content").find("#table-songs").empty()
                                parent.layer.load()
                                var sl_name = parent.$(".content").find("#slName").text()
                                $.ajax({
                                    async:false,
                                    type: 'post',
                                    url: '<%=path%>/songInfo/getSongs',
                                    data: {
                                        sg_songList: sl_name,
                                    },
                                    dataType: 'json',
                                    success: function (data) {
                                        parent.layer.closeAll('loading');
                                        parent.$("#table-songs").load("<%=path%>/page/music/slTableSongs.jsp",function () {})
                                    }
                                })
                            }
                            if (parent.$(".content").find("#tit").text() == '搜索') {
                                parent.$(".content").find("#search-content").empty()
                                parent.layer.load()
                                var text= parent.$(".content").find("#search-box").val()
                                $.ajax({
                                    async:false,
                                    type: 'post',
                                    url: '<%=path%>/songInfo/getSongInfoByText',
                                    data: {
                                        text: text,
                                    },
                                    dataType: 'json',
                                    success: function (data) {
                                        parent.layer.closeAll('loading');
                                        if(data.stateGetSearchSongs.trim()==='1'){
                                            parent.$("#search-content").load("<%=path%>/page/search/searchSongs.jsp",function () {})
                                        }
                                    }
                                })
                            }
                        }, 1200);

                    }
                    if (data.stateCode.trim() === "codeError") {
                        layer.msg('<span style="font-size:17px">验证码错误,请重新输入</span>', {
                            offset: '150px',
                            anim: 6,
                            time: 1200,
                            skin: 'myStyle'
                        });
                    }
                    if (data.stateCode.trim() === "404") {
                        parent.location.href = "<%=path%>/page/error/serviceError.jsp"
                    }
                }
            })
            //alert("AJAX结束了")
        }
    }
</script>
</body>
</html>
