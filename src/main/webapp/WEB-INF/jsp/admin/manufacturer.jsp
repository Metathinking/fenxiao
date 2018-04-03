<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/29
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/angular-1.5.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/fenxiao.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/resources/js/angular-file-upload.min.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/resources/js/controller.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/resources/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/resources/kindeditor/lang/zh-CN.js"></script>
<div class="breadcrumbs">
    <a href="/admin/">首页</a>
    &rsaquo; 厂商信息
</div>
<!-- Content -->
<div id="content" class="colM" ng-app="app" ng-controller="manufacturerController">
    <h1>厂商信息</h1>
    <div id="content-main">
        <div>
            <fieldset class="module aligned ">
                <div class="form-row field-name">
                    <div>
                        <label class="required" for="id_name">名称:</label>
                        <input type="text" name="name" class="vTextField" maxlength="500" required id="id_name"
                               ng-model="manufacturer.name"/>
                    </div>
                </div>
                <div class="form-row field-phone">
                    <div>
                        <label class="required" for="id_phone">电话:</label>
                        <input type="text" name="phone" class="vTextField" maxlength="100" required
                               ng-model="manufacturer.phone"
                               id="id_phone"/>
                    </div>
                </div>
                <div class="form-row field-address">
                    <div>
                        <label class="required" for="id_address">地址:</label>
                        <input type="text" name="address" class="vTextField" maxlength="100" required
                               ng-model="manufacturer.address"
                               id="id_address"/>
                    </div>
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
                                                ng-click="addImageToContent(item)">添加
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
                                        <td ng-show="imageController.uploader.isHTML5" nowrap>{{
                                            item.file.size/1024/1024|number:2}} MB
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
                <div class="form-row field-introduction">
                    <div>
                        <label class="required" for="id_introduction">介绍:</label>
                        <textarea id="editor_id" name="content" name="introduction" cols="40" rows="10"
                                  class="vLargeTextField" required id="id_introduction">
                            ${manufacturer.introduction}
                        </textarea>
                    </div>
                </div>
            </fieldset>
            <p class="errornote" ng-if="error">
                {{error}}
            </p>
            <p class="successnote" ng-if="success_message">
                {{success_message}}
            </p>
            <div class="submit-row">
                <input type="button" value="保存" class="default" name="_save" ng-click="save()"/>
            </div>
        </div>
    </div>
    <br class="clear"/>
</div>
<!-- END Content -->
<!-- 编辑器 start-->
<script>
    KindEditor.ready(function (K) {
        window.editor = K.create('#editor_id', {
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: false,
            filterMode: false,
//            cssDate:'{font: 18px/32px "Microsoft Yahei";color: #404040;text-indent: 2em;margin: 32px 0 0;}',
            items: [
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons']
        });
    });
</script>
<!-- 编辑器 end-->
<script>
    app.controller("manufacturerController", function ($scope, $http) {
        $scope.error = "";
        $scope.success_message = "";

        $scope.manufacturer = {
            id: '${manufacturer.id}',
            name: "${manufacturer.name}",
            phone: "${manufacturer.phone}",
            address: "${manufacturer.address}"
        };

        $scope.imageController = {
            images: [],
            uploader: {}
        };

        $scope.addImageToContent = function (_imageSrc) {
            window.editor.sync();
            var image = "<div align='center'> <img src='" + _imageSrc + "' style='width:80%'/></div>";
            window.editor.insertHtml(image);
        }

        //保存文章 start
        $scope.save = function () {
            window.editor.sync();
            $scope.manufacturer.introduction = document.getElementById('editor_id').value;

            var req = {
                method: 'POST',
                url: context + '/admin/manufacturer/edit',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: $scope.manufacturer
            };
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    $scope.success_message = response.msg;
                    $scope.error = "";
                } else {
                    $scope.success_message = "";
                    $scope.error = response.msg;
                }
            }).error(function (response, status, headers, cfg) {
                $scope.error = response;
            })
        }
        //保存文章 end
    })
</script>
