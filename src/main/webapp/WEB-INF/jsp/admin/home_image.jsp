<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/29
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="breadcrumbs">
    <a href="/admin/">首页</a>
    &rsaquo; 首页图片
</div>
<!-- Content -->
<div id="content" class="colM" ng-controller="homeImageController">
    <h1>首页图片</h1>
    <div id="content-main">
        <div>
            <fieldset class="module aligned ">
                <div class="row">
                    <c:forEach items="${list}" var="image">
                        <div class="col-md-3">
                            <p>
                                <img src="${image.url}" style="width: 100%"/>
                            </p>
                            <p>
                                <a href="/admin/homeImage/delete?id=${image.id}">
                                    删除
                                </a>
                            </p>
                        </div>
                    </c:forEach>
                </div>
                <div class="form-row">
                    <!--图片上传 start-->
                    <div class="form-group ">
                        <label>添加图片</label>(1、图片大小不能超过2M；2、支持格式：.jpg .gif .png .bmp)
                        <div class="panel panel-default" ng-controller="imageController">
                            <div class="panel-body" nv-file-drop="" uploader="imageController.uploader"
                                 filters="queueLimit, customFilter">
                                <input type="file" nv-file-select="" uploader="imageController.uploader"/>
                                <ol>
                                    <li ng-repeat="item in imageController.images">{{item}}
                                        <button class="btn btn-raised btn-sm btn-primary"
                                                ng-click="add(item)">添加
                                        </button>
                                    </li>
                                </ol>
                                <div class="alert alert-danger" ng-if="imageError">
                                    {{imageError}}
                                </div>
                                <table class="table" ng-if="imageController.uploader.queue.length>0">
                                    <thead>
                                    <tr>
                                        <th width="50%">图片</th>
                                        <th ng-show="imageController.uploader.isHTML5">大小</th>
                                        <th ng-show="imageController.uploader.isHTML5">进度</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-repeat="item in imageController.uploader.queue">
                                        <td><strong>{{ item.file.name }}</strong></td>
                                        <td ng-show="imageController.uploader.isHTML5" nowrap>
                                            {{item.file.size/1024/1024|number:2}} MB
                                        </td>
                                        <td ng-show="imageController.uploader.isHTML5">
                                            <div class="progress" style="margin-bottom: 0;">
                                                <div class="progress-bar" role="progressbar"
                                                     ng-style="{ 'width': item.progress + '%' }"></div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <span ng-show="item.isSuccess">成功</span>
                                            <span ng-show="item.isError">失败</span>
                                        </td>
                                        <td nowrap>
                                            <button type="button" class="btn btn-raised btn-success btn-xs"
                                                    ng-click="item.upload()"
                                                    ng-disabled="item.isReady || item.isUploading || item.isSuccess">
                                                上传
                                            </button>
                                            <button type="button" class="btn btn-raised btn-danger btn-xs"
                                                    ng-click="item.remove()">
                                                移除
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--图片上传 end-->
                </div>

            </fieldset>
            <p class="errornote" ng-if="error">
                {{error}}
            </p>
            <p class="successnote" ng-if="success_message">
                {{success_message}}
            </p>
            <%--<div class="submit-row">--%>
            <%--<input type="button" value="保存" class="default" name="_save" ng-click="save()"/>--%>
            <%--</div>--%>
        </div>
    </div>
    <br class="clear"/>
</div>
<!-- END Content -->

<script>
    app.controller("homeImageController", function ($scope, $http) {
        $scope.error = "";
        $scope.success_message = "";

        $scope.imageController = {
            images: [],
            uploader: {}
        };

        $scope.add = function (_imageSrc) {
            var req = {
                method: 'POST',
                url: context + '/admin/homeImage/add',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: {
                    url: _imageSrc
                }
            };
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    window.location.reload();
                } else {
                    $scope.success_message = "";
                    $scope.error = response.msg;
                }
            }).error(function (response, status, headers, cfg) {
                $scope.error = response;
            })
        };
    })
</script>
