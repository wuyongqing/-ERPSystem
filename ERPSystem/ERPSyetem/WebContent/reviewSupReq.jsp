<%@ page pageEncoding="GBK" language="java" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>物资申请审批</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

     <c:choose>
         <c:when test="${empty sessionScope.role}">
             <jsp:forward page="login.jsp"></jsp:forward>
         </c:when>
         <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'物资管理')}">
             <jsp:forward page="menu.jsp"></jsp:forward>
         </c:when>
     </c:choose>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div><div style="width:100%" align="center">
<form class="forms-sample" name="showSupReq" action="<%=request.getContextPath()%>/eF0703.html" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
        <h4 align="center">
            物资申请审批
        </h4>

        <div class="form-group" align="left">
            <label for="aae102">申请人 :</label>
            <e:text styleClass="form-control" name="aae102" id="aae102" readonly="true" defval="${ins.aae102}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae103">申请人编号 :</label>
            <e:text styleClass="form-control" name="aae103" id="aae103" readonly="true" defval="${ins.aae103}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aac602">申请时间 :</label>
            <e:date styleClass="form-control" name="aac602" id="aac602" readonly="true" defval="${ins.aac602}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae502">申请物资 :</label>
            <e:text styleClass="form-control" name="aae502" id="aae502" readonly="true" defval="${ins.aae502}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aac603">申请数量 :</label>
            <e:text styleClass="form-control" name="aac603" id="aac603" readonly="true" defval="${ins.aac603}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aac604">申请理由 :</label>
            <e:text styleClass="form-control" name="aac604" id="aac604" readonly="true" defval="${ins.aac604}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aac605">审批意见 :</label>
            <e:select styleClass="form-control" name="aac605" id="aac605" value="审核通过:2,审核不通过:3" required="true" defval="1"/>
        </div>

        <div class="form-group" align="left">
            <label for="aac607">审批理由 :</label>
            <e:text styleClass="form-control" name="aac607" id="aac607" maxlength="20"/>
        </div>

        <div class="form-group" align="left">
            <label for="aac608">备注 :</label>
            <e:textarea styleClass="form-control" name="aac608" id="aac608" rows="6" cols="30"/>
        </div>

        <div class="form-group" align="center">
            <button type="submit" class="btn btn-success mr-2" name="next">提交</button>
            <button type="submit" class="btn btn-secondary mr-2" name="next"
                   formaction="<%=request.getContextPath()%>/eF0701.html"
                    formnovalidate="formnovalidate">返回</button>
        </div>


    <input type="hidden" name="aac601" value="${param.aac601}">

    <e:hidden name="qaae102"/>
    <e:hidden name="qaae103"/>
    <e:hidden name="qaae502"/>
    <e:hidden name="qaac605"/>
    <e:hidden name="baac602"/>
    <e:hidden name="eaac602"/>

            </div>
        </div>
    </div>
</form>
</div>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>
