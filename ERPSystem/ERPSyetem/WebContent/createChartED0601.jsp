<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'�ʽ����')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>������ʾ</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head>
 <body style="height: 100%;background-color: #F5F5F5">
 <form id="myform" action="<%=path%>/ED0601CreateChart.html">
      <div style="margin-top:15px; height: 20%">
           <h4 align="center">��Ȳ�������ͳ��</h4>
           <div id="condition" align="center" style="width:100%;height:70px;margin-top: 10px">
           		<div style="width:100%;margin-top: 25px;float:left" align="center" >
				<div class="form-group" align="center" >
                	<label style="line-height: 25px">���:</label>
                	<e:select styleClass="form-control" id="year1" name="year1" value="2019" style="margin-left:20px;width:80px"/>
                	<button class="btn btn-primary mr-2" style="margin-left: 20px"  type="submit" name="next">��ѯ</button>
                	<button type="submit" name="next" class="btn btn-secondary mr-2" style="margin-left: 20px"
                   		formaction="<%=path%>/ED0601QueryFundRecord.html" formnovalidate="formnovalidate">
                   		����</button>
			    </div>
			    </div>
           </div>
      </div>
      <div id="container1" style="height: 90%;margin-left: 5%"></div>
      <div style="height:15%;margin-top: 0px">
           <h4 align="center" style="margin-top: 40px">�������֧���ֲ�ͼ</h4>
       </div>
      <div id="container3" style="height:40%;width:46%;margin-right:0px;float:right;"></div>
       <div id="container2" style="height:40%;width:46%;margin-right: 5%;float:right;"></div>

       <div style="height: 20%;float:none;">   
           <div id="condition" align="center" style="width:100%;height:70px;margin-top: 10px">
             <div style="width:100%;margin-top: 25px;float:left" align="center" >
             <h4 align="center" style="margin-top:10px">���Ȳ�������ͳ��</h4>
				<div class="form-group" style="margin-top:25px"align="center" >
                <label style="line-height: 25px">���:</label>
                <e:select styleClass="form-control" id="year2" name="year2" value="2019" style="margin-left:20px;width:80px"/>
               <label style="margin-left:20px;line-height: 25px">����:</label>
               <e:select styleClass="form-control" style="width:100px;margin-left:20px" name="season" value="��һ����:1,�ڶ�����:2,��������:3,���ļ���:4" />
              <button class="btn btn-primary mr-2" style="margin-left:20px"  type="submit" name="next">��ѯ</button>
                <button type="submit" name="next" class="btn btn-secondary mr-2" style="margin-left:20px" 
                   formaction="<%=path%>/ED0601QueryFundRecord.html" formnovalidate="formnovalidate">
                   ����</button>
              </div>
             </div>
            </div>
               <c:choose>
                   <c:when test="${param.season==1}">
                          <input type="hidden" id="month1" name="month1" value="1��">
                  		  <input type="hidden" id="month2" name="month2" value="2��">
                  		  <input type="hidden" id="month3" name="month3" value="3��">
                   </c:when>
                   <c:when test="${param.season==2}">
                         <input type="hidden" id="month1" name="month1" value="4��">
                  		 <input type="hidden" id="month2" name="month2" value="5��">
                  		 <input type="hidden" id="month3" name="month3" value="6��">
                   </c:when>
                   <c:when test="${param.season==3}">
                         <input type="hidden" id="month1" name="month1" value="7��">
                  		 <input type="hidden" id="month2" name="month2" value="8��">
                  		 <input type="hidden" id="month3" name="month3" value="9��">
                   </c:when>
                   <c:otherwise>
                         <input type="hidden" id="month1" name="month1" value="10��">
                  		 <input type="hidden" id="month2" name="month2" value="11��">
                  		 <input type="hidden" id="month3" name="month3" value="12��">
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
           <h4 align="center" style="margin-top: 40px">��������֧���ֲ�ͼ</h4>
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
				app.title = '��������ͼ';
				
				option = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // ������ָʾ���������ᴥ����Ч
				            type : 'shadow'        // Ĭ��Ϊֱ�ߣ���ѡΪ��'line' | 'shadow'
				        }
				    },
				    legend: {
				        data:['����', '֧��', '����']
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
				            data : ['��һ����','�ڶ�����','��������','���ļ���']
				        }
				    ],
				    series : [
				        {
				            name:'����',
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
				            name:'����',
				            type:'bar',
				            stack: '����',
				            label: {
				                normal: {
				                    show: true
				                }
				            },
				            data:[sin1, sin2, sin3, sin4]
				        },
				        {
				            name:'֧��',
				            type:'bar',
				            stack: '����',
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
			app.title = '����ͼ';
			
			option = {
			    tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        x: 'left',
			        data:['ѧ��','ס�޷�','���ѽ���']
			    },
			    series: [
			        {
			            name:'ռ��',
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
			                {value:yscost, name:'ѧ��'},
			                {value:ylcost, name:'ס�޷�'},
			                {value:yrcost, name:'���ѽ���'},
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
			app.title = '����ͼ';
			
			option = {
			    tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        x: 'left',
			        data:['���о���','�����','���ھ���']
			    },
			    series: [
			        {
			            name:'������Դ',
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
			                {value:ytcost, name:'���о���'},
			                {value:yacost, name:'�����'},
			                {value:ybcost, name:'���ھ���'},
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
				app.title = '��������ͼ';
				
				option = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // ������ָʾ���������ᴥ����Ч
				            type : 'shadow'        // Ĭ��Ϊֱ�ߣ���ѡΪ��'line' | 'shadow'
				        }
				    },
				    legend: {
				        data:['����', '֧��', '����']
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
				            name:'����',
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
				            name:'����',
				            type:'bar',
				            stack: '����',
				            label: {
				                normal: {
				                    show: true
				                }
				            },
				            data:[in1, in2, in3]
				        },
				        {
				            name:'֧��',
				            type:'bar',
				            stack: '����',
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
			app.title = '����ͼ';
			
			option = {
			    tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        x: 'left',
			        data:['ѧ��','ס�޷�','���ѽ���']
			    },
			    series: [
			        {
			            name:'ռ��',
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
			                {value:scost, name:'ѧ��'},
			                {value:lcost, name:'ס�޷�'},
			                {value:rcost, name:'���ѽ���'},
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
			app.title = '����ͼ';
			
			option = {
			    tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        x: 'left',
			        data:['���о���','�����','���ھ���']
			    },
			    series: [
			        {
			            name:'������Դ',
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
			                {value:tcost, name:'���о���'},
			                {value:acost, name:'�����'},
			                {value:bcost, name:'���ھ���'},
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
				       selector.selectedIndex = 0;//Ĭ��ѡ�е�һ��
				      // selector.options.length = 0;//��ʼ��select
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
				       selector.selectedIndex = 0;//Ĭ��ѡ�е�һ��
				      // selector.options.length = 0;//��ʼ��select
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