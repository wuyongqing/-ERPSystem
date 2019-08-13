<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'教研方案管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>活动管理</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
<script type="text/javascript">
		function onBack(vaac301)
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/EC0901FindByIdPlan.html?uaac301="+vaac301;
			vform.submit();
		} 
</script>
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div  style="width:100%" align="center">
<form class="forms-sample"  id="myform" action="<%=path%>/EC0901AddActivity.html" method="post">
<div class="col-10 grid-margin stretch-card" >
      <div class="card" style="width:60%;"align="center">
           <div class="card-body" style="width:60%;" align="center">
              	<h4 align="center">活动添加</h4>
              	<c:if test="${!empty param.aac401}"> 
       			<div class="form-group" align="left">
					<label for="aac401">活动编号  :</label>
		     		<e:text styleClass="form-control"  id="aac401" name="aac401" readonly="true" defval="${subins.aac401}"/>
				</div>
				</c:if>
      			<div class="form-group" align="left">
					<label for="aae103">教师编号  :</label>
		     		<e:text styleClass="form-control"  id="aad103" name="aae103" required="true" defval="${subins.aae103}" />
     			</div>
			    <div class="form-group" align="left">
						<label for="aae102">教师姓名  :</label>
					     <e:text  styleClass="form-control"  id="aae102" name="aae102" required="true" defval="${subins.aae102}" />
			     </div>
			     <div class="form-group" align="left">
					     <label for="aac402">活动日期  :</label>
					     <e:date styleClass="form-control"  id="aac402" name="aac402" required="true" defval="${subins.aac402}"/>
			     </div>
			     <div class="form-group" align="left">
					     <label for="aac403">活动地点  :</label>
					     <e:text styleClass="form-control" maxlength="12"  id="aac403" name="aac403" required="true" defval="${subins.aac403}"/>   
			     </div>
			    <div class="form-group" align="left">
					     <label  for="aac404" >活动内容  :</label>
					     <e:textarea styleClass="form-control"  required="true"  id="aac404"  name="aac404" rows="10" cols="40"  defval="${subins.aac404}"/>
			     </div>
			      <div class="form-group" align="center">
				       <button type="submit" name="next" class="btn btn-success mr-2" 
				               formaction="<%=path%>/EC0901AddActivity.html?maac301=${param.maac301}">添加</button>
				       <button type="submit" name="next" class="btn btn-secondary mr-2" 
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