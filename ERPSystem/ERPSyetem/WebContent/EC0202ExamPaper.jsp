<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'试卷生成')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>试卷生成</title>
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
	function onPrint(vaab601)
	{
		 var vform = document.getElementById("myform");
		 vform.action="<%=path%>/EC0202PrintPaper.html?aab601="+vaab601;
		 //alert(vform.action);
		 vform.submit();
	}
	
</script>
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
      <div class="card" style="max-width: 100%; " align="center">
           <div class="card-body" style="max-width:100%" align="center">
<form id="myform" action="<%=path %>/EC0202ExamPaper.html" method="post">
<h4 align="center">试卷预览</h4>
		<input type="hidden" value="${rows[0].aab602 }">
	<table class="table-bordered" border="1" align="center" width="100%">
				<tr>
			<td>考试编号</td>
			<td>
				<e:text styleClass="form-control" name="aab602" required="true" readonly="${empty rows[0].aab602?'false':'true' }" defval="${rows[0].aab602 }" style="width:100%"/>
			</td>
			<td>科目</td>
			<td>
				<e:select styleClass="form-control" name="aaf503" required="true" value="C#:C#,Java:Java,c++:c++" readonly="${empty rows[0].aaf503?'false':'true' }" defval="${rows[0].aaf503 }" style="width:100%"/>
			</td>
			<c:if test="${rows==null }">
			<td>
				<button class="btn btn-success mr-2" type="submit" name="next" 
              	formaction="<%=path%>/EC0202ExamPaper.html">生成</button>
            </td>
            </c:if>
		</tr>
	</table>
	<table class="table-bordered" border="1" align="center" width="100%">	
		<tr>
		<td style="width:5%">序号</td>
	    <td >题目</td>
	    <td >参考答案</td>
	    <td style="width:10%">备注</td>
	  </tr>	     
         <!-- 显示实际查询到的数据 -->
         <c:choose>
         <c:when test="${rows!=null }">
         	  <tr>
	    	  	<td colspan="5">客观题</td>
	 		  </tr>

	      <c:forEach items="${rows }" var="ins" varStatus="vs">
    	   	  <tr>
    	   	  <input type="hidden" name="idlist" value="${ins.aaf501 }">
			    <td>${vs.count }</td>
			    <td>${ins.aaf504 }</td>
			    <td>${ins.aaf505 }</td>
			    <td>${ins.aaf506 }</td>
			  </tr>
			  <c:if test="${vs.count=='10' }">
			  <tr>
			  <td colspan="5">主观题</td>
		  	  </tr>
		  	  </c:if>
		  </c:forEach>
	      <!-- 补充空行 -->
	      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="20">
		          <tr>
		            <td></td>
		            <td></td>
		            <td></td>
		            <td></td>		            
		          </tr>
	      </c:forEach>
	    </c:when>
	    <c:otherwise>
	        <c:forEach begin="1" step="1" end="20">
	           <tr>
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
	       	<button type="submit" name="next" class="btn btn-primary mr-2" 
	       		  formaction="<%=path%>/EC0202AddPaper.html">保存</button>
	       	<button type="submit" name="next" class="btn btn-success mr-2"
	              formaction="<%=path%>/EC0202PrintPaper.html">打印预览 </button>
          	<c:if test="${rows!=null }">
	              
	       		<button type="submit" name="next" class="btn btn-secondary mr-2"
	              	formaction="<%=path%>/EC0201QueryExam.html">返回</button>
           	</c:if>
	       
	</div>
	</div>
	
	
</form>
</div>
</div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>