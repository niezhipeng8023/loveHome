<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/7
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="x-ua-compatible" content="IE=Edge">

    <meta name="keywords" content="">
    <meta name="description" content="">

    <meta name="viewport" content="width=1200">
    <meta http-equiv="cleartype" content="on">
    <title>审核成为房东请求 · 恋家短租</title>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/x-icon">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/jquery-confirm.css" rel="stylesheet" />


    <link href="${pageContext.request.contextPath}/css/ion.rangeSlider.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/ion.rangeSlider.skinHTML5.css" rel="stylesheet" />


    <link href="${pageContext.request.contextPath}/css/center/ucenter_custom.css" rel="stylesheet" />

    <style>
        .jconfirm-box {
            margin-top: 30% !important;
        }

        img{
            height: inherit;
        }

        .avatar-pic, .avatar-pic canvas, .avatar-pic img {
            border-radius: inherit;
            width: 100%;
            height:100%;
        }
    </style>


</head>
<body>
<!--页头-->
<div class="header-nav-box">
    <div class="container">
        <div class="row header">
            <div class="header-nav-left">
                <a href="${pageContext.request.contextPath}/main/toIndex" class="site-log">
                    <img src="${pageContext.request.contextPath}/img/logo.png" alt="">
                </a>
            </div>
            <div class="header-nav-right">
                <ul>

                    <li class="nav-user-info">
                        <a href="/" class="nav-user-pic">
                            <c:if test="${not empty user.hardIcon}">
                                <img src="${pageContext.request.contextPath}/upload/${user.hardIcon}" class="img-circle" alt="" style="width:45px;height:45px;padding-top: 3px;" id="icon" >
                            </c:if>
                            <c:if test="${ empty user.hardIcon}">
                                <img src="${pageContext.request.contextPath}/img/default-male-avatar.png" id="icon" class="img-circle" style="width:45px;height:45px;padding-top: 3px;">
                            </c:if>

                        </a>
                        <c:if test="${empty user}" >
                            <a href="${pageContext.request.contextPath}/main/toShowLogin" target="_blank">登录</a><span>|</span><a href="${pageContext.request.contextPath}/main/toShowReg" target="_blank">注册</a>
                        </c:if>
                        <c:if test="${not empty user}">
                            <span><a style="color: #0fa39f" href="${pageContext.request.contextPath}/userFind/toShowUserCenter/${user.id}">${user.name}</a>,你好！ |  <a href="${pageContext.request.contextPath}/user/logout" >退出</a></span>
                        </c:if>
                    </li>

                </ul>
            </div>

        </div>
    </div>
</div>


