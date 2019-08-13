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
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'题库管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" class="forms-sample" action="<%=path %>/EA15Add.html" method="post">
	<e:hidden name="aaf501"/>
	<e:hidden name="qaaf502"/>
	<e:hidden name="qaaf503"/>
	<e:hidden name="qaaf504"/>
	<div class="col-10 grid-margin stretch-card" >
		<div class="card" style="width:60%;"align="center">
        	<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">
				题目${empty param.aaf501?'添加':'修改' }
				</h4>
				<div class="form-group" align="left">
					<label for="aaf502" style="width:100%;text-align: left;" >类型</label>
					<e:radio styleClass="" name="aaf502" value="客观题:1,主观题:2" 
						     defval="${empty ins.aaf502?'1':ins.aaf502}" required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aaf503" >科目</label>
					<input class="form-control" type="text" id="aaf503" list="listItem" maxlength="10" name="aaf503" value="${ins.aaf503 }"
						   required="required">
					<datalist id="listItem">
						<c:forEach items="${selects }" var="sel" varStatus="svs">
							<option value="${sel.aaf503 }">${sel.aaf503 }</option>
						</c:forEach>
					</datalist>
				</div>
				<div class="form-group" align="left">
					<label for="aaf504" >内容</label>
					<e:textarea styleClass="form-control" rows="10" cols="50" name="aaf504"
								defval="${ins.aaf504 }" required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aaf505" >答案</label>
					<e:textarea styleClass="form-control" rows="10" cols="50" name="aaf505" 
								defval="${ins.aaf505 }" required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aaf506" >备注/简介</label>
					<e:textarea styleClass="form-control" rows="5" cols="50" name="aaf506" defval="${ins.aaf506 }"/>
				</div>
				<div class="form-group" align="center">
					<button type="submit" name="next" class="btn btn-success mr-2"
								formaction="<%=path %>/EA15${empty param.aaf501?'Add':'Modify' }.html">${empty param.aaf501?'添加':'修改' }</button>
					<button type="submit" name="next" class="btn btn-secondary mr-2"
		    					formaction="<%=request.getContextPath() %>/EA15Query.html" 
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