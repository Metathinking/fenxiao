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
    &rsaquo; 佣金设置
</div>
<!-- Content -->
<div id="content" class="colM" ng-controller="yongJinSettingController">

    <h1>佣金设置</h1>
    <div id="content-main">
        <div>
            <c:if test="${not empty errorMessage}">
                <p class="errornote">
                        ${errorMessage}
                </p>
            </c:if>
            <fieldset class="module aligned wide">
                <div class="form-row">
                    <label class="required" for="id_secondToFirst">二级会员订单，一级会员抽取佣金:</label>
                    <input type="number" min="0" max="100" ng-model="yongJinSetting.secondToFirst" autofocus required
                           id="id_secondToFirst"/>%
                </div>
                <div class="form-row">
                    <label class="required" for="id_memberToFirst">三级会员订单，一级会员抽取佣金:</label>
                    <input type="number" min="0" max="100" ng-model="yongJinSetting.memberToFirst" required id="id_memberToFirst"/>%
                </div>
                <div class="form-row">
                    <label class="required" for="id_memberToSecond">三级会员订单，二级会员抽取佣金:</label>
                    <input type="number" min="0" max="100" ng-model="yongJinSetting.memberToSecond" required id="id_memberToSecond"/>%
                </div>
            </fieldset>
            <div class="submit-row">
                <input type="button" ng-click="save()" value="保存" class="default"/>
            </div>
        </div>
    </div>
    <br class="clear"/>
</div>
<!-- END Content -->
<script>
    app.controller("yongJinSettingController", function ($scope, $http) {
        $scope.error = "";
        $scope.success_message = "";

        $scope.yongJinSetting = {
            id: ${yongJinSetting.id},
            secondToFirst: ${yongJinSetting.secondToFirst},
            memberToFirst: ${yongJinSetting.memberToFirst},
            memberToSecond: ${yongJinSetting.memberToSecond}
        };


        //保存 start
        $scope.save = function () {
            var req = {
                method: 'POST',
                url: context + '/admin/yong_jin_setting/edit',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: $scope.yongJinSetting
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