<!--内容-->
<div class="container" id="page-main">
    <!--左部-->
    <!--右部-->




    <script src="${pageContext.request.contextPath}/js/jquery-1.12.3.min.js"></script>
    <script>
        $(function () {
            $("#li"+8).addClass("active");
        })

    </script>
    <!--左部-->
    <jsp:include page="user_left.jsp"></jsp:include>


    <div class="main-right">
        <div class="main-right-inner">
            <input id="AllTags" name="TagList" type="hidden" value="{allTags:[{id:18,type:3,name:&#39;旅游&#39;},{id:22,type:3,name:&#39;LOL&#39;},{id:23,type:2,name:&#39;女汉纸&#39;},{id:24,type:2,name:&#39;拖延症&#39;},{id:25,type:2,name:&#39;宅&#39;},{id:26,type:2,name:&#39;逗逼&#39;},{id:27,type:2,name:&#39;简单&#39;},{id:28,type:2,name:&#39;双重人格&#39;},{id:29,type:2,name:&#39;吃货&#39;},{id:30,type:2,name:&#39;选择恐惧症&#39;},{id:31,type:2,name:&#39;自来熟&#39;},{id:32,type:2,name:&#39;理想主义&#39;},{id:33,type:2,name:&#39;靠谱&#39;},{id:34,type:2,name:&#39;热血&#39;},{id:35,type:2,name:&#39;文艺&#39;},{id:36,type:2,name:&#39;叛逆&#39;},{id:37,type:2,name:&#39;腐&#39;},{id:38,type:2,name:&#39;萌萌哒&#39;},{id:49,type:3,name:&#39;运动健身&#39;},{id:50,type:3,name:&#39;夜跑&#39;},{id:51,type:3,name:&#39;篮球&#39;},{id:52,type:3,name:&#39;睡觉&#39;},{id:53,type:3,name:&#39;羽毛球&#39;},{id:54,type:3,name:&#39;足球&#39;},{id:55,type:3,name:&#39;打麻将&#39;},{id:56,type:3,name:&#39;看电影&#39;},{id:57,type:3,name:&#39;美食&#39;},{id:58,type:3,name:&#39;逛街&#39;},{id:59,type:3,name:&#39;泡吧&#39;},{id:60,type:3,name:&#39;K歌&#39;},{id:61,type:3,name:&#39;美剧&#39;},{id:62,type:3,name:&#39;TVB&#39;},{id:63,type:3,name:&#39;购物狂&#39;},{id:64,type:3,name:&#39;玩游戏&#39;},{id:65,type:1,name:&#39;应酬多&#39;},{id:66,type:1,name:&#39;夜猫子&#39;},{id:67,type:1,name:&#39;洁癖&#39;},{id:68,type:1,name:&#39;吸烟&#39;},{id:69,type:1,name:&#39;不叠被子&#39;},{id:70,type:1,name:&#39;上夜班&#39;},{id:71,type:1,name:&#39;裸睡&#39;},{id:72,type:1,name:&#39;自己做饭&#39;},{id:73,type:1,name:&#39;每天洗澡&#39;},{id:74,type:1,name:&#39;每天换衣服&#39;},{id:75,type:1,name:&#39;摄影&#39;},],checkedTags:[]}" />

            <div class="right-hd">
                <h3 class="right-title">审核申请</h3>
            </div>


            <form action="" class="form-horizontal" id="validate-form" method="post" novalidate="novalidate" role="form">
                <div class="meta-info">
                    <h4 class="right-sub-title">
                        <span>审核房东申请请求</span>
                    </h4>
                    <div class="meta-form">
                        <input type="hidden" id="uid" name="uid" value="${ownerInfo.user.id}" />
                        <input type="hidden" id="ownerid" name="ownerid" value="${ownerInfo.ownerId}" />
                        <div class="form-group">
                            <label class="control-label col-sm-3">创建人姓名:</label>
                            <div class="col-sm-6 ">
                                <input class="form-control" id="ownerName" readonly="readonly" check-type="required" name="ownerName" type="text" value="${ownerInfo.ownerName}" />
                                <span class="field-validation-valid" id="ownerName_Info" data-valmsg-for="NickName" data-valmsg-replace="true"></span>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-sm-3">用户身份证号码:</label>
                            <div class="col-sm-6 ">
                                <input class="form-control" id="ownerIdcard" readonly="readonly" check-type="required" name="ownerIdcard"  type="text" value="${ownerInfo.ownerIdcard}" />
                                <span class="field-validation-valid" id="IdCard_Info" data-valmsg-for="IdCard" data-valmsg-replace="true"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3">申请房东说明:</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" id="requestDesc" readonly="readonly"  check-type="required" name="requestDesc" type="text" value="" cols="20" rows="4" >${ownerInfo.requestDesc}</textarea>
                                <span class="field-validation-valid" id="requestDesc_Info" data-valmsg-for="Career" data-valmsg-replace="true"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3">用户昵称</label>
                            <div class="col-sm-9">
                                <input class="form-control" id="uname" name="uname" readonly="readonly" type="text" value="${ownerInfo.user.name}" />
                                <span class="field-validation-valid" data-valmsg-for="NickName" data-valmsg-replace="true"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">性别</label>
                            <div class="col-sm-9">
                                <c:if test="${empty ownerInfo.user.sex}">
                                    <label class="radio-inline">
                                        <input checked="checked"   data-val="true" data-val-required="Gender 字段是必需的。"  name="sex" type="radio" value="1" /> <span>男</span>
                                    </label>
                                    <label class="radio-inline">
                                        <input   name="sex" type="radio" value="0" /><span>女</span>
                                    </label>
                                </c:if>
                                <c:if test="${ownerInfo.user.sex == 0}">
                                    <label class="radio-inline">
                                        <input    data-val="true" data-val-required="Gender 字段是必需的。"  name="sex" type="radio" value="1" /> <span>男</span>
                                    </label>
                                    <label class="radio-inline">
                                        <input  checked="checked" name="sex" type="radio" value="0" /><span>女</span>
                                    </label>
                                </c:if>
                                <c:if test="${ownerInfo.user.sex == 1}">
                                    <label class="radio-inline">
                                        <input  checked="checked"  data-val="true" data-val-required="Gender 字段是必需的。"  name="sex" type="radio" value="1" /> <span>男</span>
                                    </label>
                                    <label class="radio-inline">
                                        <input   name="sex" type="radio" value="0" /><span>女</span>
                                    </label>
                                </c:if>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">年龄</label>
                            <div class="col-sm-4 has-feedback">
                                <input class="form-control" id="age" name="age" readonly="readonly" type="text" value="${ownerInfo.user.age}" />

                            </div>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-sm-3">职业</label>
                            <div class="col-sm-6">
                                <input class="form-control" id="job" name="job" readonly="readonly" type="text" value="${ownerInfo.user.job}" />

                                <%--  <input class="form-control" id="Career" name="Career" type="text" value="${user.job}" />--%>
                                <span class="field-validation-valid" data-valmsg-for="Career" data-valmsg-replace="true"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3">所在地</label>
                            <div class="col-sm-9">
                                <input class="form-control" id="address" readonly="readonly" name="address" type="text" value="${ownerInfo.user.address}"  />
                                <span class="field-validation-valid" data-valmsg-for="Career" data-valmsg-replace="true"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="avatar-upload">
                                <div class="avatar-pic" id="avatar-box" style="cursor:pointer">
                                    <img src="${pageContext.request.contextPath}/upload/${ownerInfo.ownerRoomPhoto}"   id="ownerInfoRoomPhoto"  />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="sub-box">
                    <input type="button" value="同意" onclick="successInfo()"  class="btn btn-info cus">&nbsp;
                    <input type="button" value="驳回" onclick="falseInfo()"  class="btn btn-danger cus">&nbsp;
                    <input type="button" value="忽略" onclick="hulue()"  class="btn btn-primary cus">&nbsp;
                </div>
            </form>
        </div>

    </div>


