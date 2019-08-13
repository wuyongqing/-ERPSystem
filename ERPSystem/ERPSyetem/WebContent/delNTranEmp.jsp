<%@ page pageEncoding="GBK" language="java" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>员工${param.tag!=1?'离职':'职务变更'}</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

    <style type="text/css">
        hh{
            color: red;
        }
    </style>

    <c:choose>
        <c:when test="${empty sessionScope.role}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:when>
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'员工管理')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>

</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div><div style="width:100%" align="center">
<form class="forms-sample" name="delNTranEmp" action="<%=request.getContextPath()%>/eF0202.html" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
        <h4 align="center">
            ${param.tag!=1?'离职':'职务变更'}信息
        </h4>

        <div class="form-group" align="left">
            <label for="aae102">姓名 :</label>
            <e:text styleClass="form-control" name="aae102" id="aae102" readonly="true" defval="${ins.aae102}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae103">编号 :</label>
            <e:text styleClass="form-control" name="aae103" id="aae103" readonly="true" defval="${ins.aae103}"/>
        </div>

        <div class="form-group" align="left">
            <label for="cnaae301">原部门 :</label>
            <e:text styleClass="form-control" name="cnaae301" id="cnaae301" readonly="true" defval="${ins.cnaae301}"/>
        </div>

        <div class="form-group" align="left">
            <label for="ncnaae301">新部门(<hh>全名</hh>) :</label>
            <e:text styleClass="form-control" name="ncnaae301" id="ncnaae301" maxlength="8" required="true" defval="${param.tag!=1?'无':ins.cnaae301}" readonly="${param.tag!=1}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae1110">原职务 :</label>
            <e:select styleClass="form-control" name="aae1110" id="aae1110" value="无:0,一般员工:1,部门主管:2,教师:3,班主任:4,安保人员:5"
                      defval="${ins.aae1110}" readonly="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="naae1110">新职务 :</label>
            <e:select styleClass="form-control" name="naae1110" id="naae1110" value="无:0,一般员工:1,部门主管:2,教师:3,班主任:4,安保人员:5"
                      defval="${param.tag!=1?'0':ins.aae1110}" readonly="${param.tag!=1}" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae1111">原工资 :</label>
            <e:number styleClass="form-control" name="aae1111" id="aae1111" step="0.01" readonly="true" defval="${ins.aae1111}"/>
        </div>

        <div class="form-group" align="left">
            <label for="naae1111">新工资 :</label>
            <e:number styleClass="form-control" name="naae1111" id="naae1111" step="0.01" onchange="if(value.length>8)value=value.slice(0,8)" required="true" defval="${param.tag!=1?'0':ins.aae1111}" readonly="${param.tag!=1}"/>
            (单位:元/月)
        </div>

        <div class="form-group" align="left">
            <label for="aae204">变更原因 :</label>
            <e:textarea styleClass="form-control" name="aae204" id="aae204" rows="6" cols="30" required="true" defval="${param.tag!=1?'离职':''}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae205">变更日期 :</label>
            <e:date styleClass="form-control" name="aae205" id="aae205" required="true"/>
        </div>

        <div class="form-group" align="center">
            <button type="submit" class="btn btn-success mr-2" name="next"
                    formaction="<%=request.getContextPath()%>/${param.tag!=1?'eF0207.html?tag=0':'eF0206.html?tag=1'}">确定</button>
            <button type="submit" class="btn btn-secondary mr-2" name="next"
                   formaction="<%=request.getContextPath()%>/eF0201.html"
                    formnovalidate="formnovalidate">返回</button>
        </div>

    <input type="hidden" name="aae101" value="${param.aae101}">
    <e:hidden name="qaae102"/>
    <e:hidden name="qaae103"/>
    <e:hidden name="qaae105"/>
    <e:hidden name="qaae106"/>
    <e:hidden name="baae104"/>
    <e:hidden name="eaae104"/>
    <e:hidden name="qaae1110"/>
    <e:hidden name="qaae1112"/>
    <e:hidden name="qcnaae301"/>
    <e:hidden name="qaae1114"/>
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

