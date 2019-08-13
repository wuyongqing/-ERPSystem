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
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'账号管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
<script type="text/javascript">
	var count=0;
	function onSelect(vstate)
	{
		if(vstate)
		{
			alert("不修改密码");	
		}
		else
		{
			alert("修改密码");
		}
	}
</script>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" class="forms-sample" action="<%=path %>/EA01Add.html" method="post">
	<e:hidden name="ssa401"/>
	<e:hidden name="aae101"/>
	<e:hidden name="qaae102"/>
	<e:hidden name="qaae103"/>
	<e:hidden name="hasAccount"/>
	<div class="col-10 grid-margin stretch-card" >
	 	<div class="card" style="width:60%;"align="center">
        	<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">
				账号${empty param.aae101?'修改':'添加' }
				</h4>
				<div class="form-group" align="left">
					<label for="ssa402" >账号</label>
					<e:text styleClass="form-control" name="ssa402" defval="${ins.ssa402}" maxlength="20" required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="ssa404" style="width:100%;text-align: left;">密码</label>
					
					<e:text styleClass="form-control" style="width:50%" name="ssa404" />
					<c:if test="${empty param.aae101}">
						<input type="checkbox" name="lock" value="lock" title="选中则不会修改密码">
					</c:if>
				</div>
				<div class="form-group" align="left">
					<label for="ssa202" >角色</label>
					<e:select name="ssa202" styleClass="form-control"
						  value="老师:老师,班主任:班主任,总务:总务,财务:财务,
						  		咨询:咨询,内务:内务,门卫:门卫,账号管理:账号管理" 
						  defval="${ins.ssa202 }"/>
				</div>
				<div class="form-group" align="left">
					<label for="ssa405" style="width:100%;text-align:left">用户状态</label>
					<e:radio styleClass="" name="ssa405" value="在用:1,停用:2"
					         defval="${empty ins.ssa405?'1':ins.ssa405 }" /> 	
				</div>
				
				<div class="form-group" align="center">
				
					<button type="submit" name="next" class="btn btn-success mr-2"
							formaction="<%=path %>/EA01${empty param.aae101?'Modify':'Add' }.html">
							${empty param.aae101?'修改':'添加' }</button>
					<button type="submit" name="next" class="btn btn-secondary mr-2"
		    					formaction="<%=request.getContextPath() %>/EA01Query.html"
		    					formnovalidate="formnovalidate">
		    					返回</button>
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