</div>
<script src="${pageContext.request.contextPath}/js/data.js"></script>
<script src="${pageContext.request.contextPath}/js/address.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-confirm.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.unobtrusive.js"></script>
<script>

</script>
<script src="${pageContext.request.contextPath}/js/center/ucenter_common.js"></script>
<!--统计代码-->


<script src="${pageContext.request.contextPath}/js/ion.rangeSlider.min.js"></script>

<script src="${pageContext.request.contextPath}/js/underscore.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ucenter_info.js"></script>
<script src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
<script src="${pageContext.request.contextPath}/js/UploadFile.js"></script>
<script src="${pageContext.request.contextPath}/js/plupload.full.min.js"></script>
<script>

   //同意申请
    function successInfo(){
        var uid = $('#uid').val();
        var ownerid = $('#ownerid').val();
        var ownerIdcard = $('#ownerIdcard').val();
        //var job = $("#job").find("option:selected").text();
        // var sex = $("input[name='sex']:checked").val();

        $.post("${pageContext.request.contextPath}/owner/successInfo",
            {"uid":uid,"ownerId": ownerid,"ownerIdcard" : ownerIdcard},
            function (data) {
                if (data.state == 1){
                    alert(data.message);
                    window.location.href="${pageContext.request.contextPath}/owner/findAllOwner";
                } else {
                    alert(data.message);
                }
            })
    }

   //驳回申请
   function falseInfo(){
       var ownerid = $('#ownerid').val();
       //var job = $("#job").find("option:selected").text();
       // var sex = $("input[name='sex']:checked").val();
       $.post("${pageContext.request.contextPath}/owner/falseInfo",
           {"ownerId":ownerid,"ownerIssuccess": 0},
           function (data) {
               if (data.state == 1){
                   alert(data.message);
                   window.location.href="${pageContext.request.contextPath}/owner/findAllOwner";
               } else {
                   alert(data.message);
               }
           })
   }

   //忽略申请
   function hulue(){
       var ownerid = $('#ownerid').val();

       $.post("${pageContext.request.contextPath}/owner/falseInfo",
           {"ownerId":ownerid,"ownerIssuccess": 2},
           function (data) {
               if (data.state == 1){
                   alert(data.message);
                   window.location.href="${pageContext.request.contextPath}/owner/findAllOwner";
               } else {
                   alert(data.message);
               }
           })
   }


   //表单验证
    $(function () {

        $('#validate-form').validate({
            errorElement: 'span',
            errorClass: 'validate_error',
            rules: {
                Name: {
                    required: true
                },
                NickName: {
                    required: true
                },
                Company: {
                    required: true
                },
                Career: {
                    required: true
                },
                Birthday: {
                    required: true,
                    date: true
                }
            },
            messages: {
                Name: {
                    required: '姓名不能为空!'
                },
                NickName: {
                    required: '昵称不能为空！'
                },
                Company: {
                    required: '公司不能为空'

                },
                Career: {
                    required: '工作不能为空！'
                },

            }

        });

    })
</script>


</body>
</html>
