<%--
  Created by IntelliJ IDEA.
  User: luyilaosan1
  Date: 2016/3/1.0001
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<li>
    <a href="<spring:url value="/products"/>">Home</a>
</li>
<li>
    <a href="<spring:url value="/products"/>">Products</a>
</li>
<li>
    <a href="<spring:url value="/products/add"/>">Add Product</a>
</li>
<li>
    <a href="<spring:url value="/cart"/>">Cart</a>
</li>