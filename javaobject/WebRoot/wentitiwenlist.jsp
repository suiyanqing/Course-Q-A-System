<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<%
    String orderby = util.Request.get("order", "id"); // 获取搜索框中的排序字段、默认为发布时间
    String sort = util.Request.get("sort", "desc"); // 获取搜索框中的排序类型、默认为倒序

    String where = " 1=1 "; // 防止sql 搜索条件为： where and a=b 这样的错误

// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中

    if (request.getParameter("bianhao") != null && !"".equals(request.getParameter("bianhao"))) {
        where += " AND bianhao LIKE '%" + request.getParameter("bianhao") + "%'";
    }
    if (request.getParameter("biaoti") != null && !"".equals(request.getParameter("biaoti"))) {
        where += " AND biaoti LIKE '%" + request.getParameter("biaoti") + "%'";
    }
    if (request.getParameter("fenlei") != null && !"".equals(request.getParameter("fenlei"))) {
        where += " AND fenlei ='" + request.getParameter("fenlei") + "'";
    }

    List<Map> lists = Query.make("wentitiwen").where(where).order(orderby + " " + sort).page(15);
%>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>


<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="title-modelbox-widget">
            <h3 class="section-title">问题列表</h3>
            <div class="sidebar-widget-body">
                <div class="hotnews class2">
                    <div style="margin-bottom: 20px">
                        <form action="?" class="search">
                            <table class="jd-search">
                                <tbody>
                                <tr>
                                    <td class="label1">分类</td>
                                    <td class="form-inline">
                                        <p class="search-radio">
                                            <input type="hidden" name="fenlei" value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>" />
                                            <a href="javascript:;" data-value="" onclick="selectRadio(this)">全部</a>
                                            <% List<Map> mapkechengfenlei6 = new CommDAO().select("SELECT id,fenleimingcheng FROM kechengfenlei"); %>
                                            <% for (Map r : mapkechengfenlei6) { %>

                                            <a href="javascript:;" data-value="<%= r.get("id") %>" onclick="selectRadio(this)"><%= r.get("fenleimingcheng") %></a>
                                            <%} %>

                                        </p>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="label1">标题</td>
                                    <td class="form-inline">
                                        <input type="text" class="form-control" style="width: 150px" name="biaoti" value="<%= request.getParameter("biaoti") !=null ? request.getParameter("biaoti") : "" %>" placeholder="请输入关键词" />
                                        <button type="submit" class="btn btn-default">搜索</button>
                                    </td>
                                </tr>


                                </tbody>
                            </table>
                        </form>
                    </div>
                    <ul class="a">
                        <%
                            int i = 0;
                            for (Map r : lists) {
                                i++;
                        %>

                        <li>
                            <a href="wentitiwendetail.jsp?id=<%= r.get("id") %>" class="clearfix">
                                <span class="dog"><%= i %></span>
                                <span class="shijian"><%= r.get("addtime") %></span>
                                <%= r.get("biaoti") %>
                            </a>
                        </li>
                        <%} %>

                    </ul>
                    ${page.info}
                </div>
            </div>
            <!-- /.sidebar-widget-body -->
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>

