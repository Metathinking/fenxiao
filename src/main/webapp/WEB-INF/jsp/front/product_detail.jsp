<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/11
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="product_body" ng-controller="indexController">
    <div class="container-fluid ">
        <div class="row text-center">
            <img src="${product.image}" style="max-width: 100%"/>
        </div>
        <div class="row">
            <h2>${product.name}</h2>
        </div>
        <div class="row">

        </div>
        <div class="row">
            ${product.introduction}
        </div>
    </div>
    <footer class="container-fluid ">
        <nav class="navbar navbar-default navbar-fixed-bottom ">
            <div class="product_footer">
                <div class="row text-center">
                    <div class="col-xs-3">
                        <h4 class="price">￥${product.price}</h4>
                    </div>
                    <div class="col-xs-6 footer-block">
                        <button type="button" class="btn btn-danger btn-block product_add"  ng-click="addCartItem(${product.id})">
                            加入购物车
                        </button>
                    </div>
                    <div class="col-xs-3 footer-block">
                        <a class="center-block" href="/cart/list">
                            <h4><span class="glyphicon glyphicon-shopping-cart"></span></h4>
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </footer>
</div>
