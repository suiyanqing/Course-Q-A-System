<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
HashMap mmm = new CommDAO().getmaps("yonghuming", (String) request.getSession().getAttribute("username"), "yonghu");

String updtself = "1";
%>
 <%@ include file="head.jsp" %>


<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css" />
<script src="js/layer/layer.js"></script>

<div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="titles"> 编辑个人资料 </span>
        </div>
        <div class="panel-body">
            <form action="yonghu.jsp?a=update" method="post" name="form1" id="form1">
                <!-- form 标签开始 -->

                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">权限<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <%= Info.html(mmm.get("cx")) %>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">用户名<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="输入用户名"
                                style="width: 150px"
                                readonly
                                data-rule-required="true"
                                data-msg-required="请填写用户名"
                                remote="factory/checkno.jsp?checktype=update&id=<%= mmm.get("id") %>&table=yonghu&col=yonghuming"
                                data-msg-remote="内容重复了"
                                id="yonghuming"
                                name="yonghuming"
                                value="<%= Info.html(mmm.get("yonghuming")) %>"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">姓名<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="输入姓名"
                                style="width: 150px"
                                data-rule-required="true"
                                data-msg-required="请填写姓名"
                                id="xingming"
                                name="xingming"
                                value="<%= Info.html(mmm.get("xingming")) %>"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">性别<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <select
                                class="form-control class_xingbie6"
                                data-value="<%= Info.html(mmm.get("xingbie")) %>"
                                data-rule-required="true"
                                data-msg-required="请填写性别"
                                id="xingbie"
                                name="xingbie"
                                style="width: 250px"
                            >
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                            <script>
                                $(".class_xingbie6").val($(".class_xingbie6").attr("data-value"));
                            </script>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">手机<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="输入手机"
                                style="width: 150px"
                                data-rule-required="true"
                                data-msg-required="请填写手机"
                                phone="true"
                                data-msg-phone="请输入正确手机号码"
                                id="shouji"
                                name="shouji"
                                value="<%= Info.html(mmm.get("shouji")) %>"
                            />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">评价分</label>
                        <div class="col-sm-10">
                            <input
                                type="number"
                                class="form-control"
                                placeholder="输入评价分"
                                style="width: 150px"
                                readonly
                                number="true"
                                data-msg-number="输入一个有效数字"
                                id="pingjiafen"
                                name="pingjiafen"
                                value="<%= Info.html(mmm.get("pingjiafen")) %>"
                            />
                        </div>
                    </div>
                </div>
                <% if ("学生".equals(session.getAttribute("cx"))) { %>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">优秀分</label>
                        <div class="col-sm-10">
                            <input
                                    type="number"
                                    class="form-control"
                                    placeholder="输入优秀分"
                                    style="width: 150px"
                                    readonly
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="youxiufen"
                                    name="youxiufen"
                                    value="<%= Info.html(mmm.get("youxiufen")) %>"
                            />
                        </div>
                    </div>
                </div>
                <%} %>

                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">解答数</label>
                        <div class="col-sm-10">
                            <input
                                type="number"
                                class="form-control"
                                placeholder="输入解答数"
                                style="width: 150px"
                                readonly
                                number="true"
                                data-msg-number="输入一个有效数字"
                                id="jiedashu"
                                name="jiedashu"
                                value="<%= Info.html(mmm.get("jiedashu")) %>"
                            />
                        </div>
                    </div>
                </div>
                <% if ("学生".equals(session.getAttribute("cx"))) { %>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">提问数</label>
                        <div class="col-sm-10">
                            <input
                                    type="number"
                                    class="form-control"
                                    placeholder="输入提问数"
                                    style="width: 150px"
                                    readonly
                                    number="true"
                                    data-msg-number="输入一个有效数字"
                                    id="tiwenshu"
                                    name="tiwenshu"
                                    value="<%= Info.html(mmm.get("tiwenshu")) %>"
                            />
                        </div>
                    </div>
                <%} %>

                </div>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">答疑等级</label>
                        <div class="col-sm-10">
                            <%= Info.html(mmm.get("dayidengji")) %>
                        </div>
                    </div>
                </div>
                <% if ("学生".equals(session.getAttribute("cx"))) { %>
                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">提问等级</label>
                        <div class="col-sm-10">
                            <%= Info.html(mmm.get("tiwendengji")) %>
                        </div>
                    </div>
                </div>
                <%} %>

                <div class="form-group">
                    <div class="row">
                        <label style="text-align: right" class="col-sm-2 hiddex-xs">头像<span style="color: red">*</span></label>
                        <div class="col-sm-10">
                            <div class="input-group" style="width: 250px">
                                <input
                                    type="text"
                                    class="form-control"
                                    data-rule-required="true"
                                    data-msg-required="请填写头像"
                                    id="touxiang"
                                    name="touxiang"
                                    value="<%= Info.html(mmm.get("touxiang")) %>"
                                />

                                <span class="input-group-btn"
                                    ><button
                                        type="button"
                                        class="btn btn-default"
                                        onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=touxiang'})"
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
                        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                        <div class="col-sm-10">
                            <input name="id" value="<%= mmm.get("id") %>" type="hidden" />
                            <input name="referer" value="?" type="hidden" />
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

