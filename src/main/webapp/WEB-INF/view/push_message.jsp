<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/1
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">

    <title>恋家短租投诉公示</title>
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



    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/about_migrate.css">
    <link href="${pageContext.request.contextPath}/css/jquery-confirm.css" rel="stylesheet" />
    <style>
        .MainBg {
            padding-bottom: 107px;
        }
    </style>


</head>
<body>
<div class="page-wrap">

    <div class="page-main" id="page-main">
        <!-- header -->
        <jsp:include page="header.jsp"></jsp:include>



        <div class="MainBg">


            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/main/toIndex">首页</a></li>
                    <li class="active">投诉及留言</li>
                </ol>

                <div class="contact-content contact-publicity-content" >
                    <div class="cont">
                        <h3>投诉方式</h3>
                        <ul class="desc">
                            <li><span>•</span>在线投诉：恋家官网 > 投诉建议</li>
                            <li><span>•</span>微信投诉：关注官方微信“恋家短租”-自助服务内申报投诉</li>
                            <li><span>•</span>电话投诉：客服电话：10**52*8</li>
                        </ul>
                        <div class="pub-pic">
                            <!--      <img src="../img/complainNotice.png" alt="投诉公示" />-->
                        </div>
                    </div>
                </div>
                <div class="contact-content contact-publicity1-content">
                    <div class="tab-content WhiteBg cantact">
                        <div class="tab-pane connect in active" id="contact_mess">
                            <div class="can-title">
                                <h3>我要留言</h3>
                                <h6>COMPLAINTS</h6>
                            </div>
                            <div class="contact_message">
                                <h6 class="mini text-brown"></h6>
                                <h4 class="title text-brown"></h4>
                                <div class="bk10"></div>
                                <input type="hidden" name="options" id="option3" value="3" />
                                <input type="hidden" id="op" />
                                <div class="form" role="form">
                                    <div class="row">
                                        <form id="messageCont">
                                            <input type="hidden" id="UID" name="uid" value="${user.id}" />
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="Title" class="AreaText"><span>* </span>标题：</label>
                                                    <input type="text" id="Title"  data-valihint="取个标题吧" class="form-control message_content" check-type="required"  />
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="UOKOTALK" class="AreaText"><span>* </span>我想说的是：</label>
                                                    <textarea id="UOKOTALK" name="Content" data-valihint="写你要说的内容" class="form-control message_content" rows="8" check-type="required" type="text"></textarea>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="UOKOUSER" class="AreaText"><span>* </span>姓名：</label>
                                                    <input id="UOKOUSER" type="text" name="UserName" data-valihint="一定要写姓名哦" class="form-control message_content" check-type="required" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="UOKOUSERPHONE" class="AreaText"><span>* </span>联系方式：</label>
                                                    <input id="UOKOUSERPHONE" type="text" name="Phone" data-valihint="留下联系方式吧" class="form-control message_content" check-type="required tel" />
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="bk10"></div>
                                    <button id="btnSubmitMessage" type="button" class="btn btn-lg btn-blue btn-contact btn-valid">提交留言</button>
                                </div>

                            </div>
                        </div>
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
            $('#customer-service-img').attr('src', '../img/serv_hover.gif');

        }, function () {

            $('#customer-service-img').attr('src', '../img/serv.gif');
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

<script src="${pageContext.request.contextPath}/js/jquery-confirm.min.js"></script>
<script src="${pageContext.request.contextPath}/js/validation.min.js"></script>

<script type="text/javascript">
    $(function () {

        $("#btnSubmitMessage").click(function (e) {


            var top = $(window).scrollTop();
            var valid = $("#contact_mess").validation();
            var _data = {
               // CityName: $("#UOKOCITY").find("option:selected").text(),
                title:$('#Title').val(),
                content: $("#UOKOTALK").val(),
                uname: $("#UOKOUSER").val(),
                uid:$("#UID").val(),
                phone: $("#UOKOUSERPHONE").val(),
            };
            if (valid.valid()) {
                var btn = $(this);
                btn.prop({ "disabled": "disabled" }).text("loading");
                $.ajax({
                    url: '${pageContext.request.contextPath}/message/addMessage',
                    type: 'post',
                    data: _data,
                    dataType: 'json',
                    success: function (res) {
                        $.confirm({
                            title: false,
                            content: '您已提交成功，<br/>谢谢您的支持！',
                            confirmButton: "我知道了",
                            cancelButton: false,
                            confirmButtonClass: 'btn-blue',
                            closeIcon: true
                        });

                        btn.text("提交留言").removeAttr("disabled");
                        $("#Title").val("");
                        $("#UOKOTALK").val("");
                        $("#UOKOUSER").val("");
                        $("#UOKOUSERPHONE").val("");
                    }
                });
            }

            $(window).scrollTop(top);
            e.preventDefault();
            return false;
        });

        var msg = '';
        if (msg) {
            alert(msg);
        }
    })
</script>


<script type="text/javascript" src="../js/ntkfstat.js" charset="utf-8"></script>
</body>
</html>
