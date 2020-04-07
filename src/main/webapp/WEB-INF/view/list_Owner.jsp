<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/6
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="x-ua-compatible" content="IE=Edge">

    <meta name="keywords" content="">
    <meta name="description" content="">

    <meta name="viewport" content="width=1200">
    <meta http-equiv="cleartype" content="on">
    <title>申请房东管理 · 恋家短租</title>

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
    </style>


</head>
<body>

<!-- 模态框（Modal） -->
<div class="modal fade" id="uploadModel" tabindex="-1" role="dialog" aria-labelledby="uploadModelLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="text-align:center;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title upload" id="uploadModelLabel">
                    申请详情
                </h4>
            </div>
            <form class="form-horizontal style-form"  method="post" action="" enctype="multipart/form-data" onSubmit="return myCheck(this)" >

                <div class="modal-body">
                    <div class="form-group" style="border:none;">
                        <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">申请人:</span>
                        <div class="col-sm-6">
                            <input type="text" id="modal-title"  check-type="required"  value="" name="ownerName" class="form-control">
                            <span class="help-block"></span>
                        </div>
                        <div class="col-sm-2" style="text-align:left;padding:0;height:32px;line-height:32px;">
                            <font id="showResult1" style="color:red">*</font>
                        </div>

                    </div>

                    <div class="form-group" style="border:none;">
                        <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">身份证号码:</span>
                        <div class="col-sm-6">
                            <input type="text" id="modal-ownerIdcard"  check-type="required"  value="" name="ownerIdcard" class="form-control">
                            <span class="help-block"></span>
                        </div>

                    </div>

                    <div class="form-group" style="border:none;margin-top:30px;">
                        <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">申请描述:</span>
                        <div class="col-sm-8">
                            <textarea id="modal-content" name="requestDesc" check-type="required"   class="form-control message_content" rows="4" check-type="required" type="text"></textarea>
                        </div>
                        <div class="col-sm-2" style="text-align:left;padding:0;height:32px;line-height:32px;">
                            <font id="showResult2" style="color:red">*</font>
                        </div>

                    </div>

                    <div class="form-group" style="border:none;margin-top:30px;">

                        <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">状态:</span>
                        <div class="col-sm-3">
                            <select class="form-control" check-type="required"  name="status" id="select_status" >


                                <option value="1" selected="selected"  >已审批</option>
                                <option value="0" >未审批</option>

                            </select>
                        </div>

                    </div>

                    <div class="form-group" style="border:none;margin-top:30px;">

                        <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">创建时间:</span>
                        <div class="col-sm-4">
                            <input type="text" readonly="readonly" name="mCreateTime" value="" id="modal-mCreateTime" class="form-control">
                        </div>
                        <div class="col-sm-1" style="text-align:left;padding:0;height:32px;line-height:32px;">
                            <font id="showResult5" style="color:red"></font>
                        </div>

                    </div>


                    <div class="form-group" style="border:none;margin-top:30px;">

                        <span class="col-sm-3" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">关联人姓名:</span>
                        <div class="col-sm-3">
                            <input type="text" readonly="readonly" name="user_name" value="" id="modal-user_name" class="form-control">
                        </div>

                        <span class="col-sm-3" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">关联人电话:</span>
                        <div class="col-sm-3">
                            <input type="text" readonly="readonly" name="user_phone" value="" id="modal-user_phone" class="form-control">
                        </div>
                    </div>

                    <div class="form-group" style="border:none;margin-top:30px;">

                        <span class="col-sm-3" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">关联人性别:</span>
                        <div class="col-sm-3">
                            <input type="text" readonly="readonly" name="user_sex" value="" id="modal-user_sex" class="form-control">
                        </div>

                        <span class="col-sm-3" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">关联人角色:</span>
                        <div class="col-sm-3">
                            <input type="text" readonly="readonly" name="user_phone" value="" id="modal-user_role" class="form-control">
                        </div>
                    </div>



                </div>


                <div class="modal-footer">

                    <button type="button"  id="btn_push_files" onclick="updataModel(${owner.rgId})"  class="btn btn-round btn-primary">
                        保存
                    </button>
                    <button type="button" class="btn btn-round btn-default" data-dismiss="modal">
                        取消
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>




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
            <div class="right-hd">
                <h3 class="right-title">申请房东管理</h3>
            </div>
            <div class="container-fluid">
                <div class="row">

                    <!-- 上部放按钮的地方开始 -->
                    <form class="form-horizontal style-form" method="get" action="${pageContext.request.contextPath}/owner/findAllOwner" style="margin-top:10px;text-align:center;">
                        <div class="form-group" style="border:none;margin-top:5px;">
                            <div class=" col-sm-3" style="float:left;">
                                <a href="${pageContext.request.contextPath }/owner/pushRequestOwner">
                                    <button type="button" class="btn btn-success"    >
                                        <span class="glyphicon glyphicon-user" style="color: rgb(255,255,255); font-size: 12px;text-shadow: rgb(255,255,255) 0px 0px 0px; ">&nbsp;房东申请</span>
                                    </button>
                                </a>

                            </div>
                            <div class=" col-sm-7" style="float:right;">
                            <button type="submit" class="btn btn-round btn-warning" style="height:28px;text-align:right;line-height:28px;">
                                <span class="glyphicon glyphicon-search" style="color: rgb(255,255,255);text-align: center; font-size: 12px;text-shadow: rgb(255,255,255) 0px 0px 0px; ">&nbsp;搜索</span>
                            </button>
                            </div>
                        </div>

                        <div class="form-group" style="border:none;">

                            <div class=" col-sm-5" style="float:left;margin-left:40px;">
                                <span style="width:35%;color:#000;font-size:15px;float:left;height:28px;text-align:right;line-height:28px;">审核状态：</span>

                                <select class="form-control" style="width:45%;font-size:12px;height:28px;"  name="getStatus" >
                                    <option value=""  selected="selected"  >请选择</option>
                                    <option value="1" >已审核</option>
                                    <option value="0" >未审核</option>
                                </select>
                            </div>

                            <div class=" col-sm-4" style="float:left;margin-left:10px;">
                                <span style="width:35%;color:#000;font-size:15px;float:left;height:28px;text-align:left;line-height:28px;">创建人:</span>

                                <input type="text" name="ownerName" value="" class="form-control" style="width:40%;height:28px;float:left;">
                            </div>



                        </div>

                        <div class="form-group" style="border:none;">

                            <div class=" col-sm-5" style="float:left;margin-left:40px;">
                                <span style="width:35%;color:#000;font-size:15px;float:left;height:28px;text-align:right;line-height:28px;">审核结果：</span>

                                <select class="form-control" style="width:45%;font-size:12px;height:28px;"  name="ownerIssuccess" >
                                    <option value=""  selected="selected"  >请选择</option>
                                    <option value="1" >通过</option>
                                    <option value="0" >驳回</option>
                                    <option value="2" >忽略</option>
                                </select>
                            </div>

                            <div class=" col-sm-4" style="float:left;margin-left:10px;">
                                <span style="width:35%;color:#000;font-size:15px;float:left;height:28px;text-align:left;line-height:28px;">关联人:</span>

                                <input type="text" name="userName" value="" class="form-control" style="width:40%;height:28px;float:left;">

                            </div>

                        </div>


                        <div class="form-group" style="border:none;">
                            <div class=" col-sm-5" style="float:left;margin-left:40px;">
                                <span style="width:35%;color:#000;font-size:15px;float:left;height:28px;text-align:right;line-height:28px;">身份证号码：</span>
                                <input type="text" name="ownerIdcard" value="" class="form-control" style="width:45%;height:28px;float:left;">

                            </div>


                            <div class=" col-sm-5" style="float:left;margin-left:10px;">
                                <span style="width:35%;color:#000;font-size:15px;float:left;height:28px;text-align:left;line-height:28px;">创建时间：</span>

                                <input type="text" class="form-control round-form" id="dateStart" name="dateStart" placeholder="起始时间" style="width:30%;height:28px;float:left;">

                                <span style="color: rgb(0, 0, 0);float:left;height:28px;text-align:center;line-height:28px;
				                  	  	  font-size: 24px; margin-left:3px;margin-right:3px;text-shadow: rgb(255, 0, 0) 0px 0px 0px;">
										  -
										  </span>

                                <input type="text" class="form-control round-form" name="finalTime" id="finalTime" placeholder="终止时间" style="width:30%;height:28px;float:left;">
                            </div>
                        </div>
                        <div class="form-group" style="border:none;">


                            <div class=" col-sm-5" style="float:left;">
                                <span style="width:35%;color:#000;font-size:15px;float:left;height:28px;text-align:right;line-height:28px;">详情：</span>

                                <input type="text"  name="Info" class="form-control" value="" style="width:60%;height:28px;float:left;">

                            </div>

                        </div>

                    </form>
                </div>

                <!-- 上部放按钮的地方结束-->
                <!-- 表格部分开始-->
                <table class="table ">
                    <thead>
                    <tr class="thead-dark">
                        <th style="text-align:center;">创建人</th>
                        <th style="text-align:center;">身份证号</th>
                        <th style="text-align:center;">状态</th>
                        <th style="text-align:center;">创建时间</th>
                        <th style="text-align:center;">关联用户</th>
                        <th style="text-align:center;">用户联系电话</th>
                        <th style="text-align:center;">操作</th>


                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageOwnerInfo.list}" var="pageOwner">

                        <tr class="mylist">
                            <td style="text-align:center;">${pageOwner.ownerName}</td>
                            <td style="text-align:center;">${pageOwner.ownerIdcard}</td>
                            <td style="text-align:center;">
                                <c:if test="${not empty pageOwner.ownerIssuccess}" >
                                    <c:if test="${pageOwner.ownerIssuccess == 0}">
                                        <button class="btn btn-danger btn-xs"  ><i class="fa fa-trash-o "></i>驳回</button>

                                    </c:if>
                                    <c:if test="${pageOwner.ownerIssuccess == 1}">
                                        <button class="btn btn-success btn-xs" ><i class="fa fa-trash-o "></i>通过</button>
                                    </c:if>
                                    <c:if test="${pageOwner.ownerIssuccess == 2}">
                                        <button class="btn btn-danger btn-xs" ><i class="fa fa-trash-o "></i>忽略</button>
                                    </c:if>
                                </c:if>
                                <c:if test="${empty pageOwner.ownerIssuccess}" >
                                    <c:if test="${pageOwner.ownerStatus == 0}">
                                        <button class="btn btn-danger btn-xs"  ><i class="fa fa-trash-o "></i>未审批</button>

                                    </c:if>
                                    <c:if test="${pageOwner.ownerStatus == 1 or pageOwner.ownerIssuccess == 2}">
                                        <button class="btn btn-danger btn-xs" ><i class="fa fa-trash-o "></i>忽略</button>
                                    </c:if>

                                </c:if>

                            </td>
                            <td style="text-align:center;"><fmt:formatDate value='${pageOwner.ownerCreateTime}' type='date' pattern='yyyy-MM-dd'/></td>
                            <td style="text-align:center;">${pageOwner.user.name}</td>
                            <td style="text-align:center;">${pageOwner.user.phone}</td>
                            <td style="text-align:center;">
                                <c:if test="${not empty pageOwner.ownerIssuccess  or pageOwner.ownerStatus == 1}" >
                                    <!-- 你根据原型图修改操作的地方 -->
                                    <button type="button" onclick="edit_btn(${pageOwner.ownerId})" id="edit_btn" class="btn btn-primary btn-xs" data-toggle="modal" u-id="${pageOwner.ownerId}"  ><i class="fa fa-pencil"></i>
                                        编辑
                                    </button>
                                    <button type="button"  class="btn btn-secondary btn-xs"  ><i class="fa fa-pencil"></i>
                                        审批
                                    </button>
                                </c:if>
                                <c:if test="${empty pageOwner.ownerIssuccess  and pageOwner.ownerStatus == 0}">
                                    <!-- 你根据原型图修改操作的地方 -->
                                    <button type="button" onclick="edit_btn(${pageOwner.ownerId})" id="edit_btn" class="btn btn-primary btn-xs" data-toggle="modal" u-id="${pageOwner.ownerId}"  ><i class="fa fa-pencil"></i>
                                        编辑
                                    </button>

                                    <button type="button" onclick="del_btn(${pageOwner.ownerId})"  class="btn btn-success btn-xs"  ><i class="fa fa-pencil"></i>
                                        审批
                                    </button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- 表格部分结束-->
                <!-- 显示分页条	 -->
                <div class="row">
                    <div class="col-md-6">当前第${pageOwnerInfo.pageNum}页,共${pageOwnerInfo.pages}页,共${pageOwnerInfo.total}条记录</div>
                    <div class="col-md-6">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a href="${pageContext.request.contextPath }/owner/findAllOwner?pageNo=1">首页</a></li>
                                <li>
                                    <c:if test="${pageOwnerInfo.hasPreviousPage}">
                                        <a href="${ pageContext.request.contextPath }/owner/findAllOwner?pageNo=${pageNum-1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </c:if>
                                </li>
                                <c:forEach items="${pageOwnerInfo.navigatepageNums}" var="page_num">
                                    <c:if test="${page_num ==pageOwnerInfo.pageNum}">
                                        <li class="active"><a href="#">${page_num}</a></li>
                                    </c:if>
                                    <c:if test="${page_num != pageOwnerInfo.pageNum}">
                                        <li><a href="${ pageContext.request.contextPath }/owner/findAllOwner?pageNo=${page_num}">${page_num}</a></li>
                                    </c:if>
                                </c:forEach>
                                <li>
                                    <c:if test="${pageOwnerInfo.hasNextPage}">
                                        <a href="${ pageContext.request.contextPath }/owner/findAllOwner?pageNo=${pageNum+1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </c:if>

                                </li>
                                <li><a href="${ pageContext.request.contextPath }/owner/findAllOwner?pageNo=${pageOwnerInfo.pages}">末页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div><!-- /content-panel -->

        </div>
    </div>



