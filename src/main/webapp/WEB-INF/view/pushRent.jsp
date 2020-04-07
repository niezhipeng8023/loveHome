<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/1
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">

    <title>发布求租信息</title>
    <meta name="keywords" />
    <meta name="description" />

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.bundle.css">
    <style>
        .city-selection .city-cur1 {
            color: #fff;
            font-size: 12px;
        }
    </style>



    <link href="${pageContext.request.contextPath}/css/common.min.css" rel="stylesheet" />

    <link href="${pageContext.request.contextPath}/css/rangeSlider.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/newMail.css" rel="stylesheet" />


</head>
<body>
<div class="page-wrap">

    <div class="page-main" id="page-main">
        <!-- header -->
        <jsp:include page="header.jsp"></jsp:include>



        <div class="container">
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main/toIndex">首页</a></li>
                <li class="active">发布求租信息</li>
            </ol>
            <div class="form-horizontal" id="form-rentGet" role="form" novalidate="novalidate">
                <div class="form-wrap">
                    <input type="hidden" id="userId" value="${user.id}" />
                    <input type="hidden" id="uname" value="${user.name}" />

                    <div class="form-group">
                        <label for="title" class="col-sm-3 control-label">租房标题：</label>
                        <div class="col-sm-5"><input type="text" class="form-control bor3" id="title" check-type="required"></div>

                    </div>
                    <div class="form-group">
                        <label for="Address" class="col-sm-3 control-label">我想要住在：</label>

                        <div class="col-sm-2" id="Address">
                            <select class="form-control" name="province" id="province" onchange="provinceChange()" style="margin-left:15px;">
                                <option value="">省份</option>
                            </select>

                        </div>
                        <div class="col-sm-2 colsm2">
                            <select  class="form-control" name="city" id="city" onchange="cityChange()">
                                <option value="">城市</option>
                            </select>
                        </div>
                        <div class="col-sm-2 colsm2">
                            <select  class="form-control" name="area" id="area"  onchange="areaChange()" >
                                <option value="">区域</option>
                            </select>
                        </div>
                        <span id="area_Info" ></span>
                    </div>
                    <div class="form-group">
                        <label for="minPrice"  class="col-sm-3 control-label">我的预算：</label>
                        <div class="col-sm-6">
                            <input type="text" maxlength="6"  class="col-sm-3" id="minPrice"> <span class="col-sm-3" >————</span>
                            <input type="text" maxlength="6"  class="col-sm-3" id="maxPrice">

                        </div>
                        <div class="col-sm-4">
                        <span id="price_info"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="liveTime" class="col-sm-3 control-label mt10">最晚入住时间：</label>
                        <div class="col-sm-4 mt4">
                            <input type="text"  class="form-control bor3 contract_time_today" id="liveTime">
                        </div>
                       <span id="time_Info"></span>
                    </div>
                    <div class="form-group">
                        <label for="roomArea" class="col-sm-3 control-label mt10">房屋面积大小：</label>
                        <div class="col-sm-4 mt4">
                            <input type="text"  check-type="required" class="form-control bor3" maxlength="4" id="roomArea">
                        </div>
                        <div class="col-sm-4 mt4">
                        <span id="roomArea_info"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-3 control-label">联系方式：</label>
                        <div class="col-sm-4"><input type="text" class="form-control bor3" id="phone" check-type="required tel"></div>

                    </div>

                    <div class="form-group">
                        <label for="phone" class="col-sm-3 control-label">房屋需求描述：</label>
                        <div class="col-sm-5"><textarea type="text" class="form-control message_content" rows="4" id="roomDesc" check-type="required" ></textarea></div>

                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-4 mt18">
                            <button type="button" id="btn_addRentGet" onclick="addRentGet()" class="btn  btn-primary btn-cflat btn-valid bor3">确认</button>
                           <%-- <button type="button" id="btn_addRentGet"  class="btn  btn-primary btn-cflat btn-valid bor3">确认</button>--%>
                            <a href="/" class="btn btn-default btn-cflat bor3 ml10">取消</a>
                        </div>
                    </div>
                    <div class="bk30"></div>
                </div>
            </div>
        </div>

        <!-- 发布提示窗口 -->
        <div class="modal fade email-modal" id="email-callback" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="ture">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body text-center">
                        <h3 class="text-orange"><strong id="alertmsg">发布成功</strong></h3>
                        <p class="text-left">HI 同学：</p>
                        <p class="text-left message">

                        </p>

                        <div class="bk20"></div>
                        <button type="button" class="btn btn-primary btn-flat" id="close" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>


    </div>



    <script type="text/javascript">
        window._bd_share_config = {
            common: {
                "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": !1, "bdPic": "",
                "bdStyle": "0", "bdSize": "16", bdMini: 2, bdPopupOffsetLeft: -207
            },
            share: [{ "bdSize": 16 }]
        }
        with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = '${pageContext.request.contextPath}/js/share.js'];

    </script>
    <div class="side-fix">
        <ul>
            <li class="side-share-box">
                <a href="javascript:void(0);" class="sprites side-share"></a>
                <div class="side-desc">
                    <div class="bdsharebuttonbox">
                        <a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a>
                        <a title="分享到QQ好友" href="#" class="bds_sqq" data-cmd="sqq"></a>
                        <a title="分享到豆瓣网" href="#" class="bds_douban" data-cmd="douban"></a>
                        <a title="分享到人人网" href="#" class="bds_renren" data-cmd="renren"></a>
                        <a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a>
                        <a title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin"></a>
                    </div>
                </div>
            </li>

            <li>
                <a href="/aboutus/contact?op=2#contact_mess_anchor" target="_blank" class="sprites side-comment"></a>
                <div class="side-desc">留言建议</div>
            </li>
            <li class="side-weixin-box">
                <a href="javascript:void(0);" class="sprites side-weixin"></a>
                <div class="side-desc">
                    <img src="${pageContext.request.contextPath}/img/loading.gif" width="131" height="131" alt="微信找房，扫我吧">
                    <p><b>微信找房</b>，扫我吧!</p>
                </div>
            </li>
            <li id="back-top" class="back-top"><a href="javascript:void(0);" class="sprites side-top"></a></li>
        </ul>

    </div>




    <div class="customer-service" id="customer-service">
        <a class="bar-link" onclick="NTKF.im_openInPageChat('kf_9452_1480658837072')" target="_blank" rel="nofollow">
            <img src="${pageContext.request.contextPath}/img/serv.gif" id="customer-service-img" />
            <img src="${pageContext.request.contextPath}/img/serv_hover.gif" style="display:none" />
        </a>
    </div>





    <!-- footer -->
    <jsp:include page="footer.jsp"></jsp:include>


