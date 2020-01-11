<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/11/19
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="<%=path%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=path%>/layui/css/layui.css">
    <link rel="stylesheet" href="<%=path%>/css/style.css">
    <script src="<%=path%>/js/jquery-3.3.1.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <style>
        .layui-layer-demo {
            width: 350px;
            height: 214px;
            font-size: 17px;
            /*text-align: center;*/
        }

        #tipFont {
            margin: 0 20px;
            /*margin-right: 10px;*/
        }
        #signin-yes{
            margin-left: 8px;
        }
        #continueDay {
            font-size: 25px;
            color: rgb(190, 50, 50);
        }

        #laybt {
            color: white;
            font-weight: bold;
            font-size: 15px;
            background-color: rgb(190, 50, 50);
            padding: 10px 55px;
            border: none;
            margin-left: 30%;
            border-radius: 25px;
        }
        #mheadCir {
            position: absolute;
            top: 16px;
            left: 7px;
        }

        #mheadCir img {
            margin-top: -4px;
            margin-left: 64px;
            width: 32px;
            height: 18px;
        }
        #mcir-box>img {
            width: 40px;
            height: 40px;
            margin-top: 0px;
            margin-left: 80px;
            background-size: cover;
            border-radius: 50%;
            background-clip: padding-box;
            background-repeat: no-repeat;
            -webkit-border-radius: 100px;
            -moz-border-radius: 100px;
            border: 2px solid red;
        }
        #mcir-box>#muserAct{
            color: rgb(70,70,70);
            font-size: 17px;
            padding: 20px 30px 20px 15px;
        }
        #mcir-box>div>.img2{
            width: 40px;
            height: 16px;
            margin-top: 17px;
            margin-left: 160px;
        }


    </style>
</head>
<body>
<a href="<%=path%>/download/fileDownload/?sg_address=http://localhost:774/music/sl1/Jony%20J%20-%20Big%C2%A0Things%C2%A0Start%C2%A0Small.mp3" id="bt1" >点击</a>
<button id="btn">点击</button>
<script src="<%=path%>/layer/layer.js"></script>
<script>
    setTimeout(function () {
        alert(55)
        setTimeout(function () {
            alert(66)
        },2000)
    },2000)
    $("#btn").click(function () {

        var path="http://localhost:774/music/sl1/Jony%20J%20-%20Big%C2%A0Things%C2%A0Start%C2%A0Small.mp3"
        download(path)
    })
    function download(sg_address) {
        $.ajax({
            type: 'post',
            url: '<%=path%>/download/fileDownload',
            data: {
                sg_address: sg_address
            },
            dataType: 'json',
            success: function (data) {
                layer.msg('<span style="font-size:17px">恭喜您！验证成功，请在浏览器中查看下载内容</span>', {
                    offset: '150px',
                    anim: 6,
                    time: 1200,
                });
            }
        })
    }
    var date=1574524800
    var da=new Date()
    da.setTime(1574524800000)
    //会员用户提示
    <%--layer.open({--%>
        <%--type: 1,--%>
        <%--title: false,--%>
        <%--offset: '200px',--%>
        <%--skin: 'layui-layer-demo', //样式类名--%>
        <%--closeBtn: 0, //不显示关闭按钮--%>
        <%--anim: 2,--%>
        <%--content: '<br>'+code +'<br><div id="tipFont">尊敬的会员用户，欢迎来到Qiaole黑怕。' +--%>
        <%--'<img id="signin-yes" src="<%=path%>/images/main/signin-yes.png"> &nbsp;签到成功，您已连续登录<span id="continueDay"> 2 </span>天！</div><br><button id="laybt">确定</button>'--%>
    <%--})--%>
</script>
</body>
</html>
