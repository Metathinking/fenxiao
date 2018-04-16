'use strict';

var app = angular.module('frontApp', []);

app.controller('indexController', function ($scope, $http) {

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



});