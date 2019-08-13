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
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'员工违纪管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" action="<%=path %>/EA0701Add.html" method="post">
	<e:hidden name="aaf201"/>
	<e:hidden name="qaae102"/>
	<e:hidden name="qaae103"/>
	<e:hidden name="baaf202"/>
	<e:hidden name="eaaf202"/>
	<div class="col-10 grid-margin stretch-card" >
		<div class="card" style="width:60%;"align="center">
        	<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">
				违纪${empty param.aaf201?'添加':'修改' }
				</h4>
				<div class="form-group" align="left">
					<label for="maae102" >违纪员工名称</label>
					<e:text styleClass="form-control" name="maae102" defval="${ins.aae102}" maxlength="6" 
							readonly="${empty param.aaf201?'false':'true'}"/>
				</div>
				<div class="form-group" align="left">
					<label for="maae103" >违纪员工编号</label>
					<e:text styleClass="form-control" name="maae103" defval="${ins.aae103}" 
							maxlength="8" readonly="${empty param.aaf201?'false':'true'}"/>
				</div>
				<div class="form-group" align="left">
					<label for="aaf202" >违纪日期</label>
					<e:date styleClass="form-control" name="aaf202" defval="${ins.aaf202}" required="true" 
							readonly="${empty param.aaf201?'false':'true'}"/>
				</div>
				<div class="form-group" align="left">
					<label for="aaf203" >违纪原因</label>
					<e:textarea styleClass="form-control" rows="10" cols="50" name="aaf203" defval="${ins.aaf203 }" 
								required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aaf204" >处理结果</label>
					<e:textarea styleClass="form-control" rows="10" cols="50" name="aaf204" defval="${ins.aaf204 }" 
								required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="raae102" >记录人姓名</label>
					<e:text styleClass="form-control" name="raae102" defval="${ins.record}" maxlength="6" 
							readonly="${empty param.aaf201?'false':'true'}"/>
				</div>
				<div class="form-group" align="left">
					<label for="raae103" >记录人编号</label>
					<e:text styleClass="form-control" name="raae103" defval="${ins.recordnum}" maxlength="8" 
							readonly="${empty param.aaf201?'false':'true'}"/>
				</div>
				<div class="form-group" align="center">
					<button type="submit" name="next" class="btn btn-success mr-2"
								formaction="<%=path %>/EA0701${empty param.aaf201?'Add':'Modify' }.html">${empty param.aaf201?'添加':'修改' }</button>
					<button type="submit" name="next" class="btn btn-secondary mr-2"
		    					formaction="<%=request.getContextPath() %>/EA0701Query.html" 
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