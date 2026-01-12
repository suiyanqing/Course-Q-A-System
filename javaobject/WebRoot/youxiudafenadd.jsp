<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <% if (null == request.getParameter("id") || "".equals(request.getParameter("id"))) { %>

<script>
    alert("非法操作");
    history.go(-1);
</script>
<% out.close(); %>
 <%} %>
 <% Map readMap = Query.make("wentitiwen").where("id", request.getParameter("id")).find(); %>
 <%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>


<script src="js/jquery.validate.js"></script>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">
                <span class="titles"> 添加 </span>
            </div>
            <div class="panel-body">
                <form action="youxiudafen.jsp?a=insert" method="post" name="form1" id="form1">
                    <!-- form 标签开始 -->

                    <input type="hidden" name="wentitiwenid" value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>" />
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">编号</label>
                            <div class="col-sm-10"><%= readMap.get("bianhao") %><input type="hidden" id="bianhao" name="bianhao" value="<%= Info.html(readMap.get("bianhao")) %>" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">标题</label>
                            <div class="col-sm-10"><%= readMap.get("biaoti") %><input type="hidden" id="biaoti" name="biaoti" value="<%= Info.html(readMap.get("biaoti")) %>" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">分类</label>
                            <div class="col-sm-10"><%
                            Map mapkechengfenlei37 = new CommDAO()
                                .find("SELECT fenleimingcheng,id FROM kechengfenlei where id='" + readMap.get("fenlei") + "'");
                            %>
<%= mapkechengfenlei37.get("fenleimingcheng") %><input type="hidden" id="fenlei" name="fenlei" value="<%= Info.html(readMap.get("fenlei")) %>" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">提问人</label>
                            <div class="col-sm-10"><%= readMap.get("tiwenren") %><input type="hidden" id="tiwenren" name="tiwenren" value="<%= Info.html(readMap.get("tiwenren")) %>" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">优秀评分<span style="color: red">*</span></label>
                            <div class="col-sm-10">
                                <select
                                    class="form-control class_youxiupingfen33"
                                    data-value=""
                                    data-rule-required="true"
                                    data-msg-required="请填写优秀评分"
                                    id="youxiupingfen"
                                    name="youxiupingfen"
                                    style="width: 250px"
                                >
                                    <option value="一般(5分)">一般(5分)</option>
                                    <option value="优秀(10分)">优秀(10分)</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">说明</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="输入说明" style="width: 250px" id="shuoming" name="shuoming" value="" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">评价老师</label>
                            <div class="col-sm-10">
                                <input
                                    type="text"
                                    class="form-control"
                                    placeholder="输入评价老师"
                                    style="width: 150px"
                                    readonly="readonly"
                                    id="pingjialaoshi"
                                    name="pingjialaoshi"
                                    value="<%= session.getAttribute("username") !=null ? session.getAttribute("username") : "" %>"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">
                                <input name="referer" id="referers" class="referers" value="<%=request.getHeader("referer") %>" type="hidden" />
                                <script>
                                    $(function () {
                                        $("input.referers").val(document.referrer);
                                    });
                                </script>

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

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>

