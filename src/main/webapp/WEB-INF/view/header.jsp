<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/31
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.bundle.css">
<style>
    .city-selection .city-cur1 {
        color: #fff;
        font-size: 12px;
    }
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset-chatBox.css">
<body>
    <div class="uoko-nav">
        <div class="container clearfix">
            <div class="uoko-navbar-left">
                <a href="${pageContext.request.contextPath}/main/toIndex" class="site-logo"><img src="${pageContext.request.contextPath}/img/logo.png" width="218" height="36"></a>
                <div class="city-selection">
                    <input type="hidden" value="278" id="curr-city-id" />
                    <input type="hidden" value="萍乡" id="curr-city-name" />
                    <input type="hidden" value="30.679943" id="curr-city-latitude" />
                    <input type="hidden" value="104.067923" id="curr-city-longitude" />

                    <a href="javascript:;" data-target="#city-list" class="city-cur1 js-drop-down">萍乡</a>

                </div>


            </div>
            <div class="uoko-navbar">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/main/toIndex">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/rentout/findRentOut">我要租房</a></li>
                    <li><a href="${pageContext.request.contextPath}/main/toShowQuestions">租前须知</a></li>

                    <li><a href="${pageContext.request.contextPath}/rentget/findRentget">求租列表</a></li>
                    <li><a href="${pageContext.request.contextPath}/main/toShowAsFor">关于恋家</a></li>
                    <li>
                        <a  href="${pageContext.request.contextPath}/main/toShowHT">
                            <span>我的合同</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="uoko-navbar-right login-box">
                <c:if test="${empty user}" >
                    <a href="${pageContext.request.contextPath}/main/toShowLogin" target="_blank">登录</a><span>|</span><a href="${pageContext.request.contextPath}/main/toShowReg" target="_blank">注册</a>
                </c:if>
                <c:if test="${not empty user}">
                    <span><a style="color: #0fa39f" href="${pageContext.request.contextPath}/userFind/toShowUserCenter/${user.id}">${user.name}</a>,你好！ |  <a href="${pageContext.request.contextPath}/user/logout" >退出</a></span>
                </c:if>

            </div>
        </div>
    </div>

</body>
</html>
