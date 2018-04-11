<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>商城首页</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=2.0, user-scalable=1"> -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="layoutmode" content="standard">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="renderer" content="webkit">
    <!--uc浏览器判断到页面上文字居多时，会自动放大字体优化移动用户体验。添加以下头部可以禁用掉该优化-->
    <meta name="wap-font-scale" content="no">
    <meta content="telephone=no" name="format-detection"/>
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <%--<link rel="stylesheet" type="text/css" href="/resources/css/fontsIco.min.css"/>--%>
    <link rel="stylesheet" type="text/css" href="/resources/css/front_base.min.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bannerAnimation.min.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/2002_1.min.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css"/>

    <!-- //横向标签样式css -->
    <style id='mobiTabStyleCss'>
        .fk-tabStyle2 .f-formTabButtonList .formTabButtonClick {
            border-bottom-color: #f23030;
        }

        .fk-tabStyle2 .f-formTabButtonList .formTabButtonClick {
            color: #f23030;
        }

        .fk-tabStyle1 div.formTabButtonClick .f-formTabMiddle {
            background-color: #f23030;
        }
    </style>
    <!-- //输出模块样式css -->
    <style id='mobiStyleModule'>
        #module317 {
            padding: 0px;
        }

        #module317 {
            margin-left: 0px;
        }

        #module317 {
            margin-right: 0px;
        }

        #module317 {
            margin-top: 0px;
        }

        #module317 {
            margin-bottom: 0px;
        }
    </style>
    <style id='mobiStyleNav' type='text/css'>
        .open .navItem:nth-child(2) {
            transition-delay: 160ms;
        }

        .open .navItem:nth-child(4) {
            transition-delay: 240ms;
        }

        .open .navItem:nth-child(6) {
            transition-delay: 320ms;
        }
    </style>


    <style id='mobiCubeStyleModule'>
    </style>

    <style id='mobiSearchStyleModule'>
    </style>

    <!-- //按钮样式css -->
    <style id='mobiFloatBtnCss'>
        .form .floatBtnStyle0 .middle {
            background-color: #f23030;
        }

        .form .floatBtnStyle1 .middle {
            background-color: #f23030;
        }

        .form .floatBtnStyle2 .middle {
            border-color: #f23030;
            color: #f23030;
        }

        .form .floatBtnStyle3 .middle {
            background: -webkit-linear-gradient(bottom, #f23030 10%, rgba(248, 151, 151, 1));
            background: -webkit-linear-gradient(bottom, #f23030 10%, rgba(248, 151, 151, 1));
        }

        .form .floatBtnStyle4 .middle {
            background: -webkit-linear-gradient(bottom, #f23030 10%, rgba(248, 151, 151, 1));
            background: -webkit-linear-gradient(bottom, #f23030 10%, rgba(248, 151, 151, 1));
            border-color: #f23030;
        }
    </style>
    <style id='mobiBackTopBtnCss'>
        .backTop .backTop_icon.icon-backTop0 {
            background-color: #f23030;
            color: #fff;
        }

        .backTop .backTop_icon.icon-backTop1 {
            background-color: #fff;
            color: #f23030;
        }

        .backTop .backTop_icon.icon-backTop2 {
            background-color: #fff;
            color: #f23030;
            border-color: #f23030;
        }
    </style>

    <!-- 输出底部样式 -->
    <style id='fixedAreaBoxStyle'>
        .webFooterBox .ui-calendar-calendar .ui-state-active {
            background-color: #f23030;
        }

        .webFooterBox .ui-calendar-calendar .ui-calendar-startDate {
            background-color: #f23030;
        }

        .webFooterBox .ui-calendar-prev:after {
            color: #f23030;
        }

        .webFooterBox .ui-calendar-next:after {
            color: #f23030;
        }

        .webFooterBox .fk-calendarNav {
            background-color: #f23030;
        }

        .mallFixNavWrap .mallNavBtn {
            width: 33%;
        }

        div.fixedAreaBox .themeColor {
            color: #f23030;
        }

        div.fixedAreaBox .themeBgColor {
            background-color: #f23030;
        }

        .fixedAreaBox .f-navCheck .icon-navItemIcon {
            color: #f23030;
        }

        .fixedAreaBox .f-navCheck .mallNavBtnText {
            color: #f23030;
        }
    </style>
    <!-- 系统特殊隐藏栏目隐藏头部、banner -->
</head>
<body faiscoMobi="true" id="g_body" class="g_locale2052 mobiCol3">

<script type="text/javascript">
    (function () {
        var fs = document.createElement("script");
        fs.src = "//fe.faisys.com/jssdk_1_0/js/hawkEye.min.js?v=201712051200";
        window.FAI_HAWK_EYE = {};
        window.FAI_HAWK_EYE.jssdk_report_url = "//report.fkw.com/js/report";
        window.FAI_HAWK_EYE.jssdk_appid = 3003;
        window.FAI_HAWK_EYE.fai_aid = 16487128;
        window.FAI_HAWK_EYE.fai_bs_aid = 16487128;
        window.FAI_HAWK_EYE.fai_bs_id = 0;
        window.FAI_HAWK_EYE.fai_bs_wid = 0;
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(fs, s);
    })();</script>

<script type="text/javascript">
    //html root的字体计算应该放在最前面，这样计算就不会有误差了/
    //2016.3.23 wjq update 之所以要加个判断返回一个20.5，是因为当用户在谷歌等浏览器直接输入手机端网站网址时，如果用户设置模块自定义样式的高度比较小，由于这时候的clientWidth为1920px，及返回的_htmlFontSize为40，这时候就会使模块太小，展示不完全，因此先取一个较为准确的值去展示。Mobi.resetHtmlFontSize()顺便也加了
    var _htmlFontSize = (function () {
        var clientWidth = document.documentElement ? document.documentElement.clientWidth : document.body.clientWidth;
        //if(clientWidth > 768) clientWidth = 768;
        if (clientWidth > 768 && clientWidth < 1280) {
            clientWidth = 768;
        } else if (clientWidth >= 1280) {
            clientWidth = 512;
        }
        document.documentElement.style.fontSize = clientWidth * 1 / 16 + "px";
        return clientWidth * 1 / 16;
    })();

</script>


<%--<div id="webTips" class="webTips jz-webTips">--%>
    <%--<div id="mobitips" class="mobitips">--%>
        <%--<div class="mobiScrollbar">--%>
            <%--<div class="j-marqueeContainer J_marqueeContainer">--%>
                <%--<ul class="marquee J_marquee" id="mobiTipsMarquee">--%>
                    <%--<li>--%>
                        <%--<div class='sitetipsTitle'>商城为 <a class='sitetipsIcon siteGroupBiz' style='color:red;'--%>
                                                          <%--target='_blank' hidefocus='true'--%>
                                                          <%--href='http://www.faisco.cn/portal.jsp#appId=shop'--%>
                                                          <%--title='点击查看详细功能列表'>商城基础版</a> 功能，6天后将自动失效。--%>
                        <%--</div>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<%--<style type="text/css">--%>
    <%--.mobiTipsStyle {--%>
        <%--margin-top: 1.5rem;--%>
    <%--}--%>

    <%--.mobiTipsBannerStyle {--%>
    <%--}--%>

    <%--.detailHeaderColor.detailHeaderColor {--%>
        <%--top: 1.5rem;--%>
    <%--}--%>
<%--</style>--%>


<div class="webLeft"></div>
<div id="g_web" class="g_web">
    <!-- this is loading  -->
    <div id="webLoading" class="loading" style='display:none;'>
        <div id="splashscreen" class='splashscreen ui-loader'>
            <span class='ui-icon ui-icon-loading spin'></span>
        </div>
    </div>
    <div id="webTopBox" class="webTopBox  ">
        <div id="webTop" class="webTop mobiTipsStyle">


        </div>
    </div>
    <div id="webHeaderBox" class="webHeaderBox    mobiTipsStyle">
        <div id='webHeader' class='webHeader webHeaderBg '>
            <div id='mallThemeHeader' class='mallThemeHeader 2002  mallThemeHeaderStyle0'>
                <div id='headerBgArea' class='headerBgArea'>
                    <div class='jz_top_wrapper J_top_wrapper'><a id='pageLogoImg' href='/' class='f_logo'
                                                                 style='border:0.1rem solid rgba(256, 256, 256, 0.6);background-clip:content-box;border-radius:5px;background-image:url(//15957144.s61i.faiusr.com/2/AD0ImPnNBxACGAAgx-T60gUorMX_7gcw9QE4oAE!160x160.jpg);'></a>
                        <div class='f_input_box'><i class='f_icon_conter faisco-icons-S000182'></i><input
                                onclick='Mobi.popupSearch({lanCode: " ",nSL: "[]", hotTopic: [], searchProduct: 1, searchTip: "搜索", moduleType: 0, moduleColor: "#aaa", historySearch: 1})'
                                ; placeholder=搜索/></div>
                        <div class='f_top_right J_top_right'><a href='/pg.jsp?entry=mallNav&pgs=4'><i
                                class='faisco-icons-S000183'></i></a></div>
                    </div>
                </div>
                <div class='headerHandlerArea'>
                    <div class='logoArea'><a href='/'><span class='pageLogo   ' id='pageLogoMall' sid='3' pw='245'
                                                            ph='160'><div id='pageLogoImgMall' class='logoImg '
                                                                          style='border:0.1rem solid rgba(256, 256, 256, 0.6);background-clip:content-box;border-radius:5px;background-image:url(//15957144.s61i.faiusr.com/2/AD0ImPnNBxACGAAgx-T60gUorMX_7gcw9QE4oAE!160x160.jpg);'></div></span></a>
                    </div>
                    <div class='titleMallArea'>
                        <div class='titleArea'><span class='pageTitle'><h1
                                style='font-weight:normal; font-size: inherit; display: inline-block;'><a
                                id='pageTitleMall' href='/' style='color:inherit;'>网站模板—茶叶酒类</a></h1></span></div>
                        <%--<div class='mallUserBtnArea'>--%>
                            <%--<a style='display:block' href='pr.jsp' hidefocus='true'--%>
                                                        <%--class='headerItemMenu  allProducts'>--%>
                            <%--<div class='headerMenuNum'><span class='icon-allProductIcon'></span><span--%>
                                    <%--class='allProductNumText'>30</span></div>--%>
                            <%--<span class='headerMenuText'>全部商品</span></a>--%>
                            <%--<a style='' href='profile.jsp' hidefocus='true'--%>
                                                                           <%--class='headerItemMenu  userCenter'>--%>
                            <%--<div class='headerMenuIcon icon-headerMenuIcon'></div>--%>
                            <%--<span class='headerMenuText'>会员中心</span></a>--%>
                            <%--<a style='' class='headerItemMenu myOrder'--%>
                                                                           <%--href='mlist.jsp'>--%>
                            <%--<div class='headerMenuIcon icon-headerMenuIcon'></div>--%>
                            <%--<span class='headerMenuText'>我的订单</span></a>--%>
                        <%--</div>--%>
                    </div>
                    <div class='headerMenuBg'></div>
                </div>
            </div>
        </div>


    </div>

    <div id="webBannerBox" class="webBannerBox   mobiTipsBannerStyle">

        <div class="multilingualArea" id="webMultilingualArea">
            <div class='multilingual'></div>
        </div>
        <div id='webBanner' class='webBanner'></div>
    </div>
    <div id="webContainerBox" class="webContainerBox" style="overflow:visible;">
        <div id="webModuleContainer" class="webModuleContainer">
            <div id='module317' class='form Handle  formStyle3 ' _autoHeight='1' _height='0' _width='0' _autoWidth='1'
                 _bHeight='0' _inTab='0' style=''>
                <div _bannerAutoHeight='1' class='formBannerTitle formBannerTitle317'>
                    <div class='titleLeft titleLeft317'>
                    </div>
                    <div class='titleCenter titleCenter317'>
                        <div class='titleText titleText317'>
                            <div class='titleTextIcon icon-titleText'>&nbsp;</div>
                            <div class='textContent'>热销产品</div>
                        </div>
                        <div class='formBannerMore formBannerMore317'></div>
                    </div>
                    <div class='titleRight titleRight317'>
                    </div>
                </div>
                <div class='formMiddle formMiddle317'>
                    <div class='middleLeft middleLeft317'>
                    </div>
                    <div class='middleCenter middleCenter317'>
                        <div class='formMiddleContent formMiddleContent317 moduleContent' _innerType='0'>
                            <div class='fk-productListTitle mProductList fk-mProductList1' id='mProductList317'
                                 mType='1'>
                                <c:forEach items="${productList}" var="product">
                                    <div topClassName='productListTopIcon' topSwitch='on' productId='${product.id}'
                                         productName='${product.name}' style="float: left"
                                         class='mProductTileForm mProductTileFormForStyle1 '
                                         id='mProductTileForm14_module317'>
                                        <a href='/product/${product.id}'>
                                            <div class='imgClass_160' id='imgClass14module317'>
                                                <span class='imageMiddle'></span>
                                            <div class='fk-productListImgWrap'>
                                                <img alt='${product.name}' class='style1Img photoListImg' src="${product.image}"
                                                     data-original='${product.image}'/>
                                            </div>
                                            </div>
                                            <div class='paramCollection'>
                                                <p class='g_link paramName paramNowrap textAlign_left'>${product.name}</p>
                                                <p class='g_link productParam paramWrap textAlign_left'>
                                                    <span class='productParamKey'>容量：</span>${product.rongLiang}ml</p>
                                                <p class='f-mallPriceWrap g_link productParam paramWrap textAlign_left'>
                                                    <span class='productParamKey'>价格：</span>
                                                    <span class='mallPrice'>￥${product.price}</span>
                                                <%--<span class='glyphicon glyphicon-shopping-cart'></span>--%>
                                                </p>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                            <div id='productMallOptionPanel_mcs_317' style='display:none;'>
                                <div class='productMallOptionPanel' moduleId='317'>
                                    <div class='productMallOptionContentPanel'>
                                        <div class='productMallOptionContent'>
                                            <div class='productDetailClose icon-Off g_iconMiddle icon-defaultColor'
                                                 style='cursor: default;z-index: 2;'></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--<div id='pagenation317' class='pagenation'>--%>
                            <%--<div class='pagePrev icon-pagePrev icon-cnListP'><a hidefocus='true' class=''--%>
                            <%--href='/index.jsp?m317pageno=1&isAjaxLoadingPage=true#module317'--%>
                            <%--onclick='Mobi.ajaxClick(this, 317);return false;'></a>--%>
                            <%--</div>--%>
                            <%--<div id='pagenationSelectDiv317' class='pagenationSelectDiv'><select class='pageSelect'--%>
                            <%--onchange='Mobi.ajaxClick(this, 317, true);return false;'>--%>
                            <%--<option class='pageOptions'--%>
                            <%--value='/index.jsp?m317pageno=1&isAjaxLoadingPage=true#module317'>1&nbsp;&nbsp;/&nbsp;&nbsp;4--%>
                            <%--</option>--%>
                            <%--<option class='pageOptions' selected='selected' value='#'>2&nbsp;&nbsp;/&nbsp;&nbsp;4</option>--%>
                            <%--<option class='pageOptions'--%>
                            <%--value='/index.jsp?m317pageno=3&isAjaxLoadingPage=true#module317'>3&nbsp;&nbsp;/&nbsp;&nbsp;4--%>
                            <%--</option>--%>
                            <%--<option class='pageOptions'--%>
                            <%--value='/index.jsp?m317pageno=4&isAjaxLoadingPage=true#module317'>4&nbsp;&nbsp;/&nbsp;&nbsp;4--%>
                            <%--</option>--%>
                            <%--</select></div>--%>
                            <%--<div class='pageNext icon-pageNext icon-cnListN'><a hidefocus='true' class=''--%>
                            <%--href='/index.jsp?m317pageno=3&isAjaxLoadingPage=true#module317'--%>
                            <%--onclick='Mobi.ajaxClick(this, 317);return false;'></a>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                    <div class='middleRight middleRight317'>
                    </div>
                </div>
            </div>

            <!--预约面板-->
            <div id="bookingPanelTriggle"></div>
        </div>
    </div>
    <%--<div id="webFooterBox" class="webFooterBox  ">--%>
        <%--<!--图片详情Div -->--%>

        <%--<div id='navbar' class='navbar '>--%>
            <%--<div id='navbarList' class='navbarList  navbarList-horizontalLayout  '>--%>
                <%--<div id='itemSep_3' class='itemSep'></div>--%>
                <%--<div id='navItem_3' class='navItem navItem_3 itemSelected icon-navItem'><a href='/index.jsp' _colid='3'--%>
                                                                                           <%--id='navbar_3'><span--%>
                        <%--class='navItemName'>首页</span></a></div>--%>
                <%--<div id='itemSep_13' class='itemSep'></div>--%>
                <%--<div id='navItem_13' class='navItem navItem_13  icon-navItem'><a href='/mcart.jsp' _colid='13'--%>
                                                                                 <%--id='navbar_13'><span--%>
                        <%--class='navItemName'>购物车</span></a></div>--%>
                <%--<div id='itemSep_23' class='itemSep'></div>--%>
                <%--<div id='navItem_23' class='navItem navItem_23  icon-navItem'><a href='pr.jsp' _colid='23'--%>
                                                                                 <%--id='navbar_23'><span--%>
                        <%--class='navItemName'>分类</span></a></div>--%>
            <%--</div>--%>
            <%--<div class='navLeft icon-navLeft'></div>--%>
            <%--<div class='navRight icon-navRight'></div>--%>
        <%--</div>--%>

        <%--&lt;%&ndash;<div id='webFooter' class='webFooter'>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div id='footer' class='footer mallThemeFooter'>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class='bottomdiv'>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class='bottom'>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class='backtop' onclick='Mobi.scrollToTop("webContainerBox")'>top<b></b></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class='footerMenu'>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class='footerMenuItem'><span class='footerMenuItemText homePage'><a class='homePageLink'&ndash;%&gt;--%>
                                                                                             <%--&lt;%&ndash;href='/index.jsp'&ndash;%&gt;--%>
                                                                                             <%--&lt;%&ndash;hidefocus='true'>主页</a></span>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class='footerMenuItem'><span class='footerMenuItemText memberCenter'><a&ndash;%&gt;--%>
                            <%--&lt;%&ndash;class='memberCenterLink' href='/profile.jsp' hidefocus='true'>会员中心</a></span></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class='footerMenuItem'><span class='footerMenuItemText siteVis'><a class='siteVisLink'&ndash;%&gt;--%>
                                                                                            <%--&lt;%&ndash;href='http://www.ru15797626.icoc.bz?_siteUrl'&ndash;%&gt;--%>
                                                                                            <%--&lt;%&ndash;target='_blank'&ndash;%&gt;--%>
                                                                                            <%--&lt;%&ndash;hidefocus='true'>电脑版</a></span>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class='footerMenuItem footLanguageItem'><span class='footerMenuItemText languageVis'>中文版</span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class='languageFullBg'></div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class='languageListPanel'>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<div class='langItem' value='/cn/index.jsp' currentLan='2052'><a class='langItemText'&ndash;%&gt;--%>
                                                                                             <%--&lt;%&ndash;href='/cn/index.jsp'>中文</a>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class='technical'>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class='technicalSupport footerInfo'><font face="Arial">©</font>2018 - 版权所有</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class='technicalSupport'><a href='http://mjz.faisco.com/?_ta=2508' target='_blank'&ndash;%&gt;--%>
                                                     <%--&lt;%&ndash;hidefocus='true'>本站使用&nbsp;<span class='faisco-icons-logo'></span>凡科建站&nbsp;搭建</a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span class='footerSep PcVer'>|</span><a class='PcVer'&ndash;%&gt;--%>
                                                                 <%--&lt;%&ndash;href='http://www.ru15797626.icoc.bz?_siteUrl'&ndash;%&gt;--%>
                                                                 <%--&lt;%&ndash;target='_blank' hidefocus='true'>电脑版</a><span&ndash;%&gt;--%>
                                <%--&lt;%&ndash;class='footerSep PcVer'>|</span><a class='rep PcVer'&ndash;%&gt;--%>
                                                                   <%--&lt;%&ndash;href='http://m.faisco.com/ts.jsp?acct=ru15797626'&ndash;%&gt;--%>
                                                                   <%--&lt;%&ndash;target='_blank' hidefocus='true'>举报</a></div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

            <%--&lt;%&ndash;&lt;%&ndash;<div id="mobiAdvertisement_box" class='mobiAdvertisement_box'>&ndash;%&gt;&ndash;%&gt;--%>

                <%--&lt;%&ndash;&lt;%&ndash;<a id="mobiAdvertisement_adImg" class="mobiAdvertisement_adImg webHeaderBg" target='_blank'&ndash;%&gt;&ndash;%&gt;--%>
                   <%--&lt;%&ndash;&lt;%&ndash;href="http://mjz.faisco.com/?_ta=2508">无需写代码，轻松建网站 >></a>&ndash;%&gt;&ndash;%&gt;--%>
                <%--&lt;%&ndash;&lt;%&ndash;<div class='mobiAdvertiseClose'>&ndash;%&gt;&ndash;%&gt;--%>
                    <%--&lt;%&ndash;&lt;%&ndash;<div id="mobiAdClose" class="mobiAdClose"></div>&ndash;%&gt;&ndash;%&gt;--%>
                <%--&lt;%&ndash;&lt;%&ndash;</div>&ndash;%&gt;&ndash;%&gt;--%>

            <%--&lt;%&ndash;&lt;%&ndash;</div>&ndash;%&gt;&ndash;%&gt;--%>


        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--<style id='mobiStyleService' type='text/css'>--%>
        <%--</style>--%>
        <%--<div id='webCustomerServiceBox' class='webCustomerServiceBox' style='display:none;'>--%>
            <%--<div class='customerServiceDiv' id='customerServiceDiv'></div>--%>
        <%--</div>--%>
        <%--<div class='webMapServiceBox fk-webMapServiceBox' id='webMapServiceBox'>--%>
            <%--<div style='display:table;height:100%;width:100%;border-collapse: collapse;'>--%>
                <%--<div style='display:table-row;'>--%>
                    <%--<div style='display:table-cell;'>--%>
                        <%--<div class='webMapHeader webHeaderBg'>--%>
                            <%--<div class='g_close icon-gClose' onclick='Mobi.closeMapService()'></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div style='height:100%;width:100%;display:table-row;'>--%>
                    <%--<div class='f-webMapIframeWrap'>--%>
                        <%--<iframe id='mobiSearchMapFrame' frameborder='0' width='100%' height='100%'--%>
                                <%--scrolling='auto'></iframe>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div id="fullScreenDivCotainer" class='fullScreenDivCotainer'></div>--%>
    <%--</div>--%>
    <div id="fixedAreaBox" class="fixedAreaBox fixedAreaBox2002_1" tplid="2002_1">
        <div class='mallFixNavWrap   fk-mallNavStyle4 '>
            <a class='J_mallNavBtn mallNavBtn f-navCheck  navItem_3' id='mallNavItem_3' href='/index.jsp' title='首页'>
                <div class='mallNavBtnText'><span class='glyphicon glyphicon-home'></span><span
                    class='mallNavText '>首页</span></div>
            </a>
            <a class='J_mallNavBtn mallNavBtn   navItem_13' id='mallNavItem_33' href='/mcart.jsp' title='积分'>
                <div class='mallNavBtnText'><span class='glyphicon glyphicon-heart-empty'></span><span
                        class='mallNavText '>积分</span></div>
            </a>
            <a class='J_mallNavBtn mallNavBtn   navItem_23' id='mallNavItem_23' href='pr.jsp' title='分类'>
                <div class='mallNavBtnText'><span class='glyphicon glyphicon-user'></span><span
                    class='mallNavText '>我</span></div>
            </a>

        </div>
    </div>


    <!--设置网站的背景颜色  start-->
    <div class="webBackgroundBox  ">
        <div id="webBodyBackground" class="webBackground "></div>
        <div id='navExistOffPanel' class='navExistOffPanel'></div>
    </div>
    <!--设置网站的背景颜色  end-->

    <!-- ------------------------------------------ -->
</div>
<div class="webRight"></div>
</body>
</html>

<%--<script type="text/javascript" language="javascript">--%>


    <%--//管理态下的预览页面提前作处理 之前这里的g_viewMode先去掉--%>
    <%--if (!false && window.top !== window.self) {--%>
        <%--var g_className = document.getElementById("g_body").className;--%>
        <%--document.getElementById("g_body").className = g_className + " ";--%>
    <%--}--%>

    <%--var _oem = false,--%>
        <%--_baiduBridgeCodes = "";--%>

    <%--//用于iframe显示手机模板的时候 给g_web加上width--%>
    <%--var g_webWidth = 0;--%>
    <%--if (g_webWidth == 0) {--%>
        <%--g_webWidth = window.localStorage ? localStorage.getItem("g_webWidth") : Cookie.read("g_webWidth");--%>
        <%--if (g_webWidth != null) {--%>
            <%--document.getElementById("g_web").style.width = g_webWidth + "px";--%>
        <%--}--%>
    <%--} else {--%>
        <%--document.getElementById("g_web").style.width = g_webWidth + "px";--%>
        <%--if (window.localStorage) {--%>
            <%--localStorage.setItem("g_webWidth", g_webWidth);--%>
        <%--} else {--%>
            <%--Cookie.write("g_webWidth", g_webWidth);--%>
        <%--}--%>
    <%--}--%>

<%--</script>--%>


<%--<script type="text/javascript" src="//mo.faisys.com/js/locale/2052.min.js?v=201802051418"></script>--%>
<%--<script type="text/javascript" charset="utf-8" src="//mo.faisys.com/js/jqmobi/jqmobi.min.js?v=201709041707"></script>--%>
<%--<script type="text/javascript" charset="utf-8" src="//mo.faisys.com/js/jqmobi/jqmobi_ui.min.js?v=201803191141"></script>--%>


<%--<script id="mobiOperationJS" type="text/javascript" charset="utf-8"--%>
        <%--src="//mo.faisys.com/js/mobi.min.js?v=201804031147"></script>--%>


<%--<script type="text/javascript">--%>
    <%--var _faiAjax = function () {--%>
        <%--//for regexp--%>
        <%--var r = /\?/;--%>
        <%--var _o = {--%>
            <%--type: "get",--%>
            <%--url: "",--%>
            <%--data: "",--%>
            <%--error: function () {--%>
            <%--},--%>
            <%--success: function () {--%>
            <%--}--%>
        <%--};--%>
        <%--var _sendRequest = function (o) {--%>
            <%--var xmlhttp = null;--%>
            <%--//init option code--%>
            <%--o.type = o.type || _o.type;--%>
            <%--o.url = o.url || _o.url;--%>
            <%--o.data = o.data || _o.data;--%>
            <%--o.error = o.error || _o.error;--%>
            <%--o.success = o.success || _o.success;--%>
            <%--if (window.XMLHttpRequest) {--%>
                <%--// code for IE7+, Firefox, Chrome, Opera, Safari--%>
                <%--xmlhttp = new XMLHttpRequest();--%>
            <%--} else {--%>
                <%--return;--%>
            <%--}--%>
            <%--//the instructions param takes the form of an eval statement--%>
            <%--if (o.type != "post") {--%>
                <%--o.url += ( this.r.test(o.url) ? "&" : "?" ) + o.data;--%>
                <%--xmlhttp.open("GET", o.url, true);--%>
                <%--xmlhttp.onreadystatechange = function () {--%>
                    <%--if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {--%>
                        <%--o.success(xmlhttp.responseText);--%>
                    <%--} else if (o.error) {--%>
                        <%--o.error();--%>
                    <%--}--%>
                <%--}--%>
                <%--xmlhttp.send();--%>
            <%--} else {--%>
                <%--xmlhttp.open("POST", o.url, true);--%>
                <%--//Send the proper header information along with the request--%>
                <%--xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");--%>
                <%--xmlhttp.onreadystatechange = function () {--%>
                    <%--if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {--%>
                        <%--o.success(xmlhttp.responseText);--%>
                    <%--} else {--%>
                        <%--o.error();--%>
                    <%--}--%>
                <%--}--%>
                <%--xmlhttp.send(o.data);--%>
            <%--}--%>
        <%--}--%>
        <%--return {--%>
            <%--ajax: function (option) {--%>
                <%--try {--%>
                    <%--//此次调用的错误不让抛出给window。防止函数重入--%>
                    <%--_sendRequest(option);--%>
                <%--} catch (e) {--%>
                    <%--//alert(e);--%>
                <%--}--%>
            <%--}--%>
        <%--};--%>
    <%--}();--%>
    <%--var _jsErrCahche = [];--%>
    <%--window.onerror = function (sMsg, sUrl, sLine) {--%>
        <%--if (typeof Mobi == 'undefined') {--%>
            <%--if ((window.DocumentTouch && document instanceof window.DocumentTouch) || 'ontouchstart' in document.documentElement) {--%>
                <%--alert('您的网页未加载完成，请尝试按“刷新”重新加载。');--%>
            <%--} else {--%>
                <%--alert('您的网页未加载完成，请尝试按“CTRL+功能键F5”重新加载。');--%>
            <%--}--%>

        <%--}--%>
        <%--if (sLine < 1 || typeof sMsg != 'string' || sMsg.length < 1) {--%>
            <%--return;--%>
        <%--}--%>

        <%--var log = "Error:" + sMsg + ";Line:" + sLine + ";Url:" + sUrl + ";UserAgent:" + navigator.userAgent;--%>
        <%--var alertLog = "Error:" + sMsg + "\n" + "Line:" + sLine + "\n" + "Url:" + sUrl + "\n";--%>
        <%--var encodeUrl = function (url) {--%>
            <%--return typeof url === "undefined" ? "" : encodeURIComponent(url);--%>
        <%--};--%>

        <%--var ajax = true;--%>
        <%--var obj = {'m': sMsg, 'u': sUrl, 'l': sLine};--%>
        <%--for (var i = 0; i < _jsErrCahche.length; i++) {--%>
            <%--if (_jsErrCahche[i].m == obj.m && _jsErrCahche[i].u == obj.u && _jsErrCahche[i].l == obj.l) {--%>
                <%--ajax = false;--%>
                <%--break;--%>
            <%--}--%>
        <%--}--%>

        <%--if (ajax) {--%>
            <%--_jsErrCahche.push(obj);--%>
            <%--_faiAjax.ajax({--%>
                <%--type: "post",--%>
                <%--url: "ajax/logJsErr.jsp?cmd=jsErr",--%>
                <%--data: 'msg=' + encodeUrl(log)--%>
            <%--});--%>
        <%--}--%>
        <%--if (false) {--%>
            <%--console.log(alertLog);--%>
        <%--}--%>
    <%--};--%>


    <%--if (typeof Fai == 'undefined') {--%>
        <%--Fai = {};--%>
        <%--//解决页面被嵌套在iframe的场景--%>

        <%--Fai.top = window;--%>

    <%--}--%>


    <%--Mobi.bookingBoxBind(false);--%>


    <%--Fai.top._isFaiHost = true;--%>

    <%--Fai.top._bannerData = {"showType": 0, "bn": 1, "b": [], "c": [], "h": false, "st": 6, "et": 1};  //横幅数据--%>
    <%--Fai.top._resRoot = '//mo.faisys.com';--%>
    <%--Fai.top._templateFrameId = 2002;--%>
    <%--Fai.top._templateLayoutId = 1;--%>
    <%--Fai.top._mobiSiteTitleChanged = 0; 	//用于记录网站标题是否有改动--%>
    <%--Fai.top._mobiSiteTitle = {--%>
        <%--"fontType": 0,--%>
        <%--"align": 0,--%>
        <%--"font": {"size": 12, "family": "", "colorType": 0, "color": "#000"},--%>
        <%--"bgType": "0",--%>
        <%--"bgFont": {"color": "#000", "alpha": 100},--%>
        <%--"bgImgFileId": "",--%>
        <%--"bgImgStyle": "1",--%>
        <%--"mbt": 0,--%>
        <%--"mbc": {"color": "#000", "alpha": 100},--%>
        <%--"mbi": "",--%>
        <%--"mbit": 1,--%>
        <%--"mths": 0,--%>
        <%--"name": "网站模板\u2014茶叶酒类",--%>
        <%--"mhl": 0,--%>
        <%--"mbip": "//2.ss.faisys.com/image/no-pic.jpg",--%>
        <%--"mti": 0--%>
    <%--};   	//网站标题数据--%>
    <%--Fai.top._onlineServiceJson = {--%>
        <%--"serviceId": {"serviceId": 6},--%>
        <%--"phone": {--%>
            <%--"open": false,--%>
            <%--"type": 1,--%>
            <%--"fName": "电话咨询",--%>
            <%--"phoneInfo": [{"name": "电话咨询", "number": ""}],--%>
            <%--"baseSetting": {--%>
                <%--"c": 0,--%>
                <%--"i": 0,--%>
                <%--"id": 0,--%>
                <%--"iconType": 0,--%>
                <%--"colIconType": 0,--%>
                <%--"colIconCusType": 0,--%>
                <%--"classname": "faisco-icons-call1",--%>
                <%--"content": "\\e62c",--%>
                <%--"color": "",--%>
                <%--"iconFileId": ""--%>
            <%--}--%>
        <%--},--%>
        <%--"sms": {--%>
            <%--"open": false,--%>
            <%--"name": "信息咨询",--%>
            <%--"number": "",--%>
            <%--"type": 2,--%>
            <%--"baseSetting": {--%>
                <%--"c": 0,--%>
                <%--"i": 0,--%>
                <%--"id": 0,--%>
                <%--"iconType": 0,--%>
                <%--"colIconType": 0,--%>
                <%--"colIconCusType": 0,--%>
                <%--"classname": "faisco-icons-mail1",--%>
                <%--"content": "\\e6a0",--%>
                <%--"color": "",--%>
                <%--"iconFileId": ""--%>
            <%--}--%>
        <%--},--%>
        <%--"map": {--%>
            <%--"open": false,--%>
            <%--"name": "在线地图",--%>
            <%--"city": "",--%>
            <%--"mark": "",--%>
            <%--"d_address": "",--%>
            <%--"type": 3,--%>
            <%--"baseSetting": {--%>
                <%--"c": 0,--%>
                <%--"i": 0,--%>
                <%--"id": 0,--%>
                <%--"iconType": 0,--%>
                <%--"colIconType": 0,--%>
                <%--"colIconCusType": 0,--%>
                <%--"classname": "faisco-icons-gps1",--%>
                <%--"content": "\\e67c",--%>
                <%--"color": "",--%>
                <%--"iconFileId": ""--%>
            <%--}--%>
        <%--},--%>
        <%--"msg": {--%>
            <%--"open": false,--%>
            <%--"name": "在线留言",--%>
            <%--"type": 4,--%>
            <%--"baseSetting": {--%>
                <%--"c": 0,--%>
                <%--"i": 0,--%>
                <%--"id": 0,--%>
                <%--"iconType": 0,--%>
                <%--"colIconType": 0,--%>
                <%--"colIconCusType": 0,--%>
                <%--"classname": "faisco-icons-message1",--%>
                <%--"content": "\\e6b2",--%>
                <%--"color": "",--%>
                <%--"iconFileId": ""--%>
            <%--}--%>
        <%--},--%>
        <%--"baiduBridge": {--%>
            <%--"open": false,--%>
            <%--"name": "百度商桥",--%>
            <%--"type": -1,--%>
            <%--"codes": "",--%>
            <%--"baseSetting": {--%>
                <%--"c": 0,--%>
                <%--"i": 0,--%>
                <%--"id": 0,--%>
                <%--"iconType": 0,--%>
                <%--"colIconType": 0,--%>
                <%--"colIconCusType": 0,--%>
                <%--"classname": "faisco-icons-scBdsq2",--%>
                <%--"content": "\\eada",--%>
                <%--"color": "",--%>
                <%--"iconFileId": "iconFileId"--%>
            <%--}--%>
        <%--},--%>
        <%--"weChat": {--%>
            <%--"open": false,--%>
            <%--"name": "微信客服",--%>
            <%--"type": -2,--%>
            <%--"code": "",--%>
            <%--"baseSetting": {--%>
                <%--"c": 0,--%>
                <%--"i": 0,--%>
                <%--"id": 0,--%>
                <%--"iconType": 0,--%>
                <%--"colIconType": 0,--%>
                <%--"colIconCusType": 0,--%>
                <%--"classname": "faisco-icons-M001038",--%>
                <%--"content": "\\eb25",--%>
                <%--"color": "",--%>
                <%--"iconFileId": ""--%>
            <%--}--%>
        <%--},--%>
        <%--"open": false,--%>
        <%--"order": []--%>
    <%--};//在线客服--%>
    <%--Fai.top._openOnlineService = false;--%>
    <%--Fai.top._manageMode = false;--%>
    <%--Fai.top.sessionMemberId = 1;--%>
    <%--Fai.top.memberName = "huyubo";--%>
    <%--Fai.top._colInfo = {--%>
        <%--"aid": 16487128,--%>
        <%--"wid": 0,--%>
        <%--"id": 3,--%>
        <%--"type": 3,--%>
        <%--"flag": 0,--%>
        <%--"moduleList": [317],--%>
        <%--"moduleHidden": [318, 319, 308, 310, 311, 312, 314, 315, 316, 309],--%>
        <%--"createTime": 1522803495000,--%>
        <%--"updateTime": 1516158540000,--%>
        <%--"authMemberLevelId": 0,--%>
        <%--"extId": 0,--%>
        <%--"other": {"pgt": 0, "pgb": {"type": 0, "catalogList": [], "s": 4}},--%>
        <%--"name": "首页",--%>
        <%--"defaultName": "首页",--%>
        <%--"url": "/index.jsp",--%>
        <%--"valid": true,--%>
        <%--"baseSetting": {--%>
            <%--"c": 0,--%>
            <%--"i": 0,--%>
            <%--"iconType": 0,--%>
            <%--"id": 0,--%>
            <%--"content": "",--%>
            <%--"classname": "",--%>
            <%--"color": "",--%>
            <%--"colIconType": 0,--%>
            <%--"colIconCusType": 0,--%>
            <%--"iconFileId": "",--%>
            <%--"jumpCtrl": {"ide": "", "columnType": 0}--%>
        <%--},--%>
        <%--"columnStyle": {"s": 7},--%>
        <%--"title": {--%>
            <%--"fontType": 0,--%>
            <%--"align": 0,--%>
            <%--"font": {"size": 12, "family": "", "colorType": 0, "color": "#000"},--%>
            <%--"bgType": "0",--%>
            <%--"bgFont": {"color": "#000", "alpha": 100},--%>
            <%--"bgImgFileId": "",--%>
            <%--"bgImgStyle": "1",--%>
            <%--"mbt": 0,--%>
            <%--"mhl": 0,--%>
            <%--"mbc": {"color": "#000", "alpha": 100},--%>
            <%--"mbi": "",--%>
            <%--"mbit": 1,--%>
            <%--"mti": 0,--%>
            <%--"mths": 0--%>
        <%--},--%>
        <%--"logo": {--%>
            <%--"i": "",--%>
            <%--"h": true,--%>
            <%--"a": 1,--%>
            <%--"style": 0,--%>
            <%--"marginType": 0,--%>
            <%--"margin": {"top": 0, "bottom": 0, "left": 0, "right": 0}--%>
        <%--},--%>
        <%--"banner": {"showType": 0, "h": false, "bn": 1, "b": [{"i": "1", "t": 0}], "st": 6, "et": 1, "c": []},--%>
        <%--"independent": false,--%>
        <%--"allowed": true,--%>
        <%--"selectable": true,--%>
        <%--"forbid": false--%>
    <%--};--%>
    <%--Fai.top._lcid = 2052;   // 当前的语言版本--%>
    <%--Fai.top._serviceList = [{--%>
        <%--"serviceType": "0",--%>
        <%--"serviceAccount": "",--%>
        <%--"showFont": "QQ客服",--%>
        <%--"showType": false,--%>
        <%--"isFontIcon": "true",--%>
        <%--"color": "rgb(238, 82, 102)",--%>
        <%--"fileId": "",--%>
        <%--"classname": "faisco-icons-scQq",--%>
        <%--"filePath": ""--%>
    <%--}, {--%>
        <%--"serviceType": "3",--%>
        <%--"serviceAccount": "",--%>
        <%--"showFont": "电话咨询",--%>
        <%--"showType": false,--%>
        <%--"isFontIcon": "true",--%>
        <%--"color": "rgb(46, 176, 99)",--%>
        <%--"fileId": "",--%>
        <%--"classname": "faisco-icons-scPhone",--%>
        <%--"filePath": ""--%>
    <%--}]; //商城主题在线客服--%>
    <%--Fai.top._mallService = 2;--%>
    <%--Fai.top.inTabMaqueeHelper = {}; // 记录标签模块内子模块的动画函数--%>
    <%--Fai.top._isBUser = false;--%>

    <%--Fai.top._webDebug = false; // 本地环境(独立开发也是true)--%>

    <%--Fai.top._jzProUrl = '';--%>
    <%--Fai.top._portalHost = '';--%>
    <%--Fai.top._homeHost = '';--%>


    <%--Fai.top._jzProUrl = 'jz.fkw.com';--%>
    <%--Fai.top._portalHost = 'www.faisco.cn';--%>
    <%--Fai.top._homeHost = 'www.faisco.com';--%>


    <%--jm(document).ready(function () {--%>


        <%--Mobi.ajaxLoadModuleDom(3, 0, {--%>
            <%--"_ajaxLoadModuleIDList": [],--%>
            <%--"fullUrl": "http://m.ru15797626.icoc.bz/index.jsp?m317pageno=2&isAjaxLoadingPage=true",--%>
            <%--"topBarOptionInfo": {"mobiMallOpen": true}--%>
        <%--});--%>


        <%--//判断该栏目是否被删除--%>
        <%--if (jm.isEmptyObject(Fai.top._colInfo)) {--%>
            <%--alert("该页面已经删除，点击确定后，将返回到首页");--%>
            <%--document.location.href = "/index.jsp"--%>
        <%--}--%>
        <%--//Mobi.viewPageBeforeInit();--%>
        <%--// 绑定退出事件--%>
        <%--jm(window).bind("load", function () {--%>

<%--//当前模块 start--%>

            <%--//Mobi.initSwipe('bannerSwipe',{"showType":0,"bn":1,"b":[],"c":[],"h":false,"st":6,"et":1});--%>
            <%--if (!Mobi.bannerAnimate.init({"showType": 0, "bn": 1, "b": [], "c": [], "h": false, "st": 6, "et": 1})) {--%>
                <%--Mobi.initBannerDefaultDom({"showType": 0, "bn": 1, "b": [], "c": [], "h": false, "st": 6, "et": 1});--%>
                <%--Mobi.initSwipe('bannerSwipe', {"showType": 0, "bn": 1, "b": [], "c": [], "h": false, "st": 6, "et": 1});--%>
            <%--}--%>
            <%--;--%>

            <%--//调整导航栏与g_web的top值--%>
            <%--//部分主题有css3动画，所以会导致计算失误，需要等css3动画执行完之后计算--%>
            <%--Mobi.autoFixGWebTop(1);--%>


            <%--Mobi.initBgmCookie();--%>


            <%--Mobi.initFooterHeight();--%>
        <%--});--%>

        <%--//手机视图初始化函数--%>
        <%--Mobi.initMobiPage({--%>
            <%--"id": 2002,--%>
            <%--"createTime": "2017-04-18",--%>
            <%--"preview": "//mo.faisys.com/image/template/2002/2002.jpg",--%>
            <%--"previewGif": "",--%>
            <%--"color": 0,--%>
            <%--"style": ["//mo.faisys.com/css/template/2002_1.min.css?v=201803121311", "//mo.faisys.com/css/template/2002_2.min.css?v=201803121311", "//mo.faisys.com/css/template/2002_3.min.css?v=201803121311", "//mo.faisys.com/css/template/2002_4.min.css?v=201803121311", "//mo.faisys.com/css/template/2002_5.min.css?v=201803121311", "//mo.faisys.com/css/template/2002_6.min.css?v=201803121311", "//mo.faisys.com/css/template/2002_7.min.css?v=201803121311", "//mo.faisys.com/css/template/2002_8.min.css?v=201803121311", "//mo.faisys.com/css/template/2002_9.min.css?v=201803121311"],--%>
            <%--"type": 0,--%>
            <%--"moduleStyle": 0,--%>
            <%--"designType": 2,--%>
            <%--"presetIndex": 0,--%>
            <%--"cube": 0,--%>
            <%--"layout": 1,--%>
            <%--"imagePage": 301,--%>
            <%--"backgroundImage": 0,--%>
            <%--"colors": [],--%>
            <%--"colorsName": []--%>
        <%--});--%>

        <%--// 取统计数据--%>
        <%--if (true) {--%>


            <%--Mobi.statisticalMobiVisitors({colId: 3, pdId: -1, ndId: -1, sc: 0, rf: "", statId: -1});--%>
            <%--if (!false) {--%>
                <%--//统计访问时长--%>
                <%--Mobi.mobiStatVisitTime();--%>
            <%--}--%>
        <%--}--%>

        <%--//前端性能数据上报--%>
        <%--Mobi.report();--%>

        <%--// 用于添加分销的标识码 dannel--%>
        <%--Mobi.addDistCode();--%>

        <%--Mobi.initShare('footerShareWeixin', 'footerShareWeibo', 'footerShareQQ');--%>
        <%--Mobi.initFooterLanguageEvent();--%>
        <%--Mobi.initFooterStyle({--%>
            <%--"fb": {"y": 0, "c": "", "f": "", "r": 0, "p": "", "ps": 0},--%>
            <%--"rt": {"y": 0, "s": -1, "f": "", "c": ""},--%>
            <%--"gt": {"y": 0}--%>
        <%--});--%>
        <%--Mobi.showQqBg();--%>
        <%--Mobi.showPhonesBg();--%>
        <%--Mobi.unLoadForWechat();--%>
        <%--Mobi.changeSiteTitleBg('null', 'null', 'null', 'null', 'null');--%>
        <%--Mobi.logoSizeCompressByMargin();--%>
        <%--Mobi.titlePositionRefreshByLogo();--%>
        <%--Mobi.bindTopIconBack();--%>
        <%--Mobi.showMallCartScreen(317, '￥', false, 100.0, "\x3cdiv class=\x27productMallOptionHead\x27\x3e\x3cdiv class=\x27productMallOptionImage\x27\x3e\x3cdiv class=\x27productMallOptionImageContent\x27\x3e\x3cspan class=\x22imageMiddleSpan\x22\x3e\x3c/span\x3e\x3cimg class=\x27mallOptionImg\x27 src=\x27\x27 /\x3e\x3c/div\x3e\x3c/div\x3e\x3cdiv class=\x27productDetail\x27\x3e\x3cdiv class=\x27productDetailName\x27\x3e\x3c/div\x3e\x3cdiv class=\x27productDetailMallAmount\x27\x3e\x3cdiv class=\x27productMallAmount\x27 style=\x27float:left\x27\x3e\x3c/div\x3e\x3cdiv class=\x27productMallWeight\x27 style=\x27float:left;margin-left:0.5rem;\x27\x3e\x3c/div\x3e\x3c/div\x3e\x3c/div\x3e\x3c/div\x3e\x3cdiv class=\x27g_separator separatorLine\x27\x3e\x3c/div\x3e\x3cdiv class=\x27mallOptionAndNumBox\x27 id=\x27mallOptionAndNumContainer\x27 \x3e \x3cdiv id=\x27mallOptionAndNumBox\x27 \x3e\x3cdiv class=\x27mallNewOptionBox mallOptionBox J-op-box\x27\x3e\x3c/div\x3e\x3cdiv class=\x27g_separator separatorLine\x27 style=\x27margin-left: 0.5rem;\x27\x3e\x3c/div\x3e\x3cdiv class=\x27productNumberPanel g_middleColor\x27\x3e\x3cspan\x3e购买数量\x3c/span\x3e\x3cdiv id=\x27limitAmountDiv\x27 style=\x27line-height:0.7rem;color:#828282;width:9rem;\x27\x3e\x3c/div\x3e\x3cdiv class=\x27productNumberContent\x27\x3e\x3cspan id=\x27g_decrease\x27 class=\x27g_decrease g_opacity50 icon-decrease g_iconMiddle\x27\x3e\x3c/span\x3e\x3cinput type=\x27number\x27 class=\x27g_buyNumber\x27 id=\x27productNum\x27 autocomplete=\x27off\x27 value=\x271\x27 min=\x271\x27 max=\x279999999\x27 /\x3e\x3cspan id=\x27g_increase\x27 class=\x27g_increase icon-increase g_iconMiddle\x27\x3e\x3c/span\x3e\x3c/div\x3e\x3c/div\x3e\x3c/div\x3e\x3c/div\x3e\x3cdiv class=\x27productMallShop\x27\x3e\x3cdiv id=\x27productBuy\x27 class=\x27productAddMall g_mallButton2 g_color g_bdColor\x27\x3e加入购物车\x3cspan class=\x27\x27\x3e\x3c/span\x3e\x3c/div\x3e\x3cdiv id=\x27g_web\x27 class=\x27J_productImmediatelyBug productImmediatelyBug g_mallButton2 g_bdColor g_bgColor\x27\x3e立即购买\x3c/div\x3e\x3c/div\x3e");--%>
        <%--Mobi.loadImgAlone('317');--%>
        <%--Mobi.manageFaiscoAd(1);--%>


        <%--// 访客态页面提示错误--%>
        <%--if (!Fai.top._manageMode) {--%>
            <%--errnoIng();--%>
        <%--}--%>
        <%--setTimeout("hasOpenFaiscoBaiduBridge()", 1000);//延迟一秒，等待百度商桥加载完成--%>

        <%--initManagePage();--%>


    <%--});--%>

    <%--//针对管理态做初始化 by jser 2017-10-23--%>
    <%--function initManagePage() {--%>

        <%--var isManageMode = (Fai.top._manageMode === true);--%>
        <%--if (!isManageMode) {--%>
            <%--return;--%>
        <%--}--%>

        <%--Fai.top.Mobi.logDogWithInitManagePage();--%>


    <%--}--%>

    <%--// 获取url参数--%>
    <%--function getUrlQueryString(name) {--%>
        <%--var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");--%>
        <%--var r = window.location.search.substr(1).match(reg);--%>
        <%--if (r != null) {--%>
            <%--return unescape(r[2]);--%>
        <%--}--%>
        <%--return null;--%>
    <%--}--%>

    <%--// 页面错误提示--%>
    <%--function errnoIng() {--%>
        <%--// 获取参数errno--%>
        <%--var errno = getUrlQueryString("errno");--%>
        <%--if (errno == 14) {--%>
            <%--Mobi.ing(LS.memberLoginNoPermission);--%>
        <%--}--%>
    <%--}--%>

    <%--//Mobi.preventScroll(document.getElementById("g_body"));//阻止滚轮事件冒泡--%>

    <%--//访客态下，统计微信浏览器的使用情况--%>

    <%--if (Mobi.isWechat()) {--%>
        <%--Mobi.logDog(200055, 1);--%>
    <%--} else {--%>
        <%--Mobi.logDog(200055, 0);--%>
    <%--}--%>


    <%--//管理下，禁止点击跳转外链--%>


    <%--//接入我们的百度商桥才隐藏默认的图标--%>
    <%--function hasOpenFaiscoBaiduBridge() {--%>
        <%--if (Fai.top._mallService == 2) {--%>
            <%--//商城主题--%>
            <%--for (var i in Fai.top._serviceList) {--%>
                <%--if (Fai.top._serviceList[i].serviceType == 2) {--%>
                    <%--if (Fai.top._serviceList[i].showType == true) {--%>
                        <%--Fai.top.Mobi.getPreviewWindow().jm("ins#newBridge").hide();--%>
                        <%--break;--%>
                    <%--} else {--%>
                        <%--if (jm("a[href*='Mobi.showBaiduBridge']").length < 1) {--%>
                            <%--Fai.top.Mobi.getPreviewWindow().jm("ins#newBridge").show();--%>
                            <%--break;--%>
                        <%--}--%>
                    <%--}--%>
                <%--} else {--%>
                    <%--if (jm("a[href*='Mobi.showBaiduBridge']").length < 1) {--%>
                        <%--Fai.top.Mobi.getPreviewWindow().jm("ins#newBridge").show();--%>
                    <%--}--%>
                <%--}--%>
            <%--}--%>
        <%--} else {--%>
            <%--//非商城主题--%>
            <%--if (Fai.top._onlineServiceJson.baiduBridge.open == true) {--%>
                <%--Fai.top.Mobi.getPreviewWindow().jm("ins#newBridge").hide();--%>
            <%--} else {--%>
                <%--if (jm("a[href*='Mobi.showBaiduBridge']").length < 1) {--%>
                    <%--Fai.top.Mobi.getPreviewWindow().jm("ins#newBridge").show();--%>
                <%--}--%>
            <%--}--%>
        <%--}--%>
        <%--//百度商桥统计--%>
        <%--jm("#newBridge #nb_icon_wrap").off('click.log').on('click.log', function () {--%>
            <%--Mobi.logDog(200171, 5);--%>
        <%--});--%>
    <%--}--%>

    <%--//解决苹果手机浏览模板网站，右下角的手机模板显示不正常的bug--%>


    <%--if (false) {--%>
        <%--var mallBuy = localStorage.getItem("mallBuyCallBack");--%>
        <%--if (!!mallBuy) {--%>
            <%--localStorage.removeItem("mallBuyCallBack");--%>
            <%--mallBuy = jm.parseJSON(mallBuy);--%>
            <%--if (mallBuy.login) {--%>
                <%--Mobi.mallBuy(mallBuy.productId, mallBuy.buyType, mallBuy.entry, mallBuy.moduleId, jm.parseJSON(mallBuy.option), mallBuy.count);--%>
            <%--}--%>
        <%--}--%>
    <%--}--%>
<%--</script>--%>




