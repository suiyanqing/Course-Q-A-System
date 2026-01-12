<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>课程教学答疑子系统后台管理</title>
    <link rel="stylesheet" type="text/css" href="htstyle/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="htstyle/css/main.css"/>
    <script type="text/javascript" src="htstyle/js/libs/modernizr.min.js"></script>
    <script src="htstyle/js/jquery.js"></script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="sy.jsp" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="./">课程教学答疑子系统</a></li>

                <li><a href="./" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li>
                    <a href="javascript:;"><%= session.getAttribute("username") != null ? session.getAttribute("username") : "" %>
                        , <%= session.getAttribute("cx") != null ? session.getAttribute("cx") : "" %>
                    </a></li>
                <li><a href="mod.jsp" target="main"> 修改密码 </a></li>
                <li><a href="logout.jsp">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">

        <div class="sidebar-content">
            <ul class="sidebar-list" id="sidebarList">
                <% if ("管理员".equals(session.getAttribute("cx"))) { %>
                <%@ include file="left_guanliyuan.jsp" %>
                <%} %>
                <% if ("学生".equals(session.getAttribute("cx"))) { %>
                <%@ include file="left_xuesheng.jsp" %>
                <%} %>
                <% if ("老师".equals(session.getAttribute("cx"))) { %>
                <%@ include file="left_laoshi.jsp" %>
                <%} %>

            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <iframe class="iframe" src="sy.jsp" name="main"></iframe>
    </div>
    <!--/main-->
</div>
<script>
    $(function () {
        $("#sidebarList").on("click", ">li>a", function () {
            $("#sidebarList>li.active .sub-menu").stop().slideUp(200);
            $("#sidebarList>li.active").removeClass("active");
            $(this).parent().toggleClass("active");
            $(this).next().stop().slideToggle(200);
        });

        $("#sidebarList>li:eq(0)>a").click();
    });
</script>
</body>
</html>
