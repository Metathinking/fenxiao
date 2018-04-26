<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/28
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
    <header class="container-fluid header">
    </header>
    <div class="container-fluid" style="margin-top: 30px">

        <div class="row">
            <c:forEach items="${productList}" var="product">

                <div class="col-xs-6  product_item text-center">
                    <a href="/product/${product.id}">
                        <img src="${product.image}" class="product_img">
                        <p>${product.name}</p>
                    </a>
                    <div class="row">
                        <div class="col-xs-8">
                            <%--<p class="text-left description">容量：${product.rongLiang}ml</p>--%>
                            <%--<p class="text-left description">香型：${product.xiangXing}</p>--%>
                            <p class="text-left description price">积分：￥${product.score}</p>
                        </div>
                        <div class="col-xs-4 text-center">
                            <%--<span class="glyphicon glyphicon-shopping-cart shop-cart" ng-click="addCartItem(${product.id})"></span>--%>
                            <button type="button" class="btn btn-danger">兑换</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>