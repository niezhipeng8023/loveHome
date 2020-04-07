<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/1
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">

    <title>恋家短租</title>
    <meta name="keywords" />
    <meta name="description" />


    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.bundle.css">
    <style>
        .city-selection .city-cur1 {
            color: #fff;
            font-size: 12px;
        }

        element.style {
            background-color:  rgb(63, 203, 192);
            width: 1519px;
            position: relative;
            left: 0px;
            top: 0px;
            z-index: 999;
            opacity: 1;
        }
    </style>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.bundle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset-chatBox.css">

</head>
<body>

<div class="page-wrap">

    <div class="page-main" id="page-main">
        <!-- header -->
        <jsp:include page="header.jsp"></jsp:include>

        <div class="banner-slider js-banner-slider">
            <ul class="slider-list">
                <li style="background-color:rgb(63, 203, 192)" class="item" data-banner-id="287">
                    <a href="${pageContext.request.contextPath}/rentout/findRentOut" target="_blank">
                        <img src="/Content/img/loading-jd.gif" data-original="${pageContext.request.contextPath}/img/PR.2.jpg" width="1170" height="300">
                    </a>
                </li>

            </ul>
        </div>
        <div class="search-box">
            <div class="container">
                <div class="search-tool">
                    <form action="${pageContext.request.contextPath}/main/toIndex">
                        <input type="search" placeholder="请输入区域、商圈或小区名" class="search-ipt" name="keywords" id="search-ipt">
                        <input type="submit" value="搜索" class="icon-search-btn search-btn js-search-btn" data-target="#search-ipt">
                    </form>
                </div><a href="${pageContext.request.contextPath}/main/toShowMap" class="sprites icon-map search-by-map"><span class="text-hidden">地图找房</span></a>
                <div class="hot-area">
                    <span><b>热门区域：</b></span>
                </div>
            </div>
        </div>
        <div class="res-selected">
            <div class="res-selected-inner">
                <div class="res-selected-tab">
                    <h2 class="tit tab-btn">今日精选房源</h2>
                    <a href="" class="tab-btn">
                        <h2 class="tit">&nbsp;</h2>
                    </a>
                </div>
                <ul class="gallery">
                    <c:forEach var="room" items="${rooms}">
                        <li class="gallery-item">
                            <div class="item-img">
                                <a href="${pageContext.request.contextPath }/rentout/findRoomById/${room.rgId}" target="_blank"><img src="${pageContext.request.contextPath}/upload/${room.roomPicture}" width="318" height="212"></a>
                            </div>
                            <div class="item-desc">
                                <span class="item-tag item-tag-standard"></span>
                                <div class="item-text">为恋家统一标准化装修，多属房龄较短的电梯公寓，在裸房基础上完成精装全配。</div>
                                <a href="${pageContext.request.contextPath }/rentout/findRoomById/${room.rgId}" target="_blank" title="${room.roomAddress}步行街附近 公交直达世纪城 中心美地 ${room.roomDesc}" class="item-tit">${room.roomAddress}步行街附近 公交直达 交通方便 中心美地</a>
                            </div>
                            <div class="item-info">
                                <div class="item-loc"><i class="sprites icon-loc"></i>${room.roomAddress}</div>
                                <div class="item-price"><span><sub>￥</sub>${room.roomPrice}</span>元/月</div>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </div>
        </div>

        <div class="reason">
            <h2 class="reson-tit"><span class="text-hidden">选择恋家的理由 top5</span></h2>
            <ul class="reason-list">
                <li>
                    <i class="sprites reason-price"></i>
                    <h4>无中介费</h4>
                    <p>网上看房 拎包入住</p>
                </li>
                <li>
                    <i class="sprites reason-young"></i>
                    <h4>年轻人</h4>
                    <p>我们追求 生活品质</p>
                </li>
                <li>
                    <i class="sprites reason-real"></i>
                    <h4>真实房源</h4>
                    <p>凭证齐全 一房一价</p>
                </li>
                <li>
                    <i class="sprites reason-wifi"></i>
                    <h4>无线wifi</h4>
                    <p>光纤网络 基情LOL</p>
                </li>
                <li>
                    <i class="sprites reason-service"></i>
                    <h4>维修保洁</h4>
                    <p>提供各类管理服务</p>
                </li>
            </ul>
        </div>
        <div class="adv">
            <div class="adv-inner">
                <div class="adv-item">
                </div>
                <div class="adv-item">
                </div>
                <div class="adv-item">
                    <a href="javascript:;" id="video-wrap" data-video-type="mp4" data-src="http://video.uoko.com/uoko_joinus_2016.mp4" data-video-width="525" data-video-height="330">
                        <img src="${pageContext.request.contextPath}/img/w2w.jpg" data-original="../img/vedio_poster.jpg" width="525" height="330">
                    </a>

                </div>
                <div class="adv-item">
                    <a href="javascript:;">
                        <img src="${pageContext.request.contextPath}/img/w3w.jpg" data-original="https://image-old.uoko.com/Upload/ShareImages/2014-12-31/2a5af010-dc19-49ed-931d-9f01e671b55a.jpg" wid width="525" height="330" alt="恋家短租">
                    </a>
                </div>
            </div>
        </div>
        <div class="instr">
            <ul class="instr-list">
                <li class="sprites instr-quanlity">
                    <h4 class="text-hidden">品质</h4>
                    <p class="text-hidden">时尚装修 品牌家电 wifi覆盖</p>
                </li>
                <li class="sprites instr-secure">
                    <h4 class="text-hidden">安全</h4>
                    <p class="text-hidden">租客认证 品质小区 一客一锁</p>
                </li>
                <li class="sprites instr-serve">
                    <h4 class="text-hidden">服务</h4>
                    <p class="text-hidden">定期保洁 月付租金 及时维修</p>
                </li>
                <li class="sprites instr-prom">
                    <h4 class="text-hidden">承诺</h4>
                    <p class="text-hidden">100%真实房源 通俗公示 一房一价</p>
                </li>
            </ul>
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
        with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = '../js/share.js'];

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



<script src="${pageContext.request.contextPath}/js/index.bundle.js"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/ntkfstat.js" charset="utf-8"></script>
</body>
</html>
