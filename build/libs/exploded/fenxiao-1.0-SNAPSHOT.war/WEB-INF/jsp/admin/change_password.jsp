<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/29
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="breadcrumbs">
    <a href="/admin/">首页</a>
    &rsaquo; 修改密码
</div>
<!-- Content -->
<div id="content" class="colM">

    <h1>修改密码</h1>
    <div id="content-main">
        <form method="post">
            <div>
                <c:if test="${not empty errorMessage}">
                <p class="errornote">
                    ${errorMessage}
                </p>
                </c:if>
                <%--<p>Please enter your old password, for security's sake, and then enter your new password twice so we can verify you typed it in correctly.</p>--%>
                <p>为了安全起见，请输入您的旧密码，然后输入新密码两次，这样我们就可以验证您输入的密码是否正确。</p>
                <fieldset class="module aligned wide">
                    <div class="form-row">
                        <label class="required" for="id_old_password">旧密码:</label> <input type="password" name="old_password" autofocus required id="id_old_password" />
                    </div>
                    <div class="form-row">
                        <label class="required" for="id_new_password1">新密码:</label> <input type="password" name="new_password1" required id="id_new_password1" />
                        <%--<div class="help">--%>
                            <%--<ul><li>Your password can&#39;t be too similar to your other personal information.</li><li>Your password must contain at least 8 characters.</li><li>Your password can&#39;t be a commonly used password.</li><li>Your password can&#39;t be entirely numeric.</li></ul>--%>
                        <%--</div>--%>
                    </div>
                    <div class="form-row">
                        <label class="required" for="id_new_password2">确认新密码:</label> <input type="password" name="new_password2" required id="id_new_password2" />
                    </div>
                </fieldset>
                <div class="submit-row">
                    <input type="submit" value="修改密码" class="default" />
                </div>
            </div>
        </form></div>
    <br class="clear" />
</div>
<!-- END Content -->