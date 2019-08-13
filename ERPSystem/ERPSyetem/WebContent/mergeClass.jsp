 <%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>Insert title here</title>
<%	String path = request.getContextPath();
	//String role = (String)request.getSession().getAttribute("role");
	//if(role==null)
	//{
	//	request.getRequestDispatcher("/login.jsp").forward(request,response);
	//}
%>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
<style type="text/css">
	td{
      height:25px;
  	}
</style>
  	
<script type="text/javascript">
	function changeInput1()
	{
		var count = document.getElementById("teacher").value;
		var s = count.indexOf(":");
		document.getElementById("teachernum").value = count.substr(0,s);
	}
	
	function changeInput2()
	{
		var count = document.getElementById("headmaster").value;
		var s = count.indexOf(":");
		document.getElementById("headmasternum").value = count.substr(0,s);
	}
	
	function changeInput3()
	{
		var count = document.getElementById("courseinfo").value;
		var s = count.indexOf(",");
		document.getElementById("course").value = count.substr(0,s);
		document.getElementById("coursenum").value = count.substr(s+1);
	}
</script>
</head><body style="background-color: #F5F5F5">	
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
      <div class="card" style="max-width: 100%; " align="center">
           <div class="card-body" style="max-width:100%" align="center">
				<form id="myform" action="<%=path %>/EA0501Merge.html" method="post">
					<e:hidden name="idlist"/>
					<h4 align="center">
							班级合并
					</h4>
					<table class="table-bordered" border=1 width="100%" align="center" >
						<tr>
							<td colspan="4">原班级信息</td>
						</tr>
						<tr>
							<td></td>
							<td>序号</td>
							<td>班级名称</td>
							<td>班级编号</td>
						</tr>
						<c:forEach items="${rows }" var="ins" varStatus="vs">
				  		<tr>
				  			<td>
			    			<input type="hidden" name="aab301" value="${ins.aab301 }">
				  			</td>
				    		<td>${vs.count }</td>
				  			<td>${ins.aab302 }</td>
				  			<td>${ins.aab303 }</td>
				 	    </tr>
				  		</c:forEach>
					</table>
					<table class="table-bordered" border=1 width="100%" align="center" id="t_class">
						<tr>
							<td colspan="4">新班级信息</td>
						</tr>
						<tr>
							<td>班级名称</td>
							<td class="content">
							<e:text styleClass="form-control" style="width:100%" name="aab302" required="true"/>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td>课程</td>
							<td class="content" >
								<input class="form-control" type="text" id="courseinfo" list="listItemC" 
									   name="courseinfo" required="required" onchange="changeInput3()" style="width:100%"/>
								<datalist id="listItemC" style="height:200px;">
									<c:forEach items="${selects }" var="csel" varStatus="csvs">
										<option value="${csel.aab502 },${csel.aab503 }" >
										${csel.aab502 },${csel.aab503 }
										</option>
									</c:forEach>
								</datalist>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td>课程名称</td>
							<td class="content">
							<e:text styleClass="form-control" style="width:100%" name="course" required="true" readonly="true"/>
							</td>
							<td>课程编号</td>
							<td class="content">
							<e:text styleClass="form-control" style="width:100%" name="coursenum" required="true" readonly="true"/>
							</td>
						</tr>
						
						<tr>
							<td>成立日期</td>
							<td class="content">
							<e:date styleClass="form-control" style="width:100%" name="aab306" required="true"/>
							</td>
							<td>结束日期</td>
							<td class="content">
							<e:date styleClass="form-control" style="width:100%" name="aab3010" required="true"/>
							</td>
						</tr>
						<tr>	
							<td>教师</td>
							<td class="content">
								<input class="form-control" style="width:100%" type="text" list="listItem" id="teacher" name="teacher" 
													onchange="changeInput1()" required="required">
								<datalist id="listItem" >
									<c:forEach items="${mem }" var="sel" varStatus="svs">
										<option value="${sel.aae101 }:${sel.aae102 },${sel.aae103 }" >
										${sel.aae101 }:${sel.aae102 },${sel.aae103 }
										</option>
									</c:forEach>
								</datalist>
							</td>
							<td>教师流水号</td>
							<td class="content">
							<e:text styleClass="form-control" style="width:100%" name="teachernum" readonly="true"/>
							</td>
						</tr>
						<tr>
							<td>班主任</td>
							<td class="content">
							<input class="form-control" style="width:100%" type="text" list="listItem2" id="headmaster" 
								   name="headmaster" onchange="changeInput2()" required="required">
							<datalist id="listItem2" >
								<c:forEach items="${mem }" var="sel2" varStatus="svs2">
									<option value="${sel2.aae101 }:${sel2.aae102 },${sel2.aae103 }" >
									${sel2.aae101 }:${sel2.aae102 },${sel2.aae103 }
									</option>
								</c:forEach>
							</datalist>
							</td>
							<td>班主任流水号</td>
							<td class="content">
							<e:text styleClass="form-control" style="width:100%" name="headmasternum" readonly="true"/>
							</td>
						</tr>
						<tr>
							<td>教室</td>
							<td class="content">
							<e:text styleClass="form-control" style="width:100%" name="aab3011" required="true"/>
							</td>
							<td>限定人数</td>
							<td class="content">
							<e:text styleClass="form-control" style="width:100%" name="aab309" required="true"/>
							</td>
						</tr>
					
					</table>
					<table border=1 width="100%" align="center" >
						<tr>
							<td>变更日期</td>
							<td class="content"><e:date styleClass="form-control" style="width:100%" name="aab405"  required="true"/></td>
						</tr>
						<tr>
							<td colspan="2">变更原因</td>
						</tr>
						<tr>
							<td colspan="2" class="content">
							<e:textarea styleClass="form-control" rows="10" cols="100" name="aab404" style="width:100%"
										required="true"/>
							</td>	
						</tr>
					</table>
				<table border=1 width="100%" align="center" >
					<tr>
						<td align="center">
							<button class="btn btn-success mr-2" type="submit" id="merge" name="next">合并</button>
							<button class="btn btn-secondary mr-2" type="submit" name="next"
			    					formaction="<%=request.getContextPath() %>/EA0301Query.html"
			    					formnovalidate="formnovalidate">返回</button>
						</td>		
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>