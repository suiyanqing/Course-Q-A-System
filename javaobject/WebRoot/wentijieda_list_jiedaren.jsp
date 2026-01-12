<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%
String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误
where += " AND jiedaren='" + session.getAttribute("username") + "' "; //  设置jiedaren为当前登录用户

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
if (request.getParameter("wentijieda") != null && !"".equals(request.getParameter("wentijieda"))) {
    where += " AND wentijieda LIKE '%" + request.getParameter("wentijieda") + "%'";
}

List<Map> lists = Query.make("wentijieda").where(where).order(orderby + " " + sort).page(15);
%>
 <%@ include file="head.jsp" %>


<div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="titles"> 问题解答查询 </span>
        </div>
        <div class="panel-body">
            <div class="form-search pa10 bg-warning">
                <form class="form-inline" action="?" size="small" id="formSearch">
                    <!-- form 标签开始 -->

                    编号： <input type="text" class="form-control" style="" name="bianhao" value="<%= request.getParameter("bianhao") !=null ? request.getParameter("bianhao") : "" %>" />

                    标题： <input type="text" class="form-control" style="" name="biaoti" value="<%= request.getParameter("biaoti") !=null ? request.getParameter("biaoti") : "" %>" />

                    分类：
                    <select class="form-control class_fenlei21" data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>" id="fenlei" name="fenlei">
                        <option value="">请选择</option>
                        <% List<Map> select = new CommDAO().select("SELECT * FROM kechengfenlei ORDER BY id desc"); %>
 <% for (Map m : select) { %>

                        <option value="<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></option>
                        <%} %>

                    </select>
                    <script>
                        $(".class_fenlei21").val($(".class_fenlei21").attr("data-value"));
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
                            <th>解答人</th>
                            <th>提交者评分</th>
                            <th>解答时间</th>

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
                            <td><% Map mapkechengfenlei14 = new CommDAO().find("SELECT fenleimingcheng,id FROM kechengfenlei where id='" + map.get("fenlei") + "'"); %>
<%= mapkechengfenlei14.get("fenleimingcheng") %></td>
                            <td><%= map.get("tiwenren") %></td>
                            <td><%= map.get("jiedaren") %></td>
                            <td><%= map.get("tijiaozhepingfen") %></td>
                            <td><%= Info.subStr(map.get("addtime"), 19 , "") %></td>

                            <td align="center">


                                <a class="btn btn-info btn-xs" href="wentijieda_detail.jsp?id=<%= map.get("id") %>" title="详情"> 详情 </a>



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

