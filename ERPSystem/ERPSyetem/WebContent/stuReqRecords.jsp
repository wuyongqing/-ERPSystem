<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'退、休、复学申请')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>退、休、复学申请记录</title>
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
	function onCancel(vaab201)
	{
		if(confirm("确定要取消此条申请吗"))
		{
			var vform = document.getElementById("stuReq-records-form");
		  	vform.action="<%=path%>/delRecordsById.html?aab201="+vaab201;
		  	vform.submit();
		}
	}
</script>

</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
	<div class="card" style="max-width: 100%; " align="center">
		<div class="card-body" style="max-width:100%" align="center">
			<form id="stuReq-records-form" action="<%=path%>/stuReqRecords.html" method="post">
			<input type="hidden" name="aae101" value="${sessionScope.user }">
	 		<h4 align="center">退、休、复学申请记录</h4>
			<table class="table-bordered" id="table-req-records" border="1" width="100%" align="center">
				<tr>
				    <td>序号</td>
				    <td>姓名</td>
				    <td>学号</td>
				    <td>原状态</td>
				    <td>申请类型</td>
				    <td>开始日期</td>
				    <td>提交日期</td>
				    <td>审批状态</td>
				    <td></td>
			  	</tr>
			  	
			  	<c:choose>
			     <c:when test="${rows!=null }">
			         <!-- 显示实际查询到的数据 -->
				     <c:forEach items="${rows }" var="ins" varStatus="vs">
			    	   	  <tr>
						    <td>${vs.count }</td>
						    <td>${ins.aab102 }</td>
						    <td>${ins.aab103 }</td>
						    <td>
							    <c:choose>
								    <c:when test="${ins.aab202==1 }">在学</c:when>
								    <c:when test="${ins.aab202==2 }">休学</c:when>
								</c:choose>
							</td>
						    <td>
							    <c:choose>
								    <c:when test="${ins.aab203==1 }">在学</c:when>
								    <c:when test="${ins.aab203==2 }">休学</c:when>
								    <c:when test="${ins.aab203==3 }">退学</c:when>
								</c:choose>
							</td>
						    <td>${ins.aab205 }</td>
						    <td>${ins.aab206 }</td>
						    <td>
							    <c:choose>
								    <c:when test="${ins.aab207==1 }">未审批</c:when>
								    <c:when test="${ins.aab207==2 }">已同意</c:when>
								    <c:when test="${ins.aab207==3 }">已驳回</c:when>
								</c:choose>
							</td>
						    <td>
						    <c:choose>
							    <c:when test="${ins.aab207==1 }">
							        <button class="btn btn-danger mr-2" 
							         onclick="onCancel('${ins.aab201}')">取消</button>
							    </c:when>
							    <c:otherwise>
							    	不能修改
							    </c:otherwise>
							</c:choose>
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
		    	<button class="btn btn-success mr-2" type="submit" name="next" 
		        	formaction="<%=path%>/stuStatusReq.jsp">添加</button>
			</div>
		</div>

 
    <script type="text/javascript">
            var theTable = document.getElementById("table-req-records");
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