<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'考试管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
   <title>考试管理</title>
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
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaab601)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/EC0201FindByIdExam.html?aab601="+vaab601;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaab601)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/EC0201DelByIdExam.html?aab601="+vaab601;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
      function onPaper(vaab601)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/EC0202QueryPaper.html?aab601="+vaab601;
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

		<form id="myform" action="<%=path%>/EC0201QueryExam.html" method="post">
		  <!-- 查询条件区 -->
			<h4 align="center">考试管理</h4>
			<table class="table-bordered" border="1" width="100%" align="center">
			  <tr>
			    <td style="min-width:90px" colspan="4">查询条件</td>
			  </tr> 
			  <tr>
			    <td >考试编号</td>
			    <td>
			      <e:text styleClass="form-control" name="qaab601" style="width:100%"/>
			    </td>
			    <td>班级编号</td>
			    <td>
			      <e:text styleClass="form-control" name="qaab303" style="width:100%"/>
			    </td>
			  </tr>	  
			  <tr>
			    <td>开始日期</td>
			    <td>
			      <e:date styleClass="form-control" name="qaab603"/>
			    </td>
			    <td>结束日期</td>
			    <td>
			      <e:date styleClass="form-control" name="paab603"/>
			    </td>
			  </tr>
			  <tr>
			    <td>开始时间</td>
			    <td>
			      <input class="form-control" type="time"  name="qaab604" style="width:100%"/>
			    </td>
			    <td>结束时间</td>
			    <td>
			      <input class="form-control" type="time"  name="qaab605" style="width:100%"/>
			    </td>
			  </tr>
			</table>
			<!-- 数据迭代区 -->
			<table id="planlist" class="table-bordered" border="1" width="100%" align="center">
			  <tr>
			    <td>#</td>
			    <td>序号</td>
			    <td>考试编号</td>
			    <td>班级编号</td>
			    <td style="width: 70px;">考试日期</td>
			    <td>开始时间</td>
			    <td>结束时间</td>
			    <td>考试地点</td>
			    <td colspan="3">功能区</td>
			  </tr>
			  <!--
			         注意事项
			    1.$及大括号的结束标记 }与双引号之间,不允许出现空格
			    2.所有的属性之间至少要有一个空格,否则报错
			    3.var 属性,相当于在页面定义变量名称,因此  ins不允许再用$ {  }
			   -->
			   <c:choose>
			     <c:when test="${rows!=null }">
			         <!-- 显示实际查询到的数据 -->
				     <c:forEach items="${rows }" var="ins" varStatus="vs">
			    	   	  <tr>
						    <td>
						      <input type="checkbox" name="idlist" value="${ins.aab601 }"
						             onclick="onSelect(this.checked)" >
						    </td>
						    <td>${vs.count }</td>
						    <td>${ins.aab602 }</td>				    
						    <td>${ins.aab303 }</td>
						    <td style="width: 70px;">${ins.aab603 }</td>
						    <td>${ins.aab604 }</td>
						    <td>${ins.aab605 }</td>
						    <td>${ins.aab606 }</td>
						    <td>
						      <button class="btn btn-primary mr-2" onclick="onEdit('${ins.aab601}')">修改</button>
						    </td>
						    <td>
						      <button class="btn btn-danger mr-2" onclick="onDel('${ins.aab601}')">删除</button>
						    </td>
						    <td style="width:70px;">
						      <button class="btn btn-primary mr-2" onclick="onPaper('${ins.aab601}')">查看试卷</button>
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
					            <td style="width: 70px;"></td>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td></td>
					            <td style="width:70px;"></td>
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
			             <td style="width: 70px;"></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td></td>
			             <td style="width:70px;"></td>
			           </tr>
			        </c:forEach>
			     </c:otherwise>
			   </c:choose>
			</table>
	<div class="form-group" align="center" style="margin-top:15px">
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
	</div>
	<!-- 功能按钮区 -->
	<div style="width:100%;margin-top: 25px;float:left" align="center" >		
	<div class="form-group" align="center" >
			       <button type="submit" name="next" class="btn btn-primary mr-2" >查询</button>
			       <button type="submit" name="next" class="btn btn-success mr-2"
			              formaction="<%=path%>/EC0201AddExam.jsp">添加</button>
			       <button type="submit" id="del" name="next" value="删除" class="btn btn-danger mr-2"  
			              formaction="<%=path%>/EC0201DelExam.html"  disabled="disabled">批量删除</button>
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