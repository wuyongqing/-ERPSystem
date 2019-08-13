<%@ page  language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>

    <title>Ա������</title>

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
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'Ա������')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>

	<script type="text/javascript">

        function onMod(vaae101) {
            var vform=document.getElementById("showEmp");
            vform.action="<%=request.getContextPath()%>/eF0204.html?aae101="+vaae101;
            vform.submit();
        }

        function onTran(vaae101) {
            var vform=document.getElementById("showEmp");
            vform.action="<%=request.getContextPath()%>/eF0205.html?aae101="+vaae101+"&tag=1";
            vform.submit();
        }

        function onDel(vaae101) {
            var vform=document.getElementById("showEmp");
            vform.action="<%=request.getContextPath()%>/eF0205.html?aae101="+vaae101+"&tag=0";
            vform.submit();
        }

        function onRec(vaae101) {
            var vform=document.getElementById("showEmp");
            vform.action="<%=request.getContextPath()%>/eF0301.html?aae101="+vaae101;
            vform.submit();
        }
    </script>

</head>

<body style="background-color: #F5F5F5">

<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
    <div class="card" style="max-width: 100%; " align="center">
        <div class="card-body" style="max-width:100%" align="center">
<form id="showEmp" action="<%=request.getContextPath()%>/eF0201.html" method="post">

    <h4 align="center">Ա��${param.dep==1?'�嵥':'����'}</h4>
    <!-- ��ѯ������ -->

	<table class="table-bordered" border="1" width="100%" align="center">

    <c:if test="${param.dep!=1}">

        <tr>
            <td colspan="12">
                ��ѯ����
            </td>
        </tr>

	  <tr>
	    <td style="width:100px;">����</td>
	    <td style="min-width:150px">
	      <e:text styleClass="form-control" name="qaae102" maxlength="6"/>
	    </td>
	    <td style="width:100px;">���</td>
	    <td style="min-width:150px">
	      <e:text styleClass="form-control" name="qaae103" maxlength="8"/>
	    </td>

          <td>�Ա�</td>
          <td>
              <e:select styleClass="form-control" name="qaae105" value="��:1,Ů:2,��ȷ��:3" header="true"/>
          </td>
          <td>����</td>
          <td>
              <e:select styleClass="form-control" name="qaae106" value="����:1,�ɹ���:2,����:3,����:4,ά�����:5,
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
	      ��ŵ��:56,����:97,���Ѫͳ:98" header="true" />
          </td>

          <td>ְ��</td>
          <td style="min-width:150px">
              <e:select styleClass="form-control" name="qaae1110" value="һ��Ա��:1,��������:2,��ʦ:3,������:4,����:5" header="true" />
          </td>

	  </tr>

	  <tr>
          <td style="width:100px;">��������</td>
          <td style="min-width:150px">
              <e:text styleClass="form-control" name="qcnaae301" maxlength="8"/>
          </td>
          <td style="width:100px;">���֤��</td>
          <td style="min-width:150px">
              <e:text styleClass="form-control" name="qaae1114" maxlength="20"/>
          </td>

	    <td>����[</td>
	    <td>
	      <e:date styleClass="form-control" name="baae104"/>
	    </td>
	    <td>����]</td>
	    <td>
	      <e:date styleClass="form-control" name="eaae104"/>
	    </td>

          <td>״̬</td>
          <td style="min-width:150px">
              <e:select styleClass="form-control" name="qaae1112" value="����:1,�ݼ�:2,��ְ:3" header="true" />
          </td>
	  </tr>

	</table>
    </c:if>
	<!-- ���ݵ����� -->
	<table class="table-bordered" border="1" width="100%" align="center" id="empTable">
	  <tr>
	    <th>���</th>
	    <th>����</th>
	    <th>����</th>
        <th>���</th>
	    <th>�Ա�</th>
	    <th>����</th>
        <th>����</th>
        <th>ְ��</th>
	    <th>״̬</th>

        <c:if test="${empty param.dep}">
          <th colspan="4">����</th>
        </c:if>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null}">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows}" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count}</td>
				    <td>${ins.aae102}</td>
				    <td>${ins.cnaae301}</td>
                    <td>${ins.aae103}</td>
				    <td>${ins.cnaae105}</td>
				    <td>${ins.cnaae106}</td>
				    <td>${ins.aae107}</td>
                    <td>${ins.cnaae1110}</td>
                      <td>
                          <c:choose>
                              <c:when test="${ins.cnaae1112=='����'}">
                                  <span class="label label-success">${ins.cnaae1112}</span>
                              </c:when>
                              <c:when test="${ins.cnaae1112=='�ݼ�'}">
                                  <span class="label label-warning">${ins.cnaae1112}</span>
                              </c:when>
                              <c:otherwise>
                                  <span class="label label-danger">${ins.cnaae1112}</span>
                              </c:otherwise>
                          </c:choose>
                      </td>


                  <c:if test="${empty param.dep}">

                          <td>
                              <button class="btn btn-primary" onclick="onMod('${ins.aae101}')">�鿴</button>
                          </td>

                          <td>
                              <button class="btn btn-primary" onclick="onRec('${ins.aae101}')">����</button>
                          </td>

                          <td>
                              <c:choose>
                                  <c:when test="${ins.cnaae1112!='��ְ'}">
                                      <button class="btn btn-warning" onclick="onTran('${ins.aae101}')">��ְ</button>
                                  </c:when>
                                  <c:otherwise>
                                      <button class="btn btn-warning disabled" disabled="disabled">��ְ</button>
                                  </c:otherwise>
                              </c:choose>

                          </td>

                          <td>
                              <c:choose>
                                  <c:when test="${ins.cnaae1112!='��ְ'}">
                                      <button class="btn btn-warning" onclick="onDel('${ins.aae101}')">��ְ</button>
                                  </c:when>
                                  <c:otherwise>
                                      <button class="btn btn-warning disabled" disabled="disabled">��ְ</button>
                                  </c:otherwise>
                              </c:choose>
                          </td>

                  </c:if>


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
                       <c:if test="${empty param.dep}">
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                       </c:if>
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
                   <c:if test="${empty param.dep}">
                   <td></td>
                   <td></td>
                   <td></td>
                   <td></td>
                   </c:if>
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
        var theTable = document.getElementById("empTable");
        var txtValue = document.getElementById("Text1").value;
        var numberRowsInTable = ${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows))};
        var colunm = ${fn:length(rows)};
    </script>
	
	<!-- ���ܰ�ť�� -->
    <div style="width:100%;margin-top: 25px;float:left" align="center" >
        <div class="form-group" align="center" >
            <c:if test="${param.dep!=1}">
                <button type="submit" name="next" class="btn btn-success mr-2">��ѯ</button>
                <button type="submit" name="next" class="btn btn-secondary mr-2"
                        formaction="<%=request.getContextPath()%>/addNModEmp.jsp">Ա����ְ</button>
            </c:if>

            <c:if test="${param.dep==1}">
                <button type="submit" name="next" class="btn btn-secondary mr-2"
                        formaction="<%=request.getContextPath()%>/eF0101.html">����</button>
            </c:if>
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