<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'�ʽ����')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>��֧��¼����</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform"  class="forms-sample" action="<%=path%>/ED0601FindByIdFundRecord.html" method="post">
<div class="col-10 grid-margin stretch-card" >
	<div class="card" style="width:60%;"align="center">
		<div class="card-body" style="width:60%;" align="center">
			<h4 align="left">��֧��¼����</h4>
	      	<div class="form-group" align="left" style="margin-top: 25px">
				<label>��¼���  :</label>
				<label style="margin-left: 38px">${ins.aad301}</label>
			</div>
	      	<div class="form-group" align="left">
				<label>��Ϊ�˱��  :</label>
				<label style="margin-left: 25px">${ins.code }</label>
			</div>
		    <div class="form-group" align="left"> 
				<label>��Ϊ������  :</label>
			    <label style="margin-left: 25px">${ins.name }</label>
		    </div>
	     	<div class="form-group" align="left"> 
				<label>��֧��  :</label>
			    <label style="margin-left: 52px">${ins.aad302 }</label>
	     	</div>
	     	<div class="form-group" align="left">      
			     <label>��֧��� :</label>
			     <label style="margin-left: 38px">${ins.aad303 }</label>
	     	</div>
	     	<div class="form-group" align="left">      
			     <label>����ʱ�� :</label>
			    <label style="margin-left: 38px">${ins.aad304 }</label>
	     	</div>
	      	<div class="form-group" align="left">      
			     <label>������ :</label>
			     <label style="margin-left: 52px">${ins.aae102 }</label>
	     	</div>
	      	<div class="form-group" align="left">      
			     <label>��ע  :</label>
			     <e:textarea  styleClass ="form-control" name="aad305" readonly="true" rows="10" cols="40"  defval="${ins.aad305}"/>
	     	</div>
	     	<div class="form-group" align="center">      
	           <button type="submit" name="next"  class="btn btn-secondary mr-2"
	              formaction="<%=path%>/ED0601QueryFundRecord.html"
	                    formnovalidate="formnovalidate">����</button>
	     	</div>
		</div>
	</div>
</div>
</form>
</div>
<script type="text/javascript">
</script>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>