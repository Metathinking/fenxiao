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
                        <a class="center-block" href="/member/order/list?memberOpenid=${openid}">
                            <h5>全部</h5>
                        </a>
                    </div>
                    <div class="col-xs-3 ${status=='NO_PAY'?'active':''}">
                        <a class="center-block" href="/member/order/list?status=NO_PAY&memberOpenid=${openid}">
                            <h5>待付款</h5>
                        </a>
                    </div>
                    <div class="col-xs-3 ${status=='PAY'?'active':''}">
                        <a class="center-block" href="/member/order/list?status=PAY&memberOpenid=${openid}">
                            <h5>待发货</h5>
                        </a>
                    </div>
                    <div class="col-xs-3 ${status=='FA_HUO'?'active':''}">
                        <a class="center-block" href="/member/order/list?status=FA_HUO&memberOpenid=${openid}">
                            <h5>待收货</h5>
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
            <a href="/member/order/detail?orderId=${vo.order.id}">
                <div class="row weui-cells" style="padding-top: 0;padding-bottom: 0">
                    <div class="weui-cell">
                        <div class="weui-cell__bd order_item_status">
                            <p>${f:getOrderDescription(vo.order.status)}</p>
                        </div>
                        <div class="weui-cell__ft">${f:format(vo.order.payTime,"yyyy-MM-dd HH:mm:ss")}</div>
                    </div>
                </div>
                <c:forEach items="${vo.itemList}" var="item">
                    <div class="row order_item">
                        <div class="col-xs-4 text-center" style="padding-top: 2%">
                            <img class="media-object cart_img" src="${item.image}" alt="...">
                        </div>
                        <div class="col-xs-8 cart_description">
                            <h5>${item.name}</h5>
                            <h6>容量：${item.rongLiang}</h6>
                            <h6>数量：${item.quantity}</h6>
                            <h5 class="price">总金额：￥${item.totalPrice}</h5>
                        </div>
                    </div>
                </c:forEach>
            </a>
        </c:forEach>
    </div>
</div>
