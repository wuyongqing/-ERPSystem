<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'���Ѳ��������')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>���Ѽ�¼</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css"> 
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" class="forms-sample" action="<%=path%>/EC1401QueryRecord.html" method="post">
<div class="col-10 grid-margin stretch-card" >
	<div class="card" style="width:60%;"align="center">
		<div class="card-body" style="width:60%;" align="center">
			<h4 align="center"> ��¼${empty param.aad101?'���':'�޸�'}</h4>
			<c:if test="${!empty param.aad101 }">
			<div class="form-group" align="left">
				<label for="aad101">��¼���</label>
				<e:text  styleClass="form-control" readonly="true" id="aad101" name="aad101"  defval="${subins.aad101 }"/>
			</div>
			</c:if>
			<div class="form-group" align="left">
				<label for="aae102">ʹ����</label>
				<e:text styleClass="form-control"  id="aae102" name="aae102" readonly="true" defval="${subins.aae102 }"/>
			</div>
			<div class="form-group" align="left">
				<label for="aad102">ʹ������</label>
				<e:select  styleClass="form-control" readonly="true" value="���ѻ�ȡ:1,�֧��:2,���ʲɹ�:3" id="aad102"  name="aad102" defval="${subins.aad102 }"/>
			</div>
			<div class="form-group" align="left">
				<label for="aad105">ʹ������</label>
				<e:text styleClass="form-control"  readonly="true"  id="aad105"  name="aad105" defval="${subins.aad105 }"/>
			</div>
			<div class="form-group" align="left">
				<label for="aad103">ʹ�ý��</label>
				<e:text styleClass="form-control"  id="aad103"  name="aad103" defval="${subins.aad103 }" readonly="true"/>
			</div>
			<div class="form-group" align="left">
				<label for="aad104">��ϸ˵��</label>
				<e:textarea styleClass="form-control"  id="aad104"  name="aad104" defval="${subins.aad104 }" cols="50" rows="10" readonly="true"/>
			</div>
			<div class="form-group" align="left">
				<label for="aad106">��ע</label>
				<e:textarea styleClass="form-control"  id="aad106" name="aad106" defval="${subins.aad106 }" cols="50" rows="10" readonly="${empty param.add101?false:true }"/>
			</div>
			<div class="form-group" align="center">
				<button type="submit" name="next"  formnovalidate="formnovalidate" class="btn btn-secondary mr-2"
				      formaction="<%=path%>/EB0201QueryAFRecord.html?uaac501=${param.uaac501}&aac507=${param.uaac507}&aae101=${param.aae101}" >
				      ����</button>
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