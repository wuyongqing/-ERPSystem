<%@ page  language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>

    <title>报名信息查询</title>

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
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'学生报名')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>

</head>

<body style="background-color: #F5F5F5">

<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div><div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
    <div class="card" style="max-width: 100%; " align="center">
        <div class="card-body" style="max-width:100%" align="center">
<form id="showEmp" action="<%=request.getContextPath()%>/eE0201.html" method="post">

    <h4 align="center">报名信息查询</h4>
    <!-- 查询条件区 -->
    <table class="table-bordered" border="1" width="100%" align="center">

        <tr>
            <td colspan="6">
                查询条件
            </td>
        </tr>

        <tr>
            <td>接待人</td>
            <td style="min-width:180px">
                <e:text styleClass="form-control" name="qaae102" maxlength="6"/>
            </td>
            <td>学生姓名</td>
            <td style="min-width:180px">
                <e:text styleClass="form-control" name="qaae804" maxlength="8"/>
            </td>
            <td>报名时间[</td>
            <td>
                <e:date styleClass="form-control" name="baae802"/>
            </td>
        </tr>

        <tr>
            <td>报名地点</td>
            <td style="min-width:180px">
                <e:text styleClass="form-control" name="qaae803" maxlength="20"/>
            </td>
            <td>报名班级</td>
            <td style="min-width:180px">
                <e:text styleClass="form-control" name="qaae805" maxlength="20"/>
            </td>
            <td>报名时间]</td>
            <td>
                <e:date styleClass="form-control" name="eaae802"/>
            </td>
        </tr>
    </table>
    <!-- 数据迭代区 -->
    <table class="table-bordered" border="1" width="100%" align="center" id="subTable">
        <tr>
            <th>序号</th>
            <th>接待人</th>
            <th>接待人编号</th>
            <th>学生姓名</th>
            <th>报名时间</th>
            <th>报名地点</th>
            <th>报名班级</th>
            <th>备注</th>
        </tr>
        <c:choose>
            <c:when test="${rows!=null}">
                <!-- 显示实际查询到的数据 -->
                <c:forEach items="${rows}" var="ins" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${ins.aae102}</td>
                        <td>${ins.aae103}</td>
                        <td>${ins.aae804}</td>
                        <td>${ins.aae802}</td>
                        <td>${ins.aae803}</td>
                        <td>${ins.aae805}</td>
                        <td>${ins.aae806}</td>
                    </tr>
                </c:forEach>
                <!-- 补充空行 -->
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
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>

    <div class="form-group" align="center" style="margin-top:15px">
    <div class="gridItem" style="padding: 5px; width: 40%; float: left; text-align: right; height: 20px; font-size: 15px;" >
        共有 <span id="spanTotalInfor"></span> 条记录
        当前第<span id="spanPageNum"></span>页
        共<span id="spanTotalPage"></span>页
    </div>
    <div class="gridItem" style="margin-left:50px;width: 40%;  padding: 5px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">
        <span id="spanFirst" >首页</span>
        <span id="spanPre">上一页</span>
        <span id="spanInput" style="margin: 0px; padding: 0px 0px 4px 0px; height:100%; ">
               	 第<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px" />页
            </span>
        <span id="spanNext">下一页</span>
        <span  id="spanLast">尾页</span>
    </div>
    </div>

    <script type="text/javascript">
        var theTable = document.getElementById("subTable");
        var txtValue = document.getElementById("Text1").value;
        var numberRowsInTable = ${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows))};
        var colunm = ${fn:length(rows)};
    </script>

    <!-- 功能按钮区 -->
    <div style="width:100%;margin-top: 25px;float:left" align="center" >
        <div class="form-group" align="center" >
            <button type="submit" name="next" class="btn btn-success mr-2">查询</button>
            <button type="submit" name="next" class="btn btn-secondary mr-2" formaction="<%=request.getContextPath()%>/eA0301QueryForSub.html">报名</button>
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