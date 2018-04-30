<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/26
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>提示</title>
    <link rel="stylesheet" href="/resources/css/weui.min.css"/>
</head>
<body>
<div class="weui-msg">
    <div class="weui-msg__icon-area"><i class="weui-icon-warn weui-icon_msg"></i></div>
    <div class="weui-msg__text-area">
        <p class="weui-msg__desc">${error_msg}</p>
    </div>
    <div class="weui-msg__opr-area">
        <p class="weui-btn-area">
            <a href="/" class="weui-btn weui-btn_primary">返回首页</a>
            <!--<a href="javascript:history.back();" class="weui-btn weui-btn_default">辅助操作</a>-->
        </p>
    </div>
    <div class="weui-msg__extra-area">
        <div class="weui-footer">
            <p class="weui-footer__links">
                <!--<a href="javascript:void(0);" class="weui-footer__link">底部链接文本</a>-->
            </p>
            <!--<p class="weui-footer__text">Copyright &copy; 2008-2016 weui.io</p>-->
        </div>
    </div>
</div>
</body>
</html>