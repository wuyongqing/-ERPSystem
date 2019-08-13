<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'证书发放记录')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>证书${empty param.aab1301?'发放':'修改' }</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form class="form-sample" action="<%=path%>/ED0601.html" method="post">
	<input type="hidden" name="aae101" value="${sessionScope.user }">
	<div class="col-10 grid-margin stretch-card" >
		<div class="card" style="width:60%;"align="center">
			<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">证书${empty param.aab1301?'发放':'修改' }</h4>
				<div class="form-group" align="left"> 
					<label for="aab102">学生姓名</label>
					<e:text styleClass="form-control" name="aab102" 
					readonly="${not empty param.aab1301 }" 
					required="true" defval="${ins.aab102 }"/>
				</div>	
				<div class="form-group" align="left"> 
		     		<label for="aab103">学号</label>
		     		<e:text styleClass="form-control" name="aab103" 
		     		readonly="${not empty param.aab1301 }" 
		       		required="true" maxlength="13" defval="${ins.aab103 }"/> 
		   		</div>	
		   		<div class="form-group" align="left"> 
		     		<label for="aab1302">证书名称</label>
		     		<e:text styleClass="form-control" name="aab1302" 
		     		required="true" defval="${ins.aab1302 }"/>
		   		</div>	
		   		<div class="form-group" align="left"> 
		   			<label for="aab1303">发放时间</label>
		   			<e:date styleClass="form-control" name="aab1303" 
		   			required="true" defval="${ins.aab1303 }"/>
		   		</div>	
		   		<div class="form-group" align="left"> 
		     		<label for="aab1304">发放单位</label>
		     		<e:text styleClass="form-control" name="aab1304" required="true" defval="${ins.aab1304 }"/>
		   		</div>	
		   		<div class="form-group" align="left"> 
		   			<label for="aab1304">发放原因详述</label>
		   			<e:textarea styleClass="form-control" name="aab1305" required="true" 
		   			rows="5" cols="45" defval="${ins.aab1305 }"/>
		   		</div>	
			    <div class="form-group" align="center"> 
			       	<button class="btn btn-success mr-2" type="submit" name="next" 
			        formaction="<%=path%>/${empty param.aab1301?'ED0601':'ED0605' }.html">
			        ${empty param.aab1301?'提交':'修改' }</button>
				    <button class="btn btn-secondary mr-2" type="submit" name="next" 
				    formaction="<%=path%>/ED0602.html"
				    formnovalidate="formnovalidate">返回</button>
			   	</div>	
<input type="hidden" name="aab1301" value="${param.aab1301 }">
<e:hidden name="qaab102"/>
<e:hidden name="qaab103"/>
<e:hidden name="qaab1302"/>
<e:hidden name="qaab1304"/>
<e:hidden name="baab1303"/>
<e:hidden name="eaab1303"/>
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