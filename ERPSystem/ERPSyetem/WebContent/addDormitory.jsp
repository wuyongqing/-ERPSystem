<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>Insert title here</title>
<%  String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'宿舍信息管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form id="myform" class="forms-sample" action="<%=path %>/EA1001Add.html" method="post">
	<e:hidden name="aab1101"/>
	<e:hidden name="qaab1102"/>
	<e:hidden name="qaab1103"/>
	<e:hidden name="qaab1104"/>
	<e:hidden name="qaab1105"/>
	<div class="col-10 grid-margin stretch-card" >
		<div class="card" style="width:60%;"align="center">
        	<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">
				宿舍信息${empty param.aab1101?'添加':'修改' }
				</h4>
				<div class="form-group" align="left">
					<label for="aab1102" >房间号</label>
					<e:text styleClass="form-control" name="aab1102" defval="${ins.aab1102}" maxlength="3" required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aab1103" >楼号</label>
					<e:text styleClass="form-control" name="aab1103" defval="${ins.aab1103}" maxlength="1" required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aab1104" >床位数</label>
					<e:number styleClass="form-control" onchange="if(value.length>2)value=value.slice(0,2)"
					 step="1" name="aab1104" defval="${ins.aab1104 }" required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aab1105" >已住人数</label>
					<e:text styleClass="form-control" name="aab1105" defval="${empty param.aab1101?'0':ins.aab1105 }"
					        required="true" readonly="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aab1107" >费用</label>
					<e:number styleClass="form-control" step="0.01" name="aab1107" defval="${ins.aab1107 }" required="true"/>
				</div>
				<div class="form-group" align="left">
					<label for="aab1106" >备注</label>
					<e:textarea styleClass="form-control" rows="10" cols="50" name="aab1106" defval="${ins.aab1106 }"/>
				</div>
				<div class="form-group" align="center">
					<button type="submit" name="next" class="btn btn-success mr-2"
						   formaction="<%=path %>/EA1001${empty param.aab1101?'Add':'Modify' }.html">${empty param.aab1101?'添加':'修改' }</button>
					<button type="submit" name="next" class="btn btn-secondary mr-2"
		    					formaction="<%=request.getContextPath() %>/EA1001Query.html" 
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