</div>


<script src="${pageContext.request.contextPath}/js/common.bundle.js"></script>
<!--统计代码-->
<script src="${pageContext.request.contextPath}/js/g.js"></script>
<script>


    NTKF_PARAM = {
        siteid: "kf_9452",
        settingid: "kf_9452_1480658837072",
        uid: "",
        uname: "",
        isvip: "0",
        userlevel: "0",
        itemid: "",
        erpparam: ""
    }

    $(function () {
        //页脚沉降
        var $bottom = $('#page-bottom');
        var $footer = $('#page-footer');
        var $main = $('#page-main');

        var h = $bottom.outerHeight() + $footer.outerHeight();
        $main.css({
            paddingBottom: h,
            marginBottom: -h
        });


        //在线客服切换效果

        $('#customer-service').hover(function () {
            $('#customer-service-img').attr('src', '${pageContext.request.contextPath}/img/serv_hover.gif');

        }, function () {

            $('#customer-service-img').attr('src', '${pageContext.request.contextPath}/img/serv.gif');
        });

        //nav高亮
        var pathname = window.location.pathname
        var $navBar = $('.uoko-navbar li')
        switch (true) {
            case pathname=='/':
                $navBar.eq(0).addClass('active')
                break;
            case pathname.indexOf('/questions')> -1:
                $navBar.eq(2).addClass('active')
                break;
            case pathname.indexOf('/room')> -1:
                $navBar.eq(1).addClass('active')
                break;
            case pathname.indexOf('/history')> -1:
                $navBar.eq(5).addClass('active')
                break;
        }
    });


    // cookie
    var Cookie = function (name, value, options) {
        if (typeof value != 'undefined') {
            options = options || {};
            if (value === null) {
                options.expires = -1;
            }
            var expires = '';
            if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
                var date;
                if (typeof options.expires == 'number') {
                    date = new Date();
                    date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
                } else {
                    date = options.expires;
                }
                expires = '; expires=' + date.toUTCString();
            }
            //var path = options.path ? '; path=' + options.path : '',
            var path = '; path=/',
                domain = options.domain ? '; domain=' + options.domain : '',
                secure = options.secure ? '; secure' : '';

            document.cookie = [name, '=', value, expires, path, domain, secure].join('');
        } else {
            var nameEQ = name + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1, c.length);
                }
                if (c.indexOf(nameEQ) == 0) {
                    return decodeURIComponent(c.substring(nameEQ.length, c.length));
                }
            }
            return false;
        }
    };

    ; (function ($, undefined) {

        function isArray(o) {
            return Object.prototype.toString.call(o) === '[object Array]';
        }
        //解析查询字符串方法 spliter可选默认 &,sparator可选默认 =;

        //传入 'foo=1&bar=2&foo=3'将返回对象 { foo:[1,3], bar:2 }

        function parseQuery(queryString, spliter, separator) {
            var ret = {};
            spliter = spliter || '&';
            separator = separator || '=';

            if (queryString === '' || queryString === undefined) {
                return ret;
            }

            var paramArr = queryString.split(spliter);

            for (var i = 0; paramArr[i]; i++) {
                var pairs = paramArr[i].split(separator);
                var key = pairs[0];
                var val = pairs[1];

                if (ret[key] === undefined) {
                    ret[key] = val;
                    continue;
                }
                if (!isArray(ret[key])) {
                    ret[key] = [ret[key]].concat(val);
                    continue;
                }

                ret[key].push(val);

            };

            return ret;

        }

        $.parseQuery = parseQuery;

    })(window.jQuery)

    function isEmptyVal(val){
        return val === undefined || val === '' || val === null;
    }
    //设置页面cookie
    function setUtmCookie(key) {
        var _utm = Cookie(key);
        var queryString = $.parseQuery(window.location.search.slice(1));
        var cookieVal = [];
        var nameTransfers = {};
        if(_utm !== false && _utm !== '' ){
            return;
        }
        var sourceType = !isEmptyVal(queryString['hmsr']) ?
            'hmsr':!isEmptyVal(queryString['utm_source'])?
                'utm_source':undefined;

        if(!sourceType){
            return ;
        }

        if (sourceType === 'hmsr') {//若sourceType是hmsr，替换循环参数
            nameTransfers = { 'utm_source': 'hmsr', 'utm_medium': 'hmpl', 'utm_term': 'hmkw', 'utm_campaign': 'hmcu', 'utm_content': 'hmci' }
        }

        $.each(setUtmCookie.cookieMap, function (index, key) {
            var queryKey = nameTransfers[key] || key;
            queryString[queryKey] && cookieVal.push(key + '=' + queryString[queryKey]);
        });

        if(!cookieVal.length){//防止写入空值
            return ;
        }
        cookieVal = cookieVal.join('&');
        return Cookie(key, cookieVal, setUtmCookie.cookieOption);
    }
    //配置
    setUtmCookie.cookieMap = ['utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content'];
    setUtmCookie.cookieOption = {
        expires: 15,
        path: '/',
        domain: '.uoko.com'
    }

    setUtmCookie('_utm');

