<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/29
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="/tag-util" %>

<div class="breadcrumbs">
    <a href="/admin/">首页</a>
    &rsaquo; 会员
</div>
<!-- Content -->
<div id="content" class="flex" ng-controller="memberController">
    <h1>会员列表</h1>
    <div id="content-main">
        <div class="module" id="changelist">
            <div id="changelist-form" novalidate>
                <form class="actions" method="get" action="/admin/member/list">
                    <input type="text" name="search" placeholder="名称/电话/地址">
                    <button type="submit" class="button">查询</button>
                </form>
                <div class="results">
                    <table id="result_list">
                        <thead>
                        <tr>
                            <th scope="col" class="sortable column-name">
                                <div class="text">编号</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-xiangXing">
                                <div class="text">名称</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-rongLiang">
                                <div class="text">电话</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-duShu">
                                <div class="text">地址</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-price">
                                <div class="text">等级</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-price">
                                <div class="text">
                                    操作
                                </div>
                                <div class="clear"></div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="item">
                            <tr class="row1">
                                <th class="field-name">${item.id}</th>
                                <td class="field-xiangXing">${item.name}</td>
                                <td class="field-rongLiang">${item.phone} </td>
                                <td class="field-duShu">${item.address}</td>
                                <td class="field-price">${item.level}</td>
                                <td class="">
                                    <a href="/admin/order/list?memberOpenid=${item.openid}">消费详情</a>|
                                    <a href="/admin/score_order/list?memberOpenid=${item.openid}">积分订单</a>|
                                    <a href="#" ng-click="getAccount('${item.id}','${item.name}')"  data-toggle="modal" data-target="#accountInfo">
                                        账户信息
                                    </a>
                                </td>
                            </tr>
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
                                <a href="/admin/member/list?index=${page}&search=${search}">${page}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    共${pageQuery.count}条,${pageQuery.pageCount}页
                </p>
            </div>
        </div>
    </div>
    <br class="clear"/>

    <!--modal start -->
    <div class="modal fade" id="accountInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">账户</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>{{account.memberName}}</label>
                        </div>
                        <div class="form-group">
                            <label>账户余额：￥{{account.money}}</label>
                        </div>
                        <div class="form-group">
                            <label>积分：{{account.score}}</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--modal end -->
</div>
<!-- END Content -->
<script>
    app.controller("memberController", function ($scope, $http) {
        $scope.getAccount = function (_memberId, _memberName) {
            var req = {
                method: 'POST',
                url: context + '/admin/member_account/findById?id=' + _memberId,
                headers: {
                    'Content-Type': 'application/json'
                }
            };
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    $scope.account = response.data;
                    $scope.account.memberName = _memberName;
                } else {

                }
            }).error(function (response, status, headers, cfg) {
            });
        };
    })
</script>