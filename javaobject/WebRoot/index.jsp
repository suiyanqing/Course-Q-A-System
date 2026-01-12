<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>


<link rel="stylesheet" href="js/swiper/swiper.css" />
<script src="js/swiper/swiper.js"></script>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <% List<Map> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>


        <div class="swiper-container" id="base/banner162">
            <div class="swiper-wrapper">
                <% for (Map bht : bhtList) { %>

                <div class="swiper-slide">
                    <div class="decoimg_b2">
                        <a class="btn btn-" href="<%= bht.get("url") %>" style="background-image: url('<%= bht.get("image") %>'); height: 480px"></a>
                    </div>
                </div>
                <%} %>

            </div>
            <!-- 如果需要分页器 -->
            <div class="swiper-pagination"></div>
            <!-- 如果需要导航按钮 -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>

        <script>
            var mySwiper = new Swiper("#base/banner162", {
                loop: true, // 循环模式选项
                autoplay: {
                    delay: 3000,
                    disableOnInteraction: false,
                },
                // 如果需要分页器
                pagination: {
                    el: ".swiper-pagination",
                },
                // 如果需要前进后退按钮
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                // 如果需要滚动条
                /*scrollbar: {
            el: '.swiper-scrollbar',
        },*/
            });
        </script>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">
            <div class="col-md-6">
                <div class="title-modelbox-widget">
                    <h3 class="section-title">
                        <div class="more">
                            <a href="wentitiwenlist.jsp">更多&gt;&gt;</a>
                        </div>
                        JAVA板块
                    </h3>
                    <div class="sidebar-widget-body">
                        <div class="hotnews class2" style="margin: 20px 0 0 0">
                            <% List<Map> wentitiwenlist168 = Query.make("wentitiwen").where("fenlei","1").limit(4).order("id desc").select(); %>

                            <ul class="a">
                                <%
                                    int i = 0;
                                    for (Map r : wentitiwenlist168) {
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
                        </div>
                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>
            </div>
            <div class="col-md-6">
                <div class="title-modelbox-widget">
                    <h3 class="section-title">
                        <div class="more">
                            <a href="wentitiwenlist.jsp">更多&gt;&gt;</a>
                        </div>
                        Python板块
                    </h3>
                    <div class="sidebar-widget-body">
                        <div class="hotnews class2" style="margin: 20px 0 0 0">
                            <% List<Map> wentitiwenlist172 = Query.make("wentitiwen").where("fenlei","5").limit(4).order("id desc").select(); %>

                            <ul class="a">
                                <%
                                    i = 0;
                                    for (Map r : wentitiwenlist172) {
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
                        </div>
                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="row">
            <div class="col-md-6">
                <div class="title-modelbox-widget">
                    <h3 class="section-title">
                        <div class="more">
                            <a href="wentitiwenlist.jsp">更多&gt;&gt;</a>
                        </div>
                        C#NET板块
                    </h3>
                    <div class="sidebar-widget-body">
                        <div class="hotnews class2" style="margin: 20px 0 0 0">
                            <% List<Map> wentitiwenlist178 = Query.make("wentitiwen").where("fenlei","4").limit(4).order("id desc").select(); %>

                            <ul class="a">
                                <%
                                    i = 0;
                                    for (Map r : wentitiwenlist178) {
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
                        </div>
                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>
            </div>
            <div class="col-md-6">
                <div class="title-modelbox-widget">
                    <h3 class="section-title">
                        <div class="more">
                            <a href="wentitiwenlist.jsp">更多&gt;&gt;</a>
                        </div>
                        PHP板块
                    </h3>
                    <div class="sidebar-widget-body">
                        <div class="hotnews class2" style="margin: 20px 0 0 0">
                            <% List<Map> wentitiwenlist182 = Query.make("wentitiwen").where("fenlei","3").limit(4).order("id desc").select(); %>

                            <ul class="a">
                                <%
                                    i = 0;
                                    for (Map r : wentitiwenlist182) {
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
                        </div>
                    </div>
                    <!-- /.sidebar-widget-body -->
                </div>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>

