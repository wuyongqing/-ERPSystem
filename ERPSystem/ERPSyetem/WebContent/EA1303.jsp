<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'教研方案审阅')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>活动内容</title>
<script type="text/javascript">
		function onBack(vaac301)
		{
			var vform = document.getElementById("activity-detail-form");
			vform.action="<%=path%>/EA1302.html?uaac301="+vaac301;
			vform.submit();
		} 
</script>
	<link rel="stylesheet" href="css/tstyle.css">
	<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="activity-detail-form" action="<%=path%>/EA1303.html" method="post">
<div class="col-10 grid-margin stretch-card" >
	<div class="card" style="width:60%;"align="center">
		<div class="card-body" style="width:60%;" align="center">
			<h3 align="center">活动内容</h3>
		  	<div class="form-group" align="left"> 
				<label for="aac401">活动编号  :</label>
				<e:text styleClass="form-control" name="aac401" readonly="true" defval="${subins.aac401}"/>
			</div>
		    <div class="form-group" align="left">  
				<label for="aae103">教师编号  :</label>
		    	<e:text styleClass="form-control" name="aae103" defval="${subins.aae103}" />
		    </div>
		    <div class="form-group" align="left">  
				<label for="aae102">教师姓名  :</label>
			 	<e:text styleClass="form-control" name="aae102" defval="${subins.aae102}" />
		    </div>
		    <div class="form-group" align="left">
			 	<label for="aac402">活动时间  :</label>
			 	<e:date styleClass="form-control" name="aac402" defval="${subins.aac402}"/>
		    </div>
		    <div class="form-group" align="left">       
		 		<label for="aac403">活动地点  :</label>
				<e:text styleClass="form-control" name="aac403" defval="${subins.aac403}"/>   
		    </div>
		   	<div class="form-group" align="left">  
			 	<label for="aac404">活动内容  :</label>
		    </div>
		    <div class="form-group" align="left">  
			 	<e:textarea styleClass="form-control" name="aac404" rows="10" cols="40"  defval="${subins.aac404}"/>
		    </div>
		    <div class="form-group" align="center">
				<button class="btn btn-secondary mr-2" type="submit" name="next" 
		        onclick="onBack('${param.maac301}')">返回</button>
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