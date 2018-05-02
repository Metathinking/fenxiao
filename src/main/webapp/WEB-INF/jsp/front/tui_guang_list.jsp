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

<c:forEach items="${memberVO.tuiGuangList}" var="first">
    <div class="weui-panel weui-panel_access">
        <div class="weui-panel__hd">一级消费者</div>
        <div class="weui-panel__bd">
            <div class="weui-media-box weui-media-box_appmsg">
                <div class="weui-media-box__hd">
                    <img class="weui-media-box__thumb"
                         src="/resources/img/default_avatar.svg"
                         alt="">
                </div>
                <div class="weui-media-box__bd">
                    <h4 class="weui-media-box__title">${first.member.name}(ID:${first.member.id})</h4>
                    <p class="weui-media-box__desc">电话：${first.member.phone}</p>
                    <p class="weui-media-box__desc">上级会员：${memberVO.member.name}(ID:${memberVO.member.id})</p>
                </div>
            </div>
        </div>
        <div class="weui-panel__ft">
            <a href="/member/order/list?memberOpenid=${first.member.openid}" class="weui-cell weui-cell_access weui-cell_link">
                <div class="weui-cell__bd">查看订单</div>
                <span class="weui-cell__ft"></span>
            </a>
        </div>
    </div>
    <c:forEach items="${first.tuiGuangList}" var="second">
        <div class="weui-panel weui-panel_access">
            <div class="weui-panel__hd">二级消费者</div>
            <div class="weui-panel__bd">
                <div class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media-box__hd">
                        <img class="weui-media-box__thumb"
                             src="/resources/img/default_avatar.svg"
                             alt="">
                    </div>
                    <div class="weui-media-box__bd">
                        <h4 class="weui-media-box__title">${second.member.name}(ID:${second.member.id})</h4>
                        <p class="weui-media-box__desc">电话：${second.member.phone}</p>
                        <p class="weui-media-box__desc">上级会员：${first.member.name}(ID:${first.member.id})</p>
                    </div>
                </div>
            </div>
            <div class="weui-panel__ft">
                <a href="/member/order/list?memberOpenid=${second.member.openid}" class="weui-cell weui-cell_access weui-cell_link">
                    <div class="weui-cell__bd">查看订单</div>
                    <span class="weui-cell__ft"></span>
                </a>
            </div>
        </div>
        <c:forEach items="${second.tuiGuangList}" var="third">
            <div class="weui-panel weui-panel_access">
                <div class="weui-panel__hd">三级消费者</div>
                <div class="weui-panel__bd">
                    <div class="weui-media-box weui-media-box_appmsg">
                        <div class="weui-media-box__hd">
                            <img class="weui-media-box__thumb"
                                 src="/resources/img/default_avatar.svg"
                                 alt="">
                        </div>
                        <div class="weui-media-box__bd">
                            <h4 class="weui-media-box__title">${third.name}(ID:${third.id})</h4>
                            <p class="weui-media-box__desc">电话：${third.phone}</p>
                            <p class="weui-media-box__desc">上级会员：${second.member.name}(ID:${second.member.id})</p>
                        </div>
                    </div>
                </div>
                <div class="weui-panel__ft">
                    <a href="/member/order/list?memberOpenid=${third.openid}" class="weui-cell weui-cell_access weui-cell_link">
                        <div class="weui-cell__bd">查看订单</div>
                        <span class="weui-cell__ft"></span>
                    </a>
                </div>
            </div>
        </c:forEach>
    </c:forEach>
</c:forEach>