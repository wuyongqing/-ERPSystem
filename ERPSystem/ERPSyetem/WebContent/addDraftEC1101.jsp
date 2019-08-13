<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'教研底稿管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>教研底稿管理</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" class="forms-sample" action="<%=path%>/EC1101AddDraft.html" method="post">
<div class="col-10 grid-margin stretch-card" >
                <div class="card" style="width:60%;"align="center">
                  <div class="card-body" style="width:60%;" align="center">
                    <h4 align="center">教研底稿${empty param.aac901?'添加':'修改'}</h4>
                    <c:if test="${!empty param.aac901}">
                      <div class="form-group" align="left">
                        <label for="aac901" >底稿编号  :</label>
                        <e:text styleClass="form-control" id="aac901" name="aac901" readonly="readonly" defval="${ins.aac901}" />
                      </div>
                    </c:if>  
                      <div class="form-group" align="left">
                        <label for="aac904">底稿名称 :</label>
                        <e:text styleClass="form-control" maxlength="10" id="aac904" name="aac904"  required="required" defval="${ins.aac904}"/>
                      </div>
                      <div class="form-group" align="left">
                        <label for="aae103">教师编号 :</label>
                        <e:text styleClass="form-control" id="aae103" name="aae103" readonly="true" required="required" defval="${sessionScope.numb}"/>
                      </div>
                      <div class="form-group" align="left">
                        <label for="aae102">教师姓名 :</label>
                        <e:text styleClass="form-control" id="aae102" name="aae102" readonly="true" required="required" defval="${sessionScope.name }"/>
                      </div>
                      <c:if test="${!empty param.aac901 }">
                      <div class="form-group" align="left">
                        <label for="aac902">上次提交时间  :</label>
                        <e:text styleClass="form-control" id="aac902" name="aac902" readonly="true" defval="${ins.aac902}" />
                      </div>
                      </c:if>
                      <div class="form-group" align="left">
                        <label for="aac903">底稿内容</label>
                        <e:textarea styleClass ="form-control" id="aac903" name="aac903" cols="30" rows="6" defval="${ins.aac903 }"/>
                      </div>
                      <div class="form-group" align="center">
                      <button type="submit" class="btn btn-success mr-2" formaction="<%=path%>/EC1101${empty param.aac901?'Add':'Modify' }Draft.html">${empty param.aac901?'添加':'修改'}</button>
                      <button type="submit" class="btn btn-secondary mr-2" name="next" formaction="<%=path%>/EC1101QueryDraft.html"
                       formnovalidate="formnovalidate">返回</button>
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