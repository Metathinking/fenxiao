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
            <input type="checkbox" class="" ng-model="cartItem.select"/>
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
            <h4><span ng-bind="cartItem.name"></span>
                <a class="cart_item_delete" ng-click="deleteCartItem(cartItem.id,$index)">
                    <span class="glyphicon glyphicon-trash"></span>
                </a>
            </h4>
            <%--<p>容量：500ml</p>--%>
            <p class="price">价格：￥<span ng-bind="cartItem.price"></span></p>
            <div class="cart_item_calc">
                <button type="button" ng-click="cartItemReduce(cartItem)">
                    <span class="glyphicon glyphicon-minus"></span>
                </button>
                <input type="text" class="cart_item_count" ng-value="cartItem.quantity"/>
                <button type="button" ng-click="cartItemRaise(cartItem)">
                    <span class="glyphicon glyphicon-plus"></span>
                </button>
            </div>
        </div>
    </div>
    <%--</c:forEach>--%>

    <div>
        <div class="">
            <button type="button" ng-click="orderSubmit()">结算</button>
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
        $scope.deleteCartItem = function (_cartItemId, _index) {
            var req = {
                method: 'POST',
                url: context + '/member/cart/delete?cartItemId=' + _cartItemId,
                headers: {
                    'Content-Type': 'application/json'
                },
            }
            $http(req).success(function (response, status, headers, cfg) {
                $scope.cartItemList.splice(_index, 1);
                if (response.success) {

                } else {

                }
            }).error(function (response, status, headers, cfg) {

            });
        };

        $scope.cartItemRaise = function (_cartItem) {
            var req = {
                method: 'POST',
                url: context + '/member/cart/raise?productId=' + _cartItem.productId,
                headers: {
                    'Content-Type': 'application/json'
                },
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    _cartItem.quantity = response.data;
                } else {

                }
            }).error(function (response, status, headers, cfg) {

            });
        };

        $scope.cartItemReduce = function (_cartItem) {
            var req = {
                method: 'POST',
                url: context + '/member/cart/reduce?productId=' + _cartItem.productId,
                headers: {
                    'Content-Type': 'application/json'
                },
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    _cartItem.quantity = response.data;
                } else {

                }
            }).error(function (response, status, headers, cfg) {

            });
        };

        /**
         * 结算
         */
        $scope.orderSubmit = function () {
            var ids = [];
            for (var i = 0; i < $scope.cartItemList.length; i++) {
                if ($scope.cartItemList[i].select == true) {
                    ids.push($scope.cartItemList[i].id);
                }
            }
            window.location.href = "/member/order/be_sure?ids=" + ids;

        };
    });
</script>
