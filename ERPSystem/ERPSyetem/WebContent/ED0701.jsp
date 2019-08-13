<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'奖惩处理记录')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>${empty param.aab801?'添加':'修改' }奖惩处理记录</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form class="form-sample"   action="<%=path%>/ED0701.html" method="post">
	<input type="hidden" name="aae101" value="${sessionScope.user }">
	<div class="col-10 grid-margin stretch-card" >
		<div class="card" style="width:60%;"align="center">
			<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">${empty param.aab801?'添加':'修改' }奖惩记录</h4>
				<div class="form-group" align="left">
					<label for="aab102">学生姓名</label>
					<e:text styleClass="form-control" name="aab102" 
					readonly="${not empty param.aab801 }" 
					required="true" defval="${ins.aab102 }"/>
				</div>
				<div class="form-group" align="left">
		     		<label for="aab103">学号</label>
		     		<e:text styleClass="form-control" name="aab103" 
		     		readonly="${not empty param.aab801 }" 
		       		required="true" maxlength="13" defval="${ins.aab103 }"/> 
		   		</div>
		   		<div class="form-group" align="left">
		     		<label for="aab802">奖惩性质</label>
		     		<e:select styleClass="form-control" name="aab802" 
		     		value="奖励:奖,惩罚:惩" 
		       		required="true" defval="${ins.aab802 }"/>
		   		</div>
		   		<div class="form-group" align="left">
		   			<label for="aab803">奖惩内容</label>
		   			<e:text styleClass="form-control" name="aab803" 
		   			required="true" defval="${ins.aab803 }"/>
		   		</div>
		   		<div class="form-group" align="left">
		   			<label for="aab805">奖惩日期</label>
		   			<e:date styleClass="form-control" name="aab805" 
		   			required="true" defval="${ins.aab805 }"/>
		   		</div>
		   		<div class="form-group" align="left">
		   			<label for="aab805">奖惩原因详述</label>
		   			<e:textarea styleClass="form-control" name="aab804" required="true" 
		   			rows="5" cols="45" defval="${ins.aab804 }"/>
		   		</div>
			   	<div class="form-group" align="center">
			       	<button class="btn btn-success mr-2" type="submit" name="next" 
			        formaction="<%=path%>/${empty param.aab801?'ED0701':'ED0705' }.html">
			        ${empty param.aab801?'提交':'修改' }</button>
				    <button class="btn btn-secondary mr-2" type="submit" name="next" 
				    formaction="<%=path%>/ED0702.html"
				    formnovalidate="formnovalidate">返回</button>
				</div>
				<input type="hidden" name="aab801" value="${param.aab801 }">
				<e:hidden name="qaab102"/>
				<e:hidden name="qaab103"/>
				<e:hidden name="qaab802"/>
				<e:hidden name="qaab804"/>
				<e:hidden name="baab805"/>
				<e:hidden name="eaab805"/>
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