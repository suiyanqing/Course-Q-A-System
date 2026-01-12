<%@ page import="util.Request" %>
<%@ page import="dao.Query" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/datepicker/WdatePicker.js"></script>

    <script src="js/highcharts/highcharts.js"></script>
    <script src="js/highcharts/modules/exporting.js"></script>
    <script src="js/highcharts/modules/series-label.js"></script>
    <script src="js/highcharts/modules/oldie.js"></script>
</head>
<%@ include file="head.jsp" %>
<body>






<%
    //if (Request.get("kaishiriqi").equals("") && !Request.get("jieshuriqi").equals("")){
%>

<%
    String where = "1=1 AND cx='老师' ";
    if (!Request.get("kaishiriqi").equals("")) {
        where += " and addtime>='"+Request.get("kaishiriqi")+" 00:00:00' ";
    }
    if (!Request.get("jieshuriqi").equals("")) {
        where += " and addtime<='"+Request.get("jieshuriqi")+" 23:59:59' ";
    }
    List<HashMap> list = Query.make("yonghu").field("yonghuming ,xingming , SUM(pingjiafen) pingjiafen , SUM(jiedashu) jiedashu")
            .where(where)
            .group("yonghuming,xingming")
            .order("SUM(jiedashu) desc")
            .select();
%>


<table class="table">
    <thead>
    <tr>
        <th>老师</th>
        <th>评价分</th>
        <th>解答次数</th>

    </tr>
    </thead>
    <tbody>
    <%for (HashMap map:list)  {%>
    <tr>

        <td><%=map.get("yonghuming")%>-<%=map.get("xingming")%></td>
        <td><%=map.get("pingjiafen")%></td>
        <td><%=map.get("jiedashu")%></td>
    </tr>
    <% } %>
    </tbody>



</table>
<div class="row" style="background-color: #bababa">
    <div class="col-sm-6">
        <div id="container" style="height:350px"></div>
    </div>
    <div class="col-sm-6">
        <div id="container1" style="height:350px"></div>
    </div>
</div>
<script>
    var chart = Highcharts.chart('container', {
        credits: {
            enabled: false , // 禁用版权信息
            text: 'HCharts.cn',
            href: 'http://www.hcharts.cn'
        },
        chart: {
            type: 'column'
        },

        title: {
            text: '解答可视化'
        },
        subtitle: {
            text: ''
        },

        yAxis: {
            title: {
                text: '次数',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: ' 次'
        },
        xAxis:{
            title:{
                text:'老师'
            },

            categories:[
                <% for(HashMap map : list){ %>
                '<%=map.get("yonghuming")%>-<%=map.get("xingming")%>',
                <% } %>

            ]

        },
        /*
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },
        */
        plotOptions: {
            series: {
                label: {
                    connectorAllowed: false
                },
                // pointStart: 2010
            }
        },
        series: [{
            name: '解答次数',
            data: [
                <% for(HashMap map : list){ %>
                <%=map.get("jiedashu")%>,
                <% } %>
            ]
        }],
        responsive: {
            rules: [{
                condition: {
                    maxWidth: 500
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        }
    });
</script>
<script>
    Highcharts.chart('container1', {
        credits: {
            enabled: false , // 禁用版权信息
            text: 'HCharts.cn',
            href: 'http://www.hcharts.cn'
        },
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '评价分占比可视化'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [ <%for (HashMap map:list)  {%>
                {
                    name :'<%=map.get("yonghuming")%>-<%=map.get("xingming")%>',
                    y: <%=map.get("pingjiafen")%>,
                },
                <% } %>

            ]
        }]
    });
</script>

<% //} %>
</body>
</html>
