<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'�����������')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>�����������</title>
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
      function onEdit(vaac501,vaac505)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/EC1001FindByIdFRequest.html?uaac501="+vaac501+"&uaac505="+vaac505;
    	 vform.submit();
      } 
      function onDel(vaac501)
      {
    	   var vform = document.getElementById("myform");
	 	   vform.action="<%=path%>/EC1001DelByIdFRequest.html?uaac501="+vaac501;
	 	   vform.submit();
      }
      function onCancel(vaac501)
      {
    	  var vform = document.getElementById("myform"); 
 		   vform.action="<%=path%>/EC1001CancelFRequest.html?uaac501="+vaac501;
 		  vform.submit();
      }
      
   </script>
   
   
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width:100%; " align="center">
      <div class="card" style="max-width: 100%; " align="center">
           <div class="card-body" style="max-width:100%" align="center">
			 <form id="myform" action="<%=path%>/EC1001QueryFRequest.html" method="post">
             	<h4 align="center">�����������</h4>
	      		<table class="table-bordered"   width="100%" align="center">
				  <tr>
				    <td colspan="8">��ѯ����</td>
				  </tr>
				  <tr>
				    <td>��ʼ����</td>
				    <td style="width:120px">
				      <e:date styleClass="form-control" name="baac504" style="width:100%"/>
				    </td>
				    <td >��������</td>
				    <td style="width:120px">
				      <e:date styleClass="form-control" name="eaac501" style="width:100%"/>
				    </td>
				    <td>��������</td>
				    <td style="width:120px">
				      <e:select styleClass="form-control" header="true" value="���о���:1,�����:2,���ھ���:3" name="qaac508" style="width:100%"/>
				    </td>
				    <td>���״̬</td>
				    <td style="width:120px">
				      <e:select styleClass="form-control" name="qaac505" header="true" value="�ѳ���:1,�����:2,δͨ��:3,��ͨ��:4,�Ѳ���:5,�ѽ���:6"  style="margin-right:30px;width:100%;" defval="${ins.aac505}"/>
				    </td>
				  </tr>
				</table>
				<table id="planlist" class="table-bordered"  width="100%" align="center">
				  <tr>
				    <td></td>
				    <td>���</td>
				    <td>��������</td>
				    <td>��������</td>
				    <td>������</td>
				    <td>���״̬</td>
				    <td colspan="3">������</td>
				  </tr>
				   <c:choose>
				     <c:when test="${rows!=null }">
				         <!-- ��ʾʵ�ʲ�ѯ�������� -->
					     <c:forEach items="${rows }" var="ins" varStatus="vs">
				    	   	  <tr>
				    	   	    <td>
				    	   	    <c:choose>
				    	   	         <c:when test="${ins.aac505>'3'}">
				    	   	         <input type="checkbox" name="list" value="${ins.aac501 }" 
							           disabled="disabled" onclick="onSelect(this.checked)" >
				    	   	         </c:when>
				    	   	         <c:otherwise>
				    	   	         <input type="checkbox" name="idlist" value="${ins.aac501 }" 
							            onclick="onSelect(this.checked)" >
				    	   	         </c:otherwise>
				    	   	    </c:choose>    
							    </td>
							    <td>${vs.count}</td>
							    <td>${ins.type}</td>
							    <td>${ins.aac504 }</td>
							    <td>${ins.aac503}</td>
							    <td>${ins.fvalue}</td>
							     <td>
							      <button class="btn btn-primary  mr-2" onclick="onEdit('${ins.aac501}','${ins.aac505 }')">����</button>
							      </td>
							   <c:choose>
							       <c:when test="${ins.aac505>'3'}">
							           <td><button class="btn btn-warning  mr-2" disabled="disabled">����</button></td>
							           <td><button class="btn btn-danger  mr-2" disabled="disabled" >ɾ��</button></td>
							       </c:when>
							       <c:when test="${ins.aac505=='1'}">
							           <td><button class="btn btn-warning  mr-2" disabled="disabled">����</button></td>
							           <td><button class="btn btn-danger  mr-2" onclick="onDel('${ins.aac501}')" >ɾ��</button></td>
							       </c:when>
							    <c:otherwise>
							       <td><button class="btn btn-warning mr-2" onclick="onCancel('${ins.aac501}')">����</button></td>
							       <td><button class="btn btn-danger mr-2" onclick="onDel('${ins.aac501}')" >ɾ��</button></td>
							    </c:otherwise>
							   </c:choose>
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
				<div class="form-group" align="center" style="margin-top:15px">
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
			       </div>
	<!-- ���ܰ�ť�� -->
				   <div style="width:100%;margin-top: 30px;float:left" align="center" >
				   <div class="form-group" align="center" >
				       <button type="submit" name="next" class="btn btn-success mr-2" >��ѯ</button>
				       <button type="submit" name="next" class="btn btn-primary mr-2"
				              formaction="<%=path%>/addFRequestEC1001.jsp?uaac505=0">�������</button>
				       <button type="submit" id="del" name="next" class="btn btn-danger mr-2"
				              formaction="<%=path%>/EC1001DelFRequest.html"  disabled="disabled">����ɾ��</button>
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