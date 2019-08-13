<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>

<html>
<head>
<title>教研方案</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
<style type="text/css">
     tr
     {
        height:38px;
        min-width:60px;
        font-size:15;
     }
     td
     {
         text-align:center;
         min-width:60px;
         height:38px;
     }
   </style>
<script>
		var count=0;
		function onSelect(vstate)
		{
			  vstate?count++:count--;
			  var vdel=document.getElementById("del");
			  vdel.disabled=(count==0);
		}	
        
		function onEdit(vaac301,vaac401,vaac303)
		{
			 var vform = document.getElementById("myform");
			 vform.action="<%=path%>/EC0901FindByIdActivity.html?maac301="+vaac301+"&aac401="+vaac401+"&aac303="+vaac303;
			 vform.submit();
		} 
		function onDel(vaac401,vaac301)
		{
			   var vform = document.getElementById("myform");
			   vform.action="<%=path%>/EC0901DelByIdActivity.html?aac401="+vaac401+"&uaac301="+vaac301;
			   vform.submit();
		}
		function onAdd(vaac301,vaac401)
		{
			 var vform = document.getElementById("myform");
			 vform.action="<%=path%>/addActivityEC0901.jsp?maac301="+vaac301+"&maac401="+vaac401;
			 vform.submit();
		}
		function onSubQuery(vaac301)
		{
			var vform = document.getElementById("myform");
			 vform.action="<%=path%>/EC0901FindByIdPlan.html?uaac301="+vaac301;
			 vform.submit();
		}
		function onSubmit(vaac301)
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/EC0901ModifyPlan.html?uaac301="+vaac301;
            vform.submit();
		}
		function onAddPlan()
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/EC0901AddPlan.html";
			vform.submit();
		}		
