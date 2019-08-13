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
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'课程管理')}">
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
	<form id="myform" class="forms-sample" action="<%=path %>/EA02Add.html" method="post">
		<e:hidden name="aab501"/>
		<e:hidden name="qaab502"/>
		<e:hidden name="qaab503"/>
		<div class="col-10 grid-margin stretch-card" >
			<div class="card" style="width:60%;"align="center">
        		<div class="card-body" style="width:60%;" align="center">
	        		<h4 align="center">
					课程${empty param.aab501?'添加':'修改' }
					</h4>
					<div class="form-group" align="left">
						<label for="aab502" >课程名称</label>
						<e:text styleClass="form-control" name="aab502" defval="${ins.aab502}" maxlength="20" required="true"/>
					</div>
					<c:if test="${!empty param.aab501}">
						<div class="form-group" align="left">
							<label for="aab503" >课程编号</label>
							<e:text styleClass="form-control" name="aab503" defval="${ins.aab503}" readonly="true"/>
						</div>
					</c:if>
					<div class="form-group" align="left">
						<label for="aab503" >课程费用</label>
						<e:number styleClass="form-control" step="0.01" name="aab504" defval="${ins.aab504 }" required="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aab505" >课程内容</label>
						<e:textarea styleClass="form-control" rows="10" cols="50" name="aab505" 
						            defval="${ins.aab505 }" required="true"/>
					</div>
					<div class="form-group" align="left">
						<label for="aab507" >备注</label>
						<e:textarea styleClass="form-control" rows="10" cols="50" name="aab507" defval="${ins.aab507 }"/>
					</div>
					<div class="form-group" align="center">
						<button type="submit" name="next" class="btn btn-success mr-2"
									formaction="<%=path %>/EA06${empty param.aab501?'Add':'Modify' }.html">${empty param.aab501?'添加':'修改' }</button>
						<button type="submit" name="next" class="btn btn-secondary mr-2"
			    					formaction="<%=request.getContextPath() %>/EA06Query.html" 
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