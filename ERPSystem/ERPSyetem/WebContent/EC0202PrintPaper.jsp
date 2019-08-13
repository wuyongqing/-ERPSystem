<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'试卷生成')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>打印预览</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
<style type="text/css">
     tr
     {
        height:38px;
        font-size:15;
     }
     td
     {
         text-align:center;
         width:50px;
         height:38px;
     }
</style>
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
      <div class="card" style="max-width: 100%; " align="center">
           <div class="card-body" style="max-width:100%" align="center">
<form action="<%=path %>/EC0202PrintPaper.html" method="post">

	
	<table id="planlist" class="table-bordered" border="1" align="center" width="65%">	
		<tr>
		<td style="width:5%">序号</td>
	    <td>题目</td>
	  </tr>	     
         <!-- 显示实际查询到的数据 -->
         <c:choose>
         <c:when test="${rows!=null }">
         	  <tr>
	    	  	<td colspan="5">客观题</td>
	 		  </tr>

	      <c:forEach items="${rows }" var="ins" varStatus="vs">
    	   	  <tr>
    	   	  <input type="hidden" name="idlist" value="${ins.aaf501 }">
			    <td>${vs.count }</td>
			    <td>${ins.aaf504 }</td>
			  </tr>
			  <c:if test="${vs.count=='10' }">
			  <tr>
			  <td colspan="5">主观题</td>
		  	  </tr>
		  	  </c:if>
		  </c:forEach>
	      <!-- 补充空行 -->
	      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="20">
		          <tr>
		            <td></td>
		            <td></td>		            
		          </tr>
	      </c:forEach>
	    </c:when>
	    <c:otherwise>
	        <c:forEach begin="1" step="1" end="20">
	           <tr>
	             <td></td>
	             <td></td>
	           </tr>
	        </c:forEach>
        </c:otherwise>
        </c:choose>
	</table>
</form>
</div>
</div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>