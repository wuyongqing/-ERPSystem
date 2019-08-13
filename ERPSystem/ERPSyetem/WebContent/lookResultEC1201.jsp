<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'教研成果管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>教研成果查看</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="margin-top: 10px">
     <h3 align="center">查看教研成果</h3>
</div>
<div style="width:100%" align="center">
<form class="form-sample"   id="store" action="<%=path %>/EC1201AddResult.html" enctype="multipart/form-data" method="post"> 
<input type="hidden" name="aae101" value="${ins.aae101 }">
<input type="hidden" name="thisaae101" value="${sessionScope.user }">
	<div class="col-10 grid-margin stretch-card" >
		<div class="card" style="width:60%;"align="center">
			<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">查看教研成果</h4>    
				<div class="form-group" align="left">  
					<label for="aae103">教师编号  :</label>
					<e:text styleClass="form-control" name="aae103" 
					readonly="${!ins.aae101.equals(sessionScope.user) }" 
					defval="${ins.aae103}" required="true"/>
		     	</div>
     			<div class="form-group" align="left">  
					<label for="aae102">教师姓名  :</label>
		     		<e:text styleClass="form-control" name="aae102" 
		     		readonly="${!ins.aae101.equals(sessionScope.user) }" 
		     		defval="${ins.aae102}" required="true" />
    		 	</div>
     			<div class="form-group" align="left">  
					<label for="aac1005">成果名称  :</label>
		     		<e:text styleClass="form-control" name="aac1005" 
		     		readonly="${!ins.aae101.equals(sessionScope.user) }" 
		     		defval="${ins.aac1005}" required="true"/>
     			</div>
     			<div class="form-group" align="left">  
      				<label for="aac1003">成果文件  :</label>
      				<input id="aac1003" type="hidden" name="aac1003" value="${ins.aac1003 }">
        			<c:url value="/DownLoadServlet" var="downurl">
            			<c:param name="filename" value="${ins.aac1003 }"></c:param>
            			<c:param name="owner-aae103" value="${ins.aae103 }"></c:param>
        			</c:url>
        			<a>${ins.realfilename }</a><a href="${downurl}">下载</a>
	 			</div>
     			<div class="form-group" align="left">  
					<label for="aac1004">备注 :</label>
     			</div>
     			<div class="form-group" align="left">  
		     		<e:textarea styleClass="form-control" name="aac1004" 
		     		readonly="${!ins.aae101.equals(sessionScope.user) }"
		      		defval="${ins.aac1004}"  cols="40" rows="10"/>
     			</div>
     			<div class="form-group" align="center">
	       			<button class="btn btn-success mr-2" type="submit" name="next">修改</button>
            		<button class="btn btn-secondary mr-2" type="submit" name="next" 
                	formaction="<%=path%>/EC1201QueryResult.html?aae101=${sessionScope.user }" 
                	formnovalidate="formnovalidate">返回</button>
     			</div>
			</div>
			<e:hidden name="qaae103"/>
			<e:hidden name="qaae102"/>
			<e:hidden name="baac1002"/>
			<e:hidden name="eaac1002"/>
			<e:hidden name="qaac203"/>
			<e:hidden name="aae101"/>
		</div>
	</div>
</form>
</div>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>