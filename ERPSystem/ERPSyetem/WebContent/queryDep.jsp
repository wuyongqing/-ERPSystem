<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>

    <title>部门管理</title>

	<link rel="stylesheet" href="css/tstyle.css">
	<link rel="stylesheet" href="css/mstyle.css">
	<style type="text/css">
		tr
		{
			height:38px;
			font-size:15px;
		}
		td,th
		{
			text-align:center;
			width:50px;
			height:38px;
		}
	</style>

	<c:choose>
        <c:when test="${empty sessionScope.role}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:when>
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'部门管理')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>

    <script type="text/javascript">
        function onMod(vaae301) {
            var vform=document.getElementById("showDep");
            vform.action="<%=request.getContextPath()%>/eF0104.html?aae301="+vaae301;
            vform.submit();
        }

        function onExp(vaae302) {
            var vform=document.getElementById("showDep");
            vform.action="<%=request.getContextPath()%>/eF0201.html?qcnaae301="+encodeURIComponent(vaae302)+"&dep=1";
            vform.submit();
        }
    </script>

</head>

<body style="background-color: #F5F5F5">

<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
	<div class="card" style="max-width: 100%; " align="center">
		<div class="card-body" style="max-width:100%" align="center">

<form id="showDep" action="<%=request.getContextPath()%>/eF0101.html" method="post">

	<h4 align="center">部门管理</h4>

	<table class="table-bordered" border="1" width="100%" align="center" id="depTable">

	  <tr>
	    <th>序号</th>
	    <th>部门名称</th>
	    <th>部门在职人数</th>
	    <th>部门所在地</th>
	    <th>部门职责</th>
	    <th>备注</th>
	    <th colspan="2">操作</th>
	  </tr>

	   <c:choose>
	     <c:when test="${rows!=null}">

	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows}" var="ins" varStatus="vs">

	    	   	  <tr>

				    <td>${vs.count}</td>
				    <td>${ins.aae302}</td>
				    <td>${ins.aae303}</td>
				    <td>${ins.aae305}</td>
				    <td>${ins.aae306}</td>
				    <td>${ins.aae307}</td>
				    <td>
                        <button class="btn btn-primary mr-2" onclick="onExp('${ins.aae302}')">员工清单</button>
                    </td>
                    <td>
                        <button class="btn btn-primary mr-2" onclick="onMod('${ins.aae301}')">信息更新</button>
					</td>

				  </tr>

		      </c:forEach>

		      <!-- 补充空行 -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10): (fn:length(rows))}">
		           <tr>
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
        var theTable = document.getElementById("depTable");
        var txtValue = document.getElementById("Text1").value;
        var numberRowsInTable = ${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows))};
        var colunm = ${fn:length(rows)};
	</script>
	
	<!-- 功能按钮区 -->
	<div style="width:100%;margin-top: 25px;float:left" align="center" >
		<div class="form-group" align="center" >
			<button type="submit" name="next" class="btn btn-success mr-2" formaction="<%=request.getContextPath()%>/addNModDep.jsp">添加</button>
			<button type="submit" name="next" class="btn btn-secondary mr-2">刷新</button>
		</div>
	</div>
</form>
		</div>
	</div>
</div>

<script type="text/javascript" src="js/Pagging.js"></script>

<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>