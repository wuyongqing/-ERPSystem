<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<html>
<head>
<title>缴费信息</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div align="center">
<form id="myform" action="<%=path%>/EB0101AddPay.html" method="post">
<div class="col-10 grid-margin stretch-card" >
                <div class="card" style="width:60%;"align="center">
                  <div class="card-body" style="width:60%;" align="center">
                    <h4 align="center">缴费信息</h4>
                    <c:if test="${!empty param.aad201 }">
                      <div class="form-group" align="left">
                        <label for="aad201" >缴费单号  :</label>
                        <e:text styleClass="form-control" id="aad201" name="aad201" readonly="true" defval="${ins.aad201}" />
                      </div>
                      </c:if>
                      <input type="hidden" name="aab101" value="${ins.aab101 }">
                      <div class="form-group" align="left">
                        <label for="aab103">学生学号 :</label>
                        <e:text styleClass="form-control" id="aab103" name="aab103"  required="true" readonly="${param.aad204==0&&param.aad207==1?false:true}" defval="${ins.aab103}"/>
                      </div>
                      <div class="form-group" align="left">
                        <label for="aab102">学生姓名 :</label>
                        <e:text styleClass="form-control" id="aab102" name="aab102" required="true" readonly="${param.aad204==0&&param.aad207==1?false:true }" defval="${ins.aab102}"/>
                      </div>
                      <div class="form-group" align="left">
                        <label for="aad202">缴费名称 :</label>
                        <e:text styleClass="form-control" maxlength="8" id="aad202" name="aad202" required="true" readonly="${param.aad204==0&&param.aad207==1?false:true}" defval="${ins.aad202}"/>
                      </div>
                      <div class="form-group" align="left">
                        <label for="aad203">缴费金额 :</label>
                        <e:number step="1" styleClass="form-control" id="aad203" name="aad203" required="true" readonly="${param.aad204==0&&param.aad207==1?false:true }" defval="${ins.aad203}"/>
                      </div>
                       <c:if test="${!empty param.aad201 }">
                      <div class="form-group" align="left">
                        <label for="aad204">缴费状态 :</label>
                        <e:text styleClass="form-control" id="value1" name="value1" required="true" readonly="true" defval="${ins.value1}"/>
                      </div>
                      </c:if>
                      <div class="form-group" align="left">
                        <label for="aad206">备注</label>
                        <e:textarea styleClass="form-control" id="aad206" name="aad206" cols="20" rows="6" defval="${ins.aad206}"/>
                      </div>
                      <div class="form-group" align="center">
                      <c:choose>
               			<c:when test="${empty param.aad201 }">
                       		<button type="submit" name="next" class="btn btn-success mr-2"
			              		formaction="<%=path%>/EB0101AddPay.html">添加 </button>
               			</c:when>
               			<c:otherwise>
                    		<c:choose>
                    			<c:when test="${param.aad204==0}">
                      				 <c:if test="${param.aad207==1}">
					       				<button type="submit" name="next" class="btn btn-success mr-2"
					              				formaction="<%=path%>/EB0101ModifyPay.html?aad204=${param.aad204}&aad207=${param.aad207}">修改</button>
				       				</c:if>
	                			</c:when>
	               			</c:choose>
               			</c:otherwise>
            		</c:choose>  
            		<c:if test="${param.aad204==0&&param.ifpay==1 }">
              			<button type="submit" name="next" class="btn btn-success mr-2"
			              	onclick="onGet('${ins.aad201}')">缴费 </button>
			 		</c:if>
                      <button type="submit" class="btn btn-secondary mr-2" name="next" formaction="<%=path%>/EB0101QueryPay.html"
                       formnovalidate="formnovalidate">返回</button>
                      </div>
                  </div>
                </div>
              </div>
</form>
</div>
<script type="text/javascript">
function onGet()
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/EB0101GetPay.html";
	 vform.submit();
} 
</script>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>