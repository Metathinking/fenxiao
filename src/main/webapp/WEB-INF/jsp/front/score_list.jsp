<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/26
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="/tag-util" %>

<c:if test="${error_msg!=null&&error_msg!=''}">
    <div class="alert alert-danger">
            ${error_msg}
    </div>
</c:if>

<div class="weui-cells">
    <div class="weui-cell weui-cell_access">
        <div class="weui-cell__bd">
            <p>账户积分：<span style="color: #9f3025;">${account.score}</span></p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </div>
</div>
<c:forEach items="${list}" var="item">
    <div class="weui-cells">
        <div class="weui-cell">
            <div class="weui-cell__hd">
                <i class="weui-icon-success " style="width:20px;margin-right:15px;display:block"></i>
            </div>
            <div class="weui-cell__bd">
                <p>积分： <span style="color: #9f3025;">${item.score}</span></p>
            </div>
            <div class="weui-cell__ft">${f:getScoreChangeReason(item.reason)}</div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__ft">${f:format(item.time,"yyyy-MM-dd HH:mm:ss")}</div>
        </div>
    </div>
</c:forEach>
<c:if test="${pageQuery.pageCount>1}">
    <div class="container-fluid">
        <ul class="pagination" style="width:100%;">
            <c:choose>
                <c:when test="${pageQuery.index==1}">
                    <li class="disabled"><a href="javascript:;" style="font-size:20px;padding-left: 32px;padding-right: 32px">上一页</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="?index=${pageQuery.index-1}" style="font-size:20px;padding-left: 32px;padding-right: 32px">上一页</a></li>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${pageQuery.pageCount==pageQuery.index}">
                    <li class="disabled" style="float: right"><a href="javascript:;" style="font-size:20px;padding-left: 32px;padding-right: 32px">下一页</a></li>
                </c:when>
                <c:otherwise>
                    <li style="float: right"><a href="?index=${pageQuery.index+1}" style="font-size:20px;padding-left: 32px;padding-right: 32px">下一页</a></li>
                </c:otherwise>
            </c:choose>

        </ul>
    </div>
</c:if>