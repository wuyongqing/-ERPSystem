<%@ page pageEncoding="GBK" language="java" %>
<%@ page import="com.neusoft.system.tools.Tools" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>物资申请</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

     <c:choose>
        <c:when test="${empty sessionScope.role}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:when>
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'个人物资申请')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>
<div style="width:100%" align="center">
<form class="forms-sample" name="addSupReq" action="<%=request.getContextPath()%>/eF0702.html" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
        <h4 align="center">
            物资申请
        </h4>

        <div class="form-group" align="left">
            <label for="aae502">物资名 :</label>
            <select class="form-control" name="aae502" id="aae502" required="required">
                <%
                    try
                    {
                        List<Map<String,String>> rows=Tools.getSupplies();
                        for (Map<String,String> ins:rows)
                        {
                %>
                <option value="<%=ins.get("aae502")%>"><%=ins.get("aae502")%>(<%=ins.get("aae503")%>)</option>
                <%
                        }
                    }
                    catch (Exception e)
                    {
                        e.printStackTrace();
                    }
                %>
            </select>
        </div>

        <div class="form-group" align="left">
            <label for="aac603">申请数量 :</label>
            <e:number styleClass="form-control" step="1" onchange="if(value.length>8)value=value.slice(0,8)" name="aac603" id="aac603" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aac604">申请原因 :</label>
            <e:text styleClass="form-control" name="aac604" id="aac604" maxlength="25" required="true"/>
        </div>

        <div class="form-group" align="center">
            <button type="submit" class="btn btn-success mr-2" name="next">提交</button>
            <button type="submit" class="btn btn-secondary mr-2" name="next"
                    formaction="<%=request.getContextPath()%>/eF0601.html"
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
