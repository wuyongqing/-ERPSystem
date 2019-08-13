<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!(fn:contains(applicationScope.menu[sessionScope.role],'转班申请记录') ||
					fn:contains(applicationScope.menu[sessionScope.role],'转班申请审批'))}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>转班申请</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form class="form-sample"   id="request-upload-form" action="<%=path%>/changeClass.html" method="post">
	<input type="hidden" name="aae101" value="${sessionScope.user }">
	<div class="col-10 grid-margin stretch-card" >
		<div class="card" style="width:60%;"align="center">
			<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">学生转班申请</h4>	
				<div class="form-group" align="left">  
					<label for="aab102" >学生姓名</label>
					<e:text styleClass="form-control" name="aab102" readonly="${not empty param.aab401 }" 
					required="true" defval="${ins.aab102 }"/>
				</div>
				<div class="form-group" align="left">  
     				<label for="aab103" >学号</label>
	     			<e:text styleClass="form-control" name="aab103" readonly="${not empty param.aab401 }" 
       				required="true" defval="${ins.aab103 }" maxlength="13" /> 
   				</div>
   				<div class="form-group" align="left">  
     				<label for="aab402" >现班级编号</label>
     				<e:text styleClass="form-control" name="aab402" readonly="${not empty param.aab401 }" 
       				required="true" defval="${ins.aab402 }" />
   				</div>
   				<div class="form-group" align="left">  
     				<label for="aab403" >申请班级编号</label>
     				<e:text styleClass="form-control" name="aab403" readonly="${not empty param.aab401 }" 
       				required="true" defval="${ins.aab403 }"/>
   				</div>
   				<div class="form-group" align="left">  
   					<label for="aab404" >原因详述</label>
   					<e:textarea styleClass="form-control" name="aab404" readonly="${not empty param.aab401 }" 
       				required="true" defval="${ins.aab404 }" rows="5" cols="45"/>
   				</div>
   				<div class="form-group" align="left">  
   					<label for="aab405" >变更日期</label>
   					<e:date styleClass="form-control" name="aab405" readonly="${not empty param.aab401 }" 
       				required="true" defval="${ins.aab405 }"/>
   				</div>
   				<div class="form-group" align="center">  
	   				<c:choose>
	   					<c:when test="${empty param.aab401 }">
	   						<button class="btn btn-success mr-2" type="submit" name="next">提交</button>
							<button class="btn btn-secondary mr-2" type="submit" name="next" 
						          formaction="<%=path%>/changeClassRecords.html"
						          formnovalidate="formnovalidate">返回</button>
	   					</c:when>
	   					<c:otherwise>
	   						<button class="btn btn-secondary mr-2" type="submit" name="next" 
						          formaction="<%=path%>/EA0201.html"
						          formnovalidate="formnovalidate">返回</button>
	   					</c:otherwise>
	   				</c:choose>
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