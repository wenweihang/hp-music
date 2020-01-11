<%--
  Created by IntelliJ IDEA.
  User: Q  Jie
  Date: 2019/10/17
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <title>歌手</title>
</head>

<body>
<div class="container-fluid">
    <div id="singer">
        <div class="row row1 mt-4">
            <div class="col-md">
                <ul class="ul-letter">
                    <li class="li-hot hot-chang-color"><a href="#">热门</a></li>
                </ul>
            </div>
        </div>
        <div class="row row2 mt-3">
            <div class="col-md">
                <ul id="ul-region">
                    <li class="li-all hot-chang-color"><a href="#">全部</a></li>
                    <li class="li-other"><a href="#">华语</a></li>
                    <li class="li-other"><a href="#">欧美</a></li>
                    <li class="li-other"><a href="#">韩国</a></li>
                    <li class="li-other"><a href="#">日本</a></li>
                </ul>
            </div>
        </div>
        <div class="row singer-content mt-5 mb-5">

        </div>
        <%--id用来清除分页--%>
        <div class="row row3" id="singer-paging">
            <div class="col-md">
                <nav aria-label="Page navigation example" class="text-center">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link prev-next" id="Previous" aria-label="Previous" href="#">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <%--<li class="page-item"><a class="page-link aShow">1</a></li>--%>
                        <li class="page-item" id="forward">
                            <a class="page-link prev-next" id="Next" aria-label="Next" href="#">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<script>
    //循环添加26个字母
    var letter = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
    $(letter).each(function (i, n) {
        $(".ul-letter").append('<li class="li-letter"><a href="#">' + n + '</a></li>')
    })
    //初始化数据,获取前面36位歌手的信息
    var currPage = 1
    var singerInfo, sumPage, sumCount
    $.ajax({
        async: false,
        type: 'post',
        url: '<%=path%>/singerInfo/getSingerInfoPage',
        data: {
            currPage: currPage
        },
        dataType: 'json',
        success: function (data) {
            success(data)
        }
    })
    //获取2~end的分页页面
    getSingerInfoPage("getSingerInfoPage","","")
    //图片点击跳转
    imgClick()
    //热门搜索点击切换
    $(".li-hot>a").click(function () {
        currPage=1
        //变色
        $(this).parent().addClass("hot-chang-color")
        $(this).parent().css("background-color", "rgb(190,50,50)")
        $(this).parent().siblings().removeAttr("sel")
        $(this).css("color", "white")
        $(".li-letter").removeClass("letter-chang-color")
        $(".li-letter>a").css("color", "")
        var sgr_region = $(".li-other[sel='sel']").text()
        //先判断地区是否为全部选项
        if ($(".li-all").css("background-color") == "rgb(190, 50, 50)") {
            //当前为全部选项,所以只需要直接获取热门的歌手
            //初始化数据,获取前面36位歌手的信息
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/singerInfo/getSingerInfoPage',
                data: {
                    currPage: currPage
                },
                dataType: 'json',
                success: function (data) {
                    success(data)
                }
            })
            getSingerInfoPage("getSingerInfoPage","","")
        }
        if ($(".li-all").css("background-color") != "rgb(190, 50, 50)") {
            //华语,欧美,韩国,日本其中一个
            //初始化数据,获取上面选中的地区前面36位歌手的信息
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/singerInfo/getSingerInfoPageByRG',
                data: {
                    currPage: currPage,
                    sgr_region: sgr_region
                },
                dataType: 'json',
                success: function (data) {
                    success(data)
                }
            })
            getSingerInfoPage("getSingerInfoPageByRG","",sgr_region)
        }
        //图片点击跳转
        imgClick()
    })
    //字母搜索点击切换
    $(".li-letter>a").click(function () {
        currPage=1
        //变色
        $(".li-hot").find("a").css("color", "black")
        $(".li-hot").css("background-color", "white")
        $(this).parent().attr("sel", "sel")
        $(this).parent().siblings().removeAttr("sel")
        $(this).parent().addClass("letter-chang-color")
        $(this).parent().siblings().removeClass("letter-chang-color")
        $(this).parent().siblings(".li-letter").find("a").css("color", "")
        $(this).css("color", "white")
        var sgr_firstLetter = $(this).text()
        var sgr_region = $(".li-other[sel='sel']").text()
        //先判断地区是否为全部选项
        if ($(".li-all").css("background-color") == "rgb(190, 50, 50)") {
            //当前为全部选项,所以只需要传入首字母搜索
            //初始化数据,获取上面选中的首字母前面36位歌手的信息
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/singerInfo/getSingerInfoPageByFL',
                data: {
                    currPage: currPage,
                    sgr_firstLetter: sgr_firstLetter
                },
                dataType: 'json',
                success: function (data) {
                    success(data)
                }
            })
            getSingerInfoPage("getSingerInfoPageByFL",sgr_firstLetter,"")
        }
        if ($(".li-all").css("background-color") != "rgb(190, 50, 50)") {
            //按首字母和地区搜索
            //初始化数据,获取上面选中的首字母和地区前面36位歌手的信息
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/singerInfo/getSingerInfoPageByFLANDRG',
                data: {
                    currPage: currPage,
                    sgr_firstLetter: sgr_firstLetter,
                    sgr_region: sgr_region
                },
                dataType: 'json',
                success: function (data) {
                    success(data)
                }
            })
            getSingerInfoPage("getSingerInfoPageByFLANDRG",sgr_firstLetter,sgr_region)
        }
        //图片点击跳转
        imgClick()
    })
    //全部搜索点击切换
    $(".li-all>a").click(function () {
        currPage=1
        $(this).parent().css("background-color", "rgb(190,50,50)")
        $(this).css("color", "white")
        $(this).parent().siblings().removeAttr("sel")
        $(".li-other").removeClass("hot-chang-color")
        $(this).parent().siblings(".li-other").find("a").css("font-weight", "")
        $(".li-other>a").css("color", "")
        var sgr_firstLetter = $(".li-letter[sel='sel']").text()
        if ($(".li-hot").css("background-color") == "rgb(190, 50, 50)") {
            //当前为热门选项,所以只需要按全部搜索
            //初始化数据,获取前面36位歌手的信息
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/singerInfo/getSingerInfoPage',
                data: {
                    currPage: currPage,
                },
                dataType: 'json',
                success: function (data) {
                    success(data)
                }
            })
            getSingerInfoPage("getSingerInfoPage","","")
        }
        if ($(".li-hot").css("background-color") != "rgb(190, 50, 50)") {
            //按首字母搜索即可
            //初始化数据,获取上面选中的首字母前面36位歌手的信息
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/singerInfo/getSingerInfoPageByFL',
                data: {
                    currPage: currPage,
                    sgr_firstLetter: sgr_firstLetter
                },
                dataType: 'json',
                success: function (data) {
                    success(data)
                }
            })
            getSingerInfoPage("getSingerInfoPageByFL",sgr_firstLetter,"")
        }
        //图片点击跳转
        imgClick()
    })
    //地区搜索点击切换
    $(".li-other>a").click(function () {
        currPage=1
        $(".li-all").find("a").css("color", "black")
        $(".li-all").css("background-color", "white")
        $(this).parent().addClass("hot-chang-color")
        $(this).parent().attr("sel", "sel")
        $(this).parent().siblings().removeAttr("sel")
        $(this).parent().siblings(".li-other").removeClass("hot-chang-color")
        $(this).parent().siblings(".li-other").find("a").css("color", "")
        $(this).parent().siblings(".li-other").find("a").css("font-weight", "")
        $(this).css({"color":"white","font-weight":"bold"})
        var sgr_firstLetter = $(".li-letter[sel='sel']").text()
        var sgr_region = $(this).text()
        if ($(".li-hot").css("background-color") == "rgb(190, 50, 50)") {
            //当前为热门选项,所以只需要按地区搜索
            //初始化数据,获取上面选中的地区前面36位歌手的信息
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/singerInfo/getSingerInfoPageByRG',
                data: {
                    currPage: currPage,
                    sgr_region: sgr_region
                },
                dataType: 'json',
                success: function (data) {
                    success(data)
                }
            })
            getSingerInfoPage("getSingerInfoPageByRG","",sgr_region)
        }
        if ($(".li-hot").css("background-color") != "rgb(190, 50, 50)") {
            //按首字母和地区搜索
            //初始化数据,获取上面选中的首字母和地区前面36位歌手的信息
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/singerInfo/getSingerInfoPageByFLANDRG',
                data: {
                    currPage: currPage,
                    sgr_firstLetter: sgr_firstLetter,
                    sgr_region: sgr_region,
                },
                dataType: 'json',
                success: function (data) {
                    success(data)
                }
            })
            getSingerInfoPage("getSingerInfoPageByFLANDRG",sgr_firstLetter,sgr_region)
        }
        //图片点击跳转
        imgClick()
    })
    //名字变色
    $(".name").hover(function () {
        $(this).css("color", "rgb(190,50,50)")
    }, function () {
        $(this).css("color", "")
    })


    //后退
    if (currPage == 1) {
        $("#Previous").attr("disabled", "true");
        $("#Previous>span").css({"color": "rgb(200,200,200)"});
        $("#Previous").css({"cursor": "not-allowed"})
    }
    $("#Previous").click(function () {
        var prev = currPage - 2;
        $(".aShow:eq('" + prev + "')").click()
    })
    //前进
    $("#Next").click(function () {
        var next = currPage;
        $(".aShow:eq('" + next + "')").click()
    })

    //js
    function getSingerInfoPage(getSingerInfoPage,sgr_firstLetter, sgr_region) {
        //给默认页加颜色
        $("#aShow1").css("color", "red")
        $(".aShow").click(function () {
            currPage = $(this).text()
            // alert(currPage)
            //切换颜色
            if (currPage == 1) {
                $("#Previous").attr("disabled", "true");
                $("#Previous>span").css({"color": "rgb(200,200,200)"});
                $("#Previous").css({"cursor": "not-allowed"})
            } else {
                $("#Previous").attr("disabled", "false");
                $("#Previous>span").css({"color": ""});
                $("#Previous").css({"cursor": "pointer"})
            }
            if (currPage == sumPage) {
                $("#Next").attr("disabled", "true");
                $("#Next>span").css({"color": "rgb(200,200,200)"});
                $("#Next").css({"cursor": "not-allowed"})
            } else {
                $("#Next").attr("disabled", "false");
                $("#Next>span").css({"color": ""});
                $("#Next").css({"cursor": "pointer"})
            }
            $(this).css("color", "red")
            $(this).parent().siblings().children(".aShow").css("color", "")
            $.ajax({
                async: false,
                type: 'post',
                url: '<%=path%>/singerInfo/' + getSingerInfoPage,
                data: {
                    currPage: currPage,
                    sgr_firstLetter: sgr_firstLetter,
                    sgr_region: sgr_region,
                },
                dataType: 'json',
                success: function (data) {
                    success2(data)
                }
            })
        })
    }

    //获取所有页码数
    function success(data) {
        $(".liShow").empty()
        $(".singer-content").empty()
        singerInfo = data.page.lists
        sumPage = data.page.sumPage    //获取总页数
        sumCount = data.page.sumCount    //获取总数
        if (sumCount <= 36) {
            $("#singer-paging").css("display","none") //分页为空
        } else {
            $("#singer-paging").css("display","block")
            for (var m = 1; m <= sumPage; m++) {
                if (m == 1) {
                    $("#forward").before('<li class="page-item liShow" id="liShow1"><a class="page-link aShow" id="aShow1" href="#">' + m + '</a></li>')
                } else {
                    $("#forward").before('<li class="page-item liShow"><a class="page-link aShow" href="#">' + m + '</a></li>')
                }
            }
        }
        $(singerInfo).each(function (i, n) {
            var htm = '<div class="col-md-2 text-center mycol">' +
                '<a href="#" class="imgAddress"><img style="width: 175px;height: 175px;border-radius: 100%" src="' + n.sgr_imgAddress + '" ></a><br><br>' +
                '<a href="#" class="name text-decoration-none" style="font-size: 17px;">' + n.sgr_name + '</a>' +
                '<div class="sex" style="display: none">' + n.sgr_sex + '</div>' +
                '<div class="detail" style="display: none">' + n.sgr_detail + '</div>' +
                '</div>'
            $(".singer-content").append(htm)
        })
        //垂直间隔距离
        $(".mycol:gt(5)").css("margin-top", "60px")
    }
    //不获取页码数
    function success2(data) {
        $(".singer-content").empty()
        singerInfo = data.page.lists
        $(singerInfo).each(function (i, n) {
            var htm = '<div class="col-md-2 text-center mycol">' +
                '<a href="#" class="imgAddress"><img style="width: 175px;height: 175px;border-radius: 100%" src="' + n.sgr_imgAddress + '" ></a><br><br>' +
                '<a href="#" class="name text-decoration-none" style="font-size: 17px;">' + n.sgr_name + '</a>' +
                '<div class="sex" style="display: none">' + n.sgr_sex + '</div>' +
                '<div class="detail" style="display: none">' + n.sgr_detail + '</div>' +
                '</div>'
            $(".singer-content").append(htm)
        })
        //垂直间隔距离
        $(".mycol:gt(5)").css("margin-top", "60px")
    }
    function imgClick() {
        $(".imgAddress").click(function () {
            var sgr_name=$(this).siblings(".name").text()
            var sgr_imgAddress=$(this).find("img").attr("src")
            var sgr_detail=$(this).siblings(".detail").text()
            $.ajax({
                type: 'post',
                url: '<%=path%>/songInfo/getSongInfoByName',
                data: {
                    sg_author: sgr_name,
                },
                dataType: 'json',
                success: function (data) {
                    if(data.stateGetSongsByName.trim()==="1"){
                        $.get("<%=path%>/page/singer/singerInfo.jsp",
                            {
                                sgr_name:sgr_name,
                                sgr_imgAddress:sgr_imgAddress,
                                sgr_detail:sgr_detail
                            },
                            function (data2) {
                                $(".content").html(data2)
                            })
                    }
                }
            })
        })
    }
</script>
</body>
</html>
