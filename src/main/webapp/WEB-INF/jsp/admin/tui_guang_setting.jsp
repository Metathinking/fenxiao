<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/29
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="breadcrumbs">
    <a href="/admin/">首页</a>
    &rsaquo; 推广设置
</div>
<!-- Content -->
<div id="content" class="colM" ng-controller="tuiGuangSettingController">

    <h1>推广设置</h1>
    <div id="content-main">
        <div>
            <c:if test="${not empty errorMessage}">
                <p class="errornote">
                        ${errorMessage}
                </p>
            </c:if>
            <fieldset class="module aligned wide">
                <div class="form-row">
                    <label class="required" for="id_money">获取推广资格所需金额:</label>
                    <input type="number" min="0" ng-model="tuiGuangSetting.money" autofocus required
                           id="id_money"/>元
                </div>
                <div class="form-row">
                    <label class="required" for="id_first">一级会员消费佣金比例:</label>
                    <input type="number" min="0" max="100" ng-model="tuiGuangSetting.first"  required
                           id="id_first"/>%
                </div>
                <div class="form-row">
                    <label class="required" for="id_second">二级会员消费佣金比例:</label>
                    <input type="number" min="0" max="100" ng-model="tuiGuangSetting.second" required
                           id="id_second"/>%
                </div>
                <div class="form-row">
                    <label class="required" for="id_third">三级会员消费佣金比例:</label>
                    <input type="number" min="0" max="100" ng-model="tuiGuangSetting.third" required
                           id="id_third"/>%
                </div>
            </fieldset>
            <p class="errornote" ng-if="error">
                {{error}}
            </p>
            <p class="successnote" ng-if="success_message">
                {{success_message}}
            </p>
            <div class="submit-row">
                <input type="button" ng-click="save()" value="保存" class="default"/>
            </div>
        </div>
    </div>
    <br class="clear"/>
</div>
<!-- END Content -->
<script>
    app.controller("tuiGuangSettingController", function ($scope, $http) {
        $scope.error = "";
        $scope.success_message = "";

        $scope.tuiGuangSetting = {
            id: ${tuiGuangSetting.id},
            money: ${tuiGuangSetting.money},
            first: ${tuiGuangSetting.first},
            second: ${tuiGuangSetting.second},
            third: ${tuiGuangSetting.third}
        };


        //保存 start
        $scope.save = function () {
            var req = {
                method: 'POST',
                url: context + '/admin/tui_guang_setting/edit',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: $scope.tuiGuangSetting
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
        //保存 end
    })
</script>