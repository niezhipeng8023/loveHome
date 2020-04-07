<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/1
  Time: 21:44
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
    <title>我的账单 · 恋家短租</title>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/x-icon">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/jquery-confirm.css" rel="stylesheet" />


    <link href="${pageContext.request.contextPath}/css/center/ucenter_custom.css" rel="stylesheet" />

    <style>
        .jconfirm-box {
            margin-top: 30% !important;
        }
    </style>

</head>
<body>
<!--页头-->
<div class="header-nav-box">
    <div class="container">
        <div class="row header">
            <div class="header-nav-left">
                <a href="/" class="site-log">
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
                    </li>
                    <li>
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



    <style>
        .wrapper {
            display:flex;
            flex-direction:column;
            align-items:center;
        }
        .wrapper img {
            display:block;
        }
        .wrapper h3 {
            font-weight: 600;
        }
        .wrapper h4 {
            font-weight:600;
        }
    </style>



    <script src="${pageContext.request.contextPath}/js/jquery-1.12.3.min.js"></script>
    <script>
        $(function () {
            $("#li"+7).addClass("active");
        })

    </script>
    <!--左部-->
    <jsp:include page="user_left.jsp"></jsp:include>


    <div class="main-right">
        <div class="main-right-inner">
            <div class="right-hd mb50">
                <h3 class="right-title">我的账单&emsp;<small>主人快点给我投币</small></h3>
            </div>
            <div class="wrapper">
                <h3>&quot;我的账单&quot;功能升级改造中</h3>
                <h4>给您造成不便，请谅解</h4>
                <img src="${pageContext.request.contextPath}/img/loading.gif" />
                <h5>温馨提示：我们的小伙伴正在加急处理</h5>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.12.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-confirm.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.unobtrusive.js"></script>
<script>
    //弹出框全局配置
    //用例：http://craftpip.github.io/jquery-confirm
    if (window.jconfirm) {
        jconfirm.defaults = {
            title: false,
            content: '是否确认提交?',
            contentLoaded: function () {
            },
            icon: '',
            confirmButton: '确定',
            cancelButton: '取消',
            confirmButtonClass: 'btn-info cus',
            cancelButtonClass: 'btn-default',
            theme: 'white',
            animation: 'zoom',
            closeAnimation: 'scale',
            animationSpeed: 500,
            animationBounce: 1.2,
            keyboardEnabled: false,
            rtl: false,
            confirmKeys: [13], // ENTER key
            cancelKeys: [27], // ESC key
            container: 'body',
            confirm: function () {
            },
            cancel: function () {
            },
            backgroundDismiss: false,
            autoClose: false,
            closeIcon: false,
            columnClass: 'col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1',
            onOpen: function () {
            },
            onClose: function () {
            },
            onAction: function () {
            }
        };
    }

</script>
<script src="${pageContext.request.contextPath}/js/ucenter_common.js"></script>
<!--统计代码-->
<script src="${pageContext.request.contextPath}/js/g.js"></script>


</body>
</html>