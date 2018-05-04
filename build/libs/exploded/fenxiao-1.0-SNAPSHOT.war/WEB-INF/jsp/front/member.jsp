<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/11
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="container-fluid mine_header">
    <div class="">
        <div class="col-xs-4 text-center">
            <img src="${member.headimgurl}" class="mine_header_img"/>
        </div>
        <div class="col-xs-8" style="padding-top: 20px">
            <h4>${member.name}</h4>
            <p>VIP会员</p>
            <p>ID:${member.id}</p>
        </div>

    </div>
</header>
<div class="container-fluid">
    <a href="/member/ti_xian_list">
        <div class="row mine_item" style="margin-top: 5%;">
            <div class="col-xs-1"><span class="glyphicon glyphicon-credit-card" style="color: #FFC125;font-size: 24px"></span></div>
            <div class="col-xs-9">余额：<span style="color: #9f3025">￥${account.money}</span></div>
            <div class="col-xs-1"><span class="glyphicon glyphicon-chevron-right jiantou"></span></div>
        </div>
    </a>
    <a href="/member/score_list">
        <div class="row mine_item">
            <div class="col-xs-1"><span class="glyphicon glyphicon-gift" style="color: #d9534f;font-size: 24px"></span></div>
            <div class="col-xs-9">积分:${account.score}</div>
            <div class="col-xs-1"><span class="glyphicon glyphicon-chevron-right jiantou"></span></div>
        </div>
    </a>
    <a href="/member/order/list">
        <div class="row mine_item" style="margin-top: 1%;">
            <div class="col-xs-1"><span class="glyphicon glyphicon-list-alt" style="color: #FFC125;font-size: 24px"></span></div>
            <div class="col-xs-9">我的订单</div>
            <div class="col-xs-1"><span class="glyphicon glyphicon-chevron-right jiantou"></span></div>
        </div>
    </a>
    <a href="/member/score_order/list">
        <div class="row mine_item">
            <div class="col-xs-1"><span class="glyphicon glyphicon-gift" style="color:#d9534f;font-size: 24px"></span></div>
            <div class="col-xs-9">积分订单</div>
            <div class="col-xs-1"><span class="glyphicon glyphicon-chevron-right jiantou"></span></div>
        </div>
    </a>
<c:if test="${hasTuiGuangPower}">
    <a href="/member/tui_guang/er_wei_ma">
        <div class="row mine_item" style="margin-top: 1%;">
            <div class="col-xs-1"><span class="glyphicon glyphicon-qrcode" style="color:#000080;font-size: 24px"></span></div>
            <div class="col-xs-9">我的二维码</div>
            <div class="col-xs-1"><span class="glyphicon glyphicon-chevron-right jiantou"></span></div>
        </div>
    </a>
    <a href="/member/tui_guang/list">
        <div class="row mine_item">
            <div class="col-xs-1"><span class="glyphicon glyphicon-list" style="color:#2E8B57;font-size: 24px"></span></div>
            <div class="col-xs-9">我的推广</div>
            <div class="col-xs-1"><span class="glyphicon glyphicon-chevron-right jiantou"></span></div>
        </div>
    </a>
</c:if>

</div>
