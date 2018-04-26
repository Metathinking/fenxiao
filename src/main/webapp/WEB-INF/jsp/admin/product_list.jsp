<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/29
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="/tag-util" %>

<div class="breadcrumbs">
    <a href="/admin/">首页</a>
    &rsaquo; 商品列表
</div>
<!-- Content -->
<div id="content" class="flex">
    <h1>商品列表</h1>
    <div id="content-main">
        <ul class="object-tools">
            <li>
                <a href="/admin/product/edit" class="addlink">
                   添加商品
                </a>
            </li>
        </ul>
        <div class="module" id="changelist">
            <form id="changelist-form" method="post" novalidate>
                <div class="results">
                    <table id="result_list">
                        <thead>
                        <tr>
                            <th scope="col" class="sortable column-name">
                                <div class="text">名称</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-xiangXing">
                                <div class="text">香型</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-rongLiang">
                                <div class="text">容量</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-duShu">
                                <div class="text">度数</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-price">
                                <div class="text">价格</div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-price">
                                <div class="text">操作</div>
                                <div class="clear"></div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="product">
                        <tr class="row1">
                            <th class="field-name"><a href="/admin/music/product/1/change/">${product.name}</a></th>
                            <td class="field-xiangXing">${product.xiangXing}</td>
                            <td class="field-rongLiang">${product.rongLiang} ml</td>
                            <td class="field-duShu">${product.duShu} 度</td>
                            <td class="field-price">${product.price} 元</td>
                            <td class="">
                                <a href="/admin/product/edit?id=${product.id}">编辑</a>|
                                <a href="/admin/product/delete?id=${product.id}">删除</a>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <p class="paginator">
                    <c:forEach items="${f:getPageIndex(pageQuery)}" var="page">
                        <c:choose>
                            <c:when test="${page==pageQuery.index}">
                                <span class="this-page">${page}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="/admin/order/list?index=${page}&status=${status}">${page}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    共${pageQuery.count}条,${pageQuery.pageCount}页
                </p>
            </form>
        </div>
    </div>
    <br class="clear"/>
</div>
<!-- END Content -->
