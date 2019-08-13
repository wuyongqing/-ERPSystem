<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'ѧ��ά��')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
	<title>ѧ��${empty param.aab101?'���':'�޸�' }</title>
	<link rel="stylesheet" href="css/tstyle.css">
	<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form class="form-sample" action="<%=path%>/stuInfoModify.html" method="post">
	<div class="col-10 grid-margin stretch-card" >
		<div class="card" style="width:60%;"align="center">
			<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">ѧ��${empty param.aab101?'���':'�޸�' }</h4>
				<h5 align="center">ѧ������</h5>
   		
   				<div class="form-group" align="left">
     				<label for="aab102" >����</label>
     				<e:text styleClass="form-control" name="aab102" required="true" autofocus="true" 
     				defval="${ins.aab102 }"/> 
   				</div>
   				<c:if test="${!empty param.aab101 }">
	   				<div class="form-group" align="left">
	     				<label for="aab103" >ѧ��</label>
	     				<e:text styleClass="form-control" name="aab103" readonly="true" defval="${ins.aab103 }"/> 
   					</div>
   				</c:if>
   				<div class="form-group" align="left">
     				<label for="aab104" >���֤</label>
     				<e:text styleClass="form-control" name="aab104"  required="true" defval="${ins.aab104 }"/>
	     		</div>
   				<div class="form-group" align="left">
     				<label for="aab105" >����</label>
     				<e:date styleClass="form-control" name="aab105"  required="true" defval="${ins.aab105 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab106" style="width:100%;text-align:left;">�Ա�</label>
	     			<e:radio styleClass="" style="margin-left: 10px;" name="aab106" value="�е�:��,Ů��:Ů" defval="${empty param.aab101?'��':ins.aab106 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab107" >����</label>
     				<e:select styleClass="form-control" name="aab107" 
       					  value="����:1,�ɹ���:2,����:3,����:4,ά�����:5,
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
						      ��ŵ��:56,����:97,���Ѫͳ:98" 
       					  defval="${ins.aab107 }" />
     		
   				</div>
   				<div class="form-group" align="left">
     				<label for="aab108" >����</label>
     				<e:text styleClass="form-control" name="aab108"  required="true" defval="${ins.aab108 }"/> 
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab109" >�ֻ�����</label>
     				<e:text styleClass="form-control" name="aab109"  required="true" defval="${ins.aab109 }"/> 
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab110" >�����ʼ�</label>
     				<e:email styleClass="form-control" name="aab110" required="true" defval="${ins.aab110 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab111" >�༶��ˮ��</label>
     				<e:text styleClass="form-control" name="aab111" required="true" 
       					readonly="${empty param.aab101?'false':'true' }" 
       					defval="${ins.aab111 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab112" >�໤��</label>
     				<e:text styleClass="form-control"  name="aab112" required="true" defval="${ins.aab112 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab113" >�໤�˵绰</label>
     				<e:text styleClass="form-control"  name="aab113" required="true" defval="${ins.aab113 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab114" >¼������</label>
     				<e:date styleClass="form-control"  name="aab114" required="true" 
        				 readonly="${empty param.aab101?'false':'true' }" 
        				 defval="${ins.aab114 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab115" >״̬</label>
     				<e:select styleClass="form-control" name="aab115" 
     					value="��У:1,��ѧ:2,��ѧ:3" 
        				readonly="${empty param.aab101?'false':'true' }" 
        				defval="${ins.aab115 }" />
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab116" >��ע</label>
     				<e:text styleClass="form-control" name="aab116" required="true" defval="${ins.aab116 }"/>
     			</div>
     			<div class="form-group" align="center">
       				<button class="btn btn-success mr-2" type="submit" name="next" 
              		formaction="<%=path%>/${empty param.aab101?'addStu.html':'stuInfoModify.html' }">
              		${empty param.aab101?'���':'�޸�' }</button>
       				<button class="btn btn-secondary mr-2" type="submit" name="next" 
              		formaction="<%=path%>/queryStu.html"
              		formnovalidate="formnovalidate">����</button>
     			</div>
				<input type="hidden" name="aab101" value="${param.aab101 }">
				<e:hidden name="qaab102"/>
				<e:hidden name="qaab103"/>
				<e:hidden name="qaab111"/>
				<e:hidden name="qaab115"/>
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