<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/4
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>









<!--<html><head></head><body></body></html>-->
<!DOCTYPE html>
<html>
<head>
    <title>订单详情 - -</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=2.0, user-scalable=1"> -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="layoutmode" content="standard">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="renderer" content="webkit">


    <!--uc浏览器判断到页面上文字居多时，会自动放大字体优化移动用户体验。添加以下头部可以禁用掉该优化-->
    <meta name="wap-font-scale" content="no">

    <meta content="telephone=no" name="format-detection" />
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">



    <link rel="stylesheet" type="text/css" href="//mo.faisys.com/css/fontsIco.min.css?v=201803211101" />
    <link rel="stylesheet" type="text/css" href="//mo.faisys.com/css/base.min.css?v=201803301816" title="default" />
    <link rel="stylesheet" type="text/css" href="//mo.faisys.com/css/bannerAnimation.min.css?v=201711201610" title="" />


    <link rel="stylesheet" id="mobiStyleTemplateCss" type="text/css" href="//mo.faisys.com/css/template/2002_1.min.css?v=201803121311"/>









    <meta id='_TOKEN' value='87bed82638128681ea9cd5c1beaf678a'/>







    <!-- //横向标签样式css -->
    <style id='mobiTabStyleCss'>
        .fk-tabStyle2 .f-formTabButtonList .formTabButtonClick{border-bottom-color:#f23030;}
        .fk-tabStyle2 .f-formTabButtonList .formTabButtonClick{color:#f23030;}
        .fk-tabStyle1 div.formTabButtonClick .f-formTabMiddle{background-color:#f23030;}
    </style>

    <!-- //输出模块样式css -->
    <style id='mobiStyleModule'>
    </style>
    <style id='mobiStyleNav' type='text/css'>
        .open .navItem:nth-child(2) {transition-delay: 160ms;}
        .open .navItem:nth-child(4) {transition-delay: 240ms;}
        .open .navItem:nth-child(6) {transition-delay: 320ms;}
    </style>


    <style id='mobiCubeStyleModule'>
    </style>

    <style id='mobiSearchStyleModule'>
    </style>



    <!-- //按钮样式css -->
    <style id='mobiFloatBtnCss'>
        .form .floatBtnStyle0 .middle{background-color:#f23030;}
        .form .floatBtnStyle1 .middle{background-color:#f23030;}
        .form .floatBtnStyle2 .middle{border-color:#f23030;color:#f23030;}
        .form .floatBtnStyle3 .middle{background:-webkit-linear-gradient(bottom, #f23030 10%,rgba(248,151,151,1));background:-webkit-linear-gradient(bottom, #f23030 10%,rgba(248,151,151,1));}
        .form .floatBtnStyle4 .middle{background:-webkit-linear-gradient(bottom, #f23030 10%,rgba(248,151,151,1));background:-webkit-linear-gradient(bottom, #f23030 10%,rgba(248,151,151,1));border-color:#f23030;}
    </style>
    <style id='mobiBackTopBtnCss'>
        .backTop .backTop_icon.icon-backTop0{background-color:#f23030;color:#fff;}
        .backTop .backTop_icon.icon-backTop1{background-color:#fff;color:#f23030;}
        .backTop .backTop_icon.icon-backTop2{background-color:#fff;color:#f23030;border-color:#f23030;}
    </style>

    <!-- 输出底部样式 -->
    <style id='fixedAreaBoxStyle'>
        .webFooterBox .ui-calendar-calendar .ui-state-active{background-color:#f23030;}
        .webFooterBox .ui-calendar-calendar .ui-calendar-startDate{background-color:#f23030;}
        .webFooterBox .ui-calendar-prev:after{color:#f23030;}
        .webFooterBox .ui-calendar-next:after{color:#f23030;}
        .webFooterBox .fk-calendarNav{background-color:#f23030;}
        .mallFixNavWrap .mallNavBtn{width:33%;}
        div.fixedAreaBox .themeColor{color:#f23030;}
        div.fixedAreaBox .themeBgColor{background-color:#f23030;}
        .fixedAreaBox .f-navCheck .icon-navItemIcon{color:#f23030;}
        .fixedAreaBox .f-navCheck .mallNavBtnText{color:#f23030;}
    </style>


    <!-- 系统特殊隐藏栏目隐藏头部、banner -->

    <style type="text/css">
        .g_web{ overflow-x: auto;}
        .webContainerBox{ position: static;}
        .form{ position: static;}
        #webHeaderBox {display:none;}
        #webBannerBox {display:none;}
        .form.Handle{margin:0px;padding:0px;}
        .form .formBannerTitle{display:none;}
        .formMiddle{padding:0px;background:none;border:none;box-shadow:none;box-sizing:border-box;margin-top: 0 !important;}
    </style>


</head>
<body faiscoMobi="true" id="g_body" class="g_locale2052 mobiCol16">

<script type="text/javascript">
    (function() {
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
    var _htmlFontSize = (function(){
        var clientWidth = document.documentElement ? document.documentElement.clientWidth : document.body.clientWidth;
        //if(clientWidth > 768) clientWidth = 768;
        if(clientWidth > 768 && clientWidth < 1280){
            clientWidth = 768;
        }else if(clientWidth >= 1280){
            clientWidth = 512;
        }
        document.documentElement.style.fontSize = clientWidth * 1/16+"px";
        return clientWidth * 1/16;
    })();

</script>



<div id="webTips" class="webTips jz-webTips">
    <div id="mobitips" class="mobitips">
        <div class="mobiScrollbar">
            <div class="j-marqueeContainer J_marqueeContainer">
                <ul class="marquee J_marquee" id="mobiTipsMarquee">
                    <li><div class='sitetipsTitle'>商城为 <a class='sitetipsIcon siteGroupBiz' style='color:red;' target='_blank' hidefocus='true' href='http://www.faisco.cn/portal.jsp#appId=shop' title='点击查看详细功能列表'>商城基础版</a> 功能，6天后将自动失效。</div></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<style type="text/css">
    .mobiTipsStyle{}
    .mobiTipsBannerStyle{}
    .detailHeaderColor.detailHeaderColor{top:1.5rem;}
</style>






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
        <div id='webHeader' class='webHeader webHeaderBg ' ><div id='mallThemeTopBarBg' class='mallThemeTopBarBg '  ></div><div id='mallThemeTopBar' class='mallThemeTopBar  ' ><div class='jz_top_wrapper J_top_wrapper'><a class='J_to_back f_back faisco-icons-S000108'></a><div class='f_input_box'><i class='f_icon_conter faisco-icons-S000182'></i><input onclick='Mobi.popupSearch({lanCode:" ",nSL:"[]", hotTopic:[], searchProduct:1, searchTip:"", moduleType:0, moduleColor:"#aaa", historySearch:1})' placeholder=搜索 /></div><a href='index.jsp' class='f_top_right'><i class='f_home faisco-icons-S0000196'></i></a></div><div class='logoTitleSide'><div class='logoArea'><span class='pageLogo   ' id='pageLogoMall' sid='3' pw='245' ph='160'><a alt='' href='/' hidefocus='true' ><div id='pageLogoImgMall' class='logoImg ' style='border:0.1rem solid rgba(256, 256, 256, 0.6);background-clip:content-box;border-radius:5px;background-image:url(//15957144.s61i.faiusr.com/2/AD0ImPnNBxACGAAgx-T60gUorMX_7gcw9QE4oAE!160x160.jpg);'></div></a></span></div><div class='titleArea'><h1 style='font-weight:normal; font-size: inherit; display: inline-block;' ><a alt='' href='/' hidefocus='true' ><span class='pageTitle' id='pageTitleMall'>网站模板—茶叶酒类</span></a></h1></div></div><div class='toolMenuSide'><div class='userEnterAera'><a href='profile.jsp'  hidefocus='true' class='userEnterLink'><span class='userEnterIcon icon-userEnterIcon'></span><span class='userEnterText'>会员中心</span></a></div><div class='seacherAera' onclick='Mobi.popupSearch({lanCode:" ",nSL:"[]", hotTopic:[], searchProduct:1, searchTip:"", moduleType:0, moduleColor:"#aaa", historySearch:1})'><span class='seacherBtnIcon icon-seacherBtnIcon'></span><span class='seacherAeraText'>搜索</span></div></div></div></div>






    </div>

    <div id="webBannerBox" class="webBannerBox   mobiTipsBannerStyle">

        <div class="multilingualArea" id="webMultilingualArea">
            <div class='multilingual'></div>
        </div>



    </div>
    <div id="webContainerBox" class="webContainerBox" style="overflow:visible;">
        <div id="webModuleContainer" class="webModuleContainer">
            <div id='module14'  class='form Handle  formStyle20 ' _autoHeight='1' _height='0' _width='0'  _autoWidth='1' _bHeight='0' _inTab='0' style=''  ><div   _bannerAutoHeight='1' class='formBannerTitle formBannerTitle14'><div class='titleLeft titleLeft14'>
            </div>
                <div class='titleCenter titleCenter14'>
                    <div class='titleText titleText14'><div class='titleTextIcon icon-titleText'>&nbsp;</div><div class='textContent'>订单详情</div></div><div class='formBannerMore formBannerMore14'></div></div>
                <div class='titleRight titleRight14'>
                </div>
            </div>
                <div class='formMiddle formMiddle14'><div class='middleLeft middleLeft14'>
                </div>
                    <div class='middleCenter middleCenter14'>
                        <div class='formMiddleContent formMiddleContent14 moduleContent' _innerType='0'><div class='moduleLoading' style='height : 20rem;'><table style='width:100%;height:100%;'><tr><td align='center' valign='middle'><img src='//mo.faisys.com/image/loading/loading_2.gif?v=201509211806' ></td></tr></table></div></div></div>
                    <div class='middleRight middleRight14'>
                    </div>
                </div>
            </div>

            <!--预约面板-->
            <div id="bookingPanelTriggle"></div>
        </div>
    </div>
    <div id="webFooterBox" class="webFooterBox  ">
        <!--图片详情Div -->

        <div id='navbar' class='navbar '>
            <div id='navbarList' class='navbarList  navbarList-horizontalLayout  '  ><div id='itemSep_3' class='itemSep'></div><div id='navItem_3' class='navItem navItem_3  icon-navItem'><a href='/index.jsp' _colid='3' id='navbar_3'><span class='navItemName'>首页</span></a></div><div id='itemSep_13' class='itemSep'></div><div id='navItem_13' class='navItem navItem_13  icon-navItem'><a href='/mcart.jsp' _colid='13' id='navbar_13'><span class='navItemName'>购物车</span></a></div><div id='itemSep_23' class='itemSep'></div><div id='navItem_23' class='navItem navItem_23  icon-navItem'><a href='pr.jsp' _colid='23' id='navbar_23'><span class='navItemName'>分类</span></a></div></div><div class='navLeft icon-navLeft'></div><div class='navRight icon-navRight'></div></div>

        <div id='webFooter' class='webFooter'>
            <div id='footer'  class='footer mallThemeFooter'><div class='bottomdiv'><div class='bottom'><div class='backtop' onclick='Mobi.scrollToTop("webContainerBox")'>top<b></b></div></div></div><div class='footerMenu'><div class='footerMenuItem'><span class='footerMenuItemText homePage'><a class='homePageLink' href='/index.jsp' hidefocus='true'>主页</a></span></div><div class='footerMenuItem'><span class='footerMenuItemText memberCenter'><a class='memberCenterLink' href='/profile.jsp' hidefocus='true'>会员中心</a></span></div><div class='footerMenuItem'><span class='footerMenuItemText siteVis'><a class='siteVisLink' href='http://www.ru15797626.icoc.bz?_siteUrl'  target='_blank' hidefocus='true'>电脑版</a></span></div><div class='footerMenuItem footLanguageItem'><span class='footerMenuItemText languageVis'>中文版</span><div class='languageFullBg'></div><div class='languageListPanel'><div class='langItem' value='/cn/index.jsp' currentLan='2052'><a class='langItemText' href='/cn/index.jsp'>中文</a></div></div></div></div><div class='technical'><div class='technicalSupport footerInfo'><font face="Arial">©</font>2018 - 版权所有</div><div class='technicalSupport'><a href='http://mjz.faisco.com/?_ta=2508'  target='_blank' hidefocus='true'>本站使用&nbsp;<span class='faisco-icons-logo'></span>凡科建站&nbsp;搭建</a>       <span class='footerSep PcVer'>|</span><a class='PcVer' href='http://www.ru15797626.icoc.bz?_siteUrl'  target='_blank' hidefocus='true'>电脑版</a><span class='footerSep PcVer'>|</span><a class='rep PcVer' href='http://m.faisco.com/ts.jsp?acct=ru15797626'  target='_blank' hidefocus='true'>举报</a></div></div></div>

            <div id="mobiAdvertisement_box" class='mobiAdvertisement_box'>

                <a id="mobiAdvertisement_adImg" class="mobiAdvertisement_adImg webHeaderBg" target='_blank' href="http://mjz.faisco.com/?_ta=2508">无需写代码，轻松建网站 >></a>
                <div class='mobiAdvertiseClose'>
                    <div id="mobiAdClose" class="mobiAdClose"></div>
                </div>

            </div>



        </div>
        <div class='webMapServiceBox fk-webMapServiceBox' id='webMapServiceBox'><div style='display:table;height:100%;width:100%;border-collapse: collapse;'><div style='display:table-row;'><div style='display:table-cell;'><div class='webMapHeader webHeaderBg'><div class='g_close icon-gClose' onclick='Mobi.closeMapService()'></div></div></div></div><div style='height:100%;width:100%;display:table-row;'><div class='f-webMapIframeWrap'><iframe id='mobiSearchMapFrame' frameborder='0' width='100%' height='100%' scrolling='auto'></iframe></div></div></div></div>
        <div id="fullScreenDivCotainer" class='fullScreenDivCotainer'></div>
    </div>
    <div id="fixedAreaBox" class="fixedAreaBox fixedAreaBox2002_1" tplid="2002_1">

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


<script type="text/javascript" language="javascript" >



    //管理态下的预览页面提前作处理 之前这里的g_viewMode先去掉
    if( !false && window.top !== window.self){
        var g_className = document.getElementById("g_body").className;
        document.getElementById("g_body").className = g_className + " ";
    }

    var _oem = false,
        _baiduBridgeCodes = "";

    //用于iframe显示手机模板的时候 给g_web加上width
    var g_webWidth = 0;
    if(g_webWidth == 0){
        g_webWidth = window.localStorage? localStorage.getItem("g_webWidth"): Cookie.read("g_webWidth");
        if(g_webWidth != null){
            document.getElementById("g_web").style.width = g_webWidth + "px";
        }
    } else{
        document.getElementById("g_web").style.width = g_webWidth + "px";
        if (window.localStorage) {
            localStorage.setItem("g_webWidth", g_webWidth);
        } else {
            Cookie.write("g_webWidth", g_webWidth);
        }
    }

</script>




<script type="text/javascript" src="//mo.faisys.com/js/locale/2052.min.js?v=201802051418"></script>
<script type="text/javascript" charset="utf-8" src="//mo.faisys.com/js/jqmobi/jqmobi.min.js?v=201709041707"></script>
<script type="text/javascript" charset="utf-8" src="//mo.faisys.com/js/jqmobi/jqmobi_ui.min.js?v=201803191141"></script>


<script id="mobiOperationJS" type="text/javascript" charset="utf-8" src="//mo.faisys.com/js/mobi.min.js?v=201804031147"></script>












<script type="text/javascript">
    var _faiAjax = function(){
        //for regexp
        var r = /\?/;
        var _o = {
            type:"get",
            url:"",
            data:"",
            error:function(){},
            success:function(){}
        };
        var _sendRequest=function(o) {
            var xmlhttp = null;
            //init option code
            o.type = o.type || _o.type;
            o.url = o.url || _o.url;
            o.data = o.data || _o.data;
            o.error = o.error || _o.error;
            o.success = o.success || _o.success;
            if (window.XMLHttpRequest) {
                // code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }else{
                return;
            }
            //the instructions param takes the form of an eval statement
            if(o.type != "post") {
                o.url += ( this.r.test( o.url ) ? "&" : "?" ) + o.data;
                xmlhttp.open("GET", o.url, true);
                xmlhttp.onreadystatechange=function() {
                    if (xmlhttp.readyState==4 && xmlhttp.status==200) {
                        o.success( xmlhttp.responseText );
                    }else if( o.error ){
                        o.error();
                    }
                }
                xmlhttp.send();
            } else {
                xmlhttp.open("POST", o.url, true);
                //Send the proper header information along with the request
                xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
                xmlhttp.onreadystatechange=function() {
                    if (xmlhttp.readyState==4 && xmlhttp.status==200) {
                        o.success( xmlhttp.responseText );
                    }else{
                        o.error();
                    }
                }
                xmlhttp.send(o.data);
            }
        }
        return {
            ajax:function(option){
                try {
                    //此次调用的错误不让抛出给window。防止函数重入
                    _sendRequest(option);
                }catch(e){
                    //alert(e);
                }
            }
        };
    }();
    var _jsErrCahche = [];
    window.onerror = function(sMsg,sUrl,sLine){
        if (typeof Mobi == 'undefined') {
            if((window.DocumentTouch && document instanceof window.DocumentTouch) || 'ontouchstart' in document.documentElement){
                alert('您的网页未加载完成，请尝试按“刷新”重新加载。');
            }else{
                alert('您的网页未加载完成，请尝试按“CTRL+功能键F5”重新加载。');
            }

        }
        if( sLine < 1 || typeof sMsg != 'string' || sMsg.length < 1 ){
            return;
        }

        var log = "Error:" + sMsg + ";Line:" + sLine + ";Url:" + sUrl + ";UserAgent:" + navigator.userAgent;
        var alertLog = "Error:"+sMsg+"\n" + "Line:" + sLine + "\n" + "Url:" + sUrl + "\n";
        var encodeUrl = function (url){
            return typeof url === "undefined" ? "" : encodeURIComponent(url);
        };

        var ajax = true;
        var obj = { 'm' : sMsg, 'u' : sUrl, 'l' : sLine };
        for( var i = 0; i < _jsErrCahche.length; i ++ ){
            if( _jsErrCahche[i].m == obj.m && _jsErrCahche[i].u == obj.u && _jsErrCahche[i].l == obj.l  ){
                ajax = false;
                break;
            }
        }

        if( ajax ){
            _jsErrCahche.push( obj );
            _faiAjax.ajax({
                type	: "post",
                url		: "ajax/logJsErr.jsp?cmd=jsErr",
                data	: 'msg='+ encodeUrl(log)
            });
        }
        if(false){
            console.log( alertLog );
        }
    };




    if (typeof Fai == 'undefined'){
        Fai = {};
        //解决页面被嵌套在iframe的场景

        Fai.top = window;

    }



    Mobi.bookingBoxBind(false);


    Fai.top._isFaiHost = true;

    Fai.top._bannerData = {"showType":0,"bn":1,"b":[],"c":[],"h":false,"st":6,"et":1};  //横幅数据
    Fai.top._resRoot = '//mo.faisys.com';
    Fai.top._templateFrameId = 2002;
    Fai.top._templateLayoutId = 1;
    Fai.top._mobiSiteTitleChanged = 0; 	//用于记录网站标题是否有改动
    Fai.top._mobiSiteTitle = {"fontType":0,"align":0,"font":{"size":12,"family":"","colorType":0,"color":"#000"},"bgType":"0","bgFont":{"color":"#000","alpha":100},"bgImgFileId":"","bgImgStyle":"1","mbt":0,"mbc":{"color":"#000","alpha":100},"mbi":"","mbit":1,"mths":0,"name":"网站模板\u2014茶叶酒类","mhl":0,"mbip":"//2.ss.faisys.com/image/no-pic.jpg","mti":0};   	//网站标题数据
    Fai.top._onlineServiceJson = {"serviceId":{"serviceId":6},"phone":{"open":false,"type":1,"fName":"电话咨询","phoneInfo":[{"name":"电话咨询","number":""}],"baseSetting":{"c":0,"i":0,"id":0,"iconType":0,"colIconType":0,"colIconCusType":0,"classname":"faisco-icons-call1","content":"\\e62c","color":"","iconFileId":""}},"sms":{"open":false,"name":"信息咨询","number":"","type":2,"baseSetting":{"c":0,"i":0,"id":0,"iconType":0,"colIconType":0,"colIconCusType":0,"classname":"faisco-icons-mail1","content":"\\e6a0","color":"","iconFileId":""}},"map":{"open":false,"name":"在线地图","city":"","mark":"","d_address":"","type":3,"baseSetting":{"c":0,"i":0,"id":0,"iconType":0,"colIconType":0,"colIconCusType":0,"classname":"faisco-icons-gps1","content":"\\e67c","color":"","iconFileId":""}},"msg":{"open":false,"name":"在线留言","type":4,"baseSetting":{"c":0,"i":0,"id":0,"iconType":0,"colIconType":0,"colIconCusType":0,"classname":"faisco-icons-message1","content":"\\e6b2","color":"","iconFileId":""}},"baiduBridge":{"open":false,"name":"百度商桥","type":-1,"codes":"","baseSetting":{"c":0,"i":0,"id":0,"iconType":0,"colIconType":0,"colIconCusType":0,"classname":"faisco-icons-scBdsq2","content":"\\eada","color":"","iconFileId":"iconFileId"}},"weChat":{"open":false,"name":"微信客服","type":-2,"code":"","baseSetting":{"c":0,"i":0,"id":0,"iconType":0,"colIconType":0,"colIconCusType":0,"classname":"faisco-icons-M001038","content":"\\eb25","color":"","iconFileId":""}},"open":false,"order":[]};//在线客服
    Fai.top._openOnlineService = false;
    Fai.top._manageMode = false;
    Fai.top.sessionMemberId = 1;
    Fai.top.memberName = "huyubo";
    Fai.top._colInfo = {"aid":16487128,"wid":0,"id":16,"type":16,"flag":0,"authMemberLevelId":0,"extId":0,"other":{"pgt":0,"pgb":{"type":0,"catalogList":[],"s":4}},"name":"订单详情","defaultName":"订单详情","url":"/mdetail.jsp","valid":false,"baseSetting":{"c":0,"i":0,"iconType":0,"id":0,"content":"","classname":"","color":"","colIconType":0,"colIconCusType":0,"iconFileId":"","jumpCtrl":{"ide":"","columnType":0}},"columnStyle":{"s":7},"title":{"fontType":0,"align":0,"font":{"size":12,"family":"","colorType":0,"color":"#000"},"bgType":"0","bgFont":{"color":"#000","alpha":100},"bgImgFileId":"","bgImgStyle":"1","mbt":0,"mhl":0,"mbc":{"color":"#000","alpha":100},"mbi":"","mbit":1,"mti":0,"mths":0},"logo":{"i":"","h":true,"a":1,"style":0,"marginType":0,"margin":{"top":0,"bottom":0,"left":0,"right":0}},"banner":{"showType":0,"h":false,"bn":1,"b":[{"i":"1","t":0}],"st":6,"et":1,"c":[]},"moduleList":[14],"moduleHidden":[],"independent":true,"allowed":true,"selectable":false,"forbid":false};
    Fai.top._lcid = 2052;   // 当前的语言版本
    Fai.top._serviceList = [{"serviceType":"0","serviceAccount":"","showFont":"QQ客服","showType":false,"isFontIcon":"true","color":"rgb(238, 82, 102)","fileId":"","classname":"faisco-icons-scQq","filePath":""},{"serviceType":"3","serviceAccount":"","showFont":"电话咨询","showType":false,"isFontIcon":"true","color":"rgb(46, 176, 99)","fileId":"","classname":"faisco-icons-scPhone","filePath":""}]; //商城主题在线客服
    Fai.top._mallService = 2;
    Fai.top.inTabMaqueeHelper = {}; // 记录标签模块内子模块的动画函数
    Fai.top._isBUser = false;

    Fai.top._webDebug = false; // 本地环境(独立开发也是true)

    Fai.top._jzProUrl = '';
    Fai.top._portalHost = '';
    Fai.top._homeHost = '';


    Fai.top._jzProUrl = 'jz.fkw.com';
    Fai.top._portalHost = 'www.faisco.cn';
    Fai.top._homeHost = 'www.faisco.com';



    jm(document).ready(function() {


        Mobi.ajaxLoadModuleDom(16, 0, {"_ajaxLoadModuleIDList":[14],"fullUrl":"http://m.ru15797626.icoc.bz/mdetail.jsp?id=101&suc=true","topBarOptionInfo":{"mobiMallOpen":true}});


        //判断该栏目是否被删除
        if(jm.isEmptyObject(Fai.top._colInfo)){
            alert("该页面已经删除，点击确定后，将返回到首页");
            document.location.href = "/index.jsp"
        }
        //Mobi.viewPageBeforeInit();
        // 绑定退出事件
        jm(window).bind("load", function() {

//当前模块 start

            //Mobi.initSwipe('bannerSwipe',{"showType":0,"bn":1,"b":[],"c":[],"h":false,"st":6,"et":1});
            if(!Mobi.bannerAnimate.init( {"showType":0,"bn":1,"b":[],"c":[],"h":false,"st":6,"et":1})){
                Mobi.initBannerDefaultDom({"showType":0,"bn":1,"b":[],"c":[],"h":false,"st":6,"et":1});
                Mobi.initSwipe('bannerSwipe',{"showType":0,"bn":1,"b":[],"c":[],"h":false,"st":6,"et":1});
            };

            //调整导航栏与g_web的top值
            //部分主题有css3动画，所以会导致计算失误，需要等css3动画执行完之后计算
            Mobi.autoFixGWebTop(1);


            Mobi.initBgmCookie();





            Mobi.initFooterHeight();
        });

        //手机视图初始化函数
        Mobi.initMobiPage({"id":2002,"createTime":"2017-04-18","preview":"//mo.faisys.com/image/template/2002/2002.jpg","previewGif":"","color":0,"style":["//mo.faisys.com/css/template/2002_1.min.css?v=201803121311","//mo.faisys.com/css/template/2002_2.min.css?v=201803121311","//mo.faisys.com/css/template/2002_3.min.css?v=201803121311","//mo.faisys.com/css/template/2002_4.min.css?v=201803121311","//mo.faisys.com/css/template/2002_5.min.css?v=201803121311","//mo.faisys.com/css/template/2002_6.min.css?v=201803121311","//mo.faisys.com/css/template/2002_7.min.css?v=201803121311","//mo.faisys.com/css/template/2002_8.min.css?v=201803121311","//mo.faisys.com/css/template/2002_9.min.css?v=201803121311"],"type":0,"moduleStyle":0,"designType":2,"presetIndex":0,"cube":0,"layout":1,"imagePage":301,"backgroundImage":0,"colors":[],"colorsName":[]});

        // 取统计数据
        if(true)
        {


            Mobi.statisticalMobiVisitors({colId:-1, pdId:-1, ndId:-1, sc:0, rf:"http://m.ru15797626.icoc.bz/mstl.jsp?imme", statId:-1});
            if(!false){
                //统计访问时长
                Mobi.mobiStatVisitTime();
            }
        }

        //前端性能数据上报
        Mobi.report();

        // 用于添加分销的标识码 dannel
        Mobi.addDistCode();

        Mobi.initShare('footerShareWeixin','footerShareWeibo','footerShareQQ');
        Mobi.initFooterLanguageEvent();
        Mobi.initFooterStyle({"fb":{"y":0,"c":"","f":"","r":0,"p":"","ps":0},"rt":{"y":0,"s":-1,"f":"","c":""},"gt":{"y":0}});
        Mobi.showQqBg();
        Mobi.showPhonesBg();
        Mobi.unLoadForWechat();
        Mobi.changeSiteTitleBg('null','null','null','null','null');
        Mobi.logoSizeCompressByMargin();
        Mobi.titlePositionRefreshByLogo();
        Mobi.bindTopIconBack();
        Mobi.manageFaiscoAd(1);





        // 访客态页面提示错误
        if(!Fai.top._manageMode ){
            errnoIng();
        }
        setTimeout("hasOpenFaiscoBaiduBridge()",1000);//延迟一秒，等待百度商桥加载完成

        initManagePage();


    });
    //针对管理态做初始化 by jser 2017-10-23
    function initManagePage(){

        var isManageMode = (Fai.top._manageMode === true);
        if(!isManageMode){
            return;
        }

        Fai.top.Mobi.logDogWithInitManagePage();


    }

    // 获取url参数
    function getUrlQueryString(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!= null){
            return  unescape(r[2]);
        }
        return null;
    }
    // 页面错误提示
    function errnoIng(){
        // 获取参数errno
        var errno = getUrlQueryString("errno");
        if(errno == 14){
            Mobi.ing(LS.memberLoginNoPermission);
        }
    }

    //Mobi.preventScroll(document.getElementById("g_body"));//阻止滚轮事件冒泡

    //访客态下，统计微信浏览器的使用情况

    if(Mobi.isWechat()){
        Mobi.logDog(200055, 1);
    }else{
        Mobi.logDog(200055, 0);
    }


    //管理下，禁止点击跳转外链


    //接入我们的百度商桥才隐藏默认的图标
    function hasOpenFaiscoBaiduBridge(){
        if (Fai.top._mallService == 2) {
            //商城主题
            for(var i in Fai.top._serviceList) {
                if ( Fai.top._serviceList[i].serviceType == 2) {
                    if ( Fai.top._serviceList[i].showType == true) {
                        Fai.top.Mobi.getPreviewWindow().jm("ins#newBridge").hide();
                        break;
                    } else {
                        if(jm("a[href*='Mobi.showBaiduBridge']").length < 1){
                            Fai.top.Mobi.getPreviewWindow().jm("ins#newBridge").show();
                            break;
                        }
                    }
                } else {
                    if(jm("a[href*='Mobi.showBaiduBridge']").length < 1){
                        Fai.top.Mobi.getPreviewWindow().jm("ins#newBridge").show();
                    }
                }
            }
        } else {
            //非商城主题
            if (Fai.top._onlineServiceJson.baiduBridge.open == true) {
                Fai.top.Mobi.getPreviewWindow().jm("ins#newBridge").hide();
            } else {
                if(jm("a[href*='Mobi.showBaiduBridge']").length < 1){
                    Fai.top.Mobi.getPreviewWindow().jm("ins#newBridge").show();
                }
            }
        }
        //百度商桥统计
        jm("#newBridge #nb_icon_wrap").off('click.log').on('click.log', function(){
            Mobi.logDog(200171, 5);
        });
    }

    //解决苹果手机浏览模板网站，右下角的手机模板显示不正常的bug


    if (false) {
        var mallBuy = localStorage.getItem("mallBuyCallBack");
        if (!! mallBuy) {
            localStorage.removeItem("mallBuyCallBack");
            mallBuy = jm.parseJSON(mallBuy);
            if (mallBuy.login) {
                Mobi.mallBuy(mallBuy.productId, mallBuy.buyType, mallBuy.entry, mallBuy.moduleId, jm.parseJSON(mallBuy.option), mallBuy.count);
            }
        }
    }
</script>


</body>
</html>


