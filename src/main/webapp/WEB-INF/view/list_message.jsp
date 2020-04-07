<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/1
  Time: 17:55
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
    <title>留言管理 · 恋家短租</title>

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
                    留言详情
                </h4>
            </div>
            <form class="form-horizontal style-form"  method="post" action="" enctype="multipart/form-data" onSubmit="return myCheck(this)" >

                <div class="modal-body">
                    <div class="form-group" style="border:none;">
                        <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">留言标题:</span>
                        <div class="col-sm-6">
                            <input type="text" id="modal-title" check-type="required"  value="" name="title" class="form-control">
                            <span class="help-block"></span>
                        </div>
                        <div class="col-sm-2" style="text-align:left;padding:0;height:32px;line-height:32px;">
                            <font id="showResult1" style="color:red">*</font>
                        </div>

                    </div>

                    <div class="form-group" style="border:none;margin-top:30px;">
                        <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">留言内容:</span>
                        <div class="col-sm-8">
                            <textarea id="modal-content" name="content" check-type="required"   class="form-control message_content" rows="4" check-type="required" type="text"></textarea>
                        </div>
                        <div class="col-sm-2" style="text-align:left;padding:0;height:32px;line-height:32px;">
                            <font id="showResult2" style="color:red">*</font>
                        </div>

                    </div>

                    <div class="form-group" style="border:none;margin-top:30px;">
                        <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">联系电话:</span>
                        <div class="col-sm-3">
                            <input type="text" name="mPhone" value="" id="modal-mphone" check-type="required tel"  class="form-control">
                        </div>
                        <div class="col-sm-1" style="text-align:left;padding:0;height:32px;line-height:32px;">
                            <font id="showResult3" style="color:red">*</font>
                        </div>


                        <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">使用状态:</span>
                        <div class="col-sm-3">
                            <select class="form-control" check-type="required"  name="status" id="select_status" >


                                <option value="1" selected="selected"  >使用中</option>
                                <option value="0" >已删除</option>

                            </select>
                        </div>

                    </div>

                    <div class="form-group" style="border:none;margin-top:30px;">

                        <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">创建人:</span>
                        <div class="col-sm-3">
                            <input type="text" name="createName" check-type="required"  value="" id="modal-createName" class="form-control">
                        </div>
                        <%-- <div class="col-sm-2" style="text-align:left;padding:0;height:32px;line-height:32px;">
                             <font id="showResult6" style="color:red">*</font>
                         </div>

                         <div class="col-sm-1" style="text-align:left;padding:0;height:32px;line-height:32px;">
                             <font id="showResult4" style="color:red"></font>
                         </div>--%>

                        <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">创建时间:</span>
                        <div class="col-sm-4">
                            <input type="text" readonly="readonly" name="mCreateTime" value="" id="modal-mCreateTime" class="form-control">
                        </div>
                        <div class="col-sm-1" style="text-align:left;padding:0;height:32px;line-height:32px;">
                            <font id="showResult5" style="color:red"></font>
                        </div>

                    </div>

                    <c:if test="${empty message.userId}">

                        <div class="form-group" style="border:none;margin-top:30px;">

                            <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">关联用户:</span>
                            <div class="col-sm-3">
                                <input type="text" readonly="readonly" name="user_name" value="" id="modal-user_name" class="form-control">
                            </div>
                        </div>

                    </c:if>
                    
                   <%-- <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">年龄:</span>
                    <div class="col-sm-3">
                        <input type="text" name="age" value="" id="modal-age" class="form-control">
                    </div>
                    <span class="col-sm-2" style="color:#000;font-size:16px;float:left;height:28px;text-align:right;line-height:28px;">性别:</span>
                    <div class="col-sm-3">
                        <select class="form-control"  name="sex" id="select_sex" >
                            <option value=""  selected="selected"  >请选择</option>
                            <option value="1" >男</option>
                            <option value="0" >女</option>

                        </select>
                    </div>--%>




                </div>
                <div class="modal-footer">

                    <button type="button"  id="btn_push_files" onclick="updataModel(${message.messageId})"  class="btn btn-round btn-primary">
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
                <h3 class="right-title">留言管理</h3>
            </div>
            <div class="container-fluid">
                <div class="row">

                      <!-- 上部放按钮的地方开始 -->
                      <form class="form-horizontal style-form" method="get" action="${pageContext.request.contextPath}/message/findAllMessage" style="margin-top:10px;text-align:center;">
                          <div class="form-group" style="border:none;margin-top:5px;">
                              <div class=" col-sm-3" style="float:left;">
                                  <a href="${pageContext.request.contextPath }/main/toShowPushMessage">
                                  <button type="button" class="btn btn-success"    >
                                      <span class="glyphicon glyphicon-user" style="color: rgb(255,255,255); font-size: 12px;text-shadow: rgb(255,255,255) 0px 0px 0px; ">&nbsp;添加留言</span>
                                  </button>
                                  </a>

                                  <button type="button" class="btn btn-danger"  onclick="deledecfm()" id="user_delete_all" >
                                      <span class="glyphicon glyphicon-trash" style="color: rgb(255,255,255); font-size: 12px;text-shadow: rgb(255,255,255) 0px 0px 0px; ">&nbsp;全部删除</span>
                                  </button>

                              </div>
                              <div class=" col-sm-4" style="float:left;">
                                  <span style="width:35%;color:#000;font-size:15px;float:left;height:28px;text-align:right;line-height:28px;">手机号:</span>

                                  <input type="text" name="phone" value="" class="form-control" style="width:45%;height:28px;float:left;">

                              </div>



                              <div class=" col-sm-5" style="float:left;">
                                  <span style="width:35%;color:#000;font-size:15px;float:left;height:28px;text-align:right;line-height:28px;">使用状态：</span>

                                  <select class="form-control" style="width:45%;font-size:12px;height:28px;"  name="mStatus" >
                                      <option value=""  selected="selected"  >请选择</option>
                                      <option value="1" >使用中</option>
                                      <option value="0" >已删除</option>
                                  </select>
                              </div>



                          </div>

                          <div class="form-group" style="border:none;">

                              <div class=" col-sm-5" style="float:left;margin-left:40px;">
                                  <span style="width:35%;color:#000;font-size:15px;float:left;height:28px;text-align:right;line-height:28px;">创建时间：</span>

                                  <input type="text" class="form-control round-form" id="dateStart" name="dateStart" placeholder="起始时间" style="width:30%;height:28px;float:left;">

                                  <span style="color: rgb(0, 0, 0);float:left;height:28px;text-align:center;line-height:28px;
				                  	  	  font-size: 24px; margin-left:3px;margin-right:3px;text-shadow: rgb(255, 0, 0) 0px 0px 0px;">
										  -
										  </span>

                                  <input type="text" class="form-control round-form" name="finalTime" id="finalTime" placeholder="终止时间" style="width:30%;height:28px;">
                              </div>

                              <div class=" col-sm-5" style="float:left;">
                                  <span style="width:35%;color:#000;font-size:15px;float:left;height:28px;text-align:right;line-height:28px;">留言标题/内容：</span>

                                  <input type="text"  name="Info" class="form-control" value="" style="width:60%;height:28px;float:left;">

                              </div>
                              <button type="submit" class="btn btn-round btn-warning" style="height:28px;text-align:center;line-height:28px;">
                                  <span class="glyphicon glyphicon-search" style="color: rgb(255,255,255);text-align: center; font-size: 12px;text-shadow: rgb(255,255,255) 0px 0px 0px; ">&nbsp;搜索</span>
                              </button>
                          </div>

                      </form>
                </div>

                      <!-- 上部放按钮的地方结束-->
                      <!-- 表格部分开始-->
                      <table class="table ">
                          <thead>
                          <tr class="thead-dark">
                              <th style="text-align:center;"><input type="checkbox" class="list-child" value=""  id="check_all" /></th>
                              <th style="text-align:center;">创建人姓名</th>
                              <th style="text-align:center;">标题</th>
                              <th style="text-align:center;">联系电话</th>
                              <th style="text-align:center;">使用状态</th>
                              <th style="text-align:center;">创建时间</th>
                              <th style="text-align:center;">创建用户</th>
                              <th style="text-align:center;">操作</th>


                          </tr>
                          </thead>
                          <tbody>
                          <c:forEach items="${pageMessageInfo.list}" var="pageMessage">

                              <tr class="mylist">
                                  <td style="text-align:center;"> <input type="checkbox" class="list-child check_item" class="list-child" value=""  /></td>
                                  <td style="text-align:center;">${pageMessage.createName}</td>
                                  <td style="text-align:center;">${pageMessage.title}</td>
                                  <td style="text-align:center;">${pageMessage.mPhone}</td>
                                  <td style="text-align:center;">
                                      <c:if test="${pageMessage.mStatus == 1}">
                                        <button class="btn btn-success btn-xs"  ><i class="fa fa-trash-o "></i>使用中</button>

                                      </c:if>
                                      <c:if test="${pageMessage.mStatus == 0}">
                                         <button class="btn btn-drak btn-xs" ><i class="fa fa-trash-o "></i>已删除</button>
                                      </c:if>
                                  </td>
                                  <td style="text-align:center;"><fmt:formatDate value='${pageMessage.mCreateTime}' type='date' pattern='yyyy-MM-dd'/></td>
                                  <td style="text-align:center;">${pageMessage.user.name}</td>
                                  <td style="text-align:center;">
                                      <c:if test="${pageMessage.mStatus == 1}">
                                          <!-- 你根据原型图修改操作的地方 -->
                                          <button type="button" onclick="edit_btn(${pageMessage.messageId})" id="edit_btn" class="btn btn-primary btn-xs" data-toggle="modal" u-id="${pageMessage.messageId}"  ><i class="fa fa-pencil"></i>
                                              编辑
                                          </button>
                                          <a href="${pageContext.request.contextPath}/message/deleteMessage/${pageMessage.messageId}"><button type="button" onclick="del_btn()"  class="btn btn-danger btn-xs"  ><i class="fa fa-pencil"></i>
                                              删除
                                          </button></a>
                                      </c:if>
                                      <c:if test="${pageMessage.mStatus == 0}">
                                          <button type="button" onclick="edit_btn(${pageMessage.messageId})" id="edit_btn" class="btn btn-primary btn-xs" data-toggle="modal" u-id="${pageMessage.messageId}"  ><i class="fa fa-pencil"></i>
                                              编辑
                                          </button>
                                         <button type="button"   class="btn btn-drak btn-xs"  ><i class="fa fa-pencil"></i>
                                              删除
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
                        <div class="col-md-6">当前第${pageMessageInfo.pageNum}页,共${pageMessageInfo.pages}页,共${pageMessageInfo.total}条记录</div>
                        <div class="col-md-6">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <li><a href="${pageContext.request.contextPath }/message/findAllMessage?pageNo=1">首页</a></li>
                                    <li>
                                        <c:if test="${pageMessageInfo.hasPreviousPage}">
                                            <a href="${ pageContext.request.contextPath }/message/findAllMessage?pageNo=${pageNum-1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </c:if>
                                    </li>
                                    <c:forEach items="${pageMessageInfo.navigatepageNums}" var="page_num">
                                        <c:if test="${page_num ==pageMessageInfo.pageNum}">
                                            <li class="active"><a href="#">${page_num}</a></li>
                                        </c:if>
                                        <c:if test="${page_num != pageMessageInfo.pageNum}">
                                            <li><a href="${ pageContext.request.contextPath }/message/findAllMessage?pageNo=${page_num}">${page_num}</a></li>
                                        </c:if>
                                    </c:forEach>
                                    <li>
                                        <c:if test="${pageMessageInfo.hasNextPage}">
                                            <a href="${ pageContext.request.contextPath }/message/findAllMessage?pageNo=${pageNum+1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </c:if>

                                    </li>
                                    <li><a href="${ pageContext.request.contextPath }/message/findAllMessage?pageNo=${pageMessageInfo.pages}">末页</a></li>
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
        var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':'
        var m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':'
        var s = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds())
        return Y + M + D + h + m + s

    }


    var updataModelUid ="";
    function edit_btn(id){
        //重置表单，清除数据
        clear_form('#uploadModel form');

        updataModelUid = id;
        $.ajax({
            url: "${pageContext.request.contextPath }/message/findById/"+id,
            type: "GET",
            success:function(result){
                if (result != null){

                    $('#modal-title').val(result.title);
                    $('#modal-content').val(result.content);
                    $('#modal-mphone').val(result.mPhone);
                    $('#modal-createName').val(result.createName);
                    $('#modal-mCreateTime').val(RiQi(result.mCreateTime));
                    $("#select_status").val(result.mStatus);
                    if(result.user.name != null){
                        $("#modal-user_name").val(result.user.name);
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







    //完成全选/全部选
    $("#check_all").click(function(){
        //attr获取checked是undefined
        //一般用attr获取自定义的属性，用prop获取dom原生的属性
        $('.check_item').prop("checked",$(this).prop("checked"));
    });
    $(document).on("click",".check_item",function(){
        var flag=($(".check_item:checked").length == $(".check_item").length);
        $("#check_all").prop("checked",flag);
    });

    //批量禁用
    $("#user_delete_all").click(function(){
        var userNames="";
        var del_id_strs="";
        $.each($(".check_item:checked"),function(){
            //alert(del_id_strs = $(this).parents("tr").find("td:last").find("button").attr('edit-id'));
            userNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            del_id_strs += del_id_strs = $(this).parents("tr").find("td:last").find("button").attr('u-id') + "-";
        });

        //去除最后的那个,
        userNames=userNames.substring(0,userNames.length-1);
        del_id_strs=del_id_strs.substring(0,del_id_strs.length-1);
        if(del_id_strs == ""){
            alert("请选择要禁用的个人信息");
            return false;
        }
       // alert(del_id_strs);
        if(confirm("确定禁用【"+userNames+"】吗?")){
            $.ajax({
                url: "${pageContext.request.contextPath }/message/deleteMessage/"+del_id_strs,
                type: "post",
                success:function(result){
                    //关闭对话框
                    //alert(result.state);
                    //回到当前页
                    window.location.href="${pageContext.request.contextPath }/message/findAllMessage";
                }
            });
        }

    });





    function del_btn() {
        if (!confirm("确认要删除吗？")) {

            window.event.returnValue = false;

        }
    }



    //模态框的修改
    function updataModel(){

        var title = $('#modal-title').val();
        var content = $('#modal-content').val();
        var mphone = $('#modal-mphone').val();
        var createName = $('#modal-createName').val();
        var mStatus = $('#select_status').val();

        $.post("${pageContext.request.contextPath}/message/updateManagerMessageInfo",
            {"mid":updataModelUid,"title": title,"content" : content,"mphone" : mphone,"createName" : createName,"mStatus":mStatus},
            function (data) {
                if (data.state == 1){
                    alert(data.message);
                    window.location.href = '${pageContext.request.contextPath}/message/findAllMessage';
                } else {
                    alert(data.message);
                }
            })
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