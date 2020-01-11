<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/12/1
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>底部内容</title>
</head>
<body>
<div id="bomContent">
    <div class="row row1">
        <div class="col-md-4">
            <font>下载Qiaole黑怕客户端</font>
            <span>(敬请期待)</span>
        </div>
        <div class="col-md-4 "><font>关于我们</font></div>
        <div class="col-md-4 "><font>其他</font></div>
    </div>
    <div class="row row2 mt-5">
        <div class="col-md-1 icon" id="pc">
            <img class="PCIcon" src="<%=path%>/images/bomContent/bomContent-PC.png" width="30" height="30"><br>
            <div class="sp">PC版</div>
        </div>
        <div class="col-md-1 icon" id="android">
            <img class="AndroidIcon ml-2" src="<%=path%>/images/bomContent/bomContent-Android.png" width="30"
                 height="30"><br>
            <div class="sp">Android</div>
        </div>
        <div class="col-md-1 icon" id="iphone">
            <img class="IPhoneIcon ml-3" src="<%=path%>/images/bomContent/bomContent-IPhone.png" width="30" height="30"><br>
            <div class="sp">IPhone版</div>
        </div>
        <div class="col-md-1 "></div>
        <div class="col-md-1 font">
            <span>意见反馈</span><br><br>
            <span>用户协议</span>
        </div>
        <div class="col-md-1 font">
            <span>帮助中心</span><br><br>
            <span>隐私权政策</span>
        </div>
        <div class="col-md-1 font">
            <span>音乐人</span>
        </div>
        <div class="col-md-1 ">
        </div>
        <div class="col-md-1 font">
            <span>联系我们</span><br><br>
            <span>音乐人合作</span>
        </div>
        <div class="col-md-1 font">
            <span>联系客服</span><br><br>

        </div>
        <div class="col-md-1 font">
            <span>Qiaole招聘</span>
        </div>
    </div>
    <div class="row row3 mt-5 pl-4">
        <div class="col-md-3">
        </div>
        <div class="col-md pl-5 bomFont">
            <span class="ml-5">我们致力于推动网络正版音乐发展，相关版权合作请联系15160609283</span>
        </div>
    </div>
    <div class="row row4 mt-2 pl-5">
        <div class="col-md-3">
        </div>
        <div class="col-md pl-5 bomFont">
            <span >违法呵不良信息举报邮箱: 1078216013@qq.com</span>
            <span>&emsp;客服邮箱: kefu@qiaole.com </span>
        </div>
    </div>
</div>
<script>
    //悬停变色
    $("#pc").hover(function () {
        $(this).children(".PCIcon").attr("src", "<%=path%>/images/bomContent/bomContent-PC-color.png")
        <%--$(this).find(".AndroidIcon").attr("src", "<%=path%>/images/bomContent/bomContent-Android-color.png")--%>
        <%--$(this).find(".IPhoneIcon").attr("src", "<%=path%>/images/bomContent/bomContent-IPhone-color.png")--%>
        $(this).find(".sp").css("color","rgb(190,50,50)")
    },function () {
        $(this).children(".PCIcon").attr("src", "<%=path%>/images/bomContent/bomContent-PC.png")
        <%--$(this).find(".AndroidIcon").attr("src", "<%=path%>/images/bomContent/bomContent-Android.png")--%>
        <%--$(this).find(".IPhoneIcon").attr("src", "<%=path%>/images/bomContent/bomContent-IPhone.png")--%>
        $(this).find(".sp").css("color","")
    })
    $("#android").hover(function () {
        $(this).children(".AndroidIcon").attr("src", "<%=path%>/images/bomContent/bomContent-Android-color.png")
        $(this).find(".sp").css("color","rgb(190,50,50)")
    },function () {
        $(this).children(".AndroidIcon").attr("src", "<%=path%>/images/bomContent/bomContent-Android.png")
        $(this).find(".sp").css("color","")
    })
    $("#iphone").hover(function () {
        $(this).children(".IPhoneIcon").attr("src", "<%=path%>/images/bomContent/bomContent-IPhone-color.png")
        $(this).find(".sp").css("color","rgb(190,50,50)")
    },function () {
        $(this).children(".IPhoneIcon").attr("src", "<%=path%>/images/bomContent/bomContent-IPhone.png")
        $(this).find(".sp").css("color","")
    })
    $(".font>span").hover(function () {
        $(this).css("color","rgb(190,50,50)")
    }, function () {
        $(this).css("color","")
    })
</script>
</body>
</html>
