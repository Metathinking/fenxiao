<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/28
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Viberr</title>
    <link rel="shortcut icon" type="image/png" href="/resources/favicon.ico"/>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css"/>
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/base.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/dashboard.css" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/css/responsive.css" />
</head>
<body>
<!-- Header -->
<div id="header">
    <div id="branding">

        <h1 id="site-name"><a href="/admin/">Django administration</a></h1>

    </div>


    <div id="user-tools">

        Welcome,
        <strong>admin</strong>.

        <a href="/">商品管理</a> /
        <a href="/">会员管理</a> /
        <a href="/">订单管理</a> /
        <a href="/">抽成设置</a> /
        <a href="/">厂商信息</a> /

        <a href="/admin/password_change/">密码修改</a> /

        <a href="/admin/logout/">退出</a>

    </div>



</div>
<!-- END Header -->
<%--<nav class="navbar navbar-inverse">--%>
    <%--<!-- Header -->--%>
    <%--<div class="container-fluid">--%>
        <%--<div class="navbar-header">--%>
            <%--<button type="button" class="navbar-toggle" date-toggle="collapse" data-target="#topNavbar">--%>
                <%--<span class="icon-bar"></span>--%>
            <%--</button>--%>
            <%--<a class="navbar-brand" href="{% url 'music:index' %}">Viberr</a>--%>
        <%--</div>--%>

        <%--<!-- Items-->--%>
        <%--<div class="collapse navbar-collapse">--%>
            <%--<ul class="nav navbar-nav">--%>
                <%--<li class="active">--%>
                    <%--<a href="{% url 'music:index' %}">--%>
                        <%--<span class="glyphicon glyphicon-cd" aria-hidden="true"></span>&nbsp;--%>
                        <%--商品管理--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li class="">--%>
                    <%--<a href="{% url 'music:index' %}">--%>
                        <%--&lt;%&ndash;<span class="glyphicon glyphicon-music" aria-hidden="true"></span>&nbsp;&ndash;%&gt;--%>
                        <%--会员管理--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li class="">--%>
                    <%--<a href="{% url 'music:index' %}">--%>
                        <%--&lt;%&ndash;<span class="glyphicon glyphicon-music" aria-hidden="true"></span>&nbsp;&ndash;%&gt;--%>
                        <%--订单管理--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li class="">--%>
                    <%--<a href="{% url 'music:index' %}">--%>
                        <%--&lt;%&ndash;<span class="glyphicon glyphicon-music" aria-hidden="true"></span>&nbsp;&ndash;%&gt;--%>
                        <%--抽成设置--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li class="">--%>
                    <%--<a href="{% url 'music:index' %}">--%>
                        <%--&lt;%&ndash;<span class="glyphicon glyphicon-music" aria-hidden="true"></span>&nbsp;&ndash;%&gt;--%>
                        <%--厂商信息--%>
                    <%--</a>--%>
                <%--</li>--%>
            <%--</ul>--%>

            <%--&lt;%&ndash;<form class="navbar-form navbar-left" action="#" method="get" role="search">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<input type="text" class="form-control" name="q" value=""/>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<button type="submit" class="btn btn-default">Search</button>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</form>&ndash;%&gt;--%>

            <%--<ul class="nav navbar-nav navbar-right">--%>
                <%--<li class="">--%>
                    <%--<a href="{% url 'music:album-add' %}">--%>
                        <%--<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;--%>
                        <%--管理员--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>/</li>--%>
                <%--<li class="">--%>
                    <%--<a href="{% url 'music:album-add' %}">--%>
                        <%--<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;--%>
                        <%--修改密码--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>/</li>--%>
                <%--<li class="">--%>
                    <%--<a href="{% url 'music:index' %}">--%>
                        <%--<span class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp;--%>
                        <%--退出--%>
                    <%--</a>--%>
                <%--</li>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</nav>--%>
<div class="container">
    <div class="app-companies module">
        <table>
            <caption>
                <a href="/admin/companies/" class="section" title="Models in the Companies application">Companies</a>
            </caption>

            <tr class="model-stock">

                <th scope="row"><a href="/admin/companies/stock/">Stocks</a></th>



                <td><a href="/admin/companies/stock/add/" class="addlink">Add</a></td>



                <td><a href="/admin/companies/stock/" class="changelink">Change</a></td>

            </tr>

        </table>
    </div>
</div>
<%--{% block body %}--%>
<%--{% endblock %}--%>
</body>
</html>
