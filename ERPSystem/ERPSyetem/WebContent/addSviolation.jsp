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
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'学生违纪管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" action="<%=path %>/EA0702Add.html" method="post">
	<e:hidden name="aab1201"/>
	<e:hidden name="qaab102"/>
	<e:hidden name="qaab103"/>
	<e:hidden name="baab1202"/>
	<e:hidden name="eaab1202"/>
	<div class="col-10 grid-margin stretch-card" >
		<div class="card" style="width:60%;"align="center">
        	<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">
				违纪${empty param.aab1201?'添加':'修改' }
				</h4>
				<div class="form-group" align="left">
					<label for="maab102" >违纪学生名称</label>
					<e:text styleClass="form-control" name="maab102" defval="${ins.aab102}" maxlength="6" 
							readonly="${empty param.aab1201?'false':'true'}" required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="maab103" >违纪学生编号</label>
					<e:text styleClass="form-control" name="maab103" defval="${ins.aab103}" maxlength="8" 
							readonly="${empty param.aab1201?'false':'true'}" required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aab1202" >违纪日期</label>
					<e:date styleClass="form-control" name="aab1202" defval="${ins.aab1202}" 
							readonly="${empty param.aab1201?'false':'true'}" required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aab1203" >违纪原因</label>
					<e:textarea styleClass="form-control" rows="10" cols="50" name="aab1203" defval="${ins.aab1203 }" 
								required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aab1204" >处理结果</label>
					<e:textarea styleClass="form-control" rows="10" cols="50" name="aab1204" defval="${ins.aab1204 }" 
								required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="raae102" >记录人姓名</label>
					<e:text styleClass="form-control" name="raae102" defval="${ins.record}" maxlength="6" 
					        readonly="${empty param.aab1201?'false':'true'}" required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="raae103" >记录人编号</label>
					<e:text styleClass="form-control" name="raae103" defval="${ins.recordnum}" maxlength="8" 
						    readonly="${empty param.aab1201?'false':'true'}" required="true"/>
				</div>
				<div class="form-group" align="center">
					<button type="submit" name="next" class="btn btn-success mr-2"
						   formaction="<%=path %>/EA0702${empty param.aab1201?'Add':'Modify' }.html">${empty param.aab1201?'添加':'修改' }</button>
					<button type="submit" name="next" class="btn btn-secondary mr-2"
		    			   formaction="<%=request.getContextPath() %>/EA0702Query.html" 
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