<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String role = (String)request.getSession().getAttribute("role");
if(role==null)
{
	request.getRequestDispatcher("/login.jsp").forward(request,response);
}
request.setAttribute("role", role);
System.out.println(role);
int num = 1;
int num2 = 1;
%>
<head>
    <title>Ö÷Ò³</title>
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">
    <style type="text/css">
			:-webkit-scrollbar{
				width:0px;
			}
    		div.box{
                float:right;
                width: 93%;
                height: 100%;
                cursor: pointer;
                overflow:hidden;
                text-align: center;
                line-height: 200px;
                margin-left: -15px;
            }
            div.box div{
                width: 93%;
                height: 100%;
            }
    </style>
  </head>
  <body>
    <div class="container-scroller">
      <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
          <a class="navbar-brand brand-logo" href="#">ERPSystem </a>
        </div>
        <ul class="navbar-nav ml-auto" style="margin-right: -700px"><li class="nav-item dropdown"><label>±àºÅ£º${sessionScope.numb }</label></li></ul>
        <ul class="navbar-nav ml-auto" style="margin-right: 50px"><li class="nav-item dropdown"><label>ÐÕÃû£º${sessionScope.name }</label></li></ul>
      </nav>
      <div class="container-fluid page-body-wrapper" style="background-color: #f5f5f5">
        <nav class="sidebar" id="sidebar" style="margin-left: -13px;">
          <ul id="menu-list" class="nav" >
            <li class="nav-item nav-category">Main Menu</li>
            <c:forEach items="${applicationScope.menu[requestScope.role]}" var="ins" varStatus="vs">
            <li class="nav-item">
              <a class="nav-link"  href="#tab<%=num++%>">
                <i class="menu-icon typcn typcn-document-text"></i>
                <span class="menu-title">${ins.ssa103 }</span>
              </a>
            </li>
            </c:forEach>
            
            <li class="nav-item">
              <a class="nav-link" href="<%=path%>/EA0102Logout.htm">
                <i class="menu-icon typcn typcn-shopping-bag"></i>
                <span class="menu-title">µÇ³ö</span>
              </a>
            </li>

          </ul>
        </nav>

        <div class="main-panel" style="width:86%£»">
          <div class="content-wrapper" style="margin-top:-10px;width:100%;background-color: #f5f5f5">
          <div class="box" style="position:fixed">
              <c:forEach items="${applicationScope.menu[requestScope.role]}" var="ins" varStatus="vs">
				<div id="tab<%=num2++%>">
					<iframe src="${ins.ssa104 }" style="width:100%;height:100%;border:0px;"></iframe>
				</div>
			</c:forEach>
			</div>
		  </div>
		</div>
	</div>
</div>

    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
	<script type="text/javascript">
	var lis=document.getElementById("menu-list").getElementsByTagName("li");
	window.onload = function() {
		for(var i = 0; i < lis.length; i++) {
			lis[i].onclick = function() {
				for(var j = 0; j < lis.length; j++) {
					lis[j].className = lis[j].className.replace("active","");
				}
				this.className += " active";
			}
		}
	}
	</script>


    <script src="js/off-canvas.js"></script>
    <script src="js/misc.js"></script>
    <script src="js/dashboard.js"></script>
  </body>
</html>