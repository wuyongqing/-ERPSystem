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
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'���гɹ�����')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>���гɹ�����</title>
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
<h5>���гɹ�����</h5>
	<table class="table-bordered" border="1" width="100%" align="center">
	  <tr>
	    <td colspan="8">��ѯ����</td>
	  </tr>
	  <tr>
	   <td>�ύ�˱��</td>
	    <td>
	      <e:text styleClass="form-control" name="qaae103" style="width:100%"/>
	    </td>
	    <td>�ύ������</td>
	    <td>
	      <e:text styleClass="form-control" name="qaae102" style="width:100%"/>
	    </td>
	    
		<td rowspan="2">Ȩ��</td>
		<td rowspan="2">
			<e:select styleClass="form-control" value="��Ȩ��:1,����Ȩ:2,�������:3" header="true" name="qaac203"/>
		</td>
	  </tr>
		<tr>
		<td>��ʼʱ��</td>
	    <td>
	      <e:date styleClass="form-control" name="baac1002"  style="margin-right:30px;width:100%;"/>
	    </td>
	    <td>����ʱ��</td>
	    <td>
	      <e:date styleClass="form-control" name="eaac1002"  style="margin-right:30px;width:100%;" />
	    </td>
		</tr>
	</table>
<table id="planlist" class="table-bordered" border="1" width="100%" align="center">
	  <tr>
	    <td>���</td>
	    <td>����</td>
	    <td>�ύʱ��</td>
	    <td>�ύ��</td>
	    <td>������</td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>${ins.aac1005}</td>
				    <td>${ins.aac1002}</td>
				    <td>${ins.aae102}</td>
				    <td>
				    <!-- #  ��ê -->
				    <c:if test="${ins.fakeaac203==1 }">
				    	<button class="btn btn-danger mr-2" onclick="onRequestToLook('${ins.thisaac1001}')">����鿴</button>
				    </c:if>
				    <c:if test="${ins.fakeaac203==2 }">
				      	<button class="btn btn-primary mr-2" onclick="onEdit('${ins.thisaac1001}')">�鿴</button>
				    </c:if>
				    <c:if test="${ins.fakeaac203==3 }">
				    	�������
				    </c:if>
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
	
	<!-- ���ܰ�ť�� -->
	<div style="width:100%;margin-top: 25px;float:left" align="center" >
			<div class="form-group" align="center" >
	       <button class="btn btn-primary mr-2" type="submit" name="next">��ѯ</button>
	       <button class="btn btn-success mr-2" type="submit" name="next" 
	              formaction="<%=path%>/addResultEC1201.jsp">��ӳɹ�</button>
	    </div>
	</div>
	</form>
	</div>
	</div>
	</div>
	<script type="text/javascript">
            var theTable = document.getElementById("planlist");
            var txtValue = document.getElementById("Text1").value;
            var numberRowsInTable = ${(fn:length(rows)%10>0)?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows)) };//����������
            var colunm=${fn:length(rows) };
    </script>
    <script type="text/javascript" src="js/Pagging.js"></script>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>