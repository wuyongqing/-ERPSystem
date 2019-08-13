<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath(); 
	String userCode=(String)request.getSession().getAttribute("numb");
%>
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
<title>教研成果管理</title>
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
      function onRequestToLook(vaac1001)
      {
    	  var vform=document.getElementById("myform");
    	  vform.action="<%=path%>/EC1201RequestToLook.html?uaac1001="+vaac1001;
  		  vform.submit();
      }
      function onEdit(vaac1001)
      {
    	  var vform=document.getElementById("myform");
    	  vform.action="<%=path%>/EC1201FindByIdResult.html?uaac1001="+vaac1001;
  		  vform.submit();
      }
   </script>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
	<div class="card" style="max-width: 100%; " align="center">
		<div class="card-body" style="max-width:100%" align="center">
<form id="myform" action="<%=path%>/EC1201QueryResult.html" method="post">
<h5>教研成果管理</h5>
	<table class="table-bordered" border="1" width="100%" align="center">
	  <tr>
	    <td colspan="8">查询条件</td>
	  </tr>
	  <tr>
	   <td>提交人编号</td>
	    <td>
	      <e:text styleClass="form-control" name="qaae103" style="width:100%"/>
	    </td>
	    <td>提交人姓名</td>
	    <td>
	      <e:text styleClass="form-control" name="qaae102" style="width:100%"/>
	    </td>
	    
		<td rowspan="2">权限</td>
		<td rowspan="2">
			<e:select styleClass="form-control" value="无权限:1,已授权:2,正在审核:3" header="true" name="qaac203"/>
		</td>
	  </tr>
		<tr>
		<td>开始时间</td>
	    <td>
	      <e:date styleClass="form-control" name="baac1002"  style="margin-right:30px;width:100%;"/>
	    </td>
	    <td>结束时间</td>
	    <td>
	      <e:date styleClass="form-control" name="eaac1002"  style="margin-right:30px;width:100%;" />
	    </td>
		</tr>
	</table>
<table id="planlist" class="table-bordered" border="1" width="100%" align="center">
	  <tr>
	    <td>序号</td>
	    <td>名称</td>
	    <td>提交时间</td>
	    <td>提交人</td>
	    <td>功能区</td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>${ins.aac1005}</td>
				    <td>${ins.aac1002}</td>
				    <td>${ins.aae102}</td>
				    <td>
				    <!-- #  空锚 -->
				    <c:if test="${ins.fakeaac203==1 }">
				    	<button class="btn btn-danger mr-2" onclick="onRequestToLook('${ins.thisaac1001}')">申请查看</button>
				    </c:if>
				    <c:if test="${ins.fakeaac203==2 }">
				      	<button class="btn btn-primary mr-2" onclick="onEdit('${ins.thisaac1001}')">查看</button>
				    </c:if>
				    <c:if test="${ins.fakeaac203==3 }">
				    	正在审核
				    </c:if>
				    </td>
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
	
	<!-- 功能按钮区 -->
	<div style="width:100%;margin-top: 25px;float:left" align="center" >
			<div class="form-group" align="center" >
	       <button class="btn btn-primary mr-2" type="submit" name="next">查询</button>
	       <button class="btn btn-success mr-2" type="submit" name="next" 
	              formaction="<%=path%>/addResultEC1201.jsp">添加成果</button>
	    </div>
	</div>
	</form>
	</div>
	</div>
	</div>
	<script type="text/javascript">
            var theTable = document.getElementById("planlist");
            var txtValue = document.getElementById("Text1").value;
            var numberRowsInTable = ${(fn:length(rows)%10>0)?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows)) };//表格最大行数
            var colunm=${fn:length(rows) };
    </script>
    <script type="text/javascript" src="js/Pagging.js"></script>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>