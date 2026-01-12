<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
 <%@ page language="java" import="java.util.*" %>
 <%@page import="util.*" %>
 <%  %>
 <% Map map = Query.make("wentitiwen").where("id", request.getParameter("id")).find(); %>
<%@ include file="head.jsp" %>
 <%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css" />
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>

<div>
    <div class="container">
        <!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="detail-bbs">
            <div class="read_t">
                <table width="100%" class="floot">
                    <tbody>
                        <tr class="vt">
                            <td rowspan="2" class="floot_left">
                                <div class="readName b">
                                    <a href="javascript:;"> <% Map user = Query.make("yonghu").where("yonghuming", map.get("tiwenren")).find(); %>
 <%= user.get("xingming") %> </a>
                                </div>
                                <div class="floot_leftdiv">
                                    <a href="javascript:;" class="userCard face_img">
                                        <% if (user.get("touxiang") == null || "".equals(user.get("touxiang"))) { %>

                                        <img class="pic" src="images/default.gif" width="120" height="120" border="0" />
                                        <%} else { %>
                                        <img class="pic" src="<%= user.get("touxiang") %>" width="120" height="120" border="0" />
                                        <%} %>

                                    </a>
                                    <div class="readUser_info cc mb10">
                                        <div class="one" id="basic_info_2920754">
                                            <dl class="cc">
                                                <dt>级别</dt>
                                                <dd><%= user.get("cx") %></dd>
                                            </dl>
                                            <dl class="cc">
                                                <dt>评价分</dt>
                                                <dd><%= user.get("pingjiafen") %></dd>
                                            </dl>

                                            <dl class="cc">
                                                <dt>优秀分</dt>
                                                <dd><%= user.get("youxiufen") %></dd>
                                            </dl>
                                            <dl class="cc">
                                                <dt>解答数</dt>
                                                <dd><%= user.get("jiedashu") %></dd>
                                            </dl>
                                            <dl class="cc">
                                                <dt>答疑等级</dt>
                                                <dd><%= user.get("dayidengji") %></dd>
                                            </dl>
                                            <dl class="cc">
                                                <dt>提问等级</dt>
                                                <dd><%= user.get("tiwendengji") %></dd>
                                            </dl>
                                        </div>
                                    </div>
                                    <div></div>
                                </div>
                            </td>
                            <td class="floot_right">
                                <a name="post_2920754"></a>
                                <!--印戳-->
                                <!--楼层信息及编辑-->
                                <div class="tipTop s6"><a class="s2 b cp">楼主</a> </div>
                                <div class="read_h1" style="margin-bottom: 10px" id="subject_2920754"><%= map.get("biaoti") %></div>
                                <div class="tpc_content">
                                    <div class="f14 mb10"><%= map.get("neirong") %></div>
                                </div>
                                <!--content_read-->
                            </td>
                        </tr>
                        <tr>
                            <td class="floot_bottom">
                                <!--评分-->
                                <div id="w_2920754" class="c"></div>
                                <!--评分结束-->
                                <div class="tipBottom cc" data-index="-1">
                                    <!--<div class="fl readbot">
                            <a class="r-reply" title="回复楼主" href="javascript:;" onclick="postreply('回 7楼(陈正奇) 的帖子');">回复</a>
                        </div>-->
                                    <div class="fr">
                                        <% if ("老师".equals(session.getAttribute("cx"))) { %>
                                        <% if ( Query.make("youxiudafen").where("wentitiwenid" , map.get("id")).count() == 0 ) {%>
                                        <a class="btn btn-primary btn-xs" href="youxiudafenadd.jsp?id=<%= map.get("id") %>"> 优秀打分 </a>
                                        <% } %>

                                        <%} %>





                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <table width="100%" class="flootbg">
                <tbody>
                    <tr>
                        <td></td>
                    </tr>
                </tbody>
            </table>

            <script>
                var page = "<%= request.getParameter("page") !=null ? request.getParameter("page") : "" %>";
                if (page == "" || page == "null") {
                    page = 1;
                }
                var pagesize = 10;
                page = Math.max(Math.floor(page), 1);
                var index = (page - 1) * pagesize + 1;
            </script>

            <% Collect<Map> list = Query.make("wentijieda").where("wentitiwenid", map.get("id")).order("id asc").page(10); %>
 <%
             int i = 0;
             for (Map reply : list) {
                 i++;
             %>

            <div class="">
                <div class="read_t">
                    <table width="100%" class="floot">
                        <tbody>
                            <tr class="vt">
                                <td rowspan="2" class="floot_left">
                                    <div class="readName b">
                                        <a href="javascript:;"> <% user = Query.make("yonghu").where("yonghuming", reply.get("jiedaren")).find(); %>
 <%= user.get("xingming") %> </a>
                                    </div>
                                    <div class="floot_leftdiv">
                                        <a href="javascript:;" class="userCard face_img">
                                            <% if (user.get("touxiang") == null || "".equals(user.get("touxiang"))) { %>

                                            <img class="pic" src="images/default.gif" width="120" height="120" border="0" />
                                            <%} else { %>
                                            <img class="pic" src="<%= user.get("touxiang") %>" width="120" height="120" border="0" />
                                            <%} %>

                                        </a>

                                        <div class="readUser_info cc mb10">
                                            <div class="one" id="basic_info_2920754">
                                                <dl class="cc">
                                                    <dt>级别</dt>
                                                    <dd><%= user.get("cx") %></dd>
                                                </dl>
                                                <dl class="cc">
                                                    <dt>评价分</dt>
                                                    <dd><%= user.get("pingjiafen") %></dd>
                                                </dl>
                                                <%
                                                    if(user.get("cx").equals("学生"))
                                                    {
                                                %>
                                                <dl class="cc">
                                                    <dt>优秀分</dt>
                                                    <dd><%= user.get("youxiufen") %></dd>
                                                </dl>
                                                <%
                                                    }
                                                %>

                                                <dl class="cc">
                                                    <dt>解答数</dt>
                                                    <dd><%= user.get("jiedashu") %></dd>
                                                </dl>
                                                <dl class="cc">
                                                    <dt>答疑等级</dt>
                                                    <dd><%= user.get("dayidengji") %></dd>
                                                </dl>
                                                <%
                                                    if(user.get("cx").equals("学生"))
                                                    {
                                                %>
                                                <dl class="cc">
                                                    <dt>提问等级</dt>
                                                    <dd><%= user.get("tiwendengji") %></dd>
                                                </dl>
                                                <%
                                                    }
                                                %>

                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="floot_right" id="td_2920754">
                                    <!--印戳-->
                                    <!--楼层信息及编辑-->
                                    <div class="tipTop s6">
                                        <a class="s2 b cp"
                                            >#
                                            <script>
                                                document.write(index);
                                            </script>
                                            楼</a
                                        > 
                                    </div>
                                    <div class="tpc_content">
                                        <div class="f14 mb10"><%= reply.get("wentijieda") %></div>
                                    </div>
                                    <!--content_read-->
                                </td>
                            </tr>
                            <tr>
                                <td class="floot_bottom">
                                    <!--评分-->
                                    <div id="w_2920754" class="c"></div>
                                    <!--评分结束-->
                                    <div class="tipBottom cc">
                                        <div class="fl readbot">

                                            <div style="display: none">
                                                <p>
                                                    回【
                                                    <script>
                                                        document.write(index);
                                                    </script>
                                                    楼】（<%= user.get("xingming") %>）的帖子
                                                </p>
                                                <%= reply.get("wentijieda") %>
                                            </div>
                                        </div>



                                    </div>

                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <table width="100%" class="flootbg">
                    <tbody>
                        <tr>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <script>
                index++;
            </script>
            <%} %>

            <div class="">${page.info}</div>
            <div class="t" style="padding: 0; margin-bottom: 0">
                <form name="FORM" method="post" action="wentijieda.jsp?a=insert" id="anchor">
                    <div class="b h" style="border-top: 0">快速解答</div>
                    <table width="100%" class="floot" style="table-layout: inherit">
                        <tbody>
                            <tr class="vt">
                                <td class="floot_left">
                                    <div class="floot_leftdiv">
                                        <div>
                                            <p class="b"><%= session.getAttribute("name") !=null ? session.getAttribute("name") : "" %></p>
                                        </div>
                                        <div class="cc">
                                            <% if (session.getAttribute("touxiang") == null || "".equals(session.getAttribute("touxiang"))) { %>

                                            <div class="face_img"><img class="pic" src="images/default.gif" width="120" height="120" border="0" /></div>
                                            <%} else { %>
                                            <div class="face_img">
                                                <img class="pic" src="<%= session.getAttribute("touxiang") !=null ? session.getAttribute("touxiang") : "" %>" width="120" height="120" border="0" />
                                            </div>
                                            <%} %>

                                        </div>
                                    </div>
                                </td>
                                <td style="padding: 10px 0 10px 10px">
                                    <div class="c mb10">
                                        <div class="" style="display: none">
                                            <% Map readMap = Query.make("wentitiwen").where("id", request.getParameter("id")).find(); %>


                                            <input type="hidden" name="wentitiwenid" value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>" />
                                            <input type="hidden" id="bianhao" name="bianhao" value="<%= Info.html(readMap.get("bianhao")) %>" />
                                            <input type="hidden" id="biaoti" name="biaoti" value="<%= Info.html(readMap.get("biaoti")) %>" />
                                            <input type="hidden" id="fenlei" name="fenlei" value="<%= Info.html(readMap.get("fenlei")) %>" />
                                            <input type="hidden" id="tiwenren" name="tiwenren" value="<%= Info.html(readMap.get("tiwenren")) %>" />
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder="输入解答人"
                                                style="width: 150px"
                                                readonly="readonly"
                                                id="jiedaren"
                                                name="jiedaren"
                                                value="<%= session.getAttribute("username") !=null ? session.getAttribute("username") : "" %>"
                                            />
                                        </div>
                                        <input name="referer" id="referer" value="" type="hidden" />
                                        <script>
                                            $("#referer").val(location.href);
                                        </script>

                                        <textarea id="wentijieda" style="width: 100%; height: 120px" name="wentijieda"></textarea>
                                    </div>
                                    <div>
                                        <span class="mr20">
                                            <span class="bt" style="margin: 0">
                                                <span>

                                                       <% if ("学生".equals(session.getAttribute("cx")) || "老师".equals(session.getAttribute("cx"))) { %>
                                                                 <%
                                                                     if(!map.get("tiwenren").equals(session.getAttribute("username")))
                                                                     {
                                                                 %>

   <button type="submit" class="btn btn-primary" name="Submit">发 布</button>
  <%
      }
  %>
                <%} %>


                                                </span>
                                            </span>
                                        </span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <script>
                    function stripscript(s) {
                        return s.replace(/<script.*?>.*?<\/script>/gis, "");
                    }
                    function postreply(obj) {
                        var content = stripscript($(obj).next().html());
                        content = content.replace(/【(.*?)([0-9]+)(.*?)】/gis, function ($0, $1, $2) {
                            return "【" + $2 + "楼】";
                        });
                        content = "<blockquote>" + content + "</blockquote><p>&nbsp;</p>";
                        var editor = UM.getEditor("wentijieda");
                        editor.setContent(content);
                        $(window).scrollTop(99999);
                        editor.focus();
                    }
                    UM.getEditor("wentijieda");
                </script>
            </div>
        </div>

        <!-- container定宽，并剧中结束 -->
    </div>
</div>

<%@ include file="footer.jsp" %>
 <%@ include file="foot.jsp" %>

