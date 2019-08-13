<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>Insert title here</title>
<% String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'宿舍信息管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
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
<script type="text/javascript">
function onDel(vaab1001)
{
	var form = document.getElementById("myform");
	form.action="<%=path%>/EA1002DeleteById.html?aab1001="+vaab1001;
	form.submit();
}
</script>

</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
      <div class="card" style="max-width: 100%; " align="center">
           <div class="card-body" style="max-width:100%" align="center">
			<form id="myform" action="<%=path %>/EA1001Query.html" method="post">
				<e:hidden name="aab1101"/>
				<e:hidden name="qaab1102"/>
				<e:hidden name="qaab1103"/>
				<e:hidden name="qaab1104"/>
				<e:hidden name="qaab1105"/>
				<h4 align="center">题库管理</h4>
				<table class="table-bordered" border=1 width="100%" align="center">
					<tr>
						<td>房间号</td>
						<td><e:text styleClass="form-control" style="width:100%" name="aab1102" defval="${ins.aab1102 }" readonly="true"/>
						</td>
						<td>宿舍楼号</td>
						<td><e:text styleClass="form-control" style="width:100%" name="aab1103" defval="${ins.aab1103 }" readonly="true"/>
						</td>
					</tr>
					<tr>
						<td>床位数</td>
						<td><e:text styleClass="form-control" style="width:100%" name="aab1104" defval="${ins.aab1104 }" readonly="true"/>
						</td>
						<td></td>
						<td></td>
					</tr>
				</table>
				<table class="table-bordered" border=1 width="100%" align="center">
					<tr>
						<td>序号</td>
						<td>学生姓名</td>
						<td>学生学号</td>
						<td>身份证</td>
						<td>电话</td>
						<td>邮箱</td>
						<td>功能区</td>
					</tr>
					<c:choose>
				  		<c:when test="${rows!=null }">
				  		<c:forEach items="${rows }" var="rins" varStatus="vs">
				  		<tr>
				    		<td>${vs.count }</td>
				  			<td>${rins.aab102 }</td>
				  			<td>${rins.aab103 }</td>
				  		    <td>${rins.aab104 }</td>
				  		    <td>${rins.aab109 }</td>
				  		    <td>${rins.aab110 }</td>
				  		    <td>
				  		    	<button class="btn btn-danger mr-2" onclick="onDel('${rins.aab1001}')">删除</button>
				  		    </td>
				 	    </tr>
				  		</c:forEach>
				  		<c:forEach begin="${fn:length(rows)+1 }" step="1" end="${ins.aab1104 }">
				  		<tr>
				    		<td></td>
				    		<td></td>
				    		<td></td>
				   		    <td></td>
				   		    <td></td>
				  		    <td></td>
				  		    <td></td>
				 	    </tr>
				  		</c:forEach>
				  		</c:when>
				  		<c:otherwise>
				  		<c:forEach begin="1" step="1" end="${ins.aab1104 }">
				  		<tr>
				  		    <td></td>
				    		<td></td>
				    		<td></td>
				   		    <td></td>
				   		    <td></td>
				  		    <td></td>
				  		    <td></td>
				 	    </tr>
				 	    </c:forEach>
				  		</c:otherwise>
				  		</c:choose>
				</table>
				<div style="width:100%;margin-top: 25px;float:left" align="center" >
					<div class="form-group" align="center" >
					<button class="btn btn-secondary mr-2" type="submit" name="next"
			   					formaction="<%=request.getContextPath() %>/EA1001Query.html" formnovalidate="formnovalidate">
			   					返回</button>
				</div>
				</div>
			</form>
			</div>
			</div>
			</div>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>