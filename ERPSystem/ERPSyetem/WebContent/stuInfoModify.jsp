<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'学籍维护')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
	<title>学籍${empty param.aab101?'添加':'修改' }</title>
	<link rel="stylesheet" href="css/tstyle.css">
	<link rel="stylesheet" href="css/mstyle.css">
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div style="width:100%" align="center">
<form class="form-sample" action="<%=path%>/stuInfoModify.html" method="post">
	<div class="col-10 grid-margin stretch-card" >
		<div class="card" style="width:60%;"align="center">
			<div class="card-body" style="width:60%;" align="center">
				<h4 align="center">学籍${empty param.aab101?'添加':'修改' }</h4>
				<h5 align="center">学籍数据</h5>
   		
   				<div class="form-group" align="left">
     				<label for="aab102" >姓名</label>
     				<e:text styleClass="form-control" name="aab102" required="true" autofocus="true" 
     				defval="${ins.aab102 }"/> 
   				</div>
   				<c:if test="${!empty param.aab101 }">
	   				<div class="form-group" align="left">
	     				<label for="aab103" >学号</label>
	     				<e:text styleClass="form-control" name="aab103" readonly="true" defval="${ins.aab103 }"/> 
   					</div>
   				</c:if>
   				<div class="form-group" align="left">
     				<label for="aab104" >身份证</label>
     				<e:text styleClass="form-control" name="aab104"  required="true" defval="${ins.aab104 }"/>
	     		</div>
   				<div class="form-group" align="left">
     				<label for="aab105" >生日</label>
     				<e:date styleClass="form-control" name="aab105"  required="true" defval="${ins.aab105 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab106" style="width:100%;text-align:left;">性别</label>
	     			<e:radio styleClass="" style="margin-left: 10px;" name="aab106" value="男的:男,女的:女" defval="${empty param.aab101?'男':ins.aab106 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab107" >民族</label>
     				<e:select styleClass="form-control" name="aab107" 
       					  value="汉族:1,蒙古族:2,回族:3,藏族:4,维吾尔族:5,
						      苗族:6,彝族:7,壮族:8,布依族:9,朝鲜族:10,
						      满族:11,侗族:12,瑶族:13,白族:14,土家族:15,
						      哈尼族:16,哈萨克族:17,傣族:18,黎族:19,傈僳族:20,
						      佤族:21,畲族:22,高山族:23,拉祜族:24,水族:25,
						      东乡族:26,纳西族:27,景颇族:28,柯尔克孜族:29,土族:30,
						      达斡尔族:31,仫佬族:32,羌族:33,布朗族:34,撒拉族:35,
						      毛难族:36,仡佬族:37,锡伯族:38,阿昌族:39,普米族:40,
						      塔吉克族:41,怒族:42,乌孜别克族:43,俄罗斯族:44,鄂温克族:45,
						      崩龙族:46,保安族:47,裕固族:48,京族:49,塔塔尔族:50,
						      独龙族:51,鄂伦春族:52,赫哲族:53,门巴族:54,珞巴族:55,
						      基诺族:56,其他:97,外国血统:98" 
       					  defval="${ins.aab107 }" />
     		
   				</div>
   				<div class="form-group" align="left">
     				<label for="aab108" >籍贯</label>
     				<e:text styleClass="form-control" name="aab108"  required="true" defval="${ins.aab108 }"/> 
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab109" >手机号码</label>
     				<e:text styleClass="form-control" name="aab109"  required="true" defval="${ins.aab109 }"/> 
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab110" >电子邮件</label>
     				<e:email styleClass="form-control" name="aab110" required="true" defval="${ins.aab110 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab111" >班级流水号</label>
     				<e:text styleClass="form-control" name="aab111" required="true" 
       					readonly="${empty param.aab101?'false':'true' }" 
       					defval="${ins.aab111 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab112" >监护人</label>
     				<e:text styleClass="form-control"  name="aab112" required="true" defval="${ins.aab112 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab113" >监护人电话</label>
     				<e:text styleClass="form-control"  name="aab113" required="true" defval="${ins.aab113 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab114" >录入日期</label>
     				<e:date styleClass="form-control"  name="aab114" required="true" 
        				 readonly="${empty param.aab101?'false':'true' }" 
        				 defval="${ins.aab114 }"/>
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab115" >状态</label>
     				<e:select styleClass="form-control" name="aab115" 
     					value="在校:1,休学:2,退学:3" 
        				readonly="${empty param.aab101?'false':'true' }" 
        				defval="${ins.aab115 }" />
     			</div>
   				<div class="form-group" align="left">
     				<label for="aab116" >备注</label>
     				<e:text styleClass="form-control" name="aab116" required="true" defval="${ins.aab116 }"/>
     			</div>
     			<div class="form-group" align="center">
       				<button class="btn btn-success mr-2" type="submit" name="next" 
              		formaction="<%=path%>/${empty param.aab101?'addStu.html':'stuInfoModify.html' }">
              		${empty param.aab101?'添加':'修改' }</button>
       				<button class="btn btn-secondary mr-2" type="submit" name="next" 
              		formaction="<%=path%>/queryStu.html"
              		formnovalidate="formnovalidate">返回</button>
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