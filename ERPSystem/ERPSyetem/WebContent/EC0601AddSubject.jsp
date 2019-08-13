<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'课题立项')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>课题立项</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" class="forms-sample" action="<%=path%>/EC0601AddSubject.html" method="post">
<div class="col-10 grid-margin stretch-card" >
                <div class="card" style="width:60%;"align="center">
                  <div class="card-body" style="width:60%;" align="center">
       				<h4 align="center">课题${empty param.aac701?'立项':'修改' }</h4>
      				  <div class="form-group" align="left">
                        <label for="aae103" >负责人编号  :</label>
                        <e:text styleClass="form-control" id="aae103" name="aae103"  defval="${ins.aae103}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aac703" >课题名称  :</label>
                        <e:text styleClass="form-control" id="aac703" name="aac703"  defval="${ins.aac703}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aac704" >开始日期  :</label>
                        <e:date styleClass="form-control" id="aac704" name="aac704"  defval="${ins.aac704}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aac706" >课题内容  :</label>
                        <e:textarea cols="30" rows="6" styleClass="form-control" id="aac706" name="aac706"  defval="${ins.aac706}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aac707" >备注  :</label>
                        <e:textarea cols="30" rows="6" styleClass="form-control" id="aac707" name="aac707"  defval="${ins.aac707}" />
                      </div>
                      <div class="form-group" align="center">
                      <button type="submit" class="btn btn-success mr-2" formaction="<%=path%>/EC0601${empty param.aac701?'Add':'Modify' }Subject.html?aac701=${param.aac701 }">${empty param.aac701?'添加':'修改'}</button>
                      <button type="submit" class="btn btn-secondary mr-2" name="next" formaction="<%=path%>/EC0601QuerySubject.html"
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