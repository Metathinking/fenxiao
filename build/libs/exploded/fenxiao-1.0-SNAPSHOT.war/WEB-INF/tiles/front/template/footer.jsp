<%--
  Created by IntelliJ IDEA.
  User: luyilaosan1
  Date: 2016/3/1.0001
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="container-fluid" id="footer">
    <nav class="navbar navbar-default navbar-fixed-bottom main_footer">
        <div class="">
            <div class="row text-center">
                <div class="col-xs-3 footer-block">
                    <a class="center-block ${sign=='home'?'active':''}" href="/">
                        <h4 class="footer_icon"><span class="glyphicon glyphicon-home"></span></h4>
                        <h6 class="footer_text">首页</h6>
                    </a>
                </div>
                <div class="col-xs-3 footer-block">
                    <a class="center-block ${sign=='score'?'active':''}" href="/score_product_list">
                        <h4 class="footer_icon"><span class="glyphicon glyphicon-signal"></span></h4>
                        <h6 class="footer_text">积分</h6>
                    </a>
                </div>
                <div class="col-xs-3 footer-block">
                    <a class="center-block ${sign=='cart'?'active':''}" href="/member/cart/list">
                        <h4 class="footer_icon"><span class="glyphicon glyphicon-shopping-cart"></span></h4>
                        <h6 class="footer_text">购物车</h6>
                    </a>
                </div>
                <div class="col-xs-3 footer-block">
                    <a class="center-block ${sign=='member'?'active':''}" href="/member/info">
                        <h4 class="footer_icon"><span class="glyphicon glyphicon-user"></span></h4>
                        <h6 class="footer_text">我</h6>
                    </a>
                </div>
            </div>
        </div>
    </nav>
</footer>
