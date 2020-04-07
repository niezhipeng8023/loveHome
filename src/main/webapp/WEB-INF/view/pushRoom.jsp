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

    <title>发布房屋信息</title>
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
                <li class="active">发布房屋信息</li>
            </ol>
         <form action="${pageContext.request.contextPath}/rentout/addRentOut" onsubmit="return checkForm()" class="form-horizontal" id="validate-form" method="post" enctype="multipart/form-data" role="form">
            <div class="form-horizontal" id="form-rentGet" role="form" novalidate="novalidate">
                <div class="form-wrap">
                    <input type="hidden" id="userId" name="userId" value="${user.id}" />
                    <input type="hidden" id="uname" name="uname" value="${user.name}" />
                    <div class="form-group">
                        <label for="Address" class="col-sm-3 control-label">房屋地址：</label>

                        <div class="col-sm-2" id="Address">
                            <select class="form-control" name="province" id="province" onchange="provinceChange()" style="margin-left:15px;">
                                <option value="">省份</option>
                            </select>

                        </div>
                        <div class="col-sm-3">
                            <select  class="form-control" name="city" id="city" onchange="cityChange()">
                                <option value="">城市</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <select  class="form-control" name="area" id="area"  onchange="areaChange()" >
                                <option value="">区域</option>
                            </select>
                        </div>
                        <input type="hidden" id="roomAddress1" name="roomAddress" value="" />
                        <span id="area_Info" ></span>
                    </div>

                    <div class="form-group">
                        <label for="roomDesc" class="col-sm-3 control-label">房屋介绍：</label>
                        <div class="col-sm-5"><textarea type="text" class="form-control message_content" rows="4" name="roomDesc" id="roomDesc" check-type="required" ></textarea></div>

                    </div>


                    <div class="form-group">
                        <label for="phone" class="col-sm-3 control-label">联系方式：</label>
                        <div class="col-sm-4"><input type="text" class="form-control bor3" name="phone" id="phone" check-type="required tel"></div>

                    </div>

                    <div class="form-group">
                        <label for="roomPrice"  class="col-sm-3 control-label">房屋租金：</label>
                        <div class="col-sm-4 mt4">
                            <input type="text" maxlength="6" check-type="required" class="form-control bor3" name="roomPrice" id="roomPrice">

                        </div>
                        <div class="col-sm-4">
                        <span id="price_info"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="roomAge" class="col-sm-3 control-label mt10">房龄：</label>
                        <div class="col-sm-4 mt4">
                            <input type="text" check-type="required" name="roomAge" class="form-control bor3" id="roomAge">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-3 control-label mt10">是否装修：</label>
                        <div class="col-sm-4 mt4">
                            <label class="radio-inline">
                                <input checked="checked"   data-val="true" data-val-required="Gender 字段是必需的。"  name="renovationint" type="radio" value="1" /> <span>是</span>
                            </label>
                            <label class="radio-inline">
                                <input     data-val="true" data-val-required="Gender 字段是必需的。"  name="renovationint" type="radio" value="0" /><span>否</span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="roomStructure" class="col-sm-3 control-label mt10">几室几厅：</label>
                        <div class="col-sm-4 mt4">
                            <input type="text"  check-type="required" class="form-control bor3" name="roomStructure" id="roomStructure">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="roomArea" class="col-sm-3 control-label mt10">房屋面积大小：</label>
                        <div class="col-sm-4 mt4">
                            <input type="text" check-type="required" check-type="required" class="form-control bor3" name="roomArea" maxlength="4" id="roomArea">
                        </div>
                        <div class="col-sm-4 mt4">
                            <span id="roomArea_info"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="allFloor" class="col-sm-3 control-label mt10">房屋楼层数：</label>
                        <div class="col-sm-4 mt4">
                            <input type="text" check-type="required" class="form-control bor3" name="allFloor" id="allFloor">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="isFloor" class="col-sm-3 control-label mt10">房屋所在楼层：</label>
                        <div class="col-sm-4 mt4">
                            <input type="text" check-type="required" class="form-control bor3" name="isFloor" id="isFloor">
                        </div>

                    </div>


                    <div class="form-group">
                        <label class="control-label col-sm-3">上传房屋图片:</label>
                        <div class="col-sm-8">
                            <input type="file" id="uploadimage" style="display: initial;" value="" name="upload" class="btn btn-default btn-cus" onchange="showPreview(this)"/>

                            <p>支持JPG、JPEG、PNG格式 / 大小不超过1M</p>
                        </div>
                        <div class="avatar-upload">
                            <div class="avatar-pic" id="avatar-box" style="cursor:pointer;text-align: center;">
                                    <img  src="${pageContext.request.contextPath}/img/loading.gif" width="50%"  height="60%" id="ownerRoomPhoto"   />
                            </div>


                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-4 mt18">
                            <input type="submit" id="btn_addRentGet"  class="btn  btn-primary btn-cflat btn-valid bor3" value="提交" />
                            <a href="/" class="btn btn-default btn-cflat bor3 ml10">取消</a>
                        </div>
                    </div>
                    <div class="bk30"></div>
                </div>
            </div>
         </form>
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
        $("#roomPrice").on("keyup", function(){
            var valid = /^\d{0,8}(\.\d{0,2})?$/.test(this.value),
                val = this.value;
            $("#price_info").html(" ");
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
            $("#roomArea_info").html(" ");
            if(!valid){
                $("#roomArea_info").css("color","red").html("请输入数字表示面积大小");
                this.value = val.substring(0, val.length - 1);
            }
        });
    });


</script>


<script>

    function checkForm() {
        var userId =  $("#userId").val();
        var uname = $("#uname").val();
        var phone = $('#phone').val();
        var roomAge = $('#roomAge').val();
        var roomStructure = $('#roomStructure').val();
        var allFloor = $('#allFloor').val();
        var isFloor = $('#isFloor').val();
        var roomPrice = $('#roomPrice').val();
        var roomArea = $('#roomArea').val();
        var addr = addrShow.value;
        $('#roomAddress1').val(addr);
        var roomDesc = $("#roomDesc").val();
        var renovationint = $("input[name='renovationint']:checked").val();
        if (userId == null || userId ==''||uname == null || uname =='') {
            alert("请先登录！");
            return false;
        }
        else if( userId == null || userId ==''||isFloor == null || isFloor ==''|| allFloor == null || allFloor ==''||addr == null || addr ==''||roomArea == null || roomArea ==''||roomPrice == null || roomPrice ==''||roomStructure == null || roomStructure ==''||renovationint == null || renovationint =='' ||roomAge == null || roomAge =='' || phone == null || phone =='' || uname == null || uname =='' || roomDesc == null || roomDesc =='') {
            alert("不能为空，请按照正确格式填写！");
            return false;
        }else {
            return true;
        }
    }

    //头像上传
    function showPreview(source) {
        var file = source.files[0];
        if(window.FileReader) {
            var fr = new FileReader();
            console.log(fr);
            // var icon = document.getElementById('icon');
            var bigIcon = document.getElementById('ownerRoomPhoto');
            fr.onloadend = function(e) {
                // icon.src = e.target.result;
                bigIcon.src = e.target.result;
            };
            fr.readAsDataURL(file);
            icon.style.display = 'block';
        }
    }


</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/ntkfstat.js" charset="utf-8"></script>
</body>
</html>
