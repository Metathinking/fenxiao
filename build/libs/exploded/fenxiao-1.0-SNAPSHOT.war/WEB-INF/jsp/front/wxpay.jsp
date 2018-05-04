<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    long t = System.currentTimeMillis();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="format-detection" content="telephone=no"/>
    <title>微信公众号支付</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html,
        body {
            height: 100%;
            overflow: hidden;
        }

        span img {
            width: 120px;
        }

        .clearfix:after {
            content: "\200B";
            display: block;
            height: 0;
            clear: both;
        }

        .clearfix {
            *zoom: 1;
        }

        .wrap {
            position: relative;
            margin: auto;
            max-width: 640px;
            min-width: 320px;
            width: 100%;
            height: 100%;
            background: #F0EFF5;
            overflow: hidden;
        }

        .edit_cash {
            display: block;
            margin-top: 15px;
            padding: 20px;
            margin: 0 auto;
            width: 90%;
            border: 1px solid #CFCFCF;
            border-radius: 10px;
            background-color: #fff;
        }

        .edit_cash p {
            font-size: 14px;
            color: #8D8D8F;
        }

        .shuru {
            position: relative;
            margin-bottom: 40px;
        }

        .shuru div {
            border: none;
            width: 100%;
            height: 50px;
            font-size: 25px;
            line-height: 50px;
            border-bottom: 1px solid #CFCFCF;
            text-indent: 30px;
            outline: none;
            white-space: pre;
            overflow-x: scroll;
        }

        .shuru span {
            position: absolute;
            top: 5px;
            font-size: 25px;
            text-align: center;
            width: 100%;

        }

        .submit {
            display: block;
            margin: 20px auto 0;
            width: 90%;
            height: 40px;
            font-size: 16px;
            color: #fff;
            background: #228B22;
            border: 1px solid #32CD32;
            border-radius: 3px;
        }
    </style>
</head>

<body>
<div class="wrap">
    <div class="shuru">
        <span><img alt="微信支付" src="${pageContext.request.contextPath}/resources/img/WePayLogo.png"></span>
    </div>
    <div  class="edit_cash">
        <p>订单总额</p>
        <div class="shuru">
            <span>&yen;${wxMap.totalFee}</span>
        </div>
    </div>
    <input href="javascript:;" onclick="pay()" type="submit" value="支付" class="submit"/>
</div>

<script type="text/javascript">
    function onBridgeReady() {

        WeixinJSBridge.invoke(
            'getBrandWCPayRequest', {
                "appId": "${wxMap.appId}",//公众号名称，由商户传入
                "timeStamp": "${wxMap.timeStamp}", //时间戳，自1970年以来的秒数
                "nonceStr": "${wxMap.nonceStr}",//随机串
                "package": "${wxMap.pack}",
                "signType": "${wxMap.signType}", //微信签名方式:
                "paySign": "${wxMap.paySign}"//微信签名

            },
            function (res) {
                if (res.err_msg == "get_brand_wcpay_request:ok") {
                    window.location.href = context + "/member/order/pay_success";
                    alert("支付成功");
                    // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。
                } else {
                    alert("支付已取消,可进入订单列表进行付款。");
                }
            }
        );
    }


    function pay() {

        if (typeof WeixinJSBridge == "undefined") {
            if (document.addEventListener) {
                document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
            } else if (document.attachEvent) {
                document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
            }
        } else {
            onBridgeReady();
        }

    }
</script>
</body>
</html>