</div>

</div>
</div>

</div>


</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.12.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<!--  时间插件js -->
<script type="text/javascript">

    $(function(){
        $("#dateStart").datetimepicker({
            bootcssVer:3,  //bootstrap-datetimepicker＋bootstrap v3，但这个插件使用的时候，并没有和V3相匹配，仍然调用的是bootstrap V2的图标 把bootcssVer的值直接设为3，否则datetimepicker不会显示出上、下个月的箭头
            format: 'yyyy-mm-dd',
            minView: 'month',//设置时间选择为年月日 去掉时分秒选择
            todayBtn: true, //如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。如果是true的话，"Today" 按钮仅仅将视图转到当天的日期，如果是"linked"，当天日期将会被选中。
            language: 'zh-CN',
            autoclose: true, //当选择一个日期之后是否立即关闭此日期时间选择器。
            keyboardNavigation: true, //是否允许通过方向键改变日期。
            forceParse: true, //当选择器关闭的时候，是否强制解析输入框中的值。
            todayHighlight: 1  //如果为true, 高亮当前日期
        }).on("click", function () {
            //設置可选的最后日期為當前日期
            $("#dateStart").datetimepicker("setEndDate", getToday())
        });
    });
    $(function(){
        $("#finalTime").datetimepicker({
            bootcssVer:3,  //bootstrap-datetimepicker＋bootstrap v3，但这个插件使用的时候，并没有和V3相匹配，仍然调用的是bootstrap V2的图标 把bootcssVer的值直接设为3，否则datetimepicker不会显示出上、下个月的箭头
            format: 'yyyy-mm-dd',
            minView: 'month',//设置时间选择为年月日 去掉时分秒选择
            todayBtn: true, //如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。如果是true的话，"Today" 按钮仅仅将视图转到当天的日期，如果是"linked"，当天日期将会被选中。
            language: 'zh-CN',
            autoclose: true, //当选择一个日期之后是否立即关闭此日期时间选择器。
            keyboardNavigation: true, //是否允许通过方向键改变日期。
            forceParse: true, //当选择器关闭的时候，是否强制解析输入框中的值。
            todayHighlight: 1  //如果为true, 高亮当前日期
        }).on("click", function () {
            //設置可选的最后日期為當前日期
            $("#finalTime").datetimepicker("setEndDate", getToday())
        });
    });


    //獲取當前日期
    function getToday(){
        var today = new Date()
        var year = today.getFullYear();
        var month = today.getMonth() + 1;
        var day = today.getDate();
        var todayStr = year+"-"+month+"-"+day;
        return todayStr;
    }
