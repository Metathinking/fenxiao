<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/28
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


    <div class="breadcrumbs">
        <a href="/admin/">Home</a>
        &rsaquo; <a href="/admin/companies/">Companies</a>
        &rsaquo; Stocks
    </div>
    <!-- Content -->
    <div id="content" class="flex">

        <h1>Select stock to change</h1>

        <div id="content-main">

            <ul class="object-tools">


                <li>

                    <a href="/admin/companies/stock/add/" class="addlink">
                        Add stock
                    </a>
                </li>


            </ul>


            <div class="module" id="changelist">










                <form id="changelist-form" method="post" novalidate><input type='hidden' name='csrfmiddlewaretoken' value='onurWXMT6xjzLH9E23shRMl84s8yUNp4suUyeL41xIwqvC2IznaQDqf7xur93iXK' />




                    <div class="actions">
                        <label>Action: <select name="action" required>
                            <option value="" selected>---------</option>

                            <option value="delete_selected">Delete selected stocks</option>

                        </select></label><input type="hidden" name="select_across" value="0" class="select-across" />
                        <button type="submit" class="button" title="Run the selected action" name="index" value="0">Go</button>

                        <span class="action-counter" data-actions-icnt="3">0 of 3 selected</span>


                    </div>




                    <div class="results">
                        <table id="result_list">
                            <thead>
                            <tr>

                                <th scope="col"  class="action-checkbox-column">

                                    <div class="text"><span><input type="checkbox" id="action-toggle" /></span></div>
                                    <div class="clear"></div>
                                </th>
                                <th scope="col"  class="column-__str__">

                                    <div class="text"><span>Stock</span></div>
                                    <div class="clear"></div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>


                            <tr class="row1"><td class="action-checkbox"><input type="checkbox" name="_selected_action" value="3" class="action-select" /></td><th class="field-__str__"><a href="/admin/companies/stock/3/change/">GOOGLE</a></th></tr>


                            <tr class="row2"><td class="action-checkbox"><input type="checkbox" name="_selected_action" value="2" class="action-select" /></td><th class="field-__str__"><a href="/admin/companies/stock/2/change/">AMAZON</a></th></tr>


                            <tr class="row1"><td class="action-checkbox"><input type="checkbox" name="_selected_action" value="1" class="action-select" /></td><th class="field-__str__"><a href="/admin/companies/stock/1/change/">FACEBOOK</a></th></tr>

                            </tbody>
                        </table>
                    </div>







                    <p class="paginator">


                        <a href="?p=0">1</a>

                        <a href="?p=1">2</a>

                        <a href="?p=2">3</a>

                        <a href="?p=3">4</a>

                        <a href="?p=4">5</a>

                        <a href="?p=5">6</a>

                        <span class="this-page">7</span>

                        <a href="?p=7">8</a>

                        <a href="?p=8">9</a>

                        <a href="?p=9" class="end">10</a>

                        20 albums
                        &nbsp;&nbsp;<a href="?all=" class="showall">Show all</a>

                    </p>

                </form>
            </div>
        </div>


        <br class="clear" />
    </div>
    <!-- END Content -->

