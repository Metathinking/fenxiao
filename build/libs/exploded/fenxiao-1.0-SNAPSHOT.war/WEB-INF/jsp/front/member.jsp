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
        <div class="col-xs-2 text-center">
            <img src="/resources/img/tou.png" class="mine_header_img"/>
        </div>
        <div class="col-xs-8">
            <h4>${member.name}</h4>
            <p>VIP会员</p>
            <p>ID:${member.id}</p>
        </div>
        <div class="col-xs-2" style="height: 100%">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </div>
    </div>
</header>
<div class="container-fluid">
    <a href="/member/ti_xian_list">
        <div class="row mine_item" style="margin-top: 5%;">
            <div class="col-xs-1"><span class="glyphicon glyphicon-credit-card"></span></div>
            <div class="col-xs-9">余额：<span style="color: #9f3025">￥${account.money}</span></div>
            <div class="col-xs-1"><span class="glyphicon glyphicon-chevron-right"></span></div>
        </div>
    </a>
    <a href="">
        <div class="row mine_item">
            <div class="col-xs-1"><span class="glyphicon glyphicon-gift"></span></div>
            <div class="col-xs-9">积分:${account.score}</div>
            <div class="col-xs-1"><span class="glyphicon glyphicon-chevron-right"></span></div>
        </div>
    </a>
    <a href="/member/order/list">
        <div class="row mine_item" style="margin-top: 1%;">
            <div class="col-xs-1"><span class="glyphicon glyphicon-list-alt"></span></div>
            <div class="col-xs-9">我的订单</div>
            <div class="col-xs-1"><span class="glyphicon glyphicon-chevron-right"></span></div>
        </div>
    </a>
    <a href="">
        <div class="row mine_item">
            <div class="col-xs-1"><span class="glyphicon glyphicon-gift"></span></div>
            <div class="col-xs-9">积分订单</div>
            <div class="col-xs-1"><span class="glyphicon glyphicon-chevron-right"></span></div>
        </div>
    </a>
</div>
