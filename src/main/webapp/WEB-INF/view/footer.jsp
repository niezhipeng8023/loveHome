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
<footer class="footer" id="page-footer">

    <div class="container clearfix">
        <div class="footer-slogan"><img src="${pageContext.request.contextPath}/img/footer-setup2.png" width="483" height="70"></div>
        <div class="social"><a href="${pageContext.request.contextPath}/main/toShowPushMessage"><i class="sprites icon-social-msg"></i>投诉及公示</a></div>
        <div class="qr-code">
            <div class="qr-code-box"><img src="${pageContext.request.contextPath}/img/erweima.png" width="137" height="114" alt="下载恋家APP"></div>
            <div class="qr-code-box"><img src="${pageContext.request.contextPath}/img/erweima.png" width="137" height="114" alt="关注恋家公众号"></div>
        </div>
        <div class="clearfix"></div>
        <div class="ext-links">


        </div>
    </div>
</footer>
<style>
    .bottom{
        height: 80px;
    }
    .text-center{
        text-align: center;
    }
    .icon-ga{
        background: url(${pageContext.request.contextPath}/img/public_security.png) no-repeat center;
        width: 20px;
        height: 20px;
        display: inline-block;
        vertical-align: text-bottom;
    }
    .beian-info{
        line-height: 20px;
    }
</style>
<div class="bottom" id="page-bottom">
    <div class="container clearfix">

        <div class="site-info">Copyright © 2012-2018 lianjia.com. All Rights  经营许可证号川***-*****<a href="" target="_blank" rel="nofollow">蜀ICP备****号-1</a></div>

        <ul class="bottom-nav">
            <li><a href="${pageContext.request.contextPath}/main/toIndex" target="_blank">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/main/toShowQuestions" >给你的信</a></li>

            <li><a href="${pageContext.request.contextPath}/main/toShowAsFor" >关于恋家</a></li>


            <li><a href="${pageContext.request.contextPath}/main/toShowPushMessage" >联系恋家</a></li>
        </ul>
    </div>
    <div class="container clearfix text-center beian-info">
        <i class="icon-ga"></i>
        <span>川公网安备 ******2001885号</span>

    </div>
</div>
</body>
</html>
