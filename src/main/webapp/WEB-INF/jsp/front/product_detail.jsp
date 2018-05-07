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
        <div class="row" style="padding-left: 20px">
            <h2>${product.name}</h2>
            <h5>香型：${product.xiangXing}</h5>
            <h5>容量：${product.rongLiang}</h5>
        </div>
        <div class="row">
            ${product.introduction}
        </div>
    </div>
    <footer class="container-fluid ">
        <nav class="navbar navbar-default navbar-fixed-bottom ">
            <div class="product_footer">
                <div class="row text-center">
                    <div class="col-xs-3" style="padding-top: 15px">
                        <p class="price">￥${product.price}</p>
                    </div>
                    <div class="col-xs-6 footer-block" style="padding-top: 10px">
                        <button type="button" class="btn btn-danger btn-block product_add"
                                ng-click="selectProduct(${product.id},'${product.name}','${product.image}',${product.price})"
                                data-toggle="modal" data-target="#addCartItem">
                            加入购物车
                        </button>
                    </div>
                    <div class="col-xs-3 footer-block">
                        <a class="center-block" href="/member/cart/list">
                            <h4><span class="glyphicon glyphicon-shopping-cart shop-cart"></span></h4>
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </footer>

    <!--modal start -->
    <div class="modal fade" id="addCartItem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="width: 100%">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <div class="modal-title" id="myModalLabel">
                            <img ng-src="{{product.image}}" style="width: 30%">
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>{{product.name}}</label>
                        </div>
                        <div class="form-group">
                            <label class="price">￥{{product.price}}</label>
                        </div>
                        <div class="form-group">
                            <label>数量:</label>
                            <div class="cart_item_calc">
                                <button type="button" ng-click="reduce()">
                                    <span class="glyphicon glyphicon-minus"></span>
                                </button>
                                <input type="text" class="cart_item_count" ng-value="product.quantity"/>
                                <button type="button" ng-click="raise()">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                        <button type="button" class="btn btn-warning btn-block" data-dismiss="modal" ng-click="addCartItem()">加入购物车
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--modal end -->
</div>
