<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/26
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" style="height:100%">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>二维码</title>
    <link rel="stylesheet" href="/resources/css/weui.min.css"/>
    <style>
        .back_div {
            background-image: url('/resources/img/tui_guang_bg.jpg');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            -moz-background-size: 100% 100%;
            height: 100%
        }
        .content{
            position: absolute;
            bottom: 4%;
            width: 100%;
            height: 15%;
        }
        .content_img{
            margin: auto;
            /*height: 20%;*/
        }
    </style>
</head>
<body style="height: 100%">
<div class="weui-msg back_div">
    <div class="content">
        <div class="weui-msg__icon-area">
            <img src="${codeImageUrl}" class="content_img">
        </div>
        <%--<div class="weui-msg__text-area">--%>
            <%--<h2 class="weui-msg__title">${member.name}</h2>--%>
            <%--<p class="weui-msg__desc">ID:${member.id}</p>--%>
        <%--</div>--%>
    </div>
</div>
</body>
</html>