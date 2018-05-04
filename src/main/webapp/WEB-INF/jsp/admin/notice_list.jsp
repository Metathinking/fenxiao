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
    &rsaquo; 公告管理
</div>
<!-- Content -->
<div ng-controller="noticeController">
    <div id="content" class="flex">
        <h1>公告管理</h1>
        <div id="content-main">
            <ul class="object-tools">
                <li>
                    <a class="addlink" href="#" data-toggle="modal" data-target="#addNotice">
                        添加公告
                    </a>
                </li>
            </ul>
            <div class="module" id="changelist">
                <form id="changelist-form" method="post" novalidate>
                    <div class="results">
                        <table id="result_list">
                            <thead>
                            <tr>
                                <th scope="col" class="sortable column-name">
                                    <div class="text">编号</div>
                                    <div class="clear"></div>
                                </th>
                                <th scope="col" class="sortable column-xiangXing">
                                    <div class="text">内容</div>
                                    <div class="clear"></div>
                                </th>
                                <th scope="col" class="sortable column-rongLiang">
                                    <div class="text">时间</div>
                                    <div class="clear"></div>
                                </th>
                                <th scope="col" class="sortable column-price">
                                    <div class="text">操作</div>
                                    <div class="clear"></div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="item">
                                <tr class="row1">
                                    <th class="field-name">${item.id}</th>
                                    <td class="field-xiangXing">${item.content}</td>
                                    <td class="field-rongLiang">${f:format(item.time,"yyyy-MM-dd HH:mm:ss" )}</td>
                                    <td class="">
                                        <a href="#" data-toggle="modal" data-target="#updateNotice"
                                           ng-click="select(${item.id},'${item.content}')">编辑</a>|
                                        <a href="/admin/notice/updateToNew?id=${item.id}">设为最新</a>|
                                        <a href="/admin/notice/delete?id=${item.id}">删除</a>
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
                                    <a href="/admin/product/list?index=${page}&status=${status}">${page}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        共${pageQuery.count}条,${pageQuery.pageCount}页
                    </p>
                </form>
            </div>
        </div>
        <br class="clear"/>
    </div>
    <!-- END Content -->
    <!--modal start -->
    <div class="modal fade" id="addNotice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form method="post" action="/admin/notice/add">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel1">添加公告</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>内容</label>
                            <input type="text" class="form-control" name="content"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <input type="submit" class="btn btn-primary" value="添加">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--modal end -->

    <!--modal start -->
    <div class="modal fade" id="updateNotice" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">编辑</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>内容</label>
                            <input type="text" class="form-control" ng-model="notice.content"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="update()">保存
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--modal end -->
</div>
<script>
    app.controller("noticeController", function ($scope, $http) {
        //公告信息
        $scope.select = function (_id, _content) {
            $scope.notice = {
                id: _id,
                content: _content,
            };
        };
        //保存
        $scope.update = function () {
            var req = {
                method: 'POST',
                url: context + '/admin/notice/update',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: $scope.notice
            }
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    window.location.reload();
                } else {

                }
            }).error(function (response, status, headers, cfg) {

            });
        };

    })
</script>