<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/28
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div ng-controller="indexController">
    <header class="container-fluid header">
        <!-- 轮转页面 start -->
        <div class="carousel slide" id="myCarousel" data-ride="carousel">
            <ol class="carousel-indicators">
                <c:forEach items="${homeImageList}" var="image" varStatus="status">
                    <li data-target="#myCarousel" data-side-to="${status.index}" class="${status.index==0?'active':''}"></li>
                </c:forEach>
                <%--<li data-target="#myCarousel" data-side-to="0" class="active"></li>--%>
                <%--<li data-target="#myCarousel" data-side-to="1"></li>--%>
                <%--<li data-target="#myCarousel" data-side-to="2"></li>--%>
                <%--<li data-target="#myCarousel" data-side-to="3"></li>--%>
            </ol>
            <div class="carousel-inner" role="listbox">
                <c:forEach items="${homeImageList}" var="image" varStatus="status">
                    <div class="item ${status.index==0?'active':''}"><img src="${image.url}"/></div>
                </c:forEach>
                <%--<div class="item "><img src="static/images/2.png" class="text-center"/></div>--%>
                <%--<div class="item text-center"><img src="static/images/3.png"/></div>--%>
                <%--<div class="item text-center"><img src="static/images/4.png"/></div>--%>
            </div>
            <!-- slider start -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>

            <!-- slider end -->
        </div>
        <!-- 轮转页面 end -->
    </header>
    <div class="container-fluid" style="margin-top: 30px">

        <div class="row">
            <c:forEach items="${list}" var="product">

                <div class="col-xs-6  product_item text-center">
                    <a href="/product/${product.id}">
                        <img src="${product.image}" class="product_img">
                        <p>${product.name}</p>
                    </a>
                    <div class="row">
                        <div class="col-xs-8">
                            <p class="text-left description">容量：${product.rongLiang}ml</p>
                            <p class="text-left description">香型：${product.xiangXing}</p>
                            <p class="text-left description price">价格：￥${product.price}</p>
                        </div>
                        <div class="col-xs-4 text-center">
                            <span class="glyphicon glyphicon-shopping-cart shop-cart"
                                  ng-click="addCartItem(${product.id})"></span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>