<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>Insert title here</title>
<%	
	String path = request.getContextPath();
%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'工作记录')}">
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
</head><body style="background-color: #F5F5F5">	
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
	<form id="myform" action="<%=path %>/EA0301Query.html" method="post">
		<e:hidden name="aab301"/>
		<div class="col-10 grid-margin stretch-card" >
			<div class="card" style="width:60%;"align="center">
	       		<div class="card-body" style="width:60%;" align="center">
					<h4 align="center">
					工作记录
					</h4>
					<div class="form-group" align="left">
						<label for="aae102" >员工姓名</label>
						<e:text styleClass="form-control" name="aae102" maxlength="6" defval="${ins.aae102}" required="true" readonly="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aae103" >员工编号</label>
						<e:text styleClass="form-control" name="aae103" maxlength="8" defval="${ins.aae103}" required="true" readonly="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aaf304" >内容简介</label>
						<e:text styleClass="form-control" name="aaf304" defval="${ins.aaf304}" required="true" readonly="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aaf303" >日期时间</label>
						<e:text styleClass="form-control" name="aaf303" defval="${ins.aaf303}" required="true" readonly="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aaf302" >具体内容</label>
						<e:textarea styleClass="form-control" name="aaf302" rows="10" cols="50" defval="${ins.aaf302}" required="true" readonly="true"/>
					</div>
					<div class="form-group" align="center">
						<button type="submit" name="next" class="btn btn-secondary mr-2"
		   					   formaction="<%=request.getContextPath() %>/EA0801Query.html" 
		   					   formnovalidate="formnovalidate">返回</button>
					</div>		
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>