<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>Insert title here</title>
<%	String path = request.getContextPath();
%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'班级管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
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

<div style="width:100%" align="center">
	<form id="myform" action="<%=path %>/EA0301Query.html" method="post">
		<e:hidden name="aab301"/>
		<div class="col-10 grid-margin stretch-card" >
			<div class="card" style="width:60%;"align="center">
        		<div class="card-body" style="width:60%;" align="center">
					<h4 align="center">
					班级信息
					</h4>
					<div class="form-group" align="left">
						<label for="aab302">班级名称</label>
						<e:text styleClass="form-control" name="aab302" defval="${ins.aab302 }" required="true" readonly="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aab303">班级编号</label>
						<e:text styleClass="form-control" name="aab303" defval="${ins.aab303 }" required="true" readonly="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="courseinfo" >课程</label>
						<input class="form-control" type="text" id="courseinfo" list="listItemC" name="courseinfo" 
							   required="required" value="${ins.course },${ins.coursenum }" 
							   onchange="changeInput3()" required="required"/>
						<datalist id="listItemC" style="height:200px;">
							<c:forEach items="${selects }" var="csel" varStatus="csvs">
								<option value="${csel.aab502 },${csel.aab503 }" >
								${csel.aab502 },${csel.aab503 }
								</option>
							</c:forEach>
						</datalist>
					</div>
					<div class="form-group" align="left">
						<label for="course" >课程名称</label>
						<e:text styleClass="form-control" name="course" defval="${ins.course }" required="true" readonly="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="coursenum" >课程编号</label>
						<e:text styleClass="form-control" name="coursenum" defval="${ins.coursenum }" 
							required="true" readonly="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aab306" >成立日期</label>
						<e:date styleClass="form-control" name="aab306" defval="${ins.aab306 }" disabled="true" required="required"/>
					</div>
					<div class="form-group" align="left">	
						<label for="aab3010">结束日期</label>
						<e:date styleClass="form-control" name="aab3010" defval="${ins.aab3010 }" required="required"/>
					</div>
					<div class="form-group" align="left">	
						<label for="teacher" >教师</label>
						<input class="form-control" type="text" list="listItem" id="teacher" name="teacher" 
							   value="${ins.tl },${ins.teacher },${ins.teachernum }" 
							   onchange="changeInput1()" required="required">
						<datalist id="listItem" >
							<c:forEach items="${rows }" var="sel" varStatus="svs">
								<option value="${sel.aae101 }:${sel.aae102 },${sel.aae103 }" >
								${sel.aae101 }:${sel.aae102 },${sel.aae103 }
								</option>
							</c:forEach>
						</datalist>
					</div>
					<div class="form-group" align="left">	
						<label for="teachernum" >教师序号</label>
						<e:text styleClass="form-control" name="teachernum" defval="${ins.tl }" 
							readonly="true" required="required"/>
					</div>
					<div class="form-group" align="left">
						<label for="headmaster">班主任</label>
						<input class="form-control" type="text" list="listItem2" id="headmaster" name="headmaster" 
							   value="${ins.hl },${ins.headmaster },${ins.headmasternum }" 
							   onchange="changeInput2()" required="required">
						<datalist id="listItem2" >
							<c:forEach items="${rows }" var="sel2" varStatus="svs2">
								<option value="${sel2.aae101 }:${sel2.aae102 },${sel2.aae103 }" >
								${sel2.aae101 }:${sel2.aae102 },${sel2.aae103 }
								</option>
							</c:forEach>
						</datalist>
					</div>
					<div class="form-group" align="left">
						<label for="headmaster">班主任序号</label>
						<e:text styleClass="form-control" name="headmasternum" defval="${ins.hl }" readonly="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aab3011">教室</label>
						<e:text styleClass="form-control" name="aab3011" maxlength="6" defval="${ins.aab3011 }" required="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aab309">限定人数</label>
						<e:text styleClass="form-control" name="aab309" defval="${ins.aab309 }" maxlength="6" required="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aab308">班级人数</label>
						<e:text styleClass="form-control" name="aab308" defval="${ins.aab308 }" required="true" readonly="true"/>
					</div>
					
					<div class="form-group" align="center">
						<button type="submit" id="modify" name="next" class="btn btn-success mr-2"
							    formaction="<%=path %>/EA0402Modify.html">修改</button>
						<button type="submit" name="next" class="btn btn-secondary mr-2"
		   					   formaction="<%=request.getContextPath() %>/EA0301Query.html" 
		   					   formnovalidate="formnovalidate">返回</button>
					</div>		
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>