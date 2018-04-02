<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/29
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="breadcrumbs">
    <a href="/admin/">首页</a>
    &rsaquo; <a href="/admin/product/list">商品列表</a>
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
            <form id="changelist-form" method="post" novalidate><input type='hidden' name='csrfmiddlewaretoken'
                                                                       value='Bg6NhNLw9OlQVBmqdhC8r39bQD7qfxO4FnwUzB3EAZyHFwfuKBkHdH3ajFq1o2mK'/>
                <%--<div class="actions">--%>
                <%--<label>Action: <select name="action" required>--%>
                <%--<option value="" selected>---------</option>--%>
                <%--<option value="delete_selected">Delete selected products</option>--%>
                <%--</select></label><input type="hidden" name="select_across" value="0" class="select-across" />--%>
                <%--<button type="submit" class="button" title="Run the selected action" name="index" value="0">Go</button>--%>
                <%--<span class="action-counter" data-actions-icnt="1">0 of 1 selected</span>--%>
                <%--</div>--%>
                <div class="results">
                    <table id="result_list">
                        <thead>
                        <tr>
                            <%--<th scope="col"  class="action-checkbox-column">--%>
                            <%--<div class="text"><span><input type="checkbox" id="action-toggle" /></span></div>--%>
                            <%--<div class="clear"></div>--%>
                            <%--</th>--%>
                            <th scope="col" class="sortable column-name">
                                <div class="text"><a href="?o=1">名称</a></div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-xiangXing">
                                <div class="text"><a href="?o=2">香型</a></div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-rongLiang">
                                <div class="text"><a href="?o=3">容量</a></div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-duShu">
                                <div class="text"><a href="?o=4">度数</a></div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-price">
                                <div class="text"><a href="?o=5">价格</a></div>
                                <div class="clear"></div>
                            </th>
                            <th scope="col" class="sortable column-price">
                                <div class="text"><a href="?o=5">操作</a></div>
                                <div class="clear"></div>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="product">
                        <tr class="row1">
                            <%--<td class="action-checkbox"><input type="checkbox" name="_selected_action" value="1"--%>
                                                               <%--class="action-select"/></td>--%>
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
                <%--<p class="paginator">--%>
                    <%--1 product--%>
                <%--</p>--%>
            </form>
        </div>
    </div>
    <br class="clear"/>
</div>
<!-- END Content -->
