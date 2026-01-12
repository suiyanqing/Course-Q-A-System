<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误

// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中

if (request.getParameter("cx") != null && !"".equals(request.getParameter("cx"))) {
    where += " AND cx ='" + request.getParameter("cx") + "'";
}
if (request.getParameter("yonghuming") != null && !"".equals(request.getParameter("yonghuming"))) {
    where += " AND yonghuming LIKE '%" + request.getParameter("yonghuming") + "%'";
}
if (request.getParameter("xingming") != null && !"".equals(request.getParameter("xingming"))) {
    where += " AND xingming LIKE '%" + request.getParameter("xingming") + "%'";
}
if (request.getParameter("dayidengji") != null && !"".equals(request.getParameter("dayidengji"))) {
    where += " AND dayidengji ='" + request.getParameter("dayidengji") + "'";
}

List<Map> lists = Query.make("yonghu").where(where).order(orderby + " " + sort).page(15);
%>
 <%@ include file="head.jsp" %>


<div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="titles"> 用户查询 </span>
        </div>
        <div class="panel-body">
            <div class="form-search pa10 bg-warning">
                <form class="form-inline" action="?" size="small" id="formSearch">
                    <!-- form 标签开始 -->

                    权限：
                    <select class="form-control class_cx1" data-value="<%= request.getParameter("cx") !=null ? request.getParameter("cx") : "" %>" data-rule-required="true" data-msg-required="请填写权限" id="cx" name="cx">
                        <option value="">请选择</option>
                        <option value="学生">学生</option>
                        <option value="老师">老师</option>
                    </select>
                    <script>
                        $(".class_cx1").val($(".class_cx1").attr("data-value"));
                    </script>

                    用户名： <input type="text" class="form-control" style="" name="yonghuming" value="<%= request.getParameter("yonghuming") !=null ? request.getParameter("yonghuming") : "" %>" />

                    姓名： <input type="text" class="form-control" style="" name="xingming" value="<%= request.getParameter("xingming") !=null ? request.getParameter("xingming") : "" %>" />

                    答疑等级：
                    <select class="form-control class_dayidengji2" data-value="<%= request.getParameter("dayidengji") !=null ? request.getParameter("dayidengji") : "" %>" id="dayidengji" name="dayidengji">
                        <option value="">请选择</option>
                        <option value="暂无">暂无</option>
                        <option value="一般">一般</option>
                        <option value="优秀">优秀</option>
                    </select>
                    <script>
                        $(".class_dayidengji2").val($(".class_dayidengji2").attr("data-value"));
                    </script>

                    <select class="form-control" name="orderby" id="orderby">
                        <option value="id">按发布时间</option>
                    </select>

                    <select class="form-control" name="sort" id="sort">
                        <option value="desc">倒序</option>
                        <option value="asc">升序</option>
                    </select>

                    <button type="submit" class="btn btn-default">搜索</button>

                    <!--form标签结束-->
                </form>
            </div>

            <script>
                $("#orderby").val("<%= orderby %>");
                $("#sort").val("<%= sort %>".toLocaleLowerCase());
            </script>

            <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                        <tr align="center">
                            <th width="60" data-field="item">序号</th>
                            <th>权限</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>手机</th>
                            <th>评价分</th>
                            <th>优秀分</th>
                            <th>解答数</th>
                            <th>提问数</th>
                            <th>答疑等级</th>
                            <th>提问等级</th>
                            <th>头像</th>

                            <th width="220" data-field="handler">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        int i = 0;
                        for (Map map : lists) {
                            i++;
                        %>

                        <tr id="<%= map.get("id") %>" pid="">
                            <td width="30" align="center">
                                <label> <%= i %> </label>
                            </td>
                            <td><%= map.get("cx") %></td>
                            <td><%= map.get("yonghuming") %></td>
                            <td><%= map.get("mima") %></td>
                            <td><%= map.get("xingming") %></td>
                            <td><%= map.get("xingbie") %></td>
                            <td><%= map.get("shouji") %></td>
                            <td><%= map.get("pingjiafen") %></td>
                            <td><%= map.get("youxiufen") %></td>
                            <td><%= map.get("jiedashu") %></td>
                            <td><%= map.get("tiwenshu") %></td>
                            <td><%= map.get("dayidengji") %></td>
                            <td><%= map.get("tiwendengji") %></td>
                            <td><% if ("".equals(map.get("touxiang"))) { %>
-<%} else { %><img width="100" src="<%= map.get("touxiang") %>" /><%} %>
</td>

                            <td align="center">
                                <a class="btn btn-info btn-xs" href="yonghu_detail.jsp?id=<%= map.get("id") %>" title="详情"> 详情 </a>

                                <a class="btn btn-success btn-xs" href="yonghu_updt.jsp?id=<%= map.get("id") %>" title="编辑"> 编辑 </a>

                                <a class="btn btn-danger btn-xs" href="yonghu.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('确定删除？此操作不可恢复')" title="删除">
                                    删除
                                </a>

                                <!--qiatnalijne-->
                            </td>
                        </tr>
                        <%} %>

                    </tbody>
                </table>
            </div>

            ${page.info}
        </div>
    </div>
</div>

<%@ include file="foot.jsp" %>

