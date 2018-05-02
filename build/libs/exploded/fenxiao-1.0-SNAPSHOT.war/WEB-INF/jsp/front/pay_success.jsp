<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/19
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>付款成功</title>
    <!-- 引入 WeUI -->
    <link rel="stylesheet" href="/resources/css/weui.min.css">
</head>
<body>
<div class="weui-msg">
    <div class="weui-msg__icon-area"><i class="weui-icon-success weui-icon_msg"></i></div>
    <div class="weui-msg__text-area">
        <h2 class="weui-msg__title">付款成功</h2>
        <%--<p class="weui-msg__desc">内容详情，可根据实际需要安排，如果换行则不超过规定长度，居中展现<a href="javascript:void(0);">文字链接</a></p>--%>
    </div>
    <div class="weui-msg__opr-area">
        <p class="weui-btn-area">
            <%--<a href="javascript:history.back();" class="weui-btn weui-btn_primary">推荐操作</a>--%>
            <a href="/;" class="weui-btn weui-btn_default">返回首页</a>
            <a href="/member/order/list" class="weui-btn weui-btn_default">查看订单</a>
        </p>
    </div>
    <div class="weui-msg__extra-area">
        <div class="weui-footer">
            <p class="weui-footer__links">
                <%--<a href="javascript:void(0);" class="weui-footer__link">底部链接文本</a>--%>
            </p>
            <p class="weui-footer__text">Copyright &copy; 2018-2018 </p>
        </div>
    </div>
</div>
</body>
</html>
