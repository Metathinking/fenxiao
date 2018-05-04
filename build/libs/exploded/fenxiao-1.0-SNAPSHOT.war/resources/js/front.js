'use strict';

var app = angular.module('frontApp', []);

app.controller('indexController', function ($scope, $http) {

    /**
     *添加购物车
     * @param _productId
     */
    $scope.addCartItem = function () {
        var req = {
            method: 'POST',
            url: context + '/member/cart/add?productId=' + $scope.product.id + "&quantity=" + $scope.product.quantity,
            headers: {
                'Content-Type': 'application/json'
            },
        }
        $http(req).success(function (response, status, headers, cfg) {
            if (response.success) {
                // alert()
            } else {

            }
        }).error(function (response, status, headers, cfg) {

        });
    };

    /**
     * 选择商品
     * @param _id
     * @param _name
     * @param _image
     * @param _price
     */
    $scope.selectProduct = function (_id, _name, _image, _price) {
        $scope.product = {
            id: _id,
            name: _name,
            image: _image,
            price: _price,
            quantity: 1
        }
    }

    $scope.reduce = function () {
        if ($scope.product.quantity > 1) {
            $scope.product.quantity = $scope.product.quantity - 1;
        }
    };

    $scope.raise = function () {
        $scope.product.quantity = $scope.product.quantity + 1;
    }

});