</script>

<script src="${pageContext.request.contextPath}/js/data.js"></script>
<script src="${pageContext.request.contextPath}/js/address.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ion.rangeSlider.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-confirm.min.js"></script>
<script src="${pageContext.request.contextPath}/js/validation.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script>
    $(function(){
        $("#minPrice").on("keyup", function(){
            var valid = /^\d{0,8}(\.\d{0,2})?$/.test(this.value),
                val = this.value;
            $("#price_info").html("");
            if(!valid){
                $("#price_info").css("color","red").html("请输入正确格式的金额");
                //console.log("Invalid input!");
                this.value = val.substring(0, val.length - 1);
            }
        });
    });

    $(function(){
        $("#maxPrice").on("keyup", function(){
            var valid = /^\d{0,8}(\.\d{0,2})?$/.test(this.value),
                val = this.value;
            $("#price_info").html("");
            if(!valid){
                $("#price_info").css("color","red").html("请输入正确格式的金额");
                //console.log("Invalid input!");
                this.value = val.substring(0, val.length - 1);
            }
        });
    });

    $(function(){
        $("#roomArea").on("keyup", function(){
            var valid = /^\d{0,8}(\.\d{0,2})?$/.test(this.value),
                val = this.value;
            $("#roomArea_info").html("");
            if(!valid){
                $("#roomArea_info").css("color","red").html("请输入数字表示面积大小");
                this.value = val.substring(0, val.length - 1);
            }
        });
    });

    $("#price-change").ionRangeSlider({
        min: 0,
        max: 8000,
        from: 800,
        to: 3000,
        type: 'double',
        step: 100,
        postfix: " 元",
        hasGrid: true,
        onChange: function (obj) {
            $(".hidminprice").val(obj.fromNumber);
            $(".hidmaxprice").val(obj.toNumber);

        },
    });
