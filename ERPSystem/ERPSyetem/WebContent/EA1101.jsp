<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'��־����')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
   <title>��־��ѯ</title>
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
			var vdel=document.getElementById("pass");
			vdel.disabled=(count==0);
		}
		function onDetail(vaac101)
		{
			var vform = document.getElementById("query-Journal-form");
			vform.action="<%=path%>/EA1102.html?aac101="+vaac101;
			vform.submit();
		}		
		function onPass(vaac101)
		{
			var vform = document.getElementById("query-Journal-form");
			vform.action="<%=path%>/EA1103.html?aac101="+vaac101;
			vform.submit();
		}
    </script>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
	<div class="card" style="max-width: 100%; " align="center">
		<div class="card-body" style="max-width:100%" align="center">
		<form id="query-Journal-form" action="<%=path%>/EA1101.html" method="post">
		  	<!-- ��ѯ������ -->
		  	<h5>��־��ѯ</h5>
			<table class="table-bordered" border="1" width="100%" align="center">
			  <tr>
			    <td colspan="6">��ѯ����</td>
			  </tr>
			  <tr>
			    <td>��ʦ����</td>
			    <td>
			      <e:text styleClass="form-control" name="qaae102"/>
			    </td>
			    <td>��ʦ���</td>
			    <td>
			      <e:text styleClass="form-control" name="qaae103"/>
			    </td>
			    <td rowspan="2">����״̬</td>
			    <td rowspan="2">
			    	<e:select styleClass="form-control" value="δ����:1,������:2" name="qaac104" header="true"/>
			    </td>
			  </tr>
			  <tr>
			    <td>����[B]</td>
			    <td colspan="1">
			      <e:date styleClass="form-control" name="baac102"/>
			    </td>
			    <td>����[E]</td>
			    <td>
			      <e:date styleClass="form-control" name="eaac102"/>
			    </td>
			  </tr>
			</table>
			<!-- ���ݵ����� -->
			<table class="table-bordered" border="1" width="100%" align="center">
			  <tr>
			  	<td style="width:20px;"></td>
			    <td>���</td>
			    <td>��ʦ����</td>
			    <td>��ʦ���</td>
			    <td>����</td>
			    <td>����״̬</td>
			    <td colspan="2">����</td>
			  </tr>
			  <!--
			         ע������
			    1.$�������ŵĽ������ }��˫����֮��,��������ֿո�
			    2.���е�����֮������Ҫ��һ���ո�,���򱨴�
			    3.var ����,�൱����ҳ�涨���������,���  ins����������$ {  }
			   -->
			   <c:choose>
			     <c:when test="${rows!=null }">
			         <!-- ��ʾʵ�ʲ�ѯ�������� -->
				     <c:forEach items="${rows }" var="ins" varStatus="vs">
			    	   	  <tr>
			    	   	  	<td style="width:20px;">
				    	   	  	<c:if test="${ins.aac104==1 }">
					    	   	  	<input type="checkbox" name="idlist" value="${ins.aac101 }"
								             onclick="onSelect(this.checked)" >
				    	   	  	</c:if>
			    	   	  	</td>
			    	   	  	<td>${vs.count }</td>
			    	   	  	<td>${ins.aae102 }</td>	   	  		
			    	   	  	<td>${ins.aae103 }</td>
			    	   	  	<td>${ins.aac102 }</td>	
			    	   	  	<td>
			    	   	  		<c:choose>
			    	   	  			<c:when test="${ins.aac104==1 }">δ����</c:when>
			    	   	  			<c:otherwise>������</c:otherwise>
			    	   	  		</c:choose>
			    	   	  	</td>		
			    	   	  	<td>
						     	<button class="btn btn-primary mr-2" onclick="onDetail('${ins.aac101 }')">�鿴</button>
						    </td>
						    <td>
							    <c:choose>
							    	<c:when test="${ins.aac104==1 }">
							      		<button class="btn btn-success mr-2" onclick="onPass('${ins.aac101 }')">����</button>
							      	</c:when>
							      	<c:otherwise>����</c:otherwise>
							    </c:choose>
						    </td>
						  </tr>
				      </c:forEach>
				      <!-- ������� -->
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
		       		<button class="btn btn-primary mr-2" type="submit" name="next">��ѯ</button>
		       		<button class="btn btn-danger mr-2" type="submit" id="pass" name="next" 
		        	formaction="<%=path%>/EA1106.html" disabled="disabled">һ������</button>
				</div>
			</div>
		    <script type="text/javascript">
		            var theTable = document.getElementById("t_certificates");
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