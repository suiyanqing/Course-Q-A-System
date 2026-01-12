<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>


<div>
    <div class="header">
        <div class="container clearfix">
            <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

            <div class="fr">
                <% if (session.getAttribute("username") != null && !("".equals(session.getAttribute("username")))) { %>
 欢迎<%= session.getAttribute("username") !=null ? session.getAttribute("username") : "" %>登录， 您得权限：<%= session.getAttribute("cx") !=null ? session.getAttribute("cx") : "" %>
                <a href="main.jsp"> 个人中心</a>
                <a href="logout.jsp" onclick="return confirm('你确定退出？')"> 退出</a>
                <%} else { %>
                <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#loginModel">登录</button>
                <%} %>

            </div>
            <div class="">欢迎光临</div>

            <!-- container定宽，并剧中结束 -->
        </div>
    </div>
    <nav class="navbar navbar-default-lan">
        <div class="container container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"> 课程教学答疑子系统 </a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="navbar-str">
                    <li>
                        <a href="./">首页 </a>
                    </li>
                    <% List<Map> mapkechengfenlei1 = new CommDAO().select("SELECT id,fenleimingcheng FROM kechengfenlei"); %>
 <% for (Map m : mapkechengfenlei1) { %>

                    <li>
                        <a href="wentitiwenlist.jsp?fenlei=<%= m.get("id") %>"><%= m.get("fenleimingcheng") %></a>
                    </li>
                    <%} %>

                    <li>
                        <a href="yonghuadd.jsp">用户注册 </a>
                    </li>
                    <li>
                        <a href="login.jsp">后台管理 </a>
                    </li>
                </ul>
                <form class="navbar-form navbar-right" action="wentitiwenlist.jsp">
                    <div class="form-group">
                        <input type="text" value="<%= request.getParameter("biaoti") !=null ? request.getParameter("biaoti") : "" %>" name="biaoti" class="form-control" placeholder="输入关键词搜索" />
                    </div>
                    <button type="submit" class="btn btn-default">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </form>
            </div>
        </div>
    </nav>
    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="0" id="loginModel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="0">登录</h4>
                </div>
                <div class="modal-body">
                    <div class="pa10">
                        <form action="login?ac=login&a=a" method="post">
                            <!-- form 标签开始 -->

                            <div class="form-group">
                                <input type="text" class="form-control" name="username" placeholder="输入帐号" />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="pwd" placeholder="密码" />
                            </div>
                            <div class="form-group">
                                <select class="form-control" name="cx">
                                    <option value="用户">用户</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="pagerandom" placeholder="输入验证码" />

                                    <span class="input-group-addon"
                                        ><img
                                            src="image.jsp"
                                            style="width: 60px; height: 20px; max-width: none; max-height: none"
                                            onclick="this.src='image.jsp?rand='+new Date().getTime()"
                                    /></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                                    <div class="col-sm-10">
                                        <button type="submit" class="btn btn-primary">登录</button>
                                    </div>
                                </div>
                            </div>

                            <!--form标签结束-->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
