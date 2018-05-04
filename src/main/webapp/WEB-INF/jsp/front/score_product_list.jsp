<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/28
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div ng-controller="scoreOrderController">
    <header class="container-fluid header">
    </header>
    <div class="container-fluid" style="margin-top: 30px">
        <div class="row">
            <c:forEach items="${productList}" var="product">
                <div class="product_item text-center" style="width: 50%;float: left">
                    <a href="/score_product/${product.id}">
                        <img src="${product.image}" class="product_img">
                        <p>${product.name}</p>
                    </a>
                    <div class="text-left description price" style="width: 50%;float: left">积分：${product.score}</div>
                    <button type="button" class="btn btn-danger btn-sm" ng-click="selectProduct(${product.id},'${product.name}',${product.score})"
                            style="float: right;margin-bottom: 4%;margin-right: 4%" data-toggle="modal" data-target="#send">兑换
                    </button>
                    <div class="clearfix"></div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!--modal start -->
    <div class="modal fade" id="send" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">兑换</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>姓名</label>
                            <input type="text" class="form-control" ng-model="orderVO.scoreOrder.memberName"/>
                        </div>
                        <div class="form-group">
                            <label>电话</label>
                            <input type="text" class="form-control" ng-model="orderVO.scoreOrder.phone"/>
                        </div>
                        <div class="form-group">
                            <label>地址</label>
                            <input type="text" class="form-control" ng-model="orderVO.scoreOrder.address"/>
                        </div>
                        <div class="form-group">
                            <label>{{orderVO.scoreOrderItem.name}}</label>
                        </div>
                        <div class="form-group">
                            <label>积分:{{orderVO.scoreOrderItem.score}}</label>
                        </div>
                        <div class="form-group">
                            <label>数量</label>
                            <input type="number" class="form-control" ng-model="orderVO.scoreOrderItem.quantity"/>
                        </div>
                        <div class="form-group">
                            <label>总积分：{{orderVO.scoreOrderItem.score*orderVO.scoreOrderItem.quantity}}</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="change()">兑换</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--modal end -->
</div>
<script>

    app.controller("scoreOrderController", function ($scope, $http) {

        $scope.orderVO={
            scoreOrder:{
                memberName:'${member.name}',
                phone:'${member.phone}',
                address:'${member.address}',
            },
        }

        //送货信息
        $scope.selectProduct = function (_productId, _name, _score) {
            $scope.orderVO.scoreOrderItem = {
                productId: _productId,
                name: _name,
                score: _score,
                quantity: 1
            };
        };
        //申请兑换
        $scope.change = function () {
            var req = {
                method: 'POST',
                url: context + '/member/score_order/change',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: $scope.orderVO
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    window.location.href="/member/score_order/list";
                } else {
                    alert(response.msg)
                }
            }).error(function (response, status, headers, cfg) {

            });
        };
    })
</script>