<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/28
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="/tag-util" %>
<div class="breadcrumbs">
    <a href="/admin/">首页</a>
    &rsaquo; 订单管理
</div>
<!-- Content -->
<div id="content" class="flex" ng-controller="orderListController">
    <h1>订单管理</h1>
    <div id="content-main">
        <div class="module" id="changelist">
            <form id="changelist-form" method="post" novalidate>
                <div class="actions">
                    <button type="button" class="button" onclick="reload(${pageQuery.index},'')">全部</button>
                    <button type="button" class="button" onclick="reload(${pageQuery.index},'NO_PAY')">未付款</button>
                    <button type="button" class="button" onclick="reload(${pageQuery.index},'PAY')">已付款</button>
                    <button type="button" class="button" onclick="reload(${pageQuery.index},'FA_HUO')">已发货</button>
                    <button type="button" class="button" onclick="reload(${pageQuery.index},'WAN_CHENG')">完成</button>
                </div>
                <div class="results">
                    <table id="result_list">
                        <thead>
                        <tr>
                            <th scope="col" class="sortable column-name">
                                <div class="text">编号</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">会员名称</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">电话</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">地址</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">金额(元)</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">付款时间</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">状态</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">备注</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">操作</div>
                                <div class="clear"></div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="vo">
                            <tr class="row1" style="background-color: #79aec8;color: #FFFFFF">
                                <td>${vo.order.id}</td>
                                <td>${vo.order.memberName}</td>
                                <td>${vo.order.phone}</td>
                                <td>${vo.order.address}</td>
                                <td>${vo.order.grandTotal}</td>
                                <td>${f:format(vo.order.payTime,"yyyy-MM-dd HH:mm:ss")}</td>
                                <td>${f:getOrderDescription(vo.order.status)}</td>
                                <td>${vo.order.remark}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${vo.order.status=='NO_PAY'}">
                                            等待付款
                                        </c:when>
                                        <c:when test="${vo.order.status=='PAY'}">
                                            <button ng-click="sendTip(${vo.order.id},'${vo.order.memberName}','${vo.order.phone}','${vo.order.address}')"
                                                    data-toggle="modal" data-target="#send">发货
                                            </button>
                                        </c:when>
                                        <c:when test="${vo.order.status=='FA_HUO'}">
                                            <button ng-click="getSendInfo(${vo.order.id})" data-toggle="modal" data-target="#sendInfo">发货记录</button>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                            <c:forEach items="${vo.itemList}" var="item">
                                <tr class="row1">
                                    <td>商品信息</td>
                                    <td>${item.name}</td>
                                    <td>价格：${item.price}</td>
                                    <td>数量：${item.quantity}</td>
                                    <td>金额${item.totalPrice}</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </c:forEach>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <p class="paginator">
                    <c:forEach items="${f:getPageIndex(pageQuery)}" var="page">
                        <c:choose>
                            <c:when test="${page==pageQuery.index}">
                                <span class="this-page">${page}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="/admin/order/list?index=${page}&status=${status}">${page}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    共${pageQuery.count}条,${pageQuery.pageCount}页
                </p>
            </form>
        </div>
    </div>
    <br class="clear"/>

    <!--modal start -->
    <div class="modal fade" id="send" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">发货</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>姓名</label>
                            <input type="text" class="form-control" ng-model="info.name"/>
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
                        <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="send()">发货</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--modal end -->

    <!--modal sendinfo start -->
    <div class="modal fade" id="sendInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel2">发货</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>姓名:{{sendInfo.name}}</label>
                        </div>
                        <div class="form-group">
                            <label>电话:{{sendInfo.phone}}</label>
                        </div>
                        <div class="form-group">
                            <label>地址:{{sendInfo.address}}</label>
                        </div>
                        <div class="form-group">
                            <label>时间:{{sendInfo.time|date:'yyyy-MM-dd HH:mm:ss'}}</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-default" disabled>已发货</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--modal sendinfo end -->
</div>
<!-- END Content -->
<script>
    function reload(_index, _status) {
        window.location.href = "/admin/order/list?index=" + _index + "&status=" + _status;
    }

    app.controller("orderListController", function ($scope, $http) {

        //送货信息
        $scope.sendTip = function (_orderId, _name, _phone, _address) {
            $scope.info = {
                orderId: _orderId,
                name: _name,
                phone: _phone,
                address: _address,
                orderType:'COMMON'
            };
        };
        //提交送货记录
        $scope.send = function () {
            var req = {
                method: 'POST',
                url: context + '/admin/send_record/send',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: $scope.info
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    window.location.reload();
                } else {

                }
            }).error(function (response, status, headers, cfg) {

            });
        };

        //查询送货记录
        $scope.getSendInfo = function (_orderId) {
            var req = {
                method: 'POST',
                url: context + '/admin/send_record/sendInfo?orderId='+_orderId+"&type=COMMON",
                headers: {
                    'Content-Type': 'application/json'
                },
                data: $scope.info
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    $scope.sendInfo=response.data;
                } else {

                }
            }).error(function (response, status, headers, cfg) {

            });
        }
    })
</script>
