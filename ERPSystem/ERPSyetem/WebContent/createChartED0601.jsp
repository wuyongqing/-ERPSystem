<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'资金审查')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>数据显示</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head>
 <body style="height: 100%;background-color: #F5F5F5">
 <form id="myform" action="<%=path%>/ED0601CreateChart.html">
      <div style="margin-top:15px; height: 20%">
           <h4 align="center">年度财务数据统计</h4>
           <div id="condition" align="center" style="width:100%;height:70px;margin-top: 10px">
           		<div style="width:100%;margin-top: 25px;float:left" align="center" >
				<div class="form-group" align="center" >
                	<label style="line-height: 25px">年份:</label>
                	<e:select styleClass="form-control" id="year1" name="year1" value="2019" style="margin-left:20px;width:80px"/>
                	<button class="btn btn-primary mr-2" style="margin-left: 20px"  type="submit" name="next">查询</button>
                	<button type="submit" name="next" class="btn btn-secondary mr-2" style="margin-left: 20px"
                   		formaction="<%=path%>/ED0601QueryFundRecord.html" formnovalidate="formnovalidate">
                   		返回</button>
			    </div>
			    </div>
           </div>
      </div>
      <div id="container1" style="height: 90%;margin-left: 5%"></div>
      <div style="height:15%;margin-top: 0px">
           <h4 align="center" style="margin-top: 40px">年度收入支出分布图</h4>
       </div>
      <div id="container3" style="height:40%;width:46%;margin-right:0px;float:right;"></div>
       <div id="container2" style="height:40%;width:46%;margin-right: 5%;float:right;"></div>

       <div style="height: 20%;float:none;">   
           <div id="condition" align="center" style="width:100%;height:70px;margin-top: 10px">
             <div style="width:100%;margin-top: 25px;float:left" align="center" >
             <h4 align="center" style="margin-top:10px">季度财务数据统计</h4>
				<div class="form-group" style="margin-top:25px"align="center" >
                <label style="line-height: 25px">年份:</label>
                <e:select styleClass="form-control" id="year2" name="year2" value="2019" style="margin-left:20px;width:80px"/>
               <label style="margin-left:20px;line-height: 25px">季度:</label>
               <e:select styleClass="form-control" style="width:100px;margin-left:20px" name="season" value="第一季度:1,第二季度:2,第三季度:3,第四季度:4" />
              <button class="btn btn-primary mr-2" style="margin-left:20px"  type="submit" name="next">查询</button>
                <button type="submit" name="next" class="btn btn-secondary mr-2" style="margin-left:20px" 
                   formaction="<%=path%>/ED0601QueryFundRecord.html" formnovalidate="formnovalidate">
                   返回</button>
              </div>
             </div>
            </div>
               <c:choose>
                   <c:when test="${param.season==1}">
                          <input type="hidden" id="month1" name="month1" value="1月">
                  		  <input type="hidden" id="month2" name="month2" value="2月">
                  		  <input type="hidden" id="month3" name="month3" value="3月">
                   </c:when>
                   <c:when test="${param.season==2}">
                         <input type="hidden" id="month1" name="month1" value="4月">
                  		 <input type="hidden" id="month2" name="month2" value="5月">
                  		 <input type="hidden" id="month3" name="month3" value="6月">
                   </c:when>
                   <c:when test="${param.season==3}">
                         <input type="hidden" id="month1" name="month1" value="7月">
                  		 <input type="hidden" id="month2" name="month2" value="8月">
                  		 <input type="hidden" id="month3" name="month3" value="9月">
                   </c:when>
                   <c:otherwise>
                         <input type="hidden" id="month1" name="month1" value="10月">
                  		 <input type="hidden" id="month2" name="month2" value="11月">
                  		 <input type="hidden" id="month3" name="month3" value="12月">
                   </c:otherwise>
               </c:choose>
                  <input type="hidden" id="scost1"      name="scost1"      value="${subins.scost1 }">
                  <input type="hidden" id="scost2"      name="scost2"      value="${subins.scost2 }">
                  <input type="hidden" id="scost3"      name="scost3"      value="${subins.scost3 }">
                  <input type="hidden" id="scost4"      name="scost4"      value="${subins.scost4 }">
                  <input type="hidden" id="sincome1" name="sincome1" value="${subins.sincome1 }">
                  <input type="hidden" id="sincome2" name="sincome2" value="${subins.sincome2 }">
                  <input type="hidden" id="sincome3" name="sincome3" value="${subins.sincome3 }">
                  <input type="hidden" id="sincome4" name="sincome4" value="${subins.sincome4 }">
                  <input type="hidden" id="yscost"      name="yscost"       value="${subins.yscost }">
                  <input type="hidden" id="ylcost"       name="ylcost"  	   value="${subins.ylcost }">
                  <input type="hidden" id="yrcost"       name="yrcost" 	   value="${subins.yrcost }">
                  <input type="hidden" id="ytcost"       name="ytcost" 	   value="${subins.ytcost }">
                  <input type="hidden" id="yacost"      name="yacost"       value="${subins.yacost }">
                  <input type="hidden" id="ybcost"      name="ybcost"       value="${subins.ybcost }">
                  <input type="hidden" id="cost1"      name="cost1"      value="${subins.cost1 }">
                  <input type="hidden" id="cost2"      name="cost2"      value="${subins.cost2 }">
                  <input type="hidden" id="cost3"      name="cost3"      value="${subins.cost3 }">
                  <input type="hidden" id="income1" name="income1" value="${subins.income1 }">
                  <input type="hidden" id="income2" name="income2" value="${subins.income2 }">
                  <input type="hidden" id="income3" name="income3" value="${subins.income3 }">
                  <input type="hidden" id="scost"      name="scost"       value="${subins.scost }">
                  <input type="hidden" id="lcost"       name="lcost"  	   value="${subins.lcost }">
                  <input type="hidden" id="rcost"       name="rcost" 	   value="${subins.rcost }">
                  <input type="hidden" id="tcost"       name="tcost" 	   value="${subins.tcost }">
                  <input type="hidden" id="acost"      name="acost"       value="${subins.acost }">
                  <input type="hidden" id="bcost"      name="bcost"       value="${subins.bcost }">
           </div>
           </form> 

       <div id="container4" style="height: 90%;margin-top:250px;margin-left: 5%;"></div>
       <div style="height:15%;margin-top: 40px">
           <h4 align="center" style="margin-top: 40px">季度收入支出分布图</h4>
       </div>
       <div id="container6" style="height:40%;width:46%;margin-right:0px;float:right;padding-bottom: 55px"></div>
       <div id="container5" style="height:40%;width:46%;margin-right: 5%;float:right;padding-bottom: 55px"></div>
       

       <script type="text/javascript" src="js/echarts.min.js"></script>
       <script type="text/javascript" src="js/shine.js"></script>
       <script type="text/javascript">
				var dom = document.getElementById("container1");
				var sc1 = document.getElementById("scost1").value;
				var sc2 = document.getElementById("scost2").value;
				var sc3 = document.getElementById("scost3").value;
				var sc4 = document.getElementById("scost4").value;
				var sin1 = document.getElementById("sincome1").value;
				var sin2 = document.getElementById("sincome2").value;
				var sin3 = document.getElementById("sincome3").value;
				var sin4 = document.getElementById("sincome4").value;
				var myChart = echarts.init(dom);
				var app = {};
				option = null;
				app.title = '正负条形图';
				
				option = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    legend: {
				        data:['利润', '支出', '收入']
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    xAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    yAxis : [
				        {
				            type : 'category',
				            axisTick : {show: false},
				            data : ['第一季度','第二季度','第三季度','第四季度']
				        }
				    ],
				    series : [
				        {
				            name:'利润',
				            type:'bar',
				            label: {
				                normal: {
				                    show: true,
				                    position: 'inside'
				                }
				            },
				            data:[sin1-sc1, sin2-sc2, sin3-sc3,sin4-sc4]
				        },
				        {
				            name:'收入',
				            type:'bar',
				            stack: '总量',
				            label: {
				                normal: {
				                    show: true
				                }
				            },
				            data:[sin1, sin2, sin3, sin4]
				        },
				        {
				            name:'支出',
				            type:'bar',
				            stack: '总量',
				            label: {
				                normal: {
				                    show: true,
				                    position: 'left'
				                }
				            },
				            data:[-sc1, -sc2, -sc3, -sc4]
				        }
				    ]
				};
				;
				if (option && typeof option === "object") {
				    myChart.setOption(option, true);
				}
	  </script>
	  <script type="text/javascript">
       		var yscost = document.getElementById("yscost").value;
			var ylcost  =  document.getElementById("ylcost").value;
			var yrcost  = document.getElementById("yrcost").value;
			var dom = document.getElementById("container2");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;
			app.title = '环形图';
			
			option = {
			    tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        x: 'left',
			        data:['学费','住宿费','经费结余']
			    },
			    series: [
			        {
			            name:'占比',
			            type:'pie',
			            radius: ['65%', '90%'],
			            avoidLabelOverlap: false,
			            label: {
			                normal: {
			                    show: false,
			                    position: 'center'
			                },
			                emphasis: {
			                    show: true,
			                    textStyle: {
			                        fontSize: '30',
			                        fontWeight: 'bold'
			                    }
			                }
			            },
			            labelLine: {
			                normal: {
			                    show: false
			                }
			            },
			            data:[
			                {value:yscost, name:'学费'},
			                {value:ylcost, name:'住宿费'},
			                {value:yrcost, name:'经费结余'},
			            ]
			        }
			    ]
			};
			;
			if (option && typeof option === "object") {
			    myChart.setOption(option, true);
			}
       </script>
        <script type="text/javascript">
        	var ytcost = document.getElementById("ytcost").value;
			var yacost = document.getElementById("yacost").value;
			var ybcost = document.getElementById("ybcost").value;
			var dom = document.getElementById("container3");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;
			app.title = '环形图';
			
			option = {
			    tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        x: 'left',
			        data:['教研经费','活动经费','后勤经费']
			    },
			    series: [
			        {
			            name:'访问来源',
			            type:'pie',
			            radius: ['65%', '90%'],
			            avoidLabelOverlap: false,
			            label: {
			                normal: {
			                    show: false,
			                    position: 'center'
			                },
			                emphasis: {
			                    show: true,
			                    textStyle: {
			                        fontSize: '30',
			                        fontWeight: 'bold'
			                    }
			                }
			            },
			            labelLine: {
			                normal: {
			                    show: false
			                }
			            },
			            data:[
			                {value:ytcost, name:'教研经费'},
			                {value:yacost, name:'活动经费'},
			                {value:ybcost, name:'后勤经费'},
			            ]
			        }
			    ]
			};
			;
			if (option && typeof option === "object") {
			    myChart.setOption(option, true);
			}
       </script>
      <script type="text/javascript">
				var dom = document.getElementById("container4");
				var c1 = document.getElementById("cost1").value;
				var c2 = document.getElementById("cost2").value;
				var c3 = document.getElementById("cost3").value;
				var in1 = document.getElementById("income1").value;
				var in2 = document.getElementById("income2").value;
				var in3 = document.getElementById("income3").value;
				var m1 = document.getElementById("month1").value;
				var m2 = document.getElementById("month2").value;
				var m3 = document.getElementById("month3").value;
				var myChart = echarts.init(dom);
				var app = {};
				option = null;
				app.title = '正负条形图';
				
				option = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    legend: {
				        data:['利润', '支出', '收入']
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    xAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    yAxis : [
				        {
				            type : 'category',
				            axisTick : {show: false},
				            data : [m1,m2,m3]
				        }
				    ],
				    series : [
				        {
				            name:'利润',
				            type:'bar',
				            label: {
				                normal: {
				                    show: true,
				                    position: 'inside'
				                }
				            },
				            data:[in1-c1, in2-c2, in3-c3]
				        },
				        {
				            name:'收入',
				            type:'bar',
				            stack: '总量',
				            label: {
				                normal: {
				                    show: true
				                }
				            },
				            data:[in1, in2, in3]
				        },
				        {
				            name:'支出',
				            type:'bar',
				            stack: '总量',
				            label: {
				                normal: {
				                    show: true,
				                    position: 'left'
				                }
				            },
				            data:[-c1, -c2, -c3 ]
				        }
				    ]
				};
				;
				if (option && typeof option === "object") {
				    myChart.setOption(option, true);
				}
				       </script>
				      
       <script type="text/javascript">
       		var scost = document.getElementById("scost").value;
			var lcost  =  document.getElementById("lcost").value;
			var rcost  = document.getElementById("rcost").value;
			var dom = document.getElementById("container5");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;
			app.title = '环形图';
			
			option = {
			    tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        x: 'left',
			        data:['学费','住宿费','经费结余']
			    },
			    series: [
			        {
			            name:'占比',
			            type:'pie',
			            radius: ['65%', '90%'],
			            avoidLabelOverlap: false,
			            label: {
			                normal: {
			                    show: false,
			                    position: 'center'
			                },
			                emphasis: {
			                    show: true,
			                    textStyle: {
			                        fontSize: '30',
			                        fontWeight: 'bold'
			                    }
			                }
			            },
			            labelLine: {
			                normal: {
			                    show: false
			                }
			            },
			            data:[
			                {value:scost, name:'学费'},
			                {value:lcost, name:'住宿费'},
			                {value:rcost, name:'经费结余'},
			            ]
			        }
			    ]
			};
			;
			if (option && typeof option === "object") {
			    myChart.setOption(option, true);
			}
       </script>
        <script type="text/javascript">
        	var tcost = document.getElementById("tcost").value;
			var acost = document.getElementById("acost").value;
			var bcost = document.getElementById("bcost").value;
			var dom = document.getElementById("container6");
			var myChart = echarts.init(dom);
			var app = {};
			option = null;
			app.title = '环形图';
			
			option = {
			    tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        x: 'left',
			        data:['教研经费','活动经费','后勤经费']
			    },
			    series: [
			        {
			            name:'访问来源',
			            type:'pie',
			            radius: ['65%', '90%'],
			            avoidLabelOverlap: false,
			            label: {
			                normal: {
			                    show: false,
			                    position: 'center'
			                },
			                emphasis: {
			                    show: true,
			                    textStyle: {
			                        fontSize: '30',
			                        fontWeight: 'bold'
			                    }
			                }
			            },
			            labelLine: {
			                normal: {
			                    show: false
			                }
			            },
			            data:[
			                {value:tcost, name:'教研经费'},
			                {value:acost, name:'活动经费'},
			                {value:bcost, name:'后勤经费'},
			            ]
			        }
			    ]
			};
			;
			if (option && typeof option === "object") {
			    myChart.setOption(option, true);
			}
       </script>
        <script type="text/javascript">
				       window.onload=setsel();
				       function setsel()
				       {
				       var options = new Array();
				       var option=null;
				       for(var i=2019;i>=2000;i--){
				       option=new Option(i,i); 
				       options[options.length] = option;
				       }
				       setOptions("year2",options);
				       }
				
				       function setOptions(selector, options){
				       var selector=document.getElementById(selector);
				       selector.selectedIndex = 0;//默认选中第一个
				      // selector.options.length = 0;//初始化select
				       if (options){
				       for (var i = 0; i < options.length; i++){
				       selector.options[selector.options.length] = options[i];
				       }
				       }
				}
       </script>
        <script type="text/javascript">
				       window.onload=setsel();
				       function setsel()
				       {
				       var options = new Array();
				       var option=null;
				       for(var i=2019;i>=2000;i--){
				       option=new Option(i,i); 
				       options[options.length] = option;
				       }
				       setOptions("year1",options);
				       }
				
				       function setOptions(selector, options){
				       var selector=document.getElementById(selector);
				       selector.selectedIndex = 0;//默认选中第一个
				      // selector.options.length = 0;//初始化select
				       if (options){
				       for (var i = 0; i < options.length; i++){
				       selector.options[selector.options.length] = options[i];
				       }
				       }
				}
       </script>
   <script type="text/javascript" src="js/forbidTab.js"></script>
</body>
</html>