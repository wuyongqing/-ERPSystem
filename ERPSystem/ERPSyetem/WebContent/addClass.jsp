 <%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>Insert title here</title>
<% String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'班级管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
<link href="css/style.css" rel="stylesheet">
<style type="text/css">
	td{
      height:25px;
  	}
</style>
  	
<script type="text/javascript">
	function changeInput1()
	{
		var count = document.getElementById("teacher").value;
		var option = document.getElementById(count);
		if(option!=null)
		{
			var s = count.indexOf(":");
			document.getElementById("teachernum").value = count.substr(0,s);
		}
		else
		{
			document.getElementById("teachernum").value = "";
			if(!count=="")
			{
				alert("教师无匹配信息");				
			}
		}
	}
	
	function changeInput2()
	{
		var count = document.getElementById("headmaster").value;
		var option = document.getElementById(count+",h");
		if(option!=null)
		{
			var s = count.indexOf(":");
			document.getElementById("headmasternum").value = count.substr(0,s);
		}
		else
		{
			document.getElementById("headmasternum").value = "";
			if(!count=="")
			{
				alert("班主任无匹配信息");				
			}
		}
	}
	
	function changeInput3()
	{
		var count = document.getElementById("courseinfo").value;
		var option = document.getElementById(count);
		if(option!=null)
		{
			var s = count.indexOf(",");
			document.getElementById("course").value = count.substr(0,s);
			document.getElementById("coursenum").value = count.substr(s+1);
		}
		else
		{
			document.getElementById("course").value = "";
			document.getElementById("coursenum").value = "";
			if(!count=="")
			{
				alert("课程无匹配信息");				
			}
		}
	}
</script>
</head><body style="background-color: #F5F5F5">	
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
	<form id="myform" class="forms-sample" action="<%=path %>/EA0402Add.html" method="post">
		<e:hidden name="aab301"/>
		<div class="col-10 grid-margin stretch-card" >
			<div class="card" style="width:60%;"align="center">
        		<div class="card-body" style="width:60%;" align="center">
					<h4 align="center">
					班级添加
					</h4>
					<div class="form-group" align="left">
						<label for="aab302" >班级名称</label>
						<e:text styleClass="form-control" name="aab302" maxlength="20" required="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="courseinfo" >课程</label>
						<input type="text" id="courseinfo" list="listItemC" class="form-control"
							   name="courseinfo" required="required" onchange="changeInput3()"/>
						<datalist id="listItemC">
							<c:forEach items="${selects }" var="csel" varStatus="csvs">
								<option value="${csel.aab502 },${csel.aab503 }" 
										id="${csel.aab502 },${csel.aab503 }">
									${csel.aab502 },${csel.aab503 }
								</option>
							</c:forEach>
						</datalist>
					</div>
					<div class="form-group" align="left">
						<label for="course" >课程名称</label>
						<e:text name="course" styleClass="form-control" required="true" onfocus="this.blur()"/>
					</div>
					<div class="form-group" align="left">
						<label for="coursenum" >课程编号</label>
						<e:text name="coursenum" styleClass="form-control" required="true" onfocus="this.blur()"/>
					</div>
					<div class="form-group" align="left">
						<label for="aab306" >成立日期</label>
						<e:date styleClass="form-control" name="aab306" required="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aab3010" >结束日期</label>
						<e:date styleClass="form-control" name="aab3010" required="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="teacher" >教师</label>
						<input type="text" list="listItem" id="teacher" name="teacher" 
								class="form-control" onchange="changeInput1()">
						<datalist id="listItem" >
							<c:forEach items="${rows }" var="sel" varStatus="svs">
								<option value="${sel.aae101 }:${sel.aae102 },${sel.aae103 }"
										id="${sel.aae101 }:${sel.aae102 },${sel.aae103 }" >
								${sel.aae101 }:${sel.aae102 },${sel.aae103 }
								</option>
							</c:forEach>
						</datalist>
					</div>
					<div class="form-group" align="left">
						<label for="teachernum" >序号</label>
						<e:text styleClass="form-control" name="teachernum" required="true" onfocus="this.blur()"/>
					</div>
					<div class="form-group" align="left">
						<label for="headmaster" >班主任</label>
						<input class="form-control" type="text" list="listItem2" id="headmaster" 
							   name="headmaster" onchange="changeInput2()">
						<datalist id="listItem2" >
							<c:forEach items="${rows }" var="sel2" varStatus="svs2">
								<option value="${sel2.aae101 }:${sel2.aae102 },${sel2.aae103 }" 
										id="${sel2.aae101 }:${sel2.aae102 },${sel2.aae103 },h">
								${sel2.aae101 }:${sel2.aae102 },${sel2.aae103 }
								</option>
							</c:forEach>
						</datalist>
					</div>
					<div class="form-group" align="left">
						<label for="headmasternum" >序号</label>
						<e:text styleClass="form-control" name="headmasternum" required="true" onfocus="this.blur()"/>
					</div>
					<div class="form-group" align="left">
						<label for="aab3011" >教室</label>
						<e:text styleClass="form-control" name="aab3011" maxlength="6" required="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aab309" >限定人数</label>
						<e:text styleClass="form-control" name="aab309" maxlength="6" required="true"/>
					</div>
					<div class="form-group" align="center">
							<button type="submit" id="add" class="btn btn-success mr-2" name="next">添加</button>
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