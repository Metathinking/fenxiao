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
    <div class="weui-cell weui-cell_access" data-toggle="modal" data-target="#shenQing">
        <div class="weui-cell__bd">
            <p>账户余额：<span style="color: #9f3025;">${account.money}</span></p>
        </div>
        <div class="weui-cell__ft">
        </div>
    </div>
</div>
<c:forEach items="${list}" var="item">
    <c:choose>
        <c:when test="${item.status=='REQUEST'}">
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <i class="weui-icon-waiting " style="width:20px;margin-right:15px;display:block"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <div>提现申请(等待审核): <span style="color: #9f3025;">${item.money}</span></div>
                        <%--<div style="color: #999999;">申请时间：${f:format(item.requestTime,"yyyy-MM-dd HH:mm:ss")}</div>--%>
                    </div>
                    <%--<div class="weui-cell__ft">申请时间：${f:format(item.requestTime,"yyyy-MM-dd HH:mm:ss")}</div>--%>
                </div>
                <div class="weui-cell">
                    <%--<div class="weui-cell__hd">--%>
                        <%--<i class="weui-icon-waiting " style="width:20px;margin-right:15px;display:block"></i>--%>
                    <%--</div>--%>
                    <%--<div class="weui-cell__bd">--%>
                        <%--<p>提现申请(等待审核): <span style="color: #9f3025;">${item.money}</span></p>--%>
                    <%--</div>--%>
                    <div class="weui-cell__ft">申请时间：${f:format(item.requestTime,"yyyy-MM-dd HH:mm:ss")}</div>
                </div>
            </div>
        </c:when>
        <c:when test="${item.status=='OVER'}">
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__hd">
                        <i class="weui-icon-success " style="width:20px;margin-right:15px;display:block"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <p>提现申请(完成): <span style="color: #9f3025;">${item.money}</span></p>
                    </div>
                    <%--<div class="weui-cell__ft">完成时间：${f:format(item.requestTime,"yyyy-MM-dd HH:mm:ss")}</div>--%>
                </div>
                <div class="weui-cell">
                    <%--<div class="weui-cell__hd">--%>
                        <%--<i class="weui-icon-success " style="width:20px;margin-right:15px;display:block"></i>--%>
                    <%--</div>--%>
                    <%--<div class="weui-cell__bd">--%>
                        <%--<p>${f:format(item.requestTime,"yyyy-MM-dd HH:mm:ss")}</p>--%>
                    <%--</div>--%>
                    <div class="weui-cell__ft">完成时间：${f:format(item.requestTime,"yyyy-MM-dd HH:mm:ss")}</div>
                </div>
            </div>
        </c:when>
    </c:choose>
</c:forEach>
<!--modal start -->
<div class="modal fade" id="shenQing" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="/member/ti_xian_request" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">提现申请</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>最大金额:￥${account.money}</label>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>金额:</label>
                        <input type="text" class="form-control" name="money" />
                    </div>
                    <div class="form-group">
                        <label>用户留言:</label>
                        <textarea class="form-control" name="memberWords" rows="5"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <input type="submit" class="btn btn-primary" value="申请"/>
                </div>
            </form>
        </div>
    </div>
</div>
<!--modal end -->
