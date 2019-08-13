<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
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
	<title>查找证书发放记录</title>
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
   	<script type="text/javascript"></script>
   	<script type="text/javascript">
	    var count=0;
	    function onSelect(vstate)
	    {
	  	  vstate?count++:count--;
	  	  var vdel=document.getElementById("del");
	  	  vdel.disabled=(count==0);
	    }
    
	    function onDel(vaab1301)
	    {
	  	 var vform = document.getElementById("serach-sertificate-form");
	  	 vform.action="<%=path%>/ED0604.html?aab1301="+vaab1301;
	  	 //alert(vform.action);
	  	 vform.submit();
	    } 
 
	    function onEdit(vaab1301)
	    {
		  	 var vform = document.getElementById("serach-sertificate-form");
		  	 vform.action="<%=path%>/ED0603.html?aab1301="+vaab1301;
		  	 //alert(vform.action);
		  	 vform.submit();
	    }
   	</script>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
	<div class="card" style="max-width: 100%; " align="center">
		<div class="card-body" style="max-width:100%" align="center">
		<form id="serach-sertificate-form" action="<%=path%>/ED0602.html" method="post">
		<input type="hidden" name="aae101" value="${sessionScope.user }">
	<!--查询条件区-->
	<h5>证书查询条件</h5>
	<table class="table-bordered" border="1" width="100%" align="center">
		<tr>
	    	<td>学生姓名</td>
		    <td><e:text styleClass="form-control" name="qaab102"/></td>
	    	<td>学号</td>
		    <td><e:text styleClass="form-control" name="qaab103" maxlength="13"/></td>
	  	</tr>
		<tr>
	    	<td>证书名称</td>
		    <td><e:text styleClass="form-control" name="qaab1302"/></td>
	    	<td>发放单位</td>
		    <td><e:text styleClass="form-control" name="qaab1304"/></td>
	  	</tr>
	  	<tr>
		    <td>录入日期[B]</td>
		    <td>
		      <e:date styleClass="form-control" name="baab1303"/>
		    </td>
		    <td>录入日期[E]</td>
		    <td>
		      <e:date styleClass="form-control" name="eaab1303"/>
		    </td>
	  	</tr>
	</table>
<!-- 数据迭代区 -->
	<table id="t_certificates" class="table-bordered" border="1" width="100%" align="center">
		<tr>
			<td style="width:20px;"></td>
		    <td>序号</td>
		    <td>姓名</td>
		    <td>学号</td>
		    <td>证书名称</td>
		    <td>发放时间</td>
		    <td>发放单位</td>
		    <td colspan="2">操作</td>
	  	</tr>
	  	
	  	<c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td style="width:20px;">
				      <input type="checkbox" name="idlist" value="${ins.aab1301 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				    <td>${ins.aab102 }</td>
				    <td>${ins.aab103 }</td>
				    <td>${ins.aab1302 }</td>
				    <td>${ins.aab1303 }</td>
				    <td>${ins.aab1304 }</td>
				    <td>
				     	<button class="btn btn-primary mr-2" onclick="onEdit('${ins.aab1301}')">修改</button>
				    </td>
				    <td>
				      <button class="btn btn-danger mr-2" onclick="onDel('${ins.aab1301}')">删除</button>
				    </td>
				  </tr>
		      </c:forEach>
		      <!-- 补充空行 -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="${(fn:length(rows)%10>0)?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows)) }">
			          <tr>
			            <td style="width:20px;"></td>
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
	             <td style="width:20px;"></td>
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
	
	<!-- 功能按钮区 -->
	<div style="width:100%;margin-top: 25px;float:left" align="center" >
		<div class="form-group" align="center" >	  
       		<button class="btn btn-primary mr-2" id="query" type="submit" name="next">查询</button>
       		<button class="btn btn-success mr-2" type="submit" name="next" 
              formaction="<%=path%>/ED0601.jsp">添加</button>
    		<button class="btn btn-danger mr-2" type="submit" id="del" name="next" 
              formaction="<%=path%>/ED0606.html"  disabled="disabled">删除</button>
		</div>
	</div>
	
    <script type="text/javascript">
            var theTable = document.getElementById("t_certificates");
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