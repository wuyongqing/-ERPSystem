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
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'来访登记管理')}">
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
	var count=0;
	function onSelect(vstate)
	{
		vstate?count++:count--;
		document.getElementById("del").disabled=(count==0);
	}
	
	function onCheck(vaaf401)
	{
		var form = document.getElementById("myform");
			form.action="<%=path%>/EA0901FindById.html?aaf401="+vaaf401;
			form.submit();
	}
	
	function onDel(vaaf401)
	{
		var form = document.getElementById("myform");
			form.action="<%=path%>/EA0901DeleteById.html?aaf401="+vaaf401;
			form.submit();
	}
</script>

</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
      <div class="card" style="max-width: 100%; " align="center">
           <div class="card-body" style="max-width:100%" align="center">
			<form id="myform" action="<%=path %>/EA0901Query.html" method="post">
				<h4 align="center">来访登记记录</h4>
				<table class="table-bordered" border=1 width="100%" align="center">
					<tr>
						<td colspan="4">
						查询条件
						</td>
					</tr>
					<tr>
						<td>访客姓名</td>
						<td><e:text styleClass="form-control" style="width:100%" name="qaaf402"/></td>
						<td>单位</td>
						<td><e:text styleClass="form-control" style="width:100%" name="qaaf407"/></td>
					</tr>
					<tr>
						<td>来访时间:起始</td>
						<td>
						<input class="form-control" style="width:100%" type="datetime-local" id="baaf403" name="baaf403" 
							   value="${param.baaf403 }">
						</td>
						<td>来访时间:结束</td>
						<td>
						<input class="form-control" style="width:100%" type="datetime-local" id="eaaf403" name="eaaf403"
							   value="${param.eaaf403 }">
						</td>
					</tr>
					<tr>
						<td>结束时间:起始</td>
						<td>
						<input class="form-control" style="width:100%" type="datetime-local" id="baaf403" name="baaf404"
							   value="${param.baaf404 }">
						</td>
						<td>结束时间:结束</td>
						<td>
						<input class="form-control" style="width:100%" type="datetime-local" id="eaaf403" name="eaaf404"
							   value="${param.eaaf404 }">
						</td>
					</tr>
				</table>
				<table class="table-bordered" id="t_visitor" border=1 width="100%" align="center">
					<tr>
			  			<td style="width:20px"></td>
			  			<td style="width:25px">序号</td>
			  			<td>访客姓名</td>
			  			<td style="width:80px">访客单位</td>
			  			<td>来访时间</td>
			  			<td>结束时间</td>
			  			<td>记录人</td>
			  			<td colspan="${sessionScope.role==3?'2':'1' }">功能区</td>
			 	    </tr>
					<c:choose>
			  			<c:when test="${rows!=null }">
					  		<c:forEach items="${rows }" var="ins" varStatus="vs">
						  		<tr>
						  			<td style="width:20px">
						  			<input type="checkbox" name="idlist" value="${ins.aaf401 }"
			  							   onclick="onSelect(this.checked)" >
		  							</td>
						  			<td style="width:25px">${vs.count }</td>
						  			<td>${ins.aaf402 }</td>
						  			<td style="width:80px">${ins.aaf407 }</td>
						  			<td>${ins.aaf403 }</td>
						  			<td>${ins.aaf404 }</td>
						  			<td>${ins.aae102 }</td>
						  			<td>
						  				<button class="btn btn-primary mr-2" onclick="onCheck('${ins.aaf401}')">查看</button>
						  			</td>
						  			<c:if test="${sessionScope.role==3 }">
						  			<td>
						  				<button class="btn btn-danger mr-2" onclick="onDel('${ins.aaf401}')">删除</button>
						  			</td>
						  			</c:if>
						  			
						  		</tr>
					  		</c:forEach>
				  		<c:forEach begin="${fn:length(rows)+1 }" step="1" end="${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10): (fn:length(rows))}">
				  		<tr>
				    		<td style="width:20px"></td>
				    		<td style="width:25px"></td>
				    		<td></td>
				   		    <td style="width:80px"></td>
				   		    <td></td>
				  		    <td></td>
				  		    <td></td>
				  		    <td colspan="${sessionScope.role==3?'2':'1' }"></td>
				 	    </tr>
				  		</c:forEach>
				  		</c:when>
			  		<c:otherwise>
			  		<c:forEach begin="1" step="1" end="10">
			  		<tr>
			  		    <td style="width:20px"></td>
			    		<td style="width:25px"></td>
			    		<td></td>
			   		    <td style="width:80px"></td>
			   		    <td></td>
			  		    <td></td>
			  		    <td></td>
			  		    <td colspan="${sessionScope.role==3?'2':'1' }"></td>
			 	    </tr>
			 	    </c:forEach>
			  	</c:otherwise>
			  </c:choose>
				</table>
				<div class="form-group" align="center" style="margin-top:15px">
				<div class="gridItem" style="padding: 5px; width: 40%; float: left; text-align: right; height: 20px; font-size: 15px;" > 
					共有 <span id="spanTotalInfor"></span> 条记录     
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
		        </div>
		<script type="text/javascript">
		var theTable = document.getElementById("t_visitor");
		var txtValue = document.getElementById("Text1").value;
		var numberRowsInTable = ${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows))};
		var colunm = ${fn:length(rows)};
		</script>
		<script type="text/javascript" src="<%=path %>/js/Pagging.js" charset="GBK"></script> 
		
				<div style="width:100%;margin-top: 25px;float:left" align="center" >
					<div class="form-group" align="center" >
						<button class="btn btn-primary mr-2" type="submit" type="submit" name="next">查询</button>
						<button class="btn btn-success mr-2" type="submit" type="submit" name="next"
							   formaction="<%=path %>/addVisitor.jsp">添加</button>
						<c:if test="${sessionScope.role.equals('3') }">
						<button class="btn btn-danger mr-2" type="submit" type="submit" id="del" name="next" disabled="disabled"
							   formaction="<%=path %>/EA0901Delete.html">删除</button>
						</c:if>
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