<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'���з�������')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>���з�������</title>
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
	function onSubQuery(vaac301)
	{
		var vform = document.getElementById("plan-detail-form");
		vform.action="<%=path%>/EA1302.html?uaac301="+vaac301;
		vform.submit();
	}
	function onDetail(vaac301,vaac401,vaac303)
	{
		 var vform = document.getElementById("plan-detail-form");
		 vform.action="<%=path%>/EA1303.html?maac301="+vaac301+"&aac401="+vaac401+"&aac303="+vaac303;
		 vform.submit();
	} 
</script>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
	<div class="card" style="max-width: 100%; " align="center">
		<div class="card-body" style="max-width:100%" align="center">
		<form id="plan-detail-form" action="<%=path%>/EA1302.html" method="post">
    <div style="border-bottom:0px">
        <h3 align="center">���з���</h3>
        <div align="center" style="margin-top:30px;border:0px">
            <label>������� :</label>
    		<e:text styleClass="form-control" name="aac301" readonly="true" 
    		defval="${param.uaac301 }" style="width:150px;margin-right:30px" />
            <label>�������� :</label>
    		<e:text styleClass="form-control" name="aac302" readonly="true" 
    		defval="${ins.aac302 }" style="width:150px;margin-right:30px"/>
    		<label>������ :</label>
    		<e:text styleClass="form-control" name="faae102" readonly="true" 
    		defval="${ins.aae102 }" style="width:150px;margin-right:30px"/>
    		<label>���״̬ :</label>
    		<e:text styleClass="form-control" name="fvalue" readonly="true" 
    		defval="${ins.fvalue }" style="width:150px;margin-right:30px" />
        </div>
    </div>
    <div style="margin-top: 20px;margin-left:40px;margin-right:40px">
    <h5>��б�</h5>
    <table class="table-bordered" border="1" width="100%" align="center">
	  	<tr>
	  		<td colspan="8">��ѯ����:</td>
	  	</tr>
	  	<tr>
	   		<td>��ʼʱ��:</td>
	    	<td style="text-align:left">
	      		<e:date styleClass="form-control" name="baac402" style="width:100%"/>
	    	</td>
	    	<td>����ʱ��:</td>
	    	<td style="text-align:left">
	      		<e:date styleClass="form-control" name="eaac402" style="width:100%"/>
	    	</td>
	    	<td>��ص�:</td>
	    	<td style="text-align:left">
	      		<e:text styleClass="form-control" name="qaac403" style="width:100%"/>
	    	</td>
	    	<td>��֯��:</td>
	    	<td style="text-align:left">
	      		<e:text styleClass="form-control" name="qaae102" style="width:100%"/>
	    	</td>
	    </tr>
	</table>
    <table class="table-bordered" border="1" width="100%" align="center">
	  	<tr>
		    <td>���</td>
		    <td>�ʱ��</td>
		    <td>��ص�</td>
		    <td>��֯��</td>
		    <td>������</td>
		    <td>��ϸ����</td>
		    <td>�鿴</td>
	  	</tr>
	   	<c:choose>
	     	<c:when test="${rows!=null }">
	         	<!-- ��ʾʵ�ʲ�ѯ�������� -->
		     	<c:forEach items="${rows }" var="subins" varStatus="vs">
	    	   	  	<tr>
					    <td>${vs.count}</td>
					    <td>${subins.aac402}</td>
					    <td>${subins.aac403}</td>
					    <td>${subins.aae102}</td>
					    <td>ѧ��</td>
					    <td>${subins.aac404 }</td>
					    <td>
				    	<!-- #  ��ê -->
				      		<button class="btn btn-primary mr-2" 
				      		onclick="onDetail('${param.uaac301}','${subins.aac401 }','${ins.aac303 }')">
				      			�鿴
				      		</button>
				      	</td>
				  	</tr>
		      	</c:forEach>
		      	<!-- ������� -->
		      	<c:forEach begin="${fn:length(rows)+1 }" step="1" end="10">
			    	<tr>
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
	        <button class="btn btn-primary mr-2" type="submit" 
	   		onclick="onSubQuery('${ins.aac301}')">��ѯ</button>
	        <button class="btn btn-light mr-2" type="submit" name="next" 
	    	formaction="<%=path%>/EA1301.html" formnovalidate="formnovalidate">����</button>
		</div>
	</div>
</div>
<script type="text/javascript">
        var theTable = document.getElementById("planlist");
        var txtValue = document.getElementById("Text1").value;
        var numberRowsInTable = ${(fn:length(rows)%10>0)?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows)) };//����������
        var colunm=${fn:length(rows) };
</script>
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