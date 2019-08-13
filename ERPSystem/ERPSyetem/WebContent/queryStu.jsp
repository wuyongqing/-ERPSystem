<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'ѧ��ά��')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
	<title>ѧ������</title>
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
	    function onEdit(vaab101)
	    {
		  	 var vform = document.getElementById("serach-stu-form");
		  	 vform.action="<%=path%>/findStuById.html?aab101="+vaab101;
		  	 //alert(vform.action);
		  	 vform.submit();
	    }
   	</script>
</head><body style="background-color: #F5F5F5">
<p align="center"><div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div></p>
<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
	<div class="card" style="max-width: 100%; " align="center">
		<div class="card-body" style="max-width:100%" align="center">
			<form id="serach-stu-form" action="<%=path%>/queryStu.html" method="post">
				<input type="hidden" name="aae101" value="${sessionScope.user }">
				<!--��ѯ������-->
				<h5>ѧ����ѯ����</h5>
				<table class="table-bordered" border="1" width="100%" align="center">
					<tr>
				    	<td>����</td>
					    <td><e:text styleClass="form-control" name="qaab102"/></td>
				    	<td>ѧ��</td>
					    <td><e:text styleClass="form-control" name="qaab103" maxlength="13"/></td><td>״̬</td>
					    <td>
					    	<e:select styleClass="form-control" name="qaab115" value="��У:1,��ѧ:2,��ѧ:3" header="true" />
					    </td>
				  	</tr>
				</table>
			<!-- ���ݵ����� -->
				<table id="t_student" class="table-bordered" border="1" width="100%" align="center">
					<tr>
					    <td>���</td>
					    <td>����</td>
					    <td>ѧ��</td>
					    <td>�Ա�</td>
					    <td style="min-width:100px;">����</td>
					    <td>����</td>
					    <td>����</td>
					    <td>�ֻ�����</td>
					    <td>�༶���</td>
					    <td></td>
				  	</tr>
				  	
				  	<c:choose>
				     <c:when test="${rows!=null }">
				         <!-- ��ʾʵ�ʲ�ѯ�������� -->
					     <c:forEach items="${rows }" var="ins" varStatus="vs">
				    	   	  <tr>
							    <td>${vs.count }</td>
							    <td>${ins.aab102 }</td>
							    <td>${ins.aab103 }</td>
							    <td>${ins.aab106 }</td>
							    <td>${ins.aab105 }</td>
							    <td>${ins.aab107 }</td>
							    <td>${ins.aab108 }</td>
							    <td>${ins.aab109 }</td>
							    <td>${ins.aab303 }</td>
							    <td>
							      <button class="btn btn-primary mr-2" onclick="onEdit('${ins.aab101}')">�޸�</button>
							    </td>
							  </tr>
					      </c:forEach>
					      <!-- ������� -->
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
				             <td></td>
				           </tr>
				        </c:forEach>
				     </c:otherwise>
				   </c:choose>
				</table>
		<div class="gridItem" style="padding: 5px; width: 40%; float: left; text-align: right; height: 20px; font-size: 15px;" > 
	        ���� <span id="spanTotalInfor">${fn:length(rows) }</span> ����¼     
	        ��ǰ��<span id="spanPageNum"></span>ҳ     
	        ��<span id="spanTotalPage"></span>ҳ
	    </div>
    	<div class="gridItem" style="margin-left:50px;width: 40%;  padding: 5px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">   
            <span id="spanFirst" >��ҳ</span> 
            <span id="spanPre">��һҳ</span>
            <span id="spanInput" style="margin: 0px; padding: 0px 0px 4px 0px; height:100%; "> 
                ��<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px" />ҳ 
            </span>
            <span id="spanNext">��һҳ</span> 
            <span  id="spanLast">βҳ</span> 
        </div>
		<div style="width:100%;margin-top: 25px;float:left" align="center" >
			<div class="form-group" align="center" >
				<button class="btn btn-primary mr-2" id="query" type="submit" name="next">��ѯ</button>
			</div>
		</div>
	
    <script type="text/javascript">
            var theTable = document.getElementById("t_student");
            var txtValue = document.getElementById("Text1").value;
            var numberRowsInTable = ${(fn:length(rows)%10>0)?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows)) };//����������
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