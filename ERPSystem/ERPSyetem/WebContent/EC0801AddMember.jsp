<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'课题组设定')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>课题组设定</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" class="forms-sample" action="<%=path%>/EC0801AddMember.html" method="post">
<div class="col-10 grid-margin stretch-card" >
                <div class="card" style="width:60%;"align="center">
                  <div class="card-body" style="width:60%;" align="center">
       				<h4 align="center">成员信息${empty param.aac801?'':'修改' }</h4>
      				  <div class="form-group" align="left">
                        <label for="aac702" >课题编号  :</label>
                        <e:text styleClass="form-control" id="aac702" name="aac702" defval="${ins.aac702}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aae102" >组员姓名  :</label>
                        <e:text styleClass="form-control" id="aae102" name="aae102" defval="${ins.aae102}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aae103" >组员编号  :</label>
                        <e:text styleClass="form-control" id="aae103" name="aae103" defval="${ins.aae103}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aac802" >职务  :</label>
                        <e:select styleClass="form-control" value="组长:1,组员:2" id="aac802" name="aac802" defval="${ins.aac802}" />
                      </div>
                      <div class="form-group" align="center">
                      <button type="submit" class="btn btn-success mr-2" formaction="<%=path%>/EC0801${empty param.aac801?'Add':'Modify' }Member.html?aac801=${param.aac801 }">${empty param.aac801?'添加':'修改'}</button>
                      <button type="submit" class="btn btn-secondary mr-2" name="next" formaction="<%=path%>/EC0801QueryMember.html"
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