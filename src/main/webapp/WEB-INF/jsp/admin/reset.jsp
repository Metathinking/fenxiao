<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/28
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en-us" >
<head>
    <title>密码重置</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/base.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/css/responsive.css" />
    <meta name="robots" content="NONE,NOARCHIVE" />
</head>
<body class=" login"
      data-admin-utc-offset="0">
<!-- Container -->
<div id="container">
    <!-- Header -->
    <div id="header">
        <div id="branding">
            <h1 id="site-name"><a href="/admin/">密码重置</a></h1>
        </div>
    </div>
    <!-- END Header -->
    <!-- Content -->
    <div id="content" class="colM">
        <c:if test="${not empty errorMessage}">
            <p class="errornote">
                ${errorMessage}
            </p>
        </c:if>

        <div id="content-main">
            <form action="/reset" method="post" id="login-form">
                <div class="form-row">

                    <label class="required" for="id_username">用户名称:</label> <input type="text" name="username" autofocus maxlength="254" required id="id_username" />
                </div>
                <div class="form-row">

                    <label class="required" for="id_password">初始密码:</label> <input type="password" name="password" required id="id_password" />
                    <input type="hidden" name="next" value="/admin/" />
                </div>


                <div class="submit-row">
                    <label>&nbsp;</label><input type="submit" value="重置" />
                </div>
            </form>

        </div>

        <br class="clear" />
    </div>
    <!-- END Content -->
    <div id="footer"></div>
</div>

</body>
</html>
