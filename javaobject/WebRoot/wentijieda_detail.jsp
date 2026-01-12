<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%  %>
 <% Map map = Query.make("wentijieda").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>


<div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <span class="titles"> 详情 </span>
        </div>
        <div class="panel-body">
            <div class="pa10">
                <div class="pa10 bg-white">
                    <table class="new-detail">
                        <tbody>
                            <tr>
                                <td class="detail-title">编号</td>
                                <td class="detail-value"><%= map.get("bianhao") %></td>
                                <td class="detail-title">标题</td>
                                <td class="detail-value"><%= map.get("biaoti") %></td>
                                <td class="detail-title">分类</td>
                                <td class="detail-value"><% Map mapkechengfenlei15 = new CommDAO().find("SELECT fenleimingcheng,id FROM kechengfenlei where id='" + map.get("fenlei") + "'"); %>
<%= mapkechengfenlei15.get("fenleimingcheng") %></td>
                            </tr>
                            <tr>
                                <td class="detail-title">提问人</td>
                                <td class="detail-value"><%= map.get("tiwenren") %></td>
                                <td class="detail-title">解答人</td>
                                <td class="detail-value"><%= map.get("jiedaren") %></td>
                                <td class="detail-title">提交者评分</td>
                                <td class="detail-value"><%= map.get("tijiaozhepingfen") %></td>
                            </tr>
                            <tr>
                                <td class="detail-title">解答时间</td>
                                <td class="detail-value"><%= map.get("addtime") %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="mt10 pa10 bg-white">
                    <div class="new-detail-line">
                        <div class="detail-title">问题解答</div>
                        <td class="detail-value"><%= map.get("wentijieda") %></td>
                    </div>
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

