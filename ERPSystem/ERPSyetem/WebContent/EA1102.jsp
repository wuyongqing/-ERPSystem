<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'日志批阅')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>日志查看</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
<style type="text/css">
  msg{
     color:#FF0000
  }
</style>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form class="form-sample"  action="<%=path%>/EA1104.html" method="post">
	<div class="col-10 grid-margin stretch-card" >
		<div class="card" style="width:60%;"align="center">
			<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">教学日志</h4>
	   			<div class="form-group" align="left">  
	     			<label for="aae102" >员工姓名</label>
	     			<e:text styleClass="form-control" name="aae102" readonly="true" defval="${ins.aae102 }"/> 
	    		</div>
	   			<div class="form-group" align="left">  
	     			<label for="aae103" >员工编号</label>
	     			<e:text styleClass="form-control" name="aae103" readonly="true"  defval="${ins.aae103 }"/> 
	    		</div>
	    		<div class="form-group" align="left">  
	     			<label for="aac102" >日期</label>
	     			<e:text styleClass="form-control" name="aac102" readonly="true"  defval="${ins.aac102 }"/>
	    		</div>
	    		<div class="form-group" align="left">  
	      			<label for="aac103" >正文</label>
	      			<e:textarea styleClass="form-control" rows="5" cols="45" name="aac103" 
	      			readonly="true" defval="${ins.aac103 }"/>
	    		</div>
	    		<div class="form-group" align="left">  
	      			<label for="aac105" >备注(可批注)</label>
	      			<e:textarea styleClass="form-control" rows="5" cols="45" name="aac105" 
	      			defval="${ins.aac105 }"/>
	   			</div>
	     		<div class="form-group" align="center">  
	       			<button class="btn btn-success mr-2" type="submit" name="next" 
	              	formaction="<%=path%>/EA1104.html">修改</button>
	       			<button class="btn btn-secondary mr-2" type="submit" name="next" 
	              	formaction="<%=path%>/EA1101.html"
	              	formnovalidate="formnovalidate">返回</button>
				</div>
				<input type="hidden" name="aac101" value="${ins.aac101 }">
				<e:hidden name="qaae102"/>
				<e:hidden name="qaae103"/>
				<e:hidden name="qaae104"/>
				<e:hidden name="baac102"/>
				<e:hidden name="eaac102"/>
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