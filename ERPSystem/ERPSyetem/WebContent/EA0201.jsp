<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'转班申请审批')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>转班申请记录</title>
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
	function onDetails(vaab401)
	{
		var vform = document.getElementById("changeClass-records-form");
	  	vform.action="<%=path%>/EA0202.html?aab401="+vaab401;
	  	vform.submit();
	}
	
	function onAgree(vaab401)
	{
		if(confirm("确定要同意此条申请吗"))
		{
			var vform = document.getElementById("changeClass-records-form");
		  	vform.action="<%=path%>/EA0207.html?aab401="+vaab401;
		  	vform.submit();
		}
	}
	
	function onReject(vaab401)
	{
		if(confirm("确定要驳回此条申请吗"))
		{
			var vform = document.getElementById("changeClass-records-form");
		  	vform.action="<%=path%>/EA0208.html?aab401="+vaab401;
		  	vform.submit();
		}
	}
</script>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
	<div class="card" style="max-width: 100%; " align="center">
		<div class="card-body" style="max-width:100%" align="center">
<form id="changeClass-records-form" action="<%=path%>/EA0201.html" method="post">
	<h5>转班申请记录</h5>
	<table id="table-changeClass-records" class="table-bordered" border="1" width="100%" align="center">
		<tr>
		    <td>序号</td>
		    <td>姓名</td>
		    <td>学号</td>
		    <td>原班级编号</td>
		    <td>申请班级编号</td>
		    <td style="width:80px;">开始日期</td>
		    <td>提交日期</td>
		    <td>审批状态</td>
		    <td colspan="3">操作</td>
	  	</tr>
	  	
	  	<c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>${ins.aab102 }</td>
				    <td>${ins.aab103 }</td>
				    <td>${ins.faab303 }</td>
				    <td>${ins.saab303 }</td>
				    <td style="width:80px;">${ins.aab405 }</td>
				    <td>${ins.aab406 }</td>
				    <td>
				    <c:choose>
					    <c:when test="${ins.aab407==1 }">未审批</c:when>
					    <c:when test="${ins.aab407==2 }">已同意</c:when>
					    <c:when test="${ins.aab407==3 }">已驳回</c:when>
					</c:choose>
				    </td>
				    <td>
				    	<button class="btn btn-primary mr-2" onclick="onDetails('${ins.aab401}')">详情</button>
				    </td>
				    <c:choose>
					    <c:when test="${ins.aab407==1 }">
					    <td>
					        <button class="btn btn-success mr-2" onclick="onAgree('${ins.aab401}')">同意</button>
					    </td>
					    <td>
					        <button class="btn btn-danger mr-2" onclick="onReject('${ins.aab401}')">驳回</button>
					    </td>
					    </c:when>
					    <c:otherwise>
					    	<td colspan="2">已审批</td>
					    </c:otherwise>
					</c:choose>
				  </tr>
		      </c:forEach>
		      <!-- 补充空行 -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="${(fn:length(rows)%10>0)?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows)) }">
			          <tr>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td style="width:80px;"></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			          </tr>
		      </c:forEach>
	     </c:when>
	     <c:otherwise>
	        <c:forEach begin="1" step="1" end="10">
	           <tr>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td style="width:80px;"></td>
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

	<div class="gridItem" style="padding: 5px; width: 40%; float: left; text-align: right; height: 20px; font-size: 15px;" > 
	        共有 <span id="spanTotalInfor">${fn:length(rows) }</span> 条记录     
	        当前第<span id="spanPageNum"></span>页     
	        共<span id="spanTotalPage"></span>页
    </div>
    <div class="gridItem" style="margin-left:50px;width: 40%;  padding: 5px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">   
        <span id="spanFirst" >首页</span> 
        <span id="spanPre">上一页</span>
        <span id="spanInput" style="margin: 0px; padding: 0px 0px 4px 0px; height:100%; "> 
            第<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px" />页 
        </span>
        <span id="spanNext">下一页</span> 
        <span  id="spanLast">尾页</span> 
    </div>

	       		
	<div style="width:100%;margin-top: 25px;float:left" align="center" >
		<div class="form-group" align="center" >	  
       		<button class="btn btn-primary mr-2" type="submit" name="next">刷新</button>
		</div>
	</div>
    <script type="text/javascript">
        var theTable = document.getElementById("table-changeClass-records");
        var txtValue = document.getElementById("Text1").value;
        var numberRowsInTable = ${(fn:length(rows)%10>0)?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows)) };//表格最大行数
        var colunm=${fn:length(rows) };
    </script>
    <script type="text/javascript" src="js/Pagging.js"></script>
</form>
</div>
</div>
</div>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>