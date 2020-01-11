<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<% int year = Calendar.getInstance().get(Calendar.YEAR);%>
<html>
<head>
    <title>个人信息</title>
    <style>
        div {
            /*border: 1px solid red;*/
        }
    </style>
</head>
<body>
<div class="container-fluid" id="myInfo">
    <div class="row pb-5">
        <%--左边--%>
        <div class="col-md-4 pl-3 pt-5" id="myInfo-left">
            <div class="row ml-5 pl-5 mb-2 row1">
                <font>管理个人信息</font>
            </div>
            <div class="row ml-5 row2">
                <div class="col-md">
                    <div class="headCir">
                        <img src="<%=path%>/images/main/bigheadCir.png" style="display: none">
                    </div>
                    <div id="myInfo-cir-box">
                        <c:if test="${empty stateUpHeImg}">
                            <img src="${logUser.uer_headImg}">
                        </c:if>
                        <c:if test="${!empty stateUpHeImg}">
                            <img src="${serverPath}">
                        </c:if>
                    </div>
                    <div id="click-upload">
                        <img src="<%=path%>/images/main/click-uploadImg.png">
                        <form id="upload-form" enctype="multipart/form-data">
                            <input type="file" name="uer_headImg" style="display: none">
                        </form>
                    </div>
                </div>
            </div>
            <div class="row ml-5 mt-5 pl-1 row3">
                <div class="col-md-8 ">
                    <span>*上传反动、色情等照片将导致您的账号被删除</span>
                </div>
            </div>
        </div>
        <%--右边--%>
        <div class="col-md-8 pt-3" id="mysInfo-right">
            <form id="myInfo-form" class="mt-5">
                <div class="form-group" id="myInfo-name">
                    <label for="myInfo-name-input"><strong>昵称</strong></label>
                    <small class="text-muted">
                        &nbsp;&nbsp;最多12个字符
                    </small>
                    <c:if test="${empty stateUpd}">
                        <input type="text" class="form-control" name="uer_name" id="myInfo-name-input"
                               value="${logUser.uer_name}">
                    </c:if>
                    <c:if test="${!empty stateUpd}">
                        <input type="text" class="form-control" name="uer_name" id="myInfo-name-input"
                               value="${updUser.uer_name}">
                    </c:if>
                    <div id="myInfo-name-remind" style="display: none"></div>
                </div>
                <div class="form-group mt-5" id="myInfo-signature">
                    <label for="myInfo-signature-input"><strong>个性签名</strong></label>
                    <small class="text-muted">
                        &nbsp;&nbsp;最多80个字符
                    </small>
                    <c:if test="${empty stateUpd}">
                        <textarea class="form-control" id="myInfo-signature-input" name="uer_signature"
                                  rows="3">${logUser.uer_signature}</textarea>
                        <%--<input type="textarea" class="form-control" name="uer_signature" id="myInfo-signature-input"--%>
                        <%--value="${logUser.uer_signature}">--%>
                    </c:if>
                    <c:if test="${!empty stateUpd}">
                        <textarea class="form-control" id="myInfo-signature-input" name="uer_signature"
                                  rows="3">${updUser.uer_signature}</textarea>
                        <%--<input type="text" class="form-control" name="uer_signature" id="myInfo-signature-input"--%>
                        <%--value="${updUser.uer_signature}">--%>
                    </c:if>
                    <div id="myInfo-signature-remind" style="display: none"></div>
                </div>
                <div class="form-group mt-5" id="myInfo-sex">
                    <label for="myInfo-sex-select"><strong>性别</strong></label>
                    <select id="myInfo-sex-select" name="uer_sex" class="form-control">
                        <option value="保密">保密</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div class="form-group mt-5">
                    <label for="myInfo-year-select"><strong>生日</strong></label>
                    <div class="form-row">
                        <div class="col-auto my-1" id="myInfo-year">
                            <select class="custom-select mr-sm-2" name="year" id="myInfo-year-select">
                                <option value="<%=year%>"><%=year%>
                                </option>
                            </select>
                        </div>
                        <div>
                            <span class="span-date">年</span>
                        </div>
                        <div class="col-auto my-1" id="myInfo-mouth">
                            <select class="custom-select mr-sm-2" name="mouth" id="myInfo-mouth-select">
                                <option value="1">1</option>
                            </select>
                        </div>
                        <span class="span-date">月</span>
                        <div class="col-auto my-1" id="myInfo-day">
                            <select class="custom-select mr-sm-2" name="day" id="myInfo-day-select">
                                <option value="1">1</option>
                            </select>
                        </div>
                        <span class="span-date">日</span>
                    </div>
                </div>
                <div class="form-group mt-5">
                    <label for="myInfo-shen-select"><strong>所在地</strong></label>
                    <div class="form-row" id="city">
                        <div class="col-auto my-1" id="myInfo-shen">
                            <select class="custom-select mr-sm-2 prov" name="shen" id="myInfo-shen-select">
                            </select>
                        </div>
                        <div class="col-auto my-1 mb-5" id="myInfo-shi">
                            <select class="custom-select mr-sm-2 city" name="shi" id="myInfo-shi-select">
                            </select>
                        </div>
                        <div class="col-auto my-1 mb-5" id="myInfo-quxian">
                            <select class="custom-select mr-sm-2 dist" name="quxian" id="myInfo-quxian-select">
                            </select>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row ml-5 mb-5">
                <div class="col-md ml-5 mb-5">
                    <button type="button" id="myInfo-bt-save" class="btn btn-primary w-25"><strong>保存</strong></button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=path%>/js/jquery.cityselect.js"></script>
