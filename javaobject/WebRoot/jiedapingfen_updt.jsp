<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
String updtself = "0"; // 设置更新
HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "jiedapingfen");

Map readMap = new CommDAO().getmap(String.valueOf(mmm.get("wentijiedaid")), "wentijieda");
%>
 <%@ include file="head.jsp" %>


<script src="js/jquery.validate.js"></script>

<div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="titles"> 添加 </span>
        </div>
        <div class="panel-body">
            <form action="jiedapingfen.jsp?a=update" method="post" name="form1" id="form1">
                <!-- form 标签开始 -->

                <input type="hidden" name="wentijiedaid" value="<%= mmm.get("wentijiedaid") %>" />
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">编号</label>
                        <div class="col-sm-10"><%= mmm.get("bianhao") %><input type="hidden" id="bianhao" name="bianhao" value="<%= Info.html(mmm.get("bianhao")) %>" /></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">标题</label>
                        <div class="col-sm-10"><%= mmm.get("biaoti") %><input type="hidden" id="biaoti" name="biaoti" value="<%= Info.html(mmm.get("biaoti")) %>" /></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">分类</label>
                        <div class="col-sm-10"><% Map mapkechengfenlei27 = new CommDAO().find("SELECT fenleimingcheng,id FROM kechengfenlei where id='" + mmm.get("fenlei") + "'"); %>
<%= mapkechengfenlei27.get("fenleimingcheng") %><input type="hidden" id="fenlei" name="fenlei" value="<%= Info.html(mmm.get("fenlei")) %>" /></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">提问人</label>
                        <div class="col-sm-10"><%= mmm.get("tiwenren") %><input type="hidden" id="tiwenren" name="tiwenren" value="<%= Info.html(mmm.get("tiwenren")) %>" /></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">问题解答</label>
                        <div class="col-sm-10"><%= mmm.get("wentijieda") %><input type="hidden" id="wentijieda" name="wentijieda" value="<%= Info.html(mmm.get("wentijieda")) %>" /></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">解答人</label>
                        <div class="col-sm-10"><%= mmm.get("jiedaren") %><input type="hidden" id="jiedaren" name="jiedaren" value="<%= Info.html(mmm.get("jiedaren")) %>" /></div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">评分<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <input
                                type="number"
                                class="form-control"
                                placeholder="输入评分"
                                style="width: 150px"
                                data-rule-required="true"
                                data-msg-required="请填写评分"
                                number="true"
                                data-msg-number="输入一个有效数字"
                                min="1"
                                max="10"
                                id="pingfen"
                                name="pingfen"
                                value="<%= Info.html(mmm.get("pingfen")) %>"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                        <div class="col-sm-10">
                            <input name="id" value="<%= mmm.get("id") %>" type="hidden" />
                            <input name="referer" value="<%=request.getHeader("referer") %>" type="hidden" />
                            <input name="updtself" value="<%= updtself %>" type="hidden" />

                            <button type="submit" class="btn btn-primary" name="Submit">提交</button>
                            <button type="reset" class="btn btn-default" name="Submit2">重置</button>
                            <button type="button" class="btn btn-default" onclick="history.back()">返回</button>
                        </div>
                    </div>
                </div>

                <!--form标签结束-->
            </form>

            <script>
                $(function () {
                    $("#form1").validate();
                });
            </script>
        </div>
    </div>
</div>

<%@ include file="foot.jsp" %>

