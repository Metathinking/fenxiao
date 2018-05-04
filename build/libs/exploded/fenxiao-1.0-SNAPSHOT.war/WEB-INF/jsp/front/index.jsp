<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/28
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div ng-controller="indexController">
    <header class="container-fluid header">
        <!-- 轮转页面 start -->
        <div class="carousel slide" id="myCarousel" data-ride="carousel">
            <ol class="carousel-indicators">
                <c:forEach items="${homeImageList}" var="image" varStatus="status">
                    <li data-target="#myCarousel" data-side-to="${status.index}"
                        class="${status.index==0?'active':''}"></li>
                </c:forEach>
            </ol>
            <div class="carousel-inner" role="listbox">
                <c:forEach items="${homeImageList}" var="image" varStatus="status">
                    <div class="item ${status.index==0?'active':''}"><img src="${image.url}"/></div>
                </c:forEach>
            </div>
            <!-- slider start -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <!-- slider end -->
        </div>
        <!-- 轮转页面 end -->
    </header>
    <div class="container-fluid" style="margin-top: 30px">
        <!--公告 start-->
        <c:if test="${notice!=null}">
            <div class="row" style="background: #FFFFFF">
                <marquee>
                        ${notice.content}
                </marquee>
            </div>
        </c:if>
        <!--公告 end-->
        <div class="row">
            <c:forEach items="${list}" var="product">
                <div class=" product_item text-center" style="width: 50%;float: left">
                    <a href="/product/${product.id}">
                        <img src="${product.image}" class="product_img">
                        <p>${product.name}</p>
                    </a>
                    <div class="" style="width: 100%">
                        <div class="" style="width: 60%;float: left">
                            <p class="text-left description">容量：${product.rongLiang}ml</p>
                            <p class="text-left description">香型：${product.xiangXing}</p>
                            <p class="text-left description price">价格：￥${product.price}</p>
                        </div>
                        <div class=" text-center" style="width: 40%;float: left">
                            <%--<span class="glyphicon glyphicon-shopping-cart shop-cart" ng-click="addCartItem(${product.id})"></span>--%>
                            <span class="glyphicon glyphicon-shopping-cart shop-cart" ng-click="selectProduct(${product.id},'${product.name}','${product.image}',${product.price})"
                                  data-toggle="modal" data-target="#addCartItem"></span>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>

    <!--modal start -->
    <div class="modal fade" id="addCartItem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="width: 100%">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form>
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span>
                        </button>
                        <div class="modal-title" id="myModalLabel">
                            <img ng-src="{{product.image}}" style="width: 30%">
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>{{product.name}}</label>
                        </div>
                        <div class="form-group">
                            <label class="price">￥{{product.price}}</label>
                        </div>
                        <div class="form-group">
                            <label>数量:</label>
                            <div class="cart_item_calc">
                                <button type="button" ng-click="reduce()">
                                    <span class="glyphicon glyphicon-minus"></span>
                                </button>
                                <input type="text" class="cart_item_count" ng-value="product.quantity"/>
                                <button type="button" ng-click="raise()">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                        <button type="button" class="btn btn-danger btn-block" data-dismiss="modal" ng-click="addCartItem()">加入购物车
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--modal end -->
</div>
