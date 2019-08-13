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
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'班级管理')}">
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
</head><body style="background-color: #F5F5F5">	
<script type="text/javascript">
	var count=0;
	function onSelect(vstate)
	{
		vstate?count++:count--;
		document.getElementById("del").disabled=(count==0);
		document.getElementById("merge").disabled=(count<=1);
	}
	function onModify(vaab301)
	{
		var form = document.getElementById("myform");
		form.action="<%=path%>/EA0402FindById.html?aab301="+vaab301;
		form.submit();
	}
	
	function onDel(vaab301)
	{
		var form = document.getElementById("myform");
		form.action="<%=path%>/EA0301DeleteById.html?aab301="+vaab301;
		form.submit();
	}

</script>

<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

	<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
      <div class="card" style="max-width: 100%; " align="center">
           <div class="card-body" style="max-width:100%" align="center">
				<form id="myform" action="<%=path %>/EA0301Query.html" method="post">
					<h4 align="center">班级管理</h4>
					<table class="table-bordered" border=1 width="100%" align="center">
						<tr>
							<td colspan="4">
							查询条件
							</td>
						</tr>
						<tr>
							<td>班级名称</td>
							<td>
								<e:text styleClass="form-control" style="width:100%" name="qaab302"/>
							</td>
							<td>班级编号</td>
							<td>
								<e:text styleClass="form-control" style="width:100%" name="qaab303"/>
							</td>
						</tr>
						<tr>
							<td>教师</td>
							<td>
								<e:text styleClass="form-control" style="width:100%" name="qteacher"/>
							</td>
							<td>班主任</td>
							<td>
								<e:text styleClass="form-control" style="width:100%" name="qheadmaster"/>
							</td>
						</tr>
						<tr>
							<td>课程名称</td>
							<td>
								<e:text styleClass="form-control" style="width:100%" name="qcourse"/>
							</td>
							<td>教室</td>
							<td>
								<e:text styleClass="form-control" style="width:100%" name="qaab3011"/>
							</td>
						</tr>
						<tr>
							<td>成立时间:起始</td>
							<td>
								<e:date styleClass="form-control" style="width:100%" name="baab306"/>
							</td>
							<td>成立时间:结束</td>
							<td>
								<e:date styleClass="form-control" style="width:100%" name="eaab306"/>
							</td>
						</tr>
					</table>
					<table class="table-bordered" border=1 width="100%" align="center" id="t_class">
						<tr>
							<td style="width:20px"></td>
							<td>序号</td>
							<td>班级名称</td>
							<td>班级编号</td>
							<td>课程名称</td>
							<td>成立日期</td>
							<td>结束日期</td>
							<td>教师</td>
							<td>班主任</td>
							<td>教室</td>
					<!--	<td>限定人数</td>
							<td>班级人数</td>  -->		
							<td colspan="2">功能区</td>
						</tr>
					<c:choose>
				  		<c:when test="${rows!=null }">
				  		<c:forEach items="${rows }" var="ins" varStatus="vs">
				  		<tr>
				  			<td style="width:20px">
				  			<c:choose>
			  		    		<c:when test="${ins.scount>0 }">
			  		    			<input type="checkbox" name="idlist" value="${ins.aab301 }"
			  							   onclick="onSelect(this.checked)">
			  		    		</c:when>
			  		    		<c:otherwise>
			  		    			<input type="checkbox" name="idlist" value="${ins.aab301 }"
			  							   onclick="onSelect(this.checked)" >
			  		    		</c:otherwise>
				  		    </c:choose>
				  			
				  			</td>
				    		<td>${vs.count }</td>
				  			<td>${ins.aab302 }</td>
				  			<td>${ins.aab303 }</td>
				  		    <td>${ins.course }</td>
				  		    <td>${ins.aab306 }</td>
				  		    <td>${ins.aab3010 }</td>
				  		    <td>${ins.teacher }</td>
				  		    <td>${ins.headmaster }</td>
				  		    <td>${ins.aab3011 }</td>
				  		    <td>
				  		    	<button class="btn btn-primary mr-2" onclick="onModify('${ins.aab301}')">查看</button>
				  		    </td>
				  		    <td>
				  		    	<c:choose>
				  		    		<c:when test="${ins.scount>0 }">
				  		    			<button class="btn btn-danger mr-2" disabled="disabled" 
				  		    			   title="如果存在班级考试信息未删除,可能会删除班级失败">删除</button>
				  		    		</c:when>
				  		    		<c:otherwise>
				  		    			<button class="btn btn-danger mr-2" onclick="onDel('${ins.aab301}')"
				  		    				title="如果存在班级考试信息未删除,可能会删除班级失败">删除</button>
				  		    		</c:otherwise>
				  		    	</c:choose>	
				  		    </td>
				 	    </tr>
				  		</c:forEach>
				  		<c:forEach begin="${fn:length(rows)+1 }" step="1" end="${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10): (fn:length(rows))}">
				  		<tr>
				    		<td style="width:20px"></td>
				    		<td></td>
				    		<td></td>
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
				  		    <td style="width:20px"></td>
				    		<td></td>
				    		<td></td>
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
				var theTable = document.getElementById("t_class");
				var txtValue = document.getElementById("Text1").value;
				var numberRowsInTable = ${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows))};
				var colunm = ${fn:length(rows)};
			</script>
			<script type="text/javascript" src="<%=path %>/js/Pagging.js" charset="GBK"></script>  	
					<div style="width:100%;margin-top: 25px;float:left" align="center" >
					<div class="form-group" align="center" >
							<button class="btn btn-primary mr-2" type="submit" name="next">查询</button>
							<button class="btn btn-success mr-2" type="submit" id="add" name="next"
								   formaction="<%=path %>/EA0402Query.html">添加</button>
							<button class="btn btn-danger mr-2" type="submit" id="del" name="next" disabled="disabled"
								   formaction="<%=path %>/EA0301Delete.html">删除</button>
						    <button class="btn btn-success mr-2" type="submit" id="merge" name="next" disabled="disabled"
								   formaction="<%=path %>/EA0501Query.html">合并</button>
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