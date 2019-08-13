<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>�༶��ѯ</title>

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
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'ѧ������')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>

	<%String path=request.getContextPath();%>
</head>
<body style="background-color: #F5F5F5">
<script type="text/javascript">

	function onSub(vaab301,vaab302)
	{
		alert(vaab301);
		var form = document.getElementById("myform");
		form.action="<%=path%>/addSub.jsp?aab301="+vaab301+"&aab302="+encodeURIComponent(vaab302);
		form.submit();
	}

</script>
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
	<div class="card" style="max-width: 100%; " align="center">
		<div class="card-body" style="max-width:100%" align="center">
	<form id="myform" action="<%=path %>/eA0301QueryForSub.html" method="post">

		<h4 align="center">�༶��ѯ</h4>

		<table class="table-bordered" border=1 width="100%" align="center">

			<tr>
				<td colspan="8">
				��ѯ����
				</td>
			</tr>
			<tr>
				<td>�༶����</td>
				<td style="min-width:150px">
					<e:text styleClass="form-control" name="qaab302"/>
				</td>
				<td>�༶���</td>
				<td style="min-width:150px">
					<e:text styleClass="form-control" name="qaab303"/>
				</td>

				<td>��ʦ</td>
				<td>
					<e:text styleClass="form-control" name="qteacher"/>
				</td>
				<td>������</td>
				<td>
					<e:text styleClass="form-control" name="qheadmaster"/>
				</td>
			</tr>

			<tr>
				<td>�γ�����</td>
				<td style="min-width:150px">
					<e:text styleClass="form-control" name="qcourse"/>
				</td>
				<td>����</td>
				<td style="min-width:150px">
					<e:text styleClass="form-control" name="qaab3011"/>
				</td>

				<td>����ʱ��[</td>
				<td>
					<e:date styleClass="form-control" name="baab306"/>
				</td>
				<td>����ʱ��]</td>
				<td>
					<e:date styleClass="form-control" name="eaab306"/>
				</td>
			</tr>

		</table>
		<table class="table-bordered" border=1 width="100%" align="center" id="t_class">
			<tr>
				<th>���</th>
				<th>�༶����</th>
				<th>�γ�����</th>
				<th>��������</th>
				<th>��������</th>
				<th>��ʦ</th>
				<th>������</th>
				<th>����</th>
			    <th>�༶����</th>
				<th>�޶�����</th>
                <th>ѧ��</th>
                <th>ʱ��</th>
				<th>����</th>
			</tr>
		<c:choose>
	  		<c:when test="${rows!=null }">
	  		<c:forEach items="${rows }" var="ins" varStatus="vs">
	  		<tr>
	    		<td>${vs.count }</td>
	  			<td>${ins.aab302 }</td>
	  		    <td>${ins.course }</td>
	  		    <td>${ins.aab306 }</td>
	  		    <td>${ins.aab3010 }</td>
	  		    <td>${ins.teacher }</td>
	  		    <td>${ins.headmaster }</td>
	  		    <td>${ins.aab3011 }</td>
                <td>${ins.aab308 }</td>
                <td>${ins.aab309 }</td>
                <td>${ins.aab504 }</td>
                <td>${ins.time }��</td>
	  		    <td>
					<c:if test="${(ins.aab308+1)<(ins.aab309+1)}">
                        <button class="btn btn-success mr-2" onclick="onSub('${ins.aab301}','${ins.aab302}')">����</button>
                    </c:if>
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
			���� <span id="spanTotalInfor"></span> ����¼     
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
	var theTable = document.getElementById("t_class");
	var txtValue = document.getElementById("Text1").value;
	var numberRowsInTable = ${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows))};
	var colunm = ${fn:length(rows)};
</script>
		<script type="text/javascript" src="js/Pagging.js"></script>


		<div style="width:100%;margin-top: 25px;float:left" align="center" >
			<div class="form-group" align="center" >
				<button type="submit" name="next" class="btn btn-success mr-2">��ѯ</button>
                <button type="submit" name="next" class="btn btn-secondary mr-2" formnovalidate="formnovalidate" formaction="<%=path%>/eE0201.html">����</button>
			</div>
		</div>

        <e:hidden name="qaae102"/>
        <e:hidden name="qaae103"/>
        <e:hidden name="baae802"/>
        <e:hidden name="eaae802"/>
        <e:hidden name="qaae803"/>
        <e:hidden name="qaae805"/>

	</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>