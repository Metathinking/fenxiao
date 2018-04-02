<%--
  Created by IntelliJ IDEA.
  User: luyilaosan1
  Date: 2016/3/1.0001
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html lang="en-us" >
<head>
    <title>后台管理——<tiles:insertAttribute name="title"/></title>
    <link rel="stylesheet" type="text/css" href="/resources/css/base.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/changelists.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/forms.css" />
    <script type="text/javascript" src="/admin/jsi18n/"></script>
    <script type="text/javascript" src="/resources/js/vendor/jquery/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.init.js"></script>
    <script type="text/javascript" src="/resources/js/core.js"></script>
    <script type="text/javascript" src="/resources/js/admin/RelatedObjectLookups.js"></script>
    <script type="text/javascript" src="/resources/js/actions.js"></script>
    <script type="text/javascript" src="/resources/js/urlify.js"></script>
    <script type="text/javascript" src="/resources/js/prepopulate.js"></script>
    <script type="text/javascript" src="/resources/js/vendor/xregexp/xregexp.js"></script>
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/css/responsive.css" />
    <meta name="robots" content="NONE,NOARCHIVE" />
    <script>
        var context = "${context}";
    </script>
</head>


<body class=" app-companies model-stock change-form"
      data-admin-utc-offset="0">

<!-- Container -->
<div id="container">


    <!-- Header -->
    <div id="header">
        <div id="branding">

            <h1 id="site-name"><a href="/admin/">Django administration</a></h1>

        </div>


        <div id="user-tools">

            Welcome,
            <strong>admin</strong>.

            <a href="/admin/product/list">商品管理</a> /
            <a href="/">会员管理</a> /
            <a href="/admin/order/list">订单管理</a> /
            <a href="/">抽成设置</a> /
            <a href="/">厂商信息</a> /

            <a href="/admin/change_password/">密码修改</a> /
            <a href="/admin/logout/">退出</a>
        </div>

    </div>
    <!-- END Header -->


        <tiles:insertAttribute name="content"/>
        <tiles:insertAttribute name="footer"/>
</div>
<!--END Container -->

</body>
</html>
