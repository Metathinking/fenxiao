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

<html lang="en-us">
<head>
    <title><tiles:insertAttribute name="title"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/fenxiao.css">
    <link rel="stylesheet" href="/resources/css/weui.min.css"/>
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/angular-1.5.0.min.js"></script>
    <script src="/resources/js/front.js"></script>
    <script>
        var context = "${context}";
    </script>
</head>
<body ng-app="frontApp">
<tiles:insertAttribute name="content"/>
<tiles:insertAttribute name="footer"/>

</body>
</html>
