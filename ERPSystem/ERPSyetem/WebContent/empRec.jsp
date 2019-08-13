<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>

    <title>������Ϣ</title>

    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">
    <style type="text/css">
        tr
        {
            height:38px;
            font-size:15px;
        }
        td,th
        {
            text-align:center;
            width:50px;
            height:38px;
        }
    </style>

     <c:choose>
        <c:when test="${empty sessionScope.role}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:when>
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'Ա������')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>

</head>

<body style="background-color: #F5F5F5">

<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div><div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
    <div class="card" style="max-width: 100%; " align="center">
        <div class="card-body" style="max-width:100%" align="center">

<form id="showEmpRec" action="<%=request.getContextPath()%>/eF0301.html" method="post">

    <h4 align="center">������Ϣ</h4>

    <table class="table-bordered" border="1" width="100%" align="center" id="empRec">

        <tr>
            <th>���</th>
            <th>����</th>
            <th>���</th>
            <th>ԭ����</th>
            <th>�²���</th>
            <th>ԭְ��</th>
            <th>��ְ��</th>
            <th>ԭ��</th>
            <th>ʱ��</th>
        </tr>

        <c:choose>
            <c:when test="${rows!=null}">

                <!-- ��ʾʵ�ʲ�ѯ�������� -->
                <c:forEach items="${rows}" var="ins" varStatus="vs">

                    <tr>

                        <td>${vs.count}</td>
                        <td>${ins.aae102}</td>
                        <td>${ins.aae103}</td>
                        <td>${ins.ocnaae301}</td>
                        <td>${ins.ncnaae301}</td>
                        <td>${ins.ocnaae1110}</td>
                        <td>${ins.ncnaae1110}</td>
                        <td>${ins.aae204}</td>
                        <td>${ins.aae205}</td>

                    </tr>

                </c:forEach>

                <!-- ������� -->
                <c:forEach begin="${fn:length(rows)+1 }" step="1" end="${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10): (fn:length(rows))}">
                    <tr>
                        <td></td>
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
                        <td></td>
                    </tr>
                </c:forEach>
            </c:otherwise>

        </c:choose>
    </table>

    <div class="form-group" align="center" style="margin-top:15px">
    <div class="gridItem" style="padding: 5px; width: 40%; float: left; text-align: right; height: 20px; font-size: 15px;" >
        ���� <span id="spanTotalInfor"></span> ����¼
        ��ǰ��<span id="spanPageNum"></span>ҳ
        ��<span id="spanTotalPage"></span>ҳ
    </div>
    <div class="gridItem" style="margin-left:50px;width: 40%;  padding: 5px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">
        <span id="spanFirst" >��ҳ</span>
        <span id="spanPre">��һҳ</span>
        <span id="spanInput" style="margin: 0px; padding: 0px 0px 4px 0px; height:100%; ">
               	 ��<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px" />ҳ
            </span>
        <span id="spanNext">��һҳ</span>
        <span  id="spanLast">βҳ</span>
    </div>
    </div>

    <script type="text/javascript">
        var theTable = document.getElementById("empRec");
        var txtValue = document.getElementById("Text1").value;
        var numberRowsInTable = ${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows))};
        var colunm = ${fn:length(rows)};
    </script>

    <!-- ���ܰ�ť�� -->
    <div style="width:100%;margin-top: 25px;float:left" align="center" >
        <div class="form-group" align="center" >
            <button type="submit" name="next" class="btn btn-secondary mr-2"
                    formaction="<%=request.getContextPath()%>/eF0201.html">����</button>
        </div>
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

</form>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/Pagging.js"></script>

<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>