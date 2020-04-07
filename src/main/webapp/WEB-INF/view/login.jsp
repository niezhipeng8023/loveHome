<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/1
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="x-ua-compatible" content="IE=Edge">
    <meta http-equiv="cleartype" content="on">
    <title>恋家-登录</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/x-icon">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login_reg.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
</head>
<script type="text/javascript">
    function uname(){
        var username = $("#username").val();
        $.post("${pageContext.request.contextPath}/user/checkUsernameOrPhone",
            {"username":username},
            function (data) {

                if(data.state == 1){

                    $("#login-error-text").css("color","green");
                    $("#login-error-text").html(" ");
                }else {
                    $("#login-error-text").css("color","red");
                    $("#login-error-text").html(data.message);
                }
        })
    }

    function login() {
        var username = $("#username").val();
        var password = $("#password").val();
        var usernameInfo = document.getElementById("login-error-text").innerHTML;
        if(usernameInfo !=" "){
            alert("请输入有效用户名或手机号");
            return false;
        }
        else {
            $.post("${pageContext.request.contextPath}/user/login",
                {"username":username,"password": password},
                function (data) {

                    if(data.state == 1){
                        alert(data.message);
                        window.location.href="${pageContext.request.contextPath}/main/toIndex";
                    }else {

                        $("#myModal-text").html(data.message);
                        $("#myModal").modal();

                    }
                })
            return true;
        }

    }



</script>
<body>
<input type="hidden" id="redirect" value="" />
<input type="hidden" id="clientId" value="uoko-shop" />
<style>
    .icon-ga{
        background: url(${pageContext.request.contextPath}/img/public_security.png) no-repeat center;
        width: 15px;
        height: 15px;
        display: inline-block;
        background-size: contain;
        vertical-align: text-bottom;
        margin-left: 10px;
    }
</style>
<div class="page-wrap on-page-2">
    <div class="form-box">
        <form action="" id="loginForm" method="post" novalidate>
            <input type="hidden" name="idsrv.xsrf" value="IkObmiJoiw9fJror7cEtvw198ekZw1Axbqv9lEr4NN4i-a92bb10KsfrVCB75GrlCDRo6KGmXYLf_z_WDvEE9_QjlcE" token="model.antiForgery">
            <a href="${pageContext.request.contextPath}/main/toIndex" class="logo logo-2">恋家短租</a>
            <div class="error-box" style="margin-top:0;margin-bottom:10px;" id="server-error-box">
                <span></span>
            </div>
            <div class="fields">
                <div class="form-field">
                    <label><input type="text" id="username" autocomplete="off" placeholder="请输入用户名/手机号" name="username" class="field-ipt" value="" onblur="uname()"></label>
                    <span  id="login-error-text" style="text-align: center"></span>

                </div>
                <br>
                <div class="form-field">
                    <label><input type="password" autocomplete="off" placeholder="输入密码" name="password" id="password" class="field-ipt" value="" /></label>
                </div>
            </div>


            <div class="btn-box">
                <input type="button" value="登  录" class="sub-btn" onclick="login()">
            </div>
            <div class="extra">
                <div class="extra-left">
                    <a href="" class="link-forget">忘记密码?</a>
                </div>
                <div class="extra-right">
                    没有账号?现在就 <a href="${pageContext.request.contextPath}/main/toShowReg" class="to-regi">注册</a>
                </div>
            </div>
        </form>
        <div class="corp-info" >
            Copyright &copy; 2012-2018 lianjia.com(江西****公寓管理有限公司). All Rights Reserved 蜀ICP备13****638号-1 <i class="icon-ga"></i> <span>川公网安备 510****2**885号</span>
        </div>
    </div>

</div>

<!--模态框组件-->
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3>提示</h3>
            </div>
            <div class="modal-body">
                <p><span id="myModal-text"></span></p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-info" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</html>

