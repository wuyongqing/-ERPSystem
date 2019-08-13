<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'成绩管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
    <title>成绩管理</title>
    <script src="js/echarts.min.js"></script>
</head>
<body style="background-color: #F5F5F5">

<form id="myform" action="<%=path%>/EC0302ScoreChart.html" method="post">
  <!-- 查询条件区 -->
	<h4 align="center">成绩分析</h4>
	<table class="table-bordered" border="1" width="100%" align="center">
	  <tr>
	    <td>考试编号</td>
	    <td>
	      <e:text styleClass="form-control" required="true" name="aab602" style="width:100%"/>
	    </td>
	    <td> 
	    <button class="btn btn-primary mr-2" type="submit" name="next" formaction="<%=path%>/EC0302ScoreChart.html">分析</button> 
	    	   
	    </td>
	  </tr>
	  <tr>
		  <input type="hidden" id="data1" value="${ins.data1 }">
		  <input type="hidden" id="data2" value="${ins.data2 }">
		  <input type="hidden" id="data3" value="${ins.data3 }">
		  <input type="hidden" id="data4" value="${ins.data4 }">
		  <input type="hidden" id="data5" value="${ins.data5 }">
		  <div id="chart1" style="width: 600px;height:400px;" align="center">柱状图</div>
	  </tr>
	</table>
	<table class="table-bordered" border="1" width="100%" align="center">
	  <tr>
		<td>姓名</td>
	    <td>
	      <e:text styleClass="form-control" name="aab102" style="width:100%"/>
	    </td>
	    <td>学号</td>
	    <td>
	      <e:text styleClass="form-control" name="aab103" style="width:100%"/>
	    </td>
	    <td>开始日期</td>
	    <td>
	      <e:date styleClass="form-control" name="qaab603" style="width:100%"/>
	    </td>
	    <td>结束日期</td>
	    <td>
	      <e:date styleClass="form-control" name="paab603" style="width:100%"/>
	    </td>
	    <td>
	    <button class="btn btn-primary mr-2" type="submit" name="next" formaction="<%=path%>/EC0302ScoreChart.html">分析</button>
	    </td>
	  </tr>
	  <tr>
	  	<c:forEach items="${rows }" var="ins" varStatus="vs">
	  		<input type="hidden" id="date${vs.count }" value="${ins.aab603 }">
	  		<input type="hidden" id="score${vs.count }" value="${ins.a }">
	  	</c:forEach>
	    <div id="chart2" style="width: 600px;height:400px;" align="center">折线图</div>
	  </tr>
	</table>
    </form>
    <script type="text/javascript">
    
        // 基于准备好的dom，初始化echarts实例
        var myChart1 = echarts.init(document.getElementById('chart1'));
        //参数赋值
		var data1=document.getElementById("data1");
		var data2=document.getElementById("data2");
		var data3=document.getElementById("data3");
		var data4=document.getElementById("data4");
		var data5=document.getElementById("data5");
		
        // 指定图表的配置项和数据
        var option1 = {
            title: {
                text: 'ECharts 入门示例'
            },
            tooltip: {},
            legend: {
                data:['人数']
            },
            xAxis: {
                data: ['E','D','C','B','A']
            },
            yAxis: {},
            series: [{
                name: '人数',
                type: 'bar',
                data: [data1, data2,data3, data4, data5]
            }]
        };
        
        
        var myChart2 = echarts.init(document.getElementById('chart2'));
        
        var date1=document.getElementById("date1");
        var date2=document.getElementById("date2");
        var date3=document.getElementById("date3");
        var date4=document.getElementById("date4");
        var date5=document.getElementById("date5");
        var date6=document.getElementById("date6");
        var date7=document.getElementById("date7");
        var date8=document.getElementById("date8");
        var date9=document.getElementById("date9");
        var date10=document.getElementById("date10");
        
        var score1=document.getElementById("score1");
        var score2=document.getElementById("score2");
        var score3=document.getElementById("score3");
        var score4=document.getElementById("score4");
        var score5=document.getElementById("score5");
        var score6=document.getElementById("score6");
        var score7=document.getElementById("score7");
        var score8=document.getElementById("score8");
        var score9=document.getElementById("score9");
        var score10=document.getElementById("score10");
        
        var option2 = {
        	    xAxis: {
        	        type: 'category',
        	        data: [date1,date2,date3,date4,date5,date6,date7,date8,date9,date10]
        	    },
        	    yAxis: {
        	        type: 'value'
        	    },
        	    series: [{
        	        data: [score1,score2,score3,score4,score5,score6,score7,score8,score9,score10],
        	        type: 'line'
        	    }]
        	};
        // 使用刚指定的配置项和数据显示图表。
        myChart1.setOption(option1);
        myChart2.setOption(option2);
    </script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>