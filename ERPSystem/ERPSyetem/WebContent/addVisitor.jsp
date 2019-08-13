<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<title>Insert title here</title>
<% String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'来访登记管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" action="<%=path %>/EA0901Add.html" method="post">
	<e:hidden name="aaf401"/>
	<e:hidden name="qaaf402"/>
	<e:hidden name="qaaf405"/>
	<e:hidden name="baaf403"/>
	<e:hidden name="eaaf403"/>
	<e:hidden name="baaf404"/>
	<e:hidden name="eaaf404"/>
	<div class="col-10 grid-margin stretch-card" >
		<div class="card" style="width:60%;"align="center">
        	<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">
				来访登记<c:if test="${!empty param.aaf401 }">查看</c:if>
				</h4>
				<div class="form-group" align="left">
					<label for="aaf402" >访客姓名</label>
					<e:text styleClass="form-control" name="aaf402" maxlength="6" defval="${ins.aaf402}" required="true" readonly="${!empty param.aaf401?'true':'false' }"/>
				</div>
				<div class="form-group" align="left">
					<label for="aaf407" >单位</label>
					<e:text styleClass="form-control" name="aaf407" maxlength="50" defval="${ins.aaf407}" required="true" readonly="${!empty param.aaf401?'true':false }"/>
				</div>
				<div class="form-group" align="left">
					<label for="aaf405" >身份证</label>
					<e:text styleClass="form-control" name="aaf405" maxlength="20" defval="${ins.aaf405}" required="true" readonly="${!empty param.aaf401?'true':'false' }"/>
				</div>
				<div class="form-group" align="left">
					<label for="aaf406" >电话</label>
					<e:text styleClass="form-control" name="aaf406" maxlength="15" defval="${ins.aaf406 }" required="true" readonly="${!empty param.aaf401?'true':'false' }"/>
				</div>
				<div class="form-group" align="left">
					<label for="aaf403" >来访时间</label>
					<input class="form-control" type="datetime-local" id="aaf403" name="aaf403" 
						   value="${fn:replace(ins.aaf403,' ','T') }"
						   ${!empty param.aaf401?'readonly="readonly"':'' }>
				</div>
				<div class="form-group" align="left">
					<label for="aaf404" >结束时间</label>
					<input class="form-control" type="datetime-local" id="aaf404" name="aaf404" 
						   value="${fn:replace(ins.aaf404,' ','T') }"
						   ${!empty param.aaf401?'readonly="readonly"':'' }>
				</div>
				<div class="form-group" align="left">
					<label for="aaf404" >来访目的</label>
					<e:textarea styleClass="form-control" rows="10" cols="50" name="aaf408" defval="${ins.aaf408 }"  
								readonly="${!empty param.aaf401?'true':'false' }"
								required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aae102" >记录人姓名</label>
					<e:text styleClass="form-control" name="aae102" maxlength="6" defval="${empty param.aaf401?sessionScope.name:ins.aae102 }" 
							readonly="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aae103" >记录人编号</label>
					<e:text styleClass="form-control" name="aae103" maxlength="8" defval="${empty param.aaf401?sessionScope.numb:ins.aae103 }" 
							readonly="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aaf409" >备注</label>
					<e:textarea styleClass="form-control" rows="10" cols="50" name="aaf409" defval="${ins.aaf409 }" 
								required="true" readonly="${!empty param.aaf401?'true':'false' }"/>
				</div>
				<div class="form-group" align="center">
					<c:if test="${empty param.aaf401}">
						<button type="submit" name="next" class="btn btn-success mr-2">添加</button>
					</c:if>
					<button type="submit" name="next" class="btn btn-secondary mr-2"
		    					formaction="<%=request.getContextPath() %>/EA0901Query.html" 
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