<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'经费申请管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>经费记录</title>
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
			<h4 align="center"> 记录${empty param.aad101?'添加':'修改'}</h4>
			<c:if test="${!empty param.aad101 }">
			<div class="form-group" align="left">
				<label for="aad101">记录编号</label>
				<e:text styleClass="form-control" readonly="true"  id="aad101"  name="aad101"  defval="${ins.aad101 }"/>
			</div>
			</c:if>
			<div class="form-group" align="left">
				<label for="aae102">使用人</label>
				<e:text styleClass="form-control" id="aae102" name="aae102" required="true" readonly="true" defval="${sessionScope.name}"/>
			</div>
			<div class="form-group" align="left">
				<label for="aad102">使用类型</label>
				<e:select styleClass="form-control"  id="aad102" name="aad102"  required="true" readonly="${empty param.add101?false:true }" value="活动支出:2,物资采购:3" defval="${ins.aad102 }"/>
			</div>
			<div class="form-group" align="left">
				<label for="aad105">使用日期</label>
				<e:date styleClass="form-control" id="aad105" required="true" name="aad105" defval="${ins.aad105 }"/>
			</div>
			<div class="form-group" align="left">
				<label for="aad103">使用金额</label>
				<e:number styleClass="form-control" id="aad103" step="1" required="true" name="aad103" defval="${ins.aad103 }" readonly="${empty param.add101?false:true }"/>
			</div>
			<div class="form-group" align="left">
				<label for="aad104">详细说明</label>
				<e:textarea styleClass="form-control" id="aad104" required="true" name="aad104" defval="${ins.aad104 }" cols="50" rows="10" readonly="${empty param.add101?false:true }"/>
			</div>
			<div class="form-group" align="left">
				<label for="aad106">备注</label>
				<e:textarea styleClass="form-control" id="aad106" name="aad106" defval="${ins.aad106 }" cols="50" rows="10" readonly="${empty param.add101?false:true }"/>
			</div>
	  		<div class="form-group" align="center">
	           <c:if test="${param.uaac507==2 }">
	               <c:choose>
	                  <c:when test="${empty param.aad101}">
				            <button type="submit" name="next"  class="btn btn-success mr-2"
				                formaction="<%=path%>/EC1401AddRecord.html?uaac501=${param.uaac501}&uaac505=${param.uaac505 }&uaac507=${param.uaac507}">
				                添加</button>
		               </c:when>
		                <c:otherwise>
		                   <c:choose>
		                       <c:when test="${ins.aad102==1 }"></c:when>
		                       <c:otherwise>
				                       <button type="submit" name="next"  class="btn btn-success mr-2"
					                formaction="<%=path%>/EC1401ModifyRecord.html?uaac501=${param.uaac501}&uaac505=${param.uaac505 }&uaac507=${param.uaac507}">
					                修改</button>
			                </c:otherwise>
		                   </c:choose>
			                  
		                </c:otherwise>
		            </c:choose>
	           </c:if>
	            <button type="submit" name="next"  formnovalidate="formnovalidate" class="btn btn-secondary mr-2"
		          formaction="<%=path%>/EC1401QueryRecord.html?uaac501=${param.uaac501}&uaac505=${param.uaac505 }&uaac507=${param.uaac507}" >返回</button>
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