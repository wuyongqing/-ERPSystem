<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'考试管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>考试管理</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" class="forms-sample" action="<%=path%>/EC0201AddExam.html" method="post">
<div class="col-10 grid-margin stretch-card" >
                <div class="card" style="width:60%;"align="center">
                  <div class="card-body" style="width:60%;" align="center">
      				<h4 align="center">考试${empty param.aab601?'添加':'修改' }</h4>
      				  <div class="form-group" align="left">
                        <label for="aab303" >班级编号  :</label>
                        <e:text styleClass="form-control" id="aab303" name="aab303"  defval="${ins.aab303}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab603" >考试日期  :</label>
                        <e:date styleClass="form-control" id="aab603" name="aab603"  defval="${ins.aab603}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab604" >开始时间  :</label>
                        <e:text styleClass="form-control" id="aab604" name="aab604"  defval="${ins.aab604}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab605" >结束时间  :</label>
                        <e:text styleClass="form-control" id="aab605" name="aab605"  defval="${ins.aab605}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab606" >考试地点  :</label>
                        <e:text styleClass="form-control" id="aab606" name="aab606"  defval="${ins.aab606}" />
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab608" >备注  :</label>
                        <e:textarea cols="30" rows="6" styleClass="form-control" id="aab608" name="aab608"  defval="${ins.aab608}" />
                      </div>
                      <div class="form-group" align="center">
                      <button type="submit" class="btn btn-success mr-2" formaction="<%=path%>/EC0201${empty param.aab601?'Add':'Modify' }Exam.html?aab601=${param.aab601 }">${empty param.aab601?'添加':'修改'}</button>
                      <button type="submit" class="btn btn-secondary mr-2" name="next" formaction="<%=path%>/EC0201QueryExam.html"
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