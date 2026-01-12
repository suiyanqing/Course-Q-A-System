<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误

// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中

if (request.getParameter("username") != null && !"".equals(request.getParameter("username"))) {
    where += " AND username LIKE '%" + request.getParameter("username") + "%'";
}

List<Map> lists = Query.make("admins").where(where).order(orderby + " " + sort).page(15);
%>
 <%@ include file="head.jsp" %>


<div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="titles"> 管理员查询 </span>
        </div>
        <div class="panel-body">
            <div class="form-search pa10 bg-warning">
                <form class="form-inline" action="?" size="small" id="formSearch">
                    <!-- form 标签开始 -->

                    帐号： <input type="text" class="form-control" style="" name="username" value="<%= request.getParameter("username") !=null ? request.getParameter("username") : "" %>" />



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
                            <th>帐号</th>
                            <th>密码</th>

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
                            <td><%= map.get("username") %></td>
                            <td><%= map.get("pwd") %></td>

                            <td align="center">
                                <a class="btn btn-success btn-xs" href="admins_updt.jsp?id=<%= map.get("id") %>" title="编辑"> 编辑 </a>

                                <a class="btn btn-danger btn-xs" href="admins.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('确定删除？此操作不可恢复')" title="删除">
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

