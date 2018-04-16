<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/11
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="container-fluid cart_body" ng-controller="cartController" ng-init="getCartItemList()">
    <%--<c:forEach items="${cartItemList}" var="cartItem">--%>
    <div class="row cart_item" ng-repeat="cartItem in cartItemList">
        <div class="col-xs-1">
            <input type="checkbox" class=""/>
            <%--<h3 class="text-center select check">--%>
            <%--<span class="glyphicon glyphicon-check"></span>--%>
            <%--</h3>--%>
        </div>
        <div class="col-xs-4 text-center">
            <a href="#">
                <img class="media-object cart_img" ng-src="{{cartItem.productImage}}" alt="...">
            </a>
        </div>
        <div class="col-xs-7 cart_description">
            <h4>{{cartItem.name}}
                <a class="cart_item_delete">
                    <span class="glyphicon glyphicon-trash"></span>
                </a>
            </h4>
            <%--<p>容量：500ml</p>--%>
            <p class="price">价格：￥{{cartItem.price}}</p>
            <div class="cart_item_calc">
                <button type="button" ng-click="">
                    <span class="glyphicon glyphicon-minus"></span>
                </button>
                <input type="text" class="cart_item_count"/>
                <button type="button" ng-click="">
                    <span class="glyphicon glyphicon-plus"></span>
                </button>
            </div>
        </div>
    </div>
    <%--</c:forEach>--%>

    <div>
        <div class="">
            <button type="button">结算</button>
        </div>
    </div>

</div>
<script>
    app.controller("cartController", function ($scope, $http) {
        $scope.cartItemList = [];

        $scope.getCartItemList = function () {
            var req = {
                method: 'POST',
                url: context + '/member/cart/list',
                headers: {
                    'Content-Type': 'application/json'
                },
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    $scope.cartItemList = response.data;
                } else {

                }
            }).error(function (response, status, headers, cfg) {

            });
        };

        /**
         *添加购物车
         * @param _productId
         */
        $scope.addCartItem = function (_productId) {
            var req = {
                method: 'POST',
                url: context + '/member/cart/add?productId=' + _productId,
                headers: {
                    'Content-Type': 'application/json'
                },
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {

                } else {

                }
            }).error(function (response, status, headers, cfg) {

            });
        };
        /**
         * 删除购物车商品
         * @param _productId
         */
        $scope.deleteCartItem = function (_cartItemId) {
            var req = {
                method: 'POST',
                url: context + '/member/cart/delete?cartItemId=' + _cartItemId,
                headers: {
                    'Content-Type': 'application/json'
                },
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {

                } else {

                }
            }).error(function (response, status, headers, cfg) {

            });
        };

        $scope.cartItemRaise = function (_productId) {
            var req = {
                method: 'POST',
                url: context + '/member/cart/raise?productId=' + _productId,
                headers: {
                    'Content-Type': 'application/json'
                },
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {

                } else {

                }
            }).error(function (response, status, headers, cfg) {

            });
        };

        $scope.cartItemReduce = function (_productId) {
            var req = {
                method: 'POST',
                url: context + '/member/cart/add?productId=' + _productId,
                headers: {
                    'Content-Type': 'application/json'
                },
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {

                } else {

                }
            }).error(function (response, status, headers, cfg) {

            });
        };
    })
</script>
