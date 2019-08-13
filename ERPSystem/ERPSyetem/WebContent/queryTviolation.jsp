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
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'Ա��Υ�͹���')}">
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
	
	function onModify(vaaf201)
	{
		var form = document.getElementById("myform");
		form.action="<%=path%>/EA0701FindById.html?aaf201="+vaaf201;
		form.submit();
	}
	
	function onDel(vaaf201)
	{
		var form = document.getElementById("myform");
		form.action="<%=path%>/EA0701DeleteById.html?aaf201="+vaaf201;
		form.submit();
	}
	
</script>

</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
      <div class="card" style="max-width: 100%; " align="center">
           <div class="card-body" style="max-width:100%" align="center">
			<form id="myform" action="<%=path %>/EA0701Query.html" method="post">
				<h4 align="center">Ա��Υ�Ͳ�ѯ</h4>
				<table class="table-bordered" border=1 width="100%" align="center">
					<tr>
						<td colspan="4">
						��ѯ����
						</td>
					</tr>
					<tr>
						<td>Ա������</td>
						<td>
							<e:text styleClass="form-control" style="width:100%" name="qaae102"/>
						</td>
						<td>Ա�����</td>
						<td>
							<e:text styleClass="form-control" style="width:100%" name="qaae103"/>
						</td>
					</tr>
					<tr>
						<td>��ʼ����</td>
						<td>
							<e:date styleClass="form-control" style="width:100%" name="baaf202"/>
						</td>
						<td>��������</td>
						<td>
							<e:date styleClass="form-control" style="width:100%" name="eaaf202"/>
						</td>
					</tr>
				</table>
				<table class="table-bordered" id="t_violation" border=1 width="100%" align="center">
					<tr>
						<td></td>
						<td>���</td>
						<td>Υ��Ա��</td>
						<td>Ա�����</td>
						<td>Υ������</td>
						<td>��¼��</td>
						<td colspan="2">������</td>
					</tr>
					<c:choose>
				 		<c:when test="${rows!=null }">
					 		<c:forEach items="${rows }" var="ins" varStatus="vs">
						 		<tr>
						 			<td>
						 			<input type="checkbox" name="idlist" value="${ins.aaf201 }"
						 							onclick="onSelect(this.checked)" >
						 			</td>
						   			<td>${vs.count }</td>
						 			<td>${ins.aae102 }</td>
						 			<td>${ins.aae103 }</td>
						 		    <td>${ins.aaf202 }</td>
						 		    <td>${ins.record }</td>
						 		    <td>
					  		    		<button class="btn btn-primary mr-2" onclick="onModify('${ins.aaf201}')">�鿴</button>
						  		    </td>
						  		    <td>
						  		    	<button class="btn btn-danger mr-2" onclick="onDel('${ins.aaf201}')">ɾ��</button>
						  		    </td>
							    </tr>
					 		</c:forEach>
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
					
				<script type="text/javascript">
				var theTable = document.getElementById("t_violation");
				var txtValue = document.getElementById("Text1").value;
				var numberRowsInTable = ${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows))};
				var colunm = ${fn:length(rows)};
				</script>
				<script type="text/javascript" src="<%=path %>/js/Pagging.js" charset="GBK"></script>
				
				<div style="width:100%;margin-top: 25px;float:left" align="center" >
					<div class="form-group" align="center" >
						<button class="btn btn-primary mr-2" type="submit" name="next">��ѯ</button>
						<button class="btn btn-success mr-2" type="submit" name="next"
							   formaction="<%=path %>/addTviolation.jsp">���</button>
						<button class="btn btn-danger mr-2" type="submit" id="del" name="next" disabled="disabled"
							   formaction="<%=path %>/EA0701Delete.html">ɾ��</button>
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