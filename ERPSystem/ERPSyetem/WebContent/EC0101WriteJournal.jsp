<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'教学日志编写')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>教学日志${empty param.aac101?'添加':'修改' }</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head>
<body>
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" class="forms-sample" action="<%=path%>/EC0101WriteJournal.html" method="post">
<div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
      				<h4 align="center">教学日志${empty param.aac101?'添加':'修改' }</h4>
      				  <div class="form-group" align="left">
      				    <label for="aae103" >教师编号  :</label>
       					<e:text styleClass="form-control" id="aae103" name="aae103" required="true"   defval="${ sessionScope.user}"/>
       				  </div> 
       				  <div class="form-group" align="left">
      				    <label for="aac102" >日期  :</label>
       					<e:date styleClass="form-control" id="aac102" name="aac102" required="true"   defval="${ins.aac102 }"/>
       				  </div>
       				  <div class="form-group" align="left">
      				    <label for="aac103" >正文  :</label>
       					<e:textarea cols="30" rows="6" styleClass="form-control" id="aac103" name="aac103" required="true"   defval="${ins.aac103 }"/>
       				  </div>
       				  <div class="form-group" align="left">
      				    <label for="aac105" >备注  :</label>
       					<e:textarea cols="30" rows="3" styleClass="form-control" id="aac105" name="aac105"    defval="${ins.aac105 }"/>
       				  </div> 
     				  <div class="form-group" align="center">
       				  <button type="submit" class="btn btn-success mr-2" formaction="<%=path%>/EC0101${empty param.aac101?'Write':'Modify' }Journal.html?aac101=${param.aac101 }" >${empty param.aac101?'添加':'修改' }</button>	
       				  <button type="submit" class="btn btn-light" name="next" formaction="<%=path%>/EC0101QueryJournal.html"
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