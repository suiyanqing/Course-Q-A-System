<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%  %>
 <% Map map = Query.make("yonghu").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>


<div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="titles"> 用户详情 </span>
        </div>
        <div class="panel-body">
            <div class="pa10">
                <div class="pa10 bg-white">
                    <table class="new-detail">
                        <tbody>
                            <tr>
                                <td class="detail-title">权限</td>
                                <td class="detail-value"><%= map.get("cx") %></td>
                                <td class="detail-title">用户名</td>
                                <td class="detail-value"><%= map.get("yonghuming") %></td>
                                <td class="detail-title">密码</td>
                                <td class="detail-value"><%= map.get("mima") %></td>
                            </tr>
                            <tr>
                                <td class="detail-title">姓名</td>
                                <td class="detail-value"><%= map.get("xingming") %></td>
                                <td class="detail-title">性别</td>
                                <td class="detail-value"><%= map.get("xingbie") %></td>
                                <td class="detail-title">手机</td>
                                <td class="detail-value"><%= map.get("shouji") %></td>
                            </tr>
                            <tr>
                                <td class="detail-title">评价分</td>
                                <td class="detail-value"><%= map.get("pingjiafen") %></td>
                                <td class="detail-title">优秀分</td>
                                <td class="detail-value"><%= map.get("youxiufen") %></td>
                                <td class="detail-title">解答数</td>
                                <td class="detail-value"><%= map.get("jiedashu") %></td>
                            </tr>
                            <tr>
                                <td class="detail-title">提问数</td>
                                <td class="detail-value"><%= map.get("tiwenshu") %></td>
                                <td class="detail-title">答疑等级</td>
                                <td class="detail-value"><%= map.get("dayidengji") %></td>
                                <td class="detail-title">提问等级</td>
                                <td class="detail-value"><%= map.get("tiwendengji") %></td>
                            </tr>
                            <tr>
                                <td class="detail-title">头像</td>
                                <td class="detail-value">
                                    <img src="<%= map.get("touxiang") %>" style="width: 350px" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="mt10 not-print">
                    <button type="button" class="btn btn-default" onclick="history.go(-1);">返回</button>
                    <button type="button" class="btn btn-default" onclick="window.print()">打印本页</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="foot.jsp" %>

