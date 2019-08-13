<%@ page pageEncoding="GBK" language="java" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>休假申请审批</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

    <c:choose>
         <c:when test="${empty sessionScope.role}">
             <jsp:forward page="login.jsp"></jsp:forward>
         </c:when>
         <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'休假管理')}">
             <jsp:forward page="menu.jsp"></jsp:forward>
         </c:when>
     </c:choose>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div><div style="width:100%" align="center">
<form class="forms-sample" name="showVacReq" action="<%=request.getContextPath()%>/eF0403.html" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
        <h4 align="center">
            休假申请审批
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
            <label for="aae402">申请时间 :</label>
            <e:date styleClass="form-control" name="aae402" id="aae402" readonly="true" defval="${ins.aae402}"/>
        </div>

        <div class="form-group" align="left">
            <label for="cnaae403">申请类型 :</label>
            <e:text styleClass="form-control" name="cnaae403" id="cnaae403" readonly="true" defval="${ins.cnaae403}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae404">请假原因 :</label>
            <e:textarea styleClass="form-control" name="aae404" id="aae404" readonly="true" rows="6" cols="30" defval="${ins.aae404}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae405">开始时间 :</label>
            <e:date styleClass="form-control" name="aae405" id="aae405" readonly="true" defval="${ins.aae405}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae406">结束时间 :</label>
            <e:date styleClass="form-control" name="aae406" id="aae406" readonly="true" defval="${ins.aae406}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae407">审批意见 :</label>
            <e:select styleClass="form-control" name="aae407" id="aae407" value="审核通过:2,审核不通过:3" required="true" defval="1"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae408">审批理由 :</label>
            <e:text styleClass="form-control" maxlength="20" name="aae408" id="aae408"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae410">备注 :</label>
            <e:textarea styleClass="form-control" name="aae410" id="aae410" rows="6" cols="30"/>
        </div>

        <div class="form-group" align="center">
            <button type="submit" class="btn btn-success mr-2" name="next">提交</button>
            <button type="submit" class="btn btn-secondary mr-2" name="next"
                   formaction="<%=request.getContextPath()%>/eF0401.html"
                    formnovalidate="formnovalidate">返回</button>
        </div>



    <input type="hidden" name="aae401" value="${param.aae401}">

    <e:hidden name="qaae102"/>
    <e:hidden name="qaae103"/>
    <e:hidden name="qaae403"/>
    <e:hidden name="qaae407"/>
    <e:hidden name="baae405"/>
    <e:hidden name="eaae405"/>
    <e:hidden name="baae406"/>
    <e:hidden name="eaae406"/>

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
