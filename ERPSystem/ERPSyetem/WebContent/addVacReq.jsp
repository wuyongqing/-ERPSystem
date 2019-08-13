<%@ page pageEncoding="GBK" language="java" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>休假申请</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

    <c:choose>
        <c:when test="${empty sessionScope.role}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:when>
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'个人休假申请')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div><div style="width:100%" align="center">
<form class="forms-sample" name="addVacReq" action="<%=request.getContextPath()%>/eF0402.html" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
        <h4 align="center">
            休假申请
        </h4>

        <div class="form-group" align="left">
            <label for="aae403">请假类型 :</label>
            <e:select styleClass="form-control" name="aae403" id="aae403" value="事假:1,病假:2,休假:3,其他:4" required="true" defval="1"/>
        </div>



        <div class="form-group" align="left">
            <label for="aae404">请假原因 :</label>
            <e:text styleClass="form-control" maxlength="25" name="aae404" id="aae404" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae405">开始时间 :</label>
            <e:date styleClass="form-control" name="aae405" id="aae405" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae406">结束时间 :</label>
            <e:date styleClass="form-control" name="aae406" id="aae406" required="true"/>
        </div>

        <div class="form-group" align="center">
            <button type="submit" class="btn btn-success mr-2" name="next">提交</button>
            <button type="submit" class="btn btn-secondary mr-2" name="next"
                   formaction="<%=request.getContextPath()%>/eF0501.html"
                    formnovalidate="formnovalidate">返回</button>
        </div>

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
