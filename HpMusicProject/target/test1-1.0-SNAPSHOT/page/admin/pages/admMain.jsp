<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/24
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <title>后台管理系统首页</title>
    <%--<meta http-equiv="refresh" content="10" />--%>
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="../plugins/morris/morris.css">
    <link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="../plugins/select2/select2.css">
    <link rel="stylesheet" href="../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="../plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/css/admstyle.css">

</head>
<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">
    <!-- 页面头部 -->
    <header class="main-header">
        <!-- Logo -->
        <a href="admMain.jsp" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->

            <span class="logo-mini" style="font-family: 超世纪粗角报">黑怕</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg">
                <img src="<%=path%>/images/main/icon-white.png" width="36" height="40">
                <span class="english-font">Qiaole</span><span style="font-family: 超世纪粗角报">黑怕</span>
            </span>
        </a>


        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu myNav">
                <ul class="nav navbar-nav">
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu myUser">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="${logAdminUser.admuer_headImg}" class="user-image">
                            <span class="hidden-xs userName">${logAdminUser.admuer_name}</span>
                        </a>
                        <ul class="dropdown-menu myUser-dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="${logAdminUser.admuer_headImg}" class="img-circle" alt="User Image">
                                <p>
                                    陈家杰 - Qiaole黑怕CEO
                                    <small>最后登录 11:20AM</small>
                                </p>
                            </li>
                            <!-- Menu Body
                    <li class="user-body">
                        <div class="row">
                            <div class="col-xs-4 text-center">
                                <a href="#">Followers</a>
                            </div>
                            <div class="col-xs-4 text-center">
                                <a href="#">Sales</a>
                            </div>
                            <div class="col-xs-4 text-center">
                                <a href="#">Friends</a>
                            </div>
                        </div>
                    </li>-->
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">修改密码</a>
                                </div>
                                <div class="pull-right">
                                    <a href="<%=path%>/admin/loginAdminOut" class="btn btn-default btn-flat"
                                       id="adminOut">退出</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel ">
                <div class="pull-left image">
                    <img src="${logAdminUser.admuer_headImg}" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>${logAdminUser.admuer_name}</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>
            <!-- search form -->
            <%--<form action="#" method="get" class="sidebar-form">--%>
            <%--<div class="input-group">--%>
            <%--<input type="text" name="q" class="form-control" placeholder="搜索...">--%>
            <%--<span class="input-group-btn">--%>
            <%--<button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>--%>
            <%--</span>--%>
            <%--</div>--%>
            <%--</form>--%>
            <!-- /.search form -->


            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" id="sidebarName">
                <li id="admin-index">
                    <a id="home" href="#">
                        <i class="fa fa-home"></i>
                        <span>首页</span>
                    </a>
                </li>
                <li class="header">分类管理</li>
                <%--音乐管理--%>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-music"></i> <span>音乐管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>

                    <ul class="treeview-menu">
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-drupal"></i> <span>歌手（singer）</span>
                                <span class="pull-right-container">
                                    <i class="fa  fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li id="singerList">
                                    <a href="#">
                                        <i class="fa fa-circle-o"></i> <span>歌手列表</span>
                                        <span class="pull-right-container">
                                            <i class="fa  fa-angle-right pull-right"></i>
                                        </span>
                                    </a>
                                </li>
                                <li id="addSinger">
                                    <a href="#">
                                        <i class="fa fa-circle-o"></i> <span>添加歌手</span>
                                        <span class="pull-right-container">
                                            <i class="fa  fa-angle-right pull-right"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-drupal"></i> <span>歌曲（songs）</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li id="addSong">
                                    <a href="#">
                                        <i class="fa fa-circle-o"></i> <span>添加歌曲</span>
                                        <span class="pull-right-container">
                                            <i class="fa  fa-angle-right pull-right"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-drupal"></i> <span>歌单（songList）</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li id="songList">
                                    <a href="#">
                                        <i class="fa fa-circle-o"></i> <span>歌单列表</span>
                                        <span class="pull-right-container">
                                            <i class="fa  fa-angle-right pull-right"></i>
                                        </span>
                                    </a>
                                </li>
                                <li id="addSongList">
                                    <a href="#">
                                        <i class="fa fa-circle-o"></i> <span>添加歌单</span>
                                        <span class="pull-right-container">
                                            <i class="fa  fa-angle-right pull-right"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-drupal"></i> <span>榜单（topList）</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li id="songTop">
                                    <a href="#">
                                        <i class="fa fa-circle-o"></i> <span>歌曲榜单列表(songtop)</span>
                                        <span class="pull-right-container">
                                            <i class="fa  fa-angle-right pull-right"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-drupal"></i> <span>专辑（zj）</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li id="zjList">
                                    <a href="#">
                                        <i class="fa fa-circle-o"></i> <span>专辑列表</span>
                                        <span class="pull-right-container">
                                            <i class="fa  fa-angle-right pull-right"></i>
                                        </span>
                                    </a>
                                </li>
                                <li id="addZJ">
                                    <a href="#">
                                        <i class="fa fa-circle-o"></i> <span>添加专辑</span>
                                        <span class="pull-right-container">
                                            <i class="fa  fa-angle-right pull-right"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <%--用户管理--%>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-user"></i> <span>用户管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="userList">
                            <a href="#">
                                <i class="fa fa-circle-o"></i>用户列表（user）
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                        </li>
                        <li id="memberInfoList">
                            <a id="allUser" href="#">
                                <i class="fa fa-circle-o"></i>用户会员列表（member）
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                        </li>
                    </ul>
                </li>
                <%--用户管理--%>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-cogs"></i> <span>系统管理</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="admUserList">
                            <a href="#">
                                <i class="fa fa-circle-o"></i>管理员用户列表（admuser）
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- 菜单 /-->
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">
        <jsp:include page="include/admHome.jsp"/>
    </div>
    <!-- 内容区域 /-->