<script>
    $(function () {
        //判断是否为会员
        if (${!empty memberInfoList}||${!empty updMemberInfo}) {
            $("#myInfo-left .headCir>img").show()
            $("#myInfo-cir-box>img").css("border", "4px solid rgb(252,193,45)")
            $("#myInfo-name-input").css("color", "rgb(193,39,45)")
        }
        //头像
        $("#click-upload img").click(function () {
            $("#click-upload input").click()
            $("#click-upload input").change(function () {
                $("#myInfo-cir-box img").attr("src", URL.createObjectURL($(this)[0].files[0]))
            })
        })

        //年
        var year = $("#myInfo-year-select option[value='2019']").text();
        year--;
        for (var y = year; y >= 1920; y--) {
            $("#myInfo-year-select").append("<option value='" + y + "'>" + y + "</option>")
        }
        $("#myInfo-year-select").focus(function () {
            $(this).attr("size", 6);
        })
        $("#myInfo-year-select option").click(function () {
            $(this).parent().removeAttr("size");
            $(this).parent().blur()
        })
        $("#myInfo-year-select").blur(function () {
            $(this).removeAttr("size");
        })
        //月
        var mouth = $("#myInfo-mouth-select option[value='1']").text();
        mouth++;
        for (var m = mouth; m <= 12; m++) {
            $("#myInfo-mouth-select").append("<option value='" + m + "'>" + m + "</option>")
        }
        $("#myInfo-mouth-select").focus(function () {
            $(this).attr("size", 6);
        })
        $("#myInfo-mouth-select option").click(function () {
            $(this).parent().removeAttr("size");
            $(this).parent().blur()
        })
        $("#myInfo-mouth-select").blur(function () {
            $(this).removeAttr("size");
        })
        //日
        var day = $("#myInfo-day-select option[value='1']").text();
        day++;
        for (var d = day; d <= 31; d++) {
            $("#myInfo-day-select").append("<option value='" + d + "'>" + d + "</option>")
        }
        $("#myInfo-day-select").focus(function () {
            $(this).attr("size", 6);
        })
        $("#myInfo-day-select option").click(function () {
            $(this).parent().removeAttr("size");
            $(this).parent().blur()
        })
        $("#myInfo-day-select").blur(function () {
            $(this).removeAttr("size");
        })

        //保存信息
        $("#myInfo-bt-save").click(function () {
            //上传头像图片
            $.ajax({
                type: 'post',
                url: '<%=path%>/user/uploadHeadImg',
                data: new FormData($("#upload-form")[0]),
                dataType: 'json',
                cache: false,
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data.stateUpHeadImg.trim() === "oversize") {
                        layer.msg('<span style="font-size:17px;margin-left: 18px;">图片过大,请重新选择</span>', {
                            offset: '150px',
                            anim: 6,
                            time: 1200,
                        });
                        return;
                    }
                }
            })
            var uer_name = $("#myInfo-name-input").val();
            var uer_signature = $("#myInfo-signature-input").val();
            var uer_sex = $("#myInfo-sex").val();
            var obj = $("#myInfo-form").serialize()
            if (uer_name.length > 12) {
                layer.msg('<span style="font-size:17px;">请更改昵称长度</span>', {
                    offset: '150px',
                    anim: 6,
                    time: 1200,
                });
            } else if (uer_signature.length > 80) {
                layer.msg('<span style="font-size:17px;">请更改个性签名长度</span>', {
                    offset: '150px',
                    anim: 6,
                    time: 1200,
                });
            } else if (uer_name.length > 12 && uer_signature.length > 80) {
                layer.msg('<span style="font-size:17px;">请更改昵称和个性签名长度</span>', {
                    offset: '150px',
                    anim: 6,
                    time: 1200,
                });
            } else {
                $.ajax({
                    type: 'post',
                    url: '<%=path%>/user/updateUser',
                    data: $("#myInfo-form").serialize(),
                    dataType: 'json',
                    success: function (data) {
                        if (data.stateUpdate.trim() === "1") {
                            layer.msg('<span style="font-size:17px;">修改个人资料成功</span>', {
                                offset: '150px',
                                anim: 6,
                                time: 1200,
                            });
                        }
                    }
                })
            }
        })

        //昵称和个性签名规范验证
        $("#myInfo-name-input").blur(function () {
            var uer_name = $("#myInfo-name-input").val();
            if (uer_name.length > 12) {
                $("#myInfo-name-remind").css({"display": "block", "color": "red"})
                $("#myInfo-name-remind").html("<i class='layui-icon layui-icon-face-cry' style='font-size: 18px'></i>" + " 昵称过长,请重新输入")
            } else {
                $("#myInfo-name-remind").css({"display": "none"})
            }
        })
        $("#myInfo-signature-input").blur(function () {
            var uer_signature = $("#myInfo-signature-input").val();
            if (uer_signature.length > 80) {
                $("#myInfo-signature-remind").css({"display": "block", "color": "red"})
                $("#myInfo-signature-remind").html("<i class='layui-icon layui-icon-face-cry' style='font-size: 18px'></i>" + " 个性签名过长,请重新输入")
            } else {
                $("#myInfo-signature-remind").css({"display": "none"})
            }
        })
        //默认性别
        if (${empty stateUpd}) {
            $("#myInfo-sex-select option[value='${logUser.uer_sex}']").attr("selected", true);
        }
        if (${!empty stateUpd}) {
            $("#myInfo-sex-select option[value='${updUser.uer_sex}']").attr("selected", true);
        }
        //默认生日
        if (${empty stateUpd}) {
            $("#myInfo-year-select option[value='${logUser.year}']").attr("selected", true)
            $("#myInfo-mouth-select option[value='${logUser.mouth}']").attr("selected", true)
            $("#myInfo-day-select option[value='${logUser.day}']").attr("selected", true)
        }
        if (${!empty stateUpd}) {
            $("#myInfo-year-select option[value='${updUser.year}']").attr("selected", true)
            $("#myInfo-mouth-select option[value='${updUser.mouth}']").attr("selected", true)
            $("#myInfo-day-select option[value='${updUser.day}']").attr("selected", true)
        }
        //所在地
        if (${empty stateUpd}) {
            $("#city").citySelect({
                prov: "${logUser.shen}",
                city: "${logUser.shi}",
                dist: "${logUser.quxian}",
                nodata: "none"
            })
        }
        if (${!empty stateUpd}) {
            $("#city").citySelect({
                prov: "${updUser.shen}",
                city: "${updUser.shi}",
                dist: "${updUser.quxian}",
                nodata: "none"
            })
        }
    })

    //js函数
    function getFileName(obj) {
        var pos = obj.lastIndexOf("\\");
        return obj.substring(pos + 1)
    }
</script>
</body>
</html>
