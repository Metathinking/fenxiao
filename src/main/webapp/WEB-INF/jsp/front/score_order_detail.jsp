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
                <p>收货人：${orderVO.scoreOrder.memberName}</p>
                <p>电话：${orderVO.scoreOrder.phone}</p>
                <p>收货地址：${orderVO.scoreOrder.address}</p>
            </div>
        </div>
        <!-- 商品列表 -->
        <div class="row order_item" >
            <div class="col-xs-4 text-center">
                <a href="#">
                    <img class="media-object cart_img" src="${orderVO.scoreOrderItem.image}" alt="...">
                </a>
            </div>
            <div class="col-xs-8 cart_description">
                <h5>${orderVO.scoreOrderItem.name}</h5>
                <p>数量：${orderVO.scoreOrderItem.quantity}</p>
                <p class="price">总金额：￥${orderVO.scoreOrderItem.totalPrice}</p>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label>备注</label>
        <p>${orderVO.scoreOrder.remark}</p>
    </div>
    <footer>
        <nav class="navbar navbar-default navbar-fixed-bottom ">
            <div class="">
                <div class="row ">
                    <div class="col-xs-8" style="padding-left: 32px">
                        <h5 class="price">${orderVO.scoreOrder.grandTotal}</h5>
                    </div>
                    <div class="col-xs-4 text-center" style="padding-top: 8px">
                        <c:if test="${orderVO.order.status=='FA_HUO'}">
                            <a class="btn btn-danger" href="/member/score_order/shouHuo?orderId=${orderVO.scoreOrder.id}">
                                确认收货
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>
    </footer>
</div>

