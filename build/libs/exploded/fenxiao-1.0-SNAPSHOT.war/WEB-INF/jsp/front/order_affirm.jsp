<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/16
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div ng-controller="affirm" ng-init="init()">
    <div class="container-fluid">
        <div class="row order_item info">
            <div class="col-xs-1">
                <span class="glyphicon glyphicon-map-marker"></span>
            </div>
            <div class="col-xs-11" data-toggle="modal" data-target="#addPage">
                <p>收货人：{{orderVO.order.memberName}}</p>
                <p>电话：{{orderVO.order.phone}}</p>
                <p>收货地址：{{orderVO.order.address}}</p>
            </div>
        </div>
        <!-- 商品列表 -->
        <%--<c:forEach items="${orderVO.itemList}" var="item">--%>
        <div class="row order_item" ng-repeat="item in orderVO.itemList">
            <div class="col-xs-4 text-center">
                <a href="#">
                    <img class="media-object cart_img" ng-src="{{item.image}}" alt="...">
                </a>
            </div>
            <div class="col-xs-8 cart_description">
                <h4>{{item.name}}
                    <%--<span class="order_item_status">--%>
                    <%--完成--%>
                    <%--</span>--%>
                </h4>
                <%--<p>容量：500ml</p>--%>
                <!--<p class="price">价格：￥99999</p>-->
                <p>数量：{{item.quantity}}</p>
                <p class="price">总金额：￥{{item.totalPrice}}</p>
                <%--<p class="order_item_time">2018-9-9 1:12:11</p>--%>
            </div>
        </div>
        <%--</c:forEach>--%>
    </div>
    <div class="form-group">
        <label>备注</label>
        <input type="text" class="form-control" ng-model="orderVO.order.remark"/>
    </div>
    <footer>
        <nav class="navbar navbar-default navbar-fixed-bottom ">
            <div class="">
                <div class="row ">
                    <div class="col-xs-8" style="padding-left: 32px">
                        <h4 class="price">￥<span ng-bind="orderVO.order.grandTotal"></span></h4>
                    </div>
                    <div class="col-xs-4 text-center" style="padding-top: 8px">
                        <a class="btn btn-danger" ng-click="submit()">
                            提交订单
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </footer>

    <!-- Modals -->
    <div class="modal fade" id="addPage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">编辑信息</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>姓名</label>
                            <input type="text" class="form-control" ng-model="info.memberName"/>
                        </div>
                        <div class="form-group">
                            <label>电话</label>
                            <input type="text" class="form-control" ng-model="info.phone"/>
                        </div>
                        <div class="form-group">
                            <label>地址</label>
                            <input type="text" class="form-control" ng-model="info.address"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="changeInfo()">完成
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script charset="utf-8" src="${pageContext.request.contextPath}/resources/js/jweixin-1.1.0.js"></script>
<script>
    app.controller("affirm", function ($scope, $http) {
        $scope.info = {
            memberName: '',
            phone: '',
            address: ''
        };
        $scope.init = function () {
            var req = {
                method: 'POST',
                url: context + '/member/order/be_sure',
                headers: {
                    'Content-Type': 'application/json'
                },
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    $scope.orderVO = response.data;
                    $scope.info = {
                        memberName: $scope.orderVO.order.memberName,
                        phone: $scope.orderVO.order.phone,
                        address: $scope.orderVO.order.address
                    };
                } else {

                }
            }).error(function (response, status, headers, cfg) {

            });
        };


        $scope.changeInfo = function () {
            $scope.orderVO.order.memberName = $scope.info.memberName;
            $scope.orderVO.order.phone = $scope.info.phone;
            $scope.orderVO.order.address = $scope.info.address;
        };
        $scope.submit = function () {
            var req = {
                method: 'POST',
                url: context + '/member/order/order_submit',
                data: $scope.orderVO,
                headers: {
                    'Content-Type': 'application/json'
                },
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    //支付模块 start
                    function onBridgeReady() {
                        WeixinJSBridge.invoke(
                            'getBrandWCPayRequest', {
                                "appId": response.data.appId,     //公众号名称，由商户传入
                                "timeStamp": response.data.timeStamp,         //时间戳，自1970年以来的秒数
                                "nonceStr": response.data.nonceStr, //随机串
                                "package": response.data.package,
                                "signType": response.data.signType,         //微信签名方式：
                                "paySign": response.data.paySign//微信签名
                            },
                            function (res) {
                                if (res.err_msg == "get_brand_wcpay_request:ok") {
                                }     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。
                            }
                        );
                    }

                    if (typeof WeixinJSBridge == "undefined") {
                        if (document.addEventListener) {
                            document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
                        } else if (document.attachEvent) {
                            document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                            document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
                        }
                    } else {
                        onBridgeReady();
                    }
                    //支付模块 end
                } else {
                    alert(response.msg);
                }
            }).error(function (response, status, headers, cfg) {

            });
        };
    })
</script>
