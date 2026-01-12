<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误
where += " AND tiwenren='" + session.getAttribute("username") + "' "; //  设置tiwenren为当前登录用户

// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中

if (request.getParameter("wentijiedaid") != null && !"".equals(request.getParameter("wentijiedaid"))) {
    where += " AND wentijiedaid='" + request.getParameter("wentijiedaid") + "' ";
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
if (request.getParameter("wentijieda") != null && !"".equals(request.getParameter("wentijieda"))) {
    where += " AND wentijieda LIKE '%" + request.getParameter("wentijieda") + "%'";
}
if (request.getParameter("pingfen_start") != null && !"".equals(request.getParameter("pingfen_start"))) {
    where += " AND pingfen >='" + request.getParameter("pingfen_start") + "' ";
}
if (request.getParameter("pingfen_end") != null && !"".equals(request.getParameter("pingfen_end"))) {
    where += " AND pingfen <='" + request.getParameter("pingfen_end") + "' ";
}
List<Map> lists = Query.make("jiedapingfen").where(where).order(orderby + " " + sort).page(15);
%>
 <%@ include file="head.jsp" %>


<div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="titles"> 解答评分查询 </span>
        </div>
        <div class="panel-body">
            <div class="form-search pa10 bg-warning">
                <form class="form-inline" action="?" size="small" id="formSearch">
                    <!-- form 标签开始 -->

                    编号： <input type="text" class="form-control" style="" name="bianhao" value="<%= request.getParameter("bianhao") !=null ? request.getParameter("bianhao") : "" %>" />

                    标题： <input type="text" class="form-control" style="" name="biaoti" value="<%= request.getParameter("biaoti") !=null ? request.getParameter("biaoti") : "" %>" />

                    分类：
                    <select class="form-control class_fenlei23" data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>" id="fenlei" name="fenlei">
                        <option value="">请选择</option>
                        <% List<Map> select = new CommDAO().select("SELECT * FROM kechengfenlei ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                        <option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></option>
                        <%} %>

                    </select>
                    <script>
                        $(".class_fenlei23").val($(".class_fenlei23").attr("data-value"));
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
                            <th>问题解答</th>
                            <th>解答人</th>
                            <th>评分</th>

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
                            <td><% Map mapkechengfenlei22 = new CommDAO().find("SELECT fenleimingcheng,id FROM kechengfenlei where id='" + map.get("fenlei") + "'"); %>
<%= mapkechengfenlei22.get("fenleimingcheng") %></td>
                            <td><%= map.get("tiwenren") %></td>
                            <td><%= map.get("wentijieda") %></td>
                            <td><%= map.get("jiedaren") %></td>
                            <td><%= map.get("pingfen") %></td>

                            <td align="center">
                                <a class="btn btn-info btn-xs" href="jiedapingfen_detail.jsp?id=<%= map.get("id") %>" title="详情"> 详情 </a>


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

