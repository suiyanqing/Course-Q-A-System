<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误

// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中

if (request.getParameter("wentitiwenid") != null && !"".equals(request.getParameter("wentitiwenid"))) {
    where += " AND wentitiwenid='" + request.getParameter("wentitiwenid") + "' ";
}
if (request.getParameter("bianhao") != null && !"".equals(request.getParameter("bianhao"))) {
    where += " AND bianhao LIKE '%" + request.getParameter("bianhao") + "%'";
}
if (request.getParameter("biaoti") != null && !"".equals(request.getParameter("biaoti"))) {
    where += " AND biaoti LIKE '%" + request.getParameter("biaoti") + "%'";
}
if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
    where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
}
if (request.getParameter("youxiupingfen") != null && !"".equals(request.getParameter("youxiupingfen"))) {
    where += " AND youxiupingfen ='" + request.getParameter("youxiupingfen") + "'";
}

List<Map> lists = Query.make("youxiudafen").where(where).order(orderby + " " + sort).page(15);
%>
 <%@ include file="head.jsp" %>


<div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="titles"> 查询 </span>
        </div>
        <div class="panel-body">
            <div class="form-search pa10 bg-warning">
                <form class="form-inline" action="?" size="small" id="formSearch">
                    <!-- form 标签开始 -->

                    编号： <input type="text" class="form-control" style="" name="bianhao" value="<%= request.getParameter("bianhao") !=null ? request.getParameter("bianhao") : "" %>" />

                    标题： <input type="text" class="form-control" style="" name="biaoti" value="<%= request.getParameter("biaoti") !=null ? request.getParameter("biaoti") : "" %>" />

                    分类：
                    <select class="form-control class_fenlei25" data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>" id="fenlei" name="fenlei">
                        <option value="">请选择</option>
                        <% List<Map> select = new CommDAO().select("SELECT * FROM kechengfenlei ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                        <option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></option>
                        <%} %>

                    </select>
                    <script>
                        $(".class_fenlei25").val($(".class_fenlei25").attr("data-value"));
                    </script>

                    优秀评分：
                    <select
                        class="form-control class_youxiupingfen26"
                        data-value="<%= request.getParameter("youxiupingfen") !=null ? request.getParameter("youxiupingfen") : "" %>"
                        data-rule-required="true"
                        data-msg-required="请填写优秀评分"
                        id="youxiupingfen"
                        name="youxiupingfen"
                    >
                        <option value="">请选择</option>
                        <option value="一般(5分)">一般(5分)</option>
                        <option value="优秀(10分)">优秀(10分)</option>
                    </select>
                    <script>
                        $(".class_youxiupingfen26").val($(".class_youxiupingfen26").attr("data-value"));
                    </script>



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
                            <th>编号</th>
                            <th>标题</th>
                            <th>分类</th>
                            <th>提问人</th>
                            <th>优秀评分</th>
                            <th>说明</th>
                            <th>评价老师</th>
                            <th>评价时间</th>

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
                            <td><%= map.get("bianhao") %></td>
                            <td><%= map.get("biaoti") %></td>
                            <td><% Map mapkechengfenlei29 = new CommDAO().find("SELECT fenleimingcheng,id FROM kechengfenlei where id='" + map.get("fenlei") + "'"); %>
<%= mapkechengfenlei29.get("fenleimingcheng") %></td>
                            <td><%= map.get("tiwenren") %></td>
                            <td><%= map.get("youxiupingfen") %></td>
                            <td><%= map.get("shuoming") %></td>
                            <td><%= map.get("pingjialaoshi") %></td>
                            <td><%= Info.subStr(map.get("addtime"), 19 , "") %></td>

                            <td align="center">
                                <a class="btn btn-info btn-xs" href="youxiudafen_detail.jsp?id=<%= map.get("id") %>" title="详情"> 详情 </a>

                                <a class="btn btn-success btn-xs" href="youxiudafen_updt.jsp?id=<%= map.get("id") %>" title="编辑"> 编辑 </a>

                                <a
                                    class="btn btn-danger btn-xs"
                                    href="youxiudafen.jsp?a=delete&id=<%= map.get("id") %>"
                                    onclick="return confirm('确定删除？此操作不可恢复')"
                                    title="删除"
                                >
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

