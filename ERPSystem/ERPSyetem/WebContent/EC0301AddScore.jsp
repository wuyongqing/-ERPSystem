<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'成绩管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>成绩管理</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head>
<body>
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" class="forms-sample" action="<%=path%>/EC0301AddScore.html" method="post">
<div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
       				<h4 align="center">分数${empty param.aab701?'录入':'修改' }</h4>
       				  <div class="form-group" align="left">
                        <label for="aab103" >学号  :</label>
                        <e:text styleClass="form-control" id="aab103" name="aab103" defval="${ins.aab103}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab602" >考试编号  :</label>
                        <e:text styleClass="form-control" id="aab602" name="aab602" defval="${ins.aab602}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab702" >客观题成绩  :</label>
                        <e:text styleClass="form-control" id="aab702" name="aab702" defval="${ins.aab702}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab703" >主观题成绩  :</label>
                        <e:text styleClass="form-control" id="aab703" name="aab703" defval="${ins.aab703}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab704" >成绩评价  :</label>
                        <e:select styleClass="form-control" value="A:A,B:B,C:C,D:D,E:E" id="aab704" name="aab704" defval="${ins.aab704}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab705" >教师评语  :</label>
                        <e:textarea cols="30" rows="6" styleClass="form-control" id="aab705" name="aab705" defval="${ins.aab705}" />
                      </div>
                      <div class="form-group" align="center">
                      <button type="submit" class="btn btn-success mr-2" formaction="<%=path%>/EC0301${empty param.aab701?'Add':'Modify' }Score.html?aab701=${param.aab701 }">${empty param.aab701?'添加':'修改'}</button>
                      <button type="submit" class="btn btn-light" name="next" formaction="<%=path%>/EC0301QueryScore.html"
                       formnovalidate="formnovalidate">返回</button>
                      </div>
                  </div>
                </div>
              </div>
</form>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>