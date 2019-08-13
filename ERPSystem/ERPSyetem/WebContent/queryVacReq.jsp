<%@ page  language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>

<head>

    <title>�ݼ��������</title>

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
        .label
        {
            display:inline;
            padding:.2em .6em .3em;
            font-size:75%;
            font-weight:700;
            line-height:1;
            color:#fff;
            text-align:center;
            white-space:nowrap;
            vertical-align:baseline;
            border-radius:.25em
        }
        .label:empty{display:none}
        .btn .label{position:relative;top:-1px}
        .label-default{background-color:#777}
        .label-primary{background-color:#337ab7}
        .label-success{background-color:#5cb85c}
        .label-info{background-color:#5bc0de}
        .label-warning{background-color:#f0ad4e}
        .label-danger{background-color:#d9534f}
    </style>

    <c:choose>
         <c:when test="${empty sessionScope.role}">
             <jsp:forward page="login.jsp"></jsp:forward>
         </c:when>
         <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'�ݼٹ���')}">
             <jsp:forward page="menu.jsp"></jsp:forward>
         </c:when>
     </c:choose>

    <script type="text/javascript">
        function onRev(vaae401) {
            var vform=document.getElementById("showVacReq");
            vform.action="<%=request.getContextPath()%>/eF0404.html?aae401="+vaae401;
            vform.submit();
        }
    </script>

</head>

<body style="background-color: #F5F5F5">

<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
    <div class="card" style="max-width: 100%; " align="center">
        <div class="card-body" style="max-width:100%" align="center">
<form id="showVacReq" action="<%=request.getContextPath()%>/eF0401.html" method="post">

    <h4 align="center">�ݼ��������</h4>
    <!-- ��ѯ������ -->
    <table class="table-bordered" border="1" width="100%" align="center">

        <tr>
            <td colspan="8">
                ��ѯ����
            </td>
        </tr>

        <tr>
            <td style="width:80px;">����</td>
            <td style="min-width:150px">
                <e:text styleClass="form-control" name="qaae102" maxlength="6"/>
            </td>
            <td style="width:80px;">���</td>
            <td style="min-width:150px">
                <e:text styleClass="form-control" name="qaae103" maxlength="8"/>
            </td>
            <td style="width:80px;">��ʼ����[</td>
            <td>
                <e:date styleClass="form-control" name="baae405"/>
            </td>
            <td style="width:80px;">��ʼ����]</td>
            <td>
                <e:date styleClass="form-control" name="eaae405"/>
            </td>
        </tr>
        <tr>
            <td style="width:80px;">��������</td>
            <td style="min-width:150px">
                <e:select styleClass="form-control" name="qaae403" value="�¼�:1,����:2,�ݼ�:3,����:4" header="true"/>
            </td>
            <td style="width:80px;">���״̬</td>
            <td style="min-width:150px">
                <e:select styleClass="form-control" name="qaae407" value="δ���:1,���ͨ��:2,��˲�ͨ��:3" header="true" />
            </td>
            <td style="width:80px;">��������[</td>
            <td>
                <e:date styleClass="form-control" name="baae406"/>
            </td>
            <td style="width:80px;">��������]</td>
            <td>
                <e:date styleClass="form-control" name="eaae406"/>
            </td>
        </tr>

    </table>
    <!-- ���ݵ����� -->
    <table class="table-bordered" border="1" width="100%" align="center" id="vacReqTable">
        <tr>
            <th>���</th>
            <th>������</th>
            <th>����ʱ��</th>
            <th>��������</th>
            <th>����״̬</th>
            <th>��������</th>
            <th>����ʱ��</th>
            <th>������</th>
            <th>��ע</th>
            <th>����</th>

        </tr>

        <c:choose>
            <c:when test="${rows!=null}">
                <!-- ��ʾʵ�ʲ�ѯ�������� -->
                <c:forEach items="${rows}" var="ins" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${ins.aae102}</td>
                        <td>${ins.aae402}</td>
                        <td>${ins.cnaae403}</td>
                        <td>
                            <c:if test="${ins.cnaae407=='δ���'}" ><span class="label label-default">${ins.cnaae407}</span></c:if>
                            <c:if test="${ins.cnaae407=='���ͨ��'}" ><span class="label label-success">${ins.cnaae407}</span></c:if>
                            <c:if test="${ins.cnaae407=='��˲�ͨ��'}" ><span class="label label-danger">${ins.cnaae407}</span></c:if>
                        </td>
                        <td>${ins.aae408}</td>
                        <td>${ins.aae409}</td>
                        <td>${ins.ae0_aae102}</td>
                        <td>${ins.aae410}</td>
                        <c:choose>
                            <c:when test="${empty ins.ae0_aae102}">
                                <td>
                                    <button class="btn btn-success" onclick="onRev('${ins.aae401}')">����</button>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>

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
        var theTable = document.getElementById("vacReqTable");
        var txtValue = document.getElementById("Text1").value;
        var numberRowsInTable = ${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows))};
        var colunm = ${fn:length(rows)};
    </script>

    <!-- ���ܰ�ť�� -->
    <div style="width:100%;margin-top: 25px;float:left" align="center" >
        <div class="form-group" align="center" >
            <button type="submit" name="next" class="btn btn-success">��ѯ</button>
        </div>
    </div>
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
