<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/26
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="/tag-util" %>

<div class="">
    <header class="container-fluid">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="">
                <div class="row text-center order_nav">
                    <div class="col-xs-3 ${status==null||status==''?'active':''}">
                        <a class="center-block" href="/member/score_order/list">
                            <h5>全部</h5>
                        </a>
                    </div>
                    <div class="col-xs-3 ${status=='NO_PAY'?'active':''}">
                        <a class="center-block" href="/member/score_order/list?status=XIAD_DAN">
                            <h5>未发货</h5>
                        </a>
                    </div>
                    <div class="col-xs-3 ${status=='PAY'?'active':''}">
                        <a class="center-block" href="/member/score_order/list?status=FA_HUO">
                            <h5>已发货</h5>
                        </a>
                    </div>
                    <div class="col-xs-3 ${status=='FA_HUO'?'active':''}">
                        <a class="center-block" href="/member/score_order/list?status=WAN_CHENG">
                            <h5>完成</h5>
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <div class="container-fluid " style="margin-top: 12%">
        <c:if test="${list==null||list.size()==0}">
            <div class="weui-msg">
                <div class="weui-msg__icon-area"><i class="weui-icon-info-circle weui-icon_msg"></i></div>
                <div class="weui-msg__text-area">
                    <h2 class="weui-msg__title">没有订单</h2>
                    <p class="weui-msg__desc">您没有任何订单</p>
                </div>
            </div>
        </c:if>
        <c:forEach items="${list}" var="vo">
            <a href="/member/score_order/detail?orderId=${vo.scoreOrder.id}">
                <div class="weui-cells">
                    <div class="weui-cell">
                        <div class="weui-cell__bd order_item_status">
                            <p>${f:getScoreOrderStatus(vo.scoreOrder.status)}</p>
                        </div>
                        <div class="weui-cell__ft">${f:format(vo.scoreOrder.payTime,"yyyy-MM-dd HH:mm:ss")}</div>
                    </div>
                </div>
                <div class="row order_item">
                    <div class="col-xs-4 text-center" style="padding-top: 2%">
                        <a href="#">
                            <img class="media-object cart_img" src="${vo.scoreOrderItem.image}" alt="...">
                        </a>
                    </div>
                    <div class="col-xs-8 cart_description">
                        <h6>${vo.scoreOrderItem.name}</h6>
                        <p>积分：${vo.scoreOrderItem.score}</p>
                        <div>数量：${vo.scoreOrderItem.quantity}</div>
                        <p class="price">总积分：${vo.scoreOrderItem.totalScore}</p>
                    </div>
                </div>
            </a>
        </c:forEach>
    </div>
</div>
