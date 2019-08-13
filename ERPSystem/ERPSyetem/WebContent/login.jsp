<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>登录</title>
<%
	String path=request.getContextPath(); 
	request.getSession().setAttribute("token", "");
%>
<script type="text/javascript">
function disablePageBack() {
    //消除后退的所有动作。包括 键盘、鼠标手势等产生的后退动作。，用户登录到系统中后，浏览器回退按钮失效，只能点击退出按钮退出系统！
    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
    });
}

disablePageBack();
</script>

<link rel="stylesheet" type="text/css" href="css/login_style.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/vector.js"></script>

</head><body style="background-color: #F5F5F5">
<div id="container">
	<div id="output">
		<div class="containerT">
			<h1 style="color: white;">用户登录</h1>
			<form class="form" id="entry_form" action="<%=path %>/EA0102Login.htm" method="post">
				<input type="hidden" name="token" value="${sessionScope.token }">
				<input type="text" name="ssa402" placeholder="用户名" id="entry_name" value="">
				<input type="password" name="ssa404" placeholder="密码" id="entry_password">
				<button type="button" onclick="submitForm()" id="entry_btn">登录</button>
				
				
				<div style="color:red;">
				<c:if test="${fn:contains(requestScope,'登陆失败')}">
					${requestScope.check }
					<% request.setAttribute("check", ""); %>
					
				</c:if>
				</div>
				<div id="prompt" class="prompt"></div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	function submitForm(){
		var myform=document.getElementById("entry_form");
		myform.submit();
	}
</script>
<script type="text/javascript">
    $(function(){
        Victor("container", "output");   //登录背景函数
        $("#entry_name").focus();
        $(document).keydown(function(event){
            if(event.keyCode==13){
                $("#entry_btn").click();
            }
        });
    });
</script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>