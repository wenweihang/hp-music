<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath();%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>html音乐播放器</title>
    <link rel="stylesheet" href="<%=path%>/css/APlayer.min.css">
    <script src="<%=path%>/js/APlayer.min.js"></script>
</head>
<body style="margin: 0px;padding: 0px">
<div id="botmplayer" class="aplayer-withlist aplayer-fixed aplayer-music ">

</div>

<script>
    var ap = new APlayer({
        element: document.getElementById('botmplayer'),//样式1
        narrow: false,
        autoplay: false,
        music: [

        ]
    })
    // ap.init()



</script>
</body>
</html>