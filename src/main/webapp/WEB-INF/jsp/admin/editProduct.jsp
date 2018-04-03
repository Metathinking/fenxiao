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
    &rsaquo; <a href="/admin/product/list/">商品列表</a>
    &rsaquo; 添加商品
</div>
<!-- Content -->
<div id="content" class="colM" ng-app="app" ng-controller="editProductController">
    <h1>添加商品</h1>
    <div id="content-main">
        <div>
            <fieldset class="module aligned ">
                <div class="form-row field-name">
                    <div>
                        <label class="required" for="id_name">名称:</label>
                        <input type="text" name="name" class="vTextField" maxlength="500" required id="id_name"
                               ng-model="product.name"/>
                    </div>
                </div>
                <div class="form-row field-xiangXing">
                    <div>
                        <label class="required" for="id_xiangXing">香型:</label>
                        <input type="text" name="xiangXing" class="vTextField" maxlength="100" required
                               ng-model="product.xiangXing"
                               id="id_xiangXing"/>
                    </div>
                </div>
                <div class="form-row field-rongLiang">
                    <div>
                        <label class="required" for="id_rongLiang">容量:</label>
                        <input type="text" name="rongLiang" class="vTextField" maxlength="100" required
                               ng-model="product.rongLiang"
                               id="id_rongLiang"/> ml
                    </div>
                </div>
                <div class="form-row field-duShu">
                    <div>
                        <label class="required" for="id_duShu">度数:</label>
                        <input type="text" name="duShu" class="vTextField" maxlength="100" required id="id_duShu"
                               ng-model="product.duShu"/>度
                    </div>
                </div>
                <div class="form-row field-price">
                    <div>
                        <label class="required" for="id_price">价格:</label>
                        <input type="number" name="price" step="any" required id="id_price" ng-model="product.price"/>元
                    </div>
                </div>
                <div class="form-row field-price">
                    <div>
                        <label class="required" for="id_score">积分:</label>
                        <input type="number" name="score" step="any" required id="id_score" ng-model="product.score"/>元
                    </div>
                </div>
                <div class="form-row field-image">
                    <div>
                        <label class="required" for="id_image">商品图片:</label>
                        <input type="text" name="image" class="vTextField" maxlength="100" required id="id_image"
                               ng-model="product.image" readonly/>
                        <div align='center'><img src='' style='width:80%'/></div>
                        <%--<input type="file" name="file" required id="file"/>--%>
                    </div>
                </div>
                <div class="form-row text-center" ng-if="siteInfo.icon">
                    <img ng-src="{{product.image}}" style="width: 100px;"/>
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

                                        <button class="btn btn-raised btn-sm btn-success"
                                                ng-click="selectProductImage(item)">设为商品图片
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
                            ${product.introduction}
                        </textarea>
                    </div>
                </div>
            </fieldset>
            <div class="submit-row">
                <input type="button" value="保存" class="default" name="_save" ng-click="save(false)"/>
                <input type="button" value="保存并继续" name="_addanother" ng-click="save(true)"/>
                <%--<input type="submit" value="Save and continue editing" name="_continue"/>--%>
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
    app.controller("editProductController", function ($scope, $http) {
        $scope.error = "";

        $scope.product = {
            id: '${product.id}',
            name: "${product.name}",
            xiangXing: "${product.xiangXing}",
            rongLiang: "${product.rongLiang}",
            duShu: "${product.duShu}",
            price: ${product.price},
            score:${product.score},
            image: "${product.image}"
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

        $scope.selectProductImage = function (_imageSrc) {
            $scope.product.image = _imageSrc;
        }
        //保存文章 start
        $scope.save = function (isContinue) {
            window.editor.sync();
            $scope.product.introduction = document.getElementById('editor_id').value;
//                if ($scope.article.content.length == 0) {
//                    $scope.error = "请填写文章内容";
//                    return;
//                }
//                if ($scope.article.image.length == 0) {
//                    $scope.error = "请上传并选择文章的标题图片";
//                    return;
//                }
//                if ($scope.article.tag.length == 0) {
//                    $scope.error = "请填写文章标签，将被用于搜索引擎的搜索使用";
//                    return;
//                }
//                if ($scope.article.description.length == 0) {
//                    $scope.error = "请填写文章的简介，可在文章中摘录一段文字";
//                    return;
//                }
//                $scope.article.open = isOpen;
            var req = {
                method: 'POST',
                url: context + '/admin/product/edit',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: $scope.product
            };
            $http(req).success(function (response, status, headers, cfg) {
                if (response.success) {
                    if (isContinue) {
                        alert(response.msg);
                        $scope.reset();
                    } else {
                        window.location.href = "/admin/product/list";
                    }
                } else {
                    $scope.error = response.msg;
                }
            }).error(function (response, status, headers, cfg) {
                $scope.error = response;
            })
        }
        //保存文章 end
        $scope.reset = function () {
            $scope.error = "";
            $scope.article = {};
            $scope.imageController.images = [];
            $scope.imageController.uploader.queue = [];
            window.editor.html('');
        }

    })
</script>
