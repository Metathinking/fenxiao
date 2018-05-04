<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/16
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="/tag-util" %>

<div>
    <div class="container-fluid">
        <div class="row order_item info">
            <div class="col-xs-1">
                <span class="glyphicon glyphicon-map-marker"></span>
            </div>
            <div class="col-xs-11">
                <p>收货人：${orderVO.order.memberName}</p>
                <p>电话：${orderVO.order.phone}</p>
                <p>收货地址：${orderVO.order.address}</p>
            </div>
        </div>
        <!-- 商品列表 -->
        <c:forEach items="${orderVO.itemList}" var="item">
            <div class="row order_item">
                <div class="col-xs-4 text-center">
                    <a href="#">
                        <img class="media-object cart_img" src="${item.image}" alt="...">
                    </a>
                </div>
                <div class="col-xs-8 cart_description">
                    <h5>${item.name}</h5>
                    <p>数量：${item.quantity}</p>
                    <p class="price">总金额：￥${item.totalPrice}</p>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="form-group">
        <label>备注</label>
        <p>${orderVO.order.remark}</p>
    </div>
    <footer>
        <nav class="navbar navbar-default navbar-fixed-bottom ">
            <div class="">
                <div class="row ">
                    <div class="col-xs-3" style="padding-left: 32px;padding-top: 15px">
                        <p class="price">￥${orderVO.order.grandTotal}</p>
                    </div>
                    <div class="col-xs-9 text-center" style="padding-top: 8px">
                        <c:if test="${orderVO.order.status=='FA_HUO'}">
                            <a class="btn btn-danger" href="/member/order/shouHuo?orderId=${orderVO.order.id}">
                                确认收货
                            </a>
                        </c:if>
                        <c:if test="${orderVO.order.status=='WAN_CHENG'}">
                            <span class="">
                                 交易成功
                            </span>
                        </c:if>
                        <c:if test="${orderVO.order.status=='NO_PAY'&&isCurrentMember}">
                            <a class="btn btn-default" href="/member/order/cancel?orderId=${orderVO.order.id}">取消订单</a>
                            <a class="btn btn-danger" href="/member/order/re_pay?orderId=${orderVO.order.id}" style="color: #FFFFFF;">付款</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>
    </footer>
</div>

