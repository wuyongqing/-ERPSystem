<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!(fn:contains(applicationScope.menu[sessionScope.role],'�ˡ��ݡ���ѧ����') ||
					fn:contains(applicationScope.menu[sessionScope.role],'���ݸ�ѧ��������'))}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>��ѧ����ѧ����ѧ����</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
<style type="text/css">
   	tr
   	{
      	height:25px;
   	}
    td
    {
      height:30px;
  	}

</style>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="request-upload-form" class="forms-sample" action="<%=path%>/stuStatusReq.html" method="post">
<div class="col-10 grid-margin stretch-card" >
	<input type="hidden" name="aae101" value="${sessionScope.user }">
	<!-- 
	<input type="hidden" name="aae101" value="${empty sessionScope.user?'1':empty sessionScope.user }">
	 -->
	<div class="card" style="width:60%;"align="center">
		<div class="card-body" style="width:60%;" align="center">
			<h4 align="center">ѧ�����ݸ�ѧ����</h4>
					<div class="form-group" align="left">
				<label for="aab102" >ѧ������</label>
				<e:text styleClass="form-control" name="aab102" readonly="${not empty param.aab201 }" 
				defval="${ins.aab102 }" required="true"/>
			</div>
			<div class="form-group" align="left">
	     		<label for="aab103" >ѧ��</label>
	      		<e:text styleClass="form-control" name="aab103" readonly="${not empty param.aab201 }" 
				defval="${ins.aab103 }" required="true" maxlength="12" /> 
	   		</div>
	   		<div class="form-group" align="left">
	     		<label for="aab202" >����״̬</label>
	     		<e:select styleClass="form-control" name="aab202" required="true" value="��ѧ:2,��ѧ:1" 
	     		defval="${empty param.aab201?1:ins.aab202 }" 
	     		readonly="${not empty param.aab201 }" /> 
	   		</div>
	   		<div class="form-group" align="left">
	     		<label for="aab203" >��������</label>
	       		<e:select styleClass="form-control" name="aab203" required="true" value="��ѧ:3,��ѧ:2,��ѧ:1" 
	       		defval="${empty param.aab201?3:ins.aab203 }" 
	       		readonly="${not empty param.aab201 }" /> 
	   		</div>
	   		<div class="form-group" align="left">
	   			<label for="aab204" >ԭ������</label>
	   			<e:textarea styleClass="form-control" name="aab204" readonly="${not empty param.aab201 }" 
				defval="${ins.aab204 }" required="true" rows="5" cols="45"/>
	   		</div>
	   		<div class="form-group" align="left">
	   			<label for="aab204" >�������</label>
	   			<e:date styleClass="form-control" name="aab205" readonly="${not empty param.aab201 }" 
				defval="${ins.aab205 }" required="true"/>
	   		</div>
	   		<div class="form-group" align="center">
	   				<c:choose>
	   					<c:when test="${empty param.aab201 }">
	   						<button class="btn btn-success mr-2" type="submit" name="next">�ύ</button>
							<button class="btn btn-light mr-2" type="submit" name="next"
						          formaction="<%=path%>/stuReqRecords.html"
						          formnovalidate="formnovalidate">����</button>
	   					</c:when>
	   					<c:otherwise>
	   						<button class="btn btn-light mr-2" type="submit" name="next"
						          formaction="<%=path%>/EA0203.html"
						          formnovalidate="formnovalidate">����</button>
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