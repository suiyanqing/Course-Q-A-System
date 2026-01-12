<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
String updtself = "0"; // 设置更新
HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "wentitiwen");
%>
 <%@ include file="head.jsp" %>


<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css" />
<script src="js/layer/layer.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css" />
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>

<div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="titles"> 添加 </span>
        </div>
        <div class="panel-body">
            <form action="wentitiwen.jsp?a=update" method="post" name="form1" id="form1">
                <!-- form 标签开始 -->

                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">编号</label>
                        <div class="col-sm-10">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="输入编号"
                                style="width: 150px"
                                readonly="readonly"
                                id="bianhao"
                                name="bianhao"
                                value="<%= Info.html(mmm.get("bianhao")) %>"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">标题<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="输入标题"
                                style="width: 250px"
                                data-rule-required="true"
                                data-msg-required="请填写标题"
                                id="biaoti"
                                name="biaoti"
                                value="<%= Info.html(mmm.get("biaoti")) %>"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">分类<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <select
                                class="form-control class_fenlei18"
                                data-value="<%= Info.html(mmm.get("fenlei")) %>"
                                data-rule-required="true"
                                data-msg-required="请填写分类"
                                id="fenlei"
                                name="fenlei"
                                style="width: 250px"
                            >
                                <% List<Map> select = new CommDAO().select("SELECT * FROM kechengfenlei ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                                <option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></option>
                                <%} %>

                            </select>
                            <script>
                                $(".class_fenlei18").val($(".class_fenlei18").attr("data-value"));
                            </script>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">封面<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <div class="input-group" style="width: 250px">
                                <input
                                    type="text"
                                    class="form-control"
                                    data-rule-required="true"
                                    data-msg-required="请填写封面"
                                    id="fengmian"
                                    name="fengmian"
                                    value="<%= Info.html(mmm.get("fengmian")) %>"
                                />

                                <span class="input-group-btn"
                                    ><button
                                        type="button"
                                        class="btn btn-default"
                                        onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=fengmian'})"
                                    >
                                        上传图片
                                    </button></span
                                >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">内容<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <textarea data-rule-required="true" data-msg-required="请填写内容" id="neirong" name="neirong" style="max-width: 750px; width: 100%; height: 300px">
<%= Info.html(mmm.get("neirong")) %></textarea
                            >
                            <script>
                                (function () {
                                    var um = UM.getEditor("neirong");
                                })();
                            </script>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">提问人</label>
                        <div class="col-sm-10">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="输入提问人"
                                style="width: 150px"
                                readonly="readonly"
                                id="tiwenren"
                                name="tiwenren"
                                value="<%= mmm.get("tiwenren") %>"
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