</script>
<script>

    $('.contract_time_today').datetimepicker({
        language: 'zh-CN',
        minView: 'month',
        format: 'yyyy-mm-dd',
        autoclose: true,
        startDate: new Date(),
        forceParse: true
    });
    $(document).on('changeDate', ".contract_time_today", function (ev) {
        $(".send-time").removeClass("hidden");
        var startTime = ev.date.valueOf();
        var NowDay = Date.parse(new Date());
        var day = Math.floor((startTime - NowDay) / (1000 * 60 * 60 * 24)) + 1;
        if (day > 7 && day <= 30) {
            $(".send-style-2,.send-style-4").addClass("hidden");
            $(".send-style-3").removeClass("hidden");
        } else if (day <= 7) {
            $(".send-style-3,.send-style-4").addClass("hidden");
            $(".send-style-2").removeClass("hidden");
        } else if (day > 30) {
            $(".send-style-3,.send-style-4").removeClass("hidden");
            $(".send-style-2").addClass("hidden");
        }
    });
</script>

<script>

    var valid = $("#form-rentGet").validation();
   function addRentGet(){
       var userId =  $("#userId").val();
       var name = $("#uname").val();
       var phone = $('#phone').val();
       var minPrice = $('#minPrice').val();
       var maxPrice = $('#maxPrice').val();
       var roomArea = $('#roomArea').val();
       var title =$("#title").val();
       var addr = addrShow.value
       var roomDesc = $("#roomDesc").val();
       var time = $('#liveTime').val();
       var proData = "title=" + title;
        proData += "&userId=" + userId + "&name=" + name + "&phone=" + phone + "&minPrice=" + minPrice + "&maxPrice=" +
            maxPrice + "&liveTime=" + time + "&roomArea=" + roomArea + "&roomAddress=" + addr + "&roomDesc=" + roomDesc;
      if(addr == null || addr == '') {
          $("#area_Info").css("color","red").html("输入地址不能为空！");
          return false;
      }else if(time == null || time == '') {
           $("#time_Info").css("color","red").html("输入入住时间不能为空！");
           return false;
       }else if(minPrice == null || minPrice =='' || maxPrice ==null || maxPrice==''){
          $("#price_info").css("color","red").html("输入金额不能为空！");
          return false;
      }else if (addr != null && addr != '' && title !=null && title !='' && time!=''&& phone !=null && phone!=''&& roomArea !=null && roomArea!=''&& roomDesc!=null && roomDesc!='') {
          $("#area_Info").css("color","red").html(" ");
          $("#price_info").css("color","red").html(" ");
          $("#time_Info").css("color","red").html(" ");

          $.ajax({
              type: "POST",
              url: "${pageContext.request.contextPath}/rentget/checkInfo",
              data: proData,
              success: function (data) {
                  //console.log("第一层"+data.state);
                  if (data.state != 12) {

                      $.ajax({
                          type: "POST",
                          url: "${pageContext.request.contextPath}/rentget/addRentGet",
                          data: proData,
                          success: function (result) {
                              //console.log("第2层"+result.state);
                              if (result.state != 0) {
                                  $(".message").html(" 您发布的<span class=\"text-orange\">" + addrShow.value + " / ￥" + $("#minPrice").val() + "-￥" + $("#maxPrice").val() + " /" + "</span>的房源需求，外星人已收到。<br/>科学家们会按照您的要求，为您及时推送房源信息，么么哒~</p>");
                                  $("#email-modal").modal('hide');
                                  $("#email-callback").modal('show');
                              } else {
                                  $("#alertmsg").html("发布失败");
                                  $(".message").html("SORRY，发布失败。科学家正在攻破这个世界难题，请换个姿势再试一次。");
                                  $("#email-modal").modal('hide');
                                  $("#email-callback").modal('show');
                              }
                          },
                          error: function (errorThrown) {
                              $("#alertmsg").html("发布失败");
                              $(".message").html("SORRY，发布出现异常。科学家正在攻破这个世界难题。");
                              $("#email-modal").modal('hide');
                              $("#email-callback").modal('show');
                          },
                      });
                  } else if (data.state == 12) {
                      $("#alertmsg").html("发布失败");
                      $(".message").html("SORRY，发布失败。请不要重复提交。");
                      $("#email-modal").modal('hide');
                      $("#email-callback").modal('show');
                  }
                  else {
                      $("#alertmsg").html("发布失败");
                      $(".message").html("SORRY，发布失败。科学家正在攻破这个世界难题，请换个姿势再试一次。");
                      $("#email-modal").modal('hide');
                      $("#email-callback").modal('show');
                  }
              },
              error: function (errorThrown) {
                  $("#alertmsg").html("发布失败");
                  $(".message").html("SORRY，发布出现异常。科学家正在攻破这个世界难题。");
                  $("#email-modal").modal('hide');
                  $("#email-callback").modal('show');
              },
          });

     }else {
         $("#alertmsg").html("发布失败");
         $(".message").html("SORRY，发布出现异常。请按正确格式完成发布。");
         $("#email-modal").modal('hide');
         $("#email-callback").modal('show');
          }

    }



</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/ntkfstat.js" charset="utf-8"></script>
</body>
</html>
