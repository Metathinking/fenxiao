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
    &rsaquo; 提现申请
</div>
<!-- Content -->
<div id="content" class="flex" ng-controller="tiXianListController">
    <h1>提现申请</h1>
    <div id="content-main">
        <div class="module" id="changelist">
            <div id="changelist-form" novalidate>
                <form class="actions" method="get" action="/admin/ti_xian/list">
                    <input type="text" name="search" placeholder="名称/电话/信息" value="${search}">
                    <input type="submit" class="button" value="查询"/>
                </form>
                <div class="actions">
                    <button type="button" class="button" onclick="reload('')">全部</button>
                    <button type="button" class="button" onclick="reload('REQUEST')">未审核</button>
                    <button type="button" class="button" onclick="reload('OVER')">已完成</button>
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
                                <div class="text">金额(元)</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">申请时间</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">审核时间</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">状态</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">信息</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-name">
                                <div class="text">操作</div>
                                <div class="clear"></div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="item">
                            <tr class="row1">
                                <td>${item.id}</td>
                                <td>${item.memberName}</td>
                                <td>${item.memberPhone}</td>
                                <td>${item.money}</td>
                                <td>${f:format(item.requestTime,"yyyy-MM-dd HH:mm:ss")}</td>
                                <td>${f:format(item.overTime,"yyyy-MM-dd HH:mm:ss")}</td>
                                <td>${f:getTiXianStatus(item.status)}</td>
                                <td>${item.info}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${item.status=='OVER'}">
                                            已完成
                                        </c:when>
                                        <c:when test="${item.status=='REQUEST'}">
                                            <a href="#"
                                               ng-click="shenHeTip(${item.id},'${item.memberName}','${item.memberPhone}','${item.money}','${f:format(item.requestTime,"yyyy-MM-dd HH:mm:ss")}','${item.memberWords}')"
                                               data-toggle="modal" data-target="#shenHe">审核
                                            </a>
                                        </c:when>
                                    </c:choose>
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
                                <a href="/admin/ti_xian/list?index=${page}&status=${status}">${page}</a>
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
    <div class="modal fade" id="shenHe" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">审核</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>姓名:{{info.memberName}}</label>
                        </div>
                        <div class="form-group">
                            <label>电话:{{info.memberPhone}}</label>
                        </div>
                        <div class="form-group">
                            <label>金额:{{info.money}}</label>
                        </div>
                        <div class="form-group">
                            <label>申请时间:{{info.requestTime}}</label>
                        </div>
                        <div class="form-group">
                            <label>用户留言:{{info.memberWords}}</label>
                        </div>
                        <div class="form-group">
                            <label>信息</label>
                            <textarea type="text" class="form-control" ng-model="info.info"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="shenHe()">审核
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--modal end -->

</div>
<!-- END Content -->
<script>

    function reload(_status) {
        window.location.href = "/admin/ti_xian/list?index=" + ${pageQuery.index} +"&status=" + _status + "&search=${search}";
    }

    app.controller("tiXianListController", function ($scope, $http) {

        //送货信息
        $scope.shenHeTip = function (_id, _name, _phone, _money, _time, _memberWords) {
            $scope.info = {
                id: _id,
                memberName: _name,
                memberPhone: _phone,
                money: _money,
                requestTime: _time,
                memberWords: _memberWords
            };
        };
        //提交送货记录
        $scope.shenHe = function () {
            var req = {
                method: 'POST',
                url: context + '/admin/ti_xian/shenHe',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: {
                    id: $scope.info.id,
                    info: $scope.info.info
                }
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    window.location.reload();
                } else {
                    alert(response.msg);
                }
            }).error(function (response, status, headers, cfg) {
            });
        };

    })
</script>
