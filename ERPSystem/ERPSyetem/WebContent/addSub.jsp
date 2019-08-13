<%@ page pageEncoding="GBK" language="java" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>�½�����</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

     <c:choose>
        <c:when test="${empty sessionScope.role}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:when>
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'ѧ������')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>

</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px">
<label id="msg1">${msg }</label></div>
<div style="width:100%" align="center">
<form class="forms-sample" name="addSup" action="<%=request.getContextPath()%>/eE0202.html" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
        <h4 align="center">
            �½�����
        </h4>

        <div class="form-group" align="left">
            <label for="aae804">ѧ������ :</label>
            <e:text styleClass="form-control" name="aae804" id="aae804" maxlength="6" autofocus="true" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab104">���֤�� :</label>
            <e:text styleClass="form-control" name="aab104" id="aab104" maxlength="20" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab105">���� :</label>
            <e:date styleClass="form-control" name="aab105" id="aab105" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab106">�Ա� :</label>
            <e:select styleClass="form-control" name="aab106" id="aab106" value="��:��,Ů:Ů"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab107">���� :</label>
            <e:select styleClass="form-control" name="aab107" id="aab107" value="����:1,�ɹ���:2,����:3,����:4,ά�����:5,
	      ����:6,����:7,׳��:8,������:9,������:10,
	      ����:11,����:12,����:13,����:14,������:15,
	      ������:16,��������:17,����:18,����:19,������:20,
	      ����:21,���:22,��ɽ��:23,������:24,ˮ��:25,
	      ������:26,������:27,������:28,�¶�������:29,����:30,
	      ���Ӷ���:31,������:32,Ǽ��:33,������:34,������:35,
	      ë����:36,������:37,������:38,������:39,������:40,
	      ��������:41,ŭ��:42,���α����:43,����˹��:44,���¿���:45,
	      ������:46,������:47,ԣ����:48,����:49,��������:50,
	      ������:51,���״���:52,������:53,�Ű���:54,�����:55,
	      ��ŵ��:56,����:97,���Ѫͳ:98"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab108">���� :</label>
            <e:text styleClass="form-control" name="aab108" id="aab108" maxlength="20" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab109">�ֻ����� :</label>
            <e:text styleClass="form-control" name="aab109" id="aab109" maxlength="15" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab110">�����ʼ� :</label>
            <e:email styleClass="form-control" name="aab110" id="aab110" maxlength="25" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab112">�໤�� :</label>
            <e:text styleClass="form-control" name="aab112" id="aab112" maxlength="6" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab113">�໤�˵绰 :</label>
            <e:text styleClass="form-control" name="aab113" id="aab113" maxlength="15" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae803">�����ص� :</label>
            <e:text styleClass="form-control" name="aae803" id="aae803" maxlength="20" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae805">�����γ� :</label>
            <e:text styleClass="form-control" name="aae805" id="aae805" required="true" defval="${param.aab302}" readonly="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae806">��ע :</label>
            <e:textarea styleClass="form-control" name="aae806" id="aae806" rows="6" cols="30"/>
        </div>

        <div class="form-group" align="center">
            <button type="submit" class="btn btn-success mr-2" name="next">�ύ</button>
            <button type="submit" class="btn btn-secondary mr-2" name="next" formaction="<%=request.getContextPath()%>/eA0301QueryForSub.html"
                    formnovalidate="formnovalidate">����</button>
        </div>

    <input hidden="hidden" name="aab111" value="${param.aab301 }">


    <e:hidden name="qaab302"/>
    <e:hidden name="qaab303"/>
    <e:hidden name="qteacher"/>
    <e:hidden name="qheadmaster"/>
    <e:hidden name="qcourse"/>
    <e:hidden name="qaab3011"/>
    <e:hidden name="baab306"/>
    <e:hidden name="eaab306"/>

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
