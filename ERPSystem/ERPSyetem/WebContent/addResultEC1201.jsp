<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'教研成果管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>教研成果管理</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<c:choose>
   	<c:when test="${empty filepath }">
		<div id="upload" align="center" > 
	  		<div style="width:100%;margin-top: 10%;" align="center">
				<div class="col-10 grid-margin stretch-card" >
                	<div class="card" style="width:60%;"align="center">
                  		<div class="card-body" style="width:60%;" align="center">
                  			<h4 align="center">添加教研成果</h4>
							<form class="form-sample" id="uploadform"  action="<%=path %>/fileUpload" enctype="multipart/form-data" method="post"> 
							    <label>成果内容  :</label>
							    <input type="file" name="file1"> 
							    <div  align="center" style="height:30px;margin-top:20px;margin-left:15% ;margin-right:25% ;width:50%">
						            <button class="btn btn-success mr-2" 
						            type="submit" name="next">提交文件并继续</button>
					            	<button class="btn btn-secondary mr-2" type="submit" name="next" 
					                	formaction="<%=path%>/EC1201QueryResult.html?aae101=${sessionScope.user }" 
					                	formnovalidate="formnovalidate">取消返回</button>
			             		</div>
							    <input type="hidden" name="aae103" value="${sessionScope.numb }">
								<input type="hidden" name="aae101" value="${sessionScope.user }">
							    <input id="filepath" type="hidden" name="filepath" value="${filepath}">
				    
								<e:hidden name="qaac1001"/>
								<e:hidden name="qaae102"/>
								<e:hidden name="baac1002"/>
								<e:hidden name="eaac1002"/>		
								<e:hidden name="qaac203"/>	
							</form>
						</div>
					</div>
				</div>
	        </div>
	    </div>
	</c:when>
<c:otherwise>
<div style="width:100%" align="center">
	<form class="form-sample"   id="store" action="<%=path %>/EC1201AddResult.html" method="post"> 
		<div class="col-10 grid-margin stretch-card" >
            <div class="card" style="width:60%;"align="center">
            	<div class="card-body" style="width:60%;" align="center">   
					<h4 align="center">添加教研成果</h4>
             		<div class="form-group" align="left">  
						<label for="aae103">教师编号  :</label>
				     	 <e:text styleClass="form-control" name="aae103" readonly="true" defval="${sessionScope.numb }"  required="true"/>
		     		</div>
		     		<div class="form-group" align="left">  
						<label for="aae102">教师姓名  :</label>
				     	 <e:text styleClass="form-control" name="aae102" readonly="true" defval="${sessionScope.name }" required="true" />
		     		</div>
		     		<div class="form-group" align="left">  
						<label for="aac1005">成果名称  :</label>
				     	 <e:text styleClass="form-control" name="aac1005" defval="${ins.aac1005}" required="true"/>
		     		</div>
		     		<div class="form-group" align="left">  
						<label for="aac1004">备注 :</label>
		     		</div>
		     		<div class="form-group" align="left">  
				     	<e:textarea styleClass="form-control" name="aac1004" defval="${ins.aac1004}"  cols="40" rows="10"/>
		     		</div>
		    		<div class="form-group" align="center">
            			<button class="btn btn-success mr-2" type="submit" name="next" style="margin-left:30px">确认添加</button>
            			<button class="btn btn-secondary mr-2" type="submit"  name="next"
                		formaction="<%=path%>/EC1201QueryResult.html" 
                		formnovalidate="formnovalidate">取消返回</button>
     				</div> 
					<input type="hidden" name="aac1003" value="${empty filepath?'':filepath }">
					<input type="hidden" name="filepath" id="filepath" value="${filepath}">
				</div>
				<e:hidden name="qaac1001"/>
				<e:hidden name="qaae102"/>
				<e:hidden name="baac1002"/>
				<e:hidden name="eaac1002"/>		
				<e:hidden name="qaac203"/>	
			</div>
		</div>
	</form>
</div>
</c:otherwise>
</c:choose>

<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>