</script>
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>
<div class="col-md-6 grid-margin stretch-card" style="max-width:100%;min-height:100%" align="center">
      <div class="card" style="max-width:100%; " align="center">
           <div class="card-body" style="max-width:100%" align="center">
           <form id="myform" action="<%=path%>/addPlanEC0901.html" method="post">
	      		<h4 align="center">教研方案</h4>
	      		<div align="center" style="margin-top:30px;">
	                <c:if test="${!empty param.uaac301 }">
	                 	<label>方案编号 :</label>
	        			<e:text styleClass="form-control" style="width:100px" name="aac301"  readonly="true" defval="${param.uaac301 }"/>
	        		</c:if>
	                <label style="margin-left: 15px;">方案名称 :</label>
	        		<e:text styleClass="form-control" maxlength="15" style="width:100px" name="aac302" required="true" autofocus="true" defval="${ins.aac302 }" />
	        		<label style="margin-left: 15px;">发起人 :</label>
	        		<e:text styleClass="form-control" name="faae102" required="true"  readonly="true" style="width:100px" defval="${sessionScope.name }"/>
	        		<label style="margin-left: 15px;">审核状态 :</label>
	        		<e:text styleClass="form-control" name="fvalue" readonly="true" style="width:100px" defval="${empty param.uaac301?'无':ins.fvalue}"/>
	        		<input type="hidden" name="type" value="${ins.fvalue }">
          		</div>
			    <c:choose>
			    <c:when test="${empty param.uaac301 }"></c:when>
			    <c:otherwise>
					<div class="form-group" align="center" style="margin-top: 15px">
					<table class="table-bordered" border="1" width="100%" align="center">
						<tr>
							<td colspan="9">活动列表</td>
						</tr>
	  					<tr style="align:center">
	   						<td style="min-width:80px">查询条件</td>
	   						<td>活动地点</td>
	    					<td>
	      						<e:text styleClass="form-control"  name="qaac403" style="width:100%"/>
	    					</td>
	    					<td>组织人</td>
						    <td>
						      <e:text styleClass="form-control" name="qaae102" style="width:100%"/>
						    </td>
						   	<td>开始时间</td>
						    <td>
						      <e:date styleClass="form-control" name="baac402" style="width:100%"/>
						    </td>
						    <td>结束时间</td>
						    <td style="text-align:left">
						      <e:date styleClass="form-control" name="eaac402" style="width:100%"/>
						    </td>
	    				</tr>
	    			</table>
	    			<table id="planlist"class="table-bordered" border="1" width="100%" align="center">
	  					<tr>
	   						 <td></td>
	   						 <td>序号</td>
						     <td>活动时间</td>
						     <td>活动地点</td>
						     <td>组织人</td>
						     <td>参与人</td>
						     <td>详细内容</td>
						     <td colspan="2">功能区</td>
						</tr>
	   				<c:choose>
	     				<c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
						     <c:forEach items="${rows }" var="subins" varStatus="vs">
					    	   	  <tr>
					    	   	    <td>
					    	   	    <input type="checkbox" name="idlist" value="${subins.aac401 }"
								             onclick="onSelect(this.checked)" >
					    	   	    </td> 
								    <td>${vs.count}</td>
								    <td>${subins.aac402}</td>
								    <td>${subins.aac403}</td>
								    <td>${subins.aae102}</td>
								    <td>学生</td>
								     <td>
								    <!-- #  空锚 -->
								      <button class="btn btn-primary mr-2" onclick="onEdit('${param.uaac301}','${subins.aac401 }','${ins.aac303 }')">查看</button>
								      </td>
								    <td>
								    <c:choose>
								    <c:when test="${ins.aac303==1 }">    
								         不可删除
								    </c:when>
								    <c:otherwise>
								    <button class="btn btn-danger mr-2"  onclick="onDel('${subins.aac401}','${param.uaac301}')" id="up">删除</button>
								    </c:otherwise>
								    </c:choose>
								    </td>
								  </tr>
						      </c:forEach>
						      <!-- 补充空行 -->
						      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="10">
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
				</div>
				<div class="form-group" align="center" >
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
				    <script type="text/javascript">
				            var theTable = document.getElementById("planlist");
				            var txtValue = document.getElementById("Text1").value;
				            var numberRowsInTable = ${(fn:length(rows)%10>0)?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows)) };//表格最大行数
				            var colunm=${fn:length(rows) };
				    </script>
    			</c:otherwise>
			</c:choose>
		<div style="width:100%;margin-top: 25px;float:left" align="center" >	
    	<div class="form-group" align="center" >
	         <c:choose>
	         <c:when test="${!empty param.uaac301 }">
	              <button type="submit"  class="btn btn-primary mr-2" 
		                     onclick="onSubQuery('${ins.aac301}')">查询</button>
		          <c:if test="${ins.aac303!='1' }">            
				    <button type="submit"  class="btn btn-success mr-2" 
				                  onclick="onAdd('${param.uaac301}','${subins.aac401}')">添加活动</button>
				    <button type="submit" id="del" class="btn btn-danger mr-2" 
				                  formaction="<%=path%>/EC0901DelActivity.html?uaac301=${param.uaac301}"  disabled="disabled">批量删除</button>
			      </c:if>            
	         </c:when>
	         </c:choose>
	         <c:if test="${ins.aac303!='1' }"> 
	              <c:choose>
	                 <c:when test="${empty param.uaac301}">
	                     <button type="submit" name="next" class="btn btn-success mr-2"  
			                   onclick="onAddPlan()">添加方案</button>
	                 </c:when>
	                 <c:otherwise>
	                    <button type="submit" name="next" class="btn btn-success mr-2"  
			                   onclick="onSubmit('${param.uaac301}')">修改方案</button>
	                 </c:otherwise>
	              </c:choose>            
	           </c:if>
	           <button type="submit" name="next" class="btn btn-secondary mr-2" 
	                   formaction="<%=path%>/EC0901QueryPlan.html" formnovalidate="formnovalidate">
	                   ${empty param.uaac301?'取消':'返回' }</button>
            </div>
            </div>
         </form>
    	</div>
	</div>
</div>
<script type="text/javascript" src="js/Pagging.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>