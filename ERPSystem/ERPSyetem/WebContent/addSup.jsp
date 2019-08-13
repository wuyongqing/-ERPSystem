<%@ page pageEncoding="GBK" language="java" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>�½�������</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

    <c:choose>
         <c:when test="${empty sessionScope.role}">
             <jsp:forward page="login.jsp"></jsp:forward>
         </c:when>
         <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'���ʹ���')}">
             <jsp:forward page="menu.jsp"></jsp:forward>
         </c:when>
     </c:choose>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>
<div style="width:100%" align="center">
<form class="forms-sample" name="addSup" action="<%=request.getContextPath()%>/eF0802.html" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
        <h4 align="center">
            �½�������
        </h4>

        <div class="form-group" align="left">
            <label for="aae502">�������� :</label>
            <e:text styleClass="form-control" name="aae502" id="aae502" maxlength="10" autofocus="true" required="true"/>
        </div>



        <div class="form-group" align="left">
            <label for="aae504">��ע :</label>
            <e:textarea styleClass="form-control" name="aae504" id="aae504" rows="6" cols="30"/>
        </div>


        <div class="form-group" align="center">
            <button type="submit" class="btn btn-success mr-2" name="next">�ύ</button>
            <button type="submit" class="btn btn-secondary mr-2" name="next" formaction="<%=request.getContextPath()%>/eF0801.html"
                    formnovalidate="formnovalidate">����</button>
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
