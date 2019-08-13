<%@ page pageEncoding="GBK" language="java" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Ա����Ϣ${empty param.aae101?'����':'����'}</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

    <c:choose>
        <c:when test="${empty sessionScope.role}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:when>
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'Ա������')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>

    <style type="text/css">
        msg{
            color: crimson;
        }
        hh{
            color: red;
        }
    </style>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div><div style="width:100%" align="center">
<form class="forms-sample" name="addNModEmp" action="<%=request.getContextPath()%>/eF0202.html" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
        <h4 align="center">
            Ա����Ϣ${empty param.aae101?'����':'����'}
        </h4>

        <div class="form-group" align="left">
            <label for="aae102">���� :</label>
            <e:text styleClass="form-control" name="aae102" id="aae102" maxlength="6" autofocus="true" required="true" defval="${ins.aae102}"/>
        </div>

        <div class="form-group" align="left">
            <label for="cnaae301">����(<hh>ȫ��</hh>) :</label>
            <e:text styleClass="form-control" name="cnaae301" id="cnaae301" maxlength="8" readonly="${!empty param.aae101}" defval="${ins.cnaae301}"/>
        </div>

        <c:if test="${!empty param.aae101}">
            <div class="form-group" align="left">
                <label for="aae103">��� :</label>
                <e:text styleClass="form-control" name="aae103" id="aae103" maxlength="8" readonly="true" defval="${ins.aae103}"/>
            </div>
        </c:if>

        <div class="form-group" align="left">
            <label for="aae104">���� :</label>
            <e:date styleClass="form-control" name="aae104" id="aae104" required="true" defval="${ins.aae104}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae105">�Ա� :</label>
            <e:select styleClass="form-control" name="aae105" id="aae105" value="��:1,Ů:2,��ȷ��:3" defval="${empty param.aae101?'1':ins.aae105}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae106">���� :</label>
            <e:select styleClass="form-control" name="aae106" id="aae106" value="����:1,�ɹ���:2,����:3,����:4,ά�����:5,
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
	      ��ŵ��:56,����:97,���Ѫͳ:98" defval="${ins.aae106}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae107">���� :</label>
            <e:text styleClass="form-control" name="aae107" id="aae107" maxlength="15" required="true" defval="${ins.aae107}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae1114">���֤�� :</label>
            <e:text styleClass="form-control" name="aae1114" id="aae1114" maxlength="20" required="true" defval="${ins.aae1114}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae108">�ֻ����� :</label>
            <e:text styleClass="form-control" name="aae108" id="aae108" maxlength="15" required="true" defval="${ins.aae108}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae109">�����ʼ� :</label>
            <e:email styleClass="form-control" name="aae109" id="aae109" maxlength="25" required="true" defval="${ins.aae109}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae1110">ְ�� :</label>
            <c:choose>
                <c:when test="${empty param.aae101}">
                    <e:select styleClass="form-control" name="aae1110" id="aae1110" value="һ��Ա��:1,��������:2,��ʦ:3,������:4,����:5"/>
                </c:when>
                <c:otherwise>
                    <e:text styleClass="form-control" name="aae1110" id="aae1110" readonly="true" defval="${ins.pos}"/>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="form-group" align="left">
            <label for="aae1111">��������(��λ:Ԫ/��) :</label>
            <e:number styleClass="form-control" name="aae1111" id="aae1111" onchange="if(value.length>8)value=value.slice(0,8)" step="0.01" required="true" defval="${ins.aae1111}"/>
        </div>

        <c:if test="${!empty param.aae101}">
        <div class="form-group" align="left">
            <label for="aae1112">״̬ :</label>
            <e:select name="aae1112" id="aae1112" styleClass="form-control" value="����:1,�ݼ�:2${(ins.aae1112+1)==4?',��ְ:3':''}"
                           defval="${ins.aae1112}"/>
        </div>
        </c:if>

        <div class="form-group" align="left">
            <label for="aae1113">��ע :</label>
            <e:textarea styleClass="form-control" name="aae1113" id="aae1113" rows="6" cols="30" defval="${ins.aae1113}"/>
        </div>

        <c:if test="${empty param.aae101}">
            <div class="form-group" align="left">
                <label for="aae205">��ְ���� :</label>
                <e:date styleClass="form-control" name="aae205" id="aae205" required="true"/>
            </div>
        </c:if>

        <div class="form-group" align="center">
            <c:if test="${(ins.aae1112+1)!=4}">
                <button type="submit" name="next" class="btn btn-success mr-2"
                        formaction="<%=request.getContextPath()%>/${empty param.aae101?'eF0202':'eF0203'}.html">${empty param.aae101?'����':'����'}</button>
            </c:if>
            <button type="submit" class="btn btn-secondary mr-2" name="next"
                   formaction="<%=request.getContextPath()%>/eF0201.html"
                    formnovalidate="formnovalidate">����</button>
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