</div>


<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/raphael/raphael-min.js"></script>
<script src="../plugins/morris/morris.min.js"></script>
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../plugins/knob/jquery.knob.js"></script>
<script src="../plugins/daterangepicker/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script src="../plugins/treeTable/jquery.treetable.js"></script>
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../plugins/flot/jquery.flot.min.js"></script>
<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="<%=path%>/layui/layui.all.js"></script>
<script src="<%=path%>/layer/layer.js"></script>
<script src="<%=path%>/js/isLogin.js"></script>
<script src="<%=path%>/js/jquery.cookie.js"></script>
<script>

    //退出清除cookie
    $("#adminOut").click(function () {
        $.removeCookie("systemManage")
    })
    //用户自动落下
    $(".myUser").hover(function () {
        $(".myUser-dropdown-menu").show()
    }, function () {
        $(".myUser-dropdown-menu").hide()
    })
    //用户名变色
    $(".myUser").hover(function () {
        $(".userName").css("color", "white")
    }, function () {
        $(".userName").css("color", "")
    })
    //首页
    $("#home").click(function () {
        $(".content-wrapper").load("include/admHome.jsp", function () {

        })
    })
    //歌手列表
    $("#singerList").click(function () {
        $.get("include/admAllSingerInfo.jsp", function (data) {
            $(".content-wrapper").html(data)
        })
    })
    //添加歌手
    $("#addSinger").click(function () {
        $.get("include/admAddSingerInfo.jsp", function (data) {
            $(".content-wrapper").html(data)
        })
    })
    //添加歌曲
    $("#addSong").click(function () {
        $.get("include/admAddSong.jsp", function (data) {
            $(".content-wrapper").html(data)
        })
    })
    //歌曲榜单列表
    $("#songTop").click(function () {
        $.get("include/admAllSongTop.jsp", function (data) {
            $(".content-wrapper").html(data)
        })
    })
    //专辑列表
    $("#zjList").click(function () {
        $.get("include/admAllSongZJ.jsp", function (data) {
            $(".content-wrapper").html(data)
        })
    })
    //添加专辑
    $("#addZJ").click(function () {
        $.get("include/admAddZJ.jsp", function (data) {
            $(".content-wrapper").html(data)
        })
    })
    //用户列表
    $("#userList").click(function () {
        // isLogin()
        $.get("include/admAllUser.jsp", function (data) {
            $(".content-wrapper").html(data)
        })
    })
    //会员信息
    $("#memberInfoList").click(function () {
        $.get("include/admAllMemberInfo.jsp", function (data) {
            $(".content-wrapper").html(data)
        })
    })
    //歌单列表
    $("#songList").click(function () {
        $.get("include/admAllSongList.jsp", function (data) {
            $(".content-wrapper").html(data)
        })
    })
    //添加歌单
    $("#addSongList").click(function () {
        $.get("include/admAddSongList.jsp", function (data) {
            $(".content-wrapper").html(data)
        })
    })
    //管理员用户管理
    $("#admUserList").click(function () {
        $.get("include/admAlladmUser.jsp", function (data) {
            $(".content-wrapper").html(data)
        })
        if ($.cookie("systemManage") == null) {
            layer.prompt({
                title: '请输入相关口令，并确认',
                offset: '200px',
                formType: 1
            }, function (pass, index) {
                if (pass == '972550') {
                    $.cookie("systemManage", "systemManage")
                    layer.close(index);
                    $.ajax({
                        type: 'post',
                        url: '<%=path%>/admin/getAllAdmUser',
                        dataType: 'json',
                        success: function (data) {
                            $.get("include/admAlladmUser.jsp", function (data2) {
                                $(".content-wrapper").html(data2)
                            })
                        }
                    })
                } else {
                    layer.msg('<span style="font-size:17px;margin-left: 18px;">口令不正确</span>', {
                        offset: '240px',
                        anim: 6,
                        time: 1200,
                    });
                }
            });
        }
        if ($.cookie("systemManage") != null) {
            $.ajax({
                type: 'post',
                url: '<%=path%>/admin/getAllAdmUser',
                dataType: 'json',
                success: function (data) {
                    $.get("include/admAlladmUser.jsp", function (data2) {
                        $(".content-wrapper").html(data2)
                    })
                }
            })
        }
    })


    //----------------------------------
    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document).ready(function () {
        // 激活导航位置
        setSidebarActive("admin-index");
        // 激活导航位置
        setSidebarActive("admin-datalist");
        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
    });
    if (${empty logAdminUser}) {
        isLogin()
    }
    setInterval(function () {
        $.ajax({
            type: 'post',
            url: '<%=path%>/isLogin',
            dataType: 'json',
            success: function (data) {
                if (data.stateIsLogin.trim() === "0") {
                    isLogin()
                }
            }
        })
    }, 60 * 24 * 1000)

    //js
    function isLogin() {
        //判断是否有管理登录
        layer.open({
            type: 1,
            title: false,
            closeBtn: false,
            offset: '180px',
            area: '300px;',
            shade: 0.8,
            id: 'LAY_layuipro', //设定一个id，防止重复弹出
            resize: false,
            btn: ['登录'],
            skin: 'admTips',
            btnAlign: 'c',
            moveType: 1,//拖拽模式，0或者1
            content: '<div style="font-size:17px;padding: 20px 40px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;text-align:center">' +
            '<img src="<%=path%>/images/admin/admError.png" style="width:36px;height:34px">' + '<br><br>' +
            '您当前状态为未登录，请登录再进行操作。</div>',
            success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').attr({
                    href: 'admLogin.jsp'
                });
            }
        });
    }
</script>
</body>
</html>