</script>

<script>



    //---------------------打开模态框--------------------
    function clear_form(ele){
        //重置内容
        $(ele)[0].reset();
        //移除添加的雷和文本
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");
    }

    //数组去除第一个
    function curtail(arr) {
        var newarr =[];
        for(i=1;i<arr.length;i++){
            newarr.push(arr[i]);
        }
        return newarr;
    }
    //时间戳转时间
    function RiQi(data)
    {
        var date = new Date(data)
        var Y = date.getFullYear() + '-'
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-'
        var D = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + ' '
        //var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':'
        // var m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':'
        // var s = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds())
        //return Y + M + D + h + m + s
        return Y + M + D
    }


    var updataModelUid ="";
    function edit_btn(id){
        //重置表单，清除数据
        clear_form('#uploadModel form');

        updataModelUid = id;
        $.ajax({
            url: "${pageContext.request.contextPath }/owner/findById/"+id,
            type: "GET",
            success:function(result){
                if (result != null){
                    $('#modal-title').val(result.ownerName);
                    $('#modal-content').val(result.requestDesc);
                    $('#modal-ownerIdcard').val(result.ownerIdcard);
                    $('#modal-mCreateTime').val(RiQi(result.ownerCreateTime));
                    $("#select_status").val(result.ownerStatus);
                    if(result.user != null){
                        $("#modal-user_name").val(result.user.name);
                        $("#modal-user_phone").val(result.user.phone);
                        if(result.user.sex == 1){
                            $("#modal-user_sex").val("男");
                        }else {
                            $("#modal-user_sex").val("女");
                        }

                        if (result.user.isOwner == 1){
                            $("#modal-user_role").val("房东");
                        }else {
                            $("#modal-user_role").val("租客");
                        }

                    }

                }else {
                    alert("编辑失败，请联系管理员！");
                }

            }
        });
        //显示模态框
        $("#uploadModel").modal({
            backdrop:'static'
        });

    }




    //模态框的修改
    function updataModel(){
        var ownerName = $('#modal-title').val();
        var requestDesc = $('#modal-content').val();
        var mStatus = $('#select_status').val();
        var ownerIdcard = $('#modal-ownerIdcard').val();
        $.post("${pageContext.request.contextPath}/owner/updateManagerownerInfo",
            {"ownerId":updataModelUid,"ownerName": ownerName,"requestDesc" : requestDesc,"mStatus":mStatus,"ownerIdcard":ownerIdcard},
            function (data) {
                if (data.state == 1){
                    alert(data.message);
                    window.location.href = '${pageContext.request.contextPath}/owner/findAllOwner';
                } else {
                    alert(data.message);
                }
            })
    }


    function del_btn(id) {
        $.ajax({
            url: "${pageContext.request.contextPath }/owner/findById/"+id,
            type: "GET",
            success:function(result){
                if (result != null){
                    window.location.href = '${pageContext.request.contextPath}/owner/findOwnerInfo';
                }else {
                    alert("审批失败，请联系管理员！");
                }

            }
        });
    }

</script>
<script src="${pageContext.request.contextPath}/js/center/ucenter_common.js"></script>
<!--统计代码-->
<script src="${pageContext.request.contextPath}/js/g.js"></script>


<script src="${pageContext.request.contextPath}/js/ion.rangeSlider.min.js"></script>

<script src="${pageContext.request.contextPath}/js/ucenter_info.js"></script>
<script src="${pageContext.request.contextPath}/js/qiniu.min.js"></script>


</body>
</html>
