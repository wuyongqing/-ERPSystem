<%@ page  language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>

<head>

    <title>物资申请管理</title>

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
         <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'物资管理')}">
             <jsp:forward page="menu.jsp"></jsp:forward>
         </c:when>
     </c:choose>

    <script type="text/javascript">
        function onRev(vaac601) {
            var vform=document.getElementById("showSupReq");
            vform.action="<%=request.getContextPath()%>/eF0704.html?aac601="+vaac601;
            vform.submit();
        }
    </script>

</head>

<body style="background-color: #F5F5F5">

<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div><div class="col-md-6 grid-margin stretch-card" style="max-width: 100%; " align="center">
    <div class="card" style="max-width: 100%; " align="center">
        <div class="card-body" style="max-width:100%" align="center">
<form id="showSupReq" action="<%=request.getContextPath()%>/eF0701.html" method="post">

    <h4 align="center">物资申请管理</h4>
    <!-- 查询条件区 -->
    <table class="table-bordered" border="1" width="100%" align="center">

        <tr>
            <td colspan="6">
                查询条件
            </td>
        </tr>

        <tr>
            <td style="width:80px;">姓名</td>
            <td style="min-width:180px">
                <e:text styleClass="form-control" maxlength="6" name="qaae102"/>
            </td>
            <td style="width:80px;">编号</td>
            <td style="min-width:180px">
                <e:text styleClass="form-control" maxlength="8" name="qaae103"/>
            </td>

            <td style="width:80px;">申请日期[</td>
            <td>
                <e:date styleClass="form-control" name="baac602"/>
            </td>
        </tr>
        <tr>
            <td style="width:80px;">申请物资</td>
            <td style="min-width:180px">
                <e:text styleClass="form-control" maxlength="10" name="qaae502"/>
            </td>
            <td style="width:80px;">审核状态</td>
            <td style="min-width:180px">
                <e:select styleClass="form-control" name="qaac605" value="未审核:1,审核通过:2,审核不通过:3" header="true" />
            </td>

            <td style="width:80px;">申请日期]</td>
            <td>
                <e:date styleClass="form-control" name="eaac602"/>
            </td>
        </tr>

    </table>
    <!-- 数据迭代区 -->
    <table class="table-bordered" border="1" width="100%" align="center" id="supReqTable">
        <tr>
            <th>序号</th>
            <th>申请人</th>
            <th>申请物资</th>
            <th>申请时间</th>
            <th>申请数量</th>
            <th>审批状态</th>
            <th>审批时间</th>
            <th>审批理由</th>
            <th>审批人</th>
            <th>备注</th>
            <th>操作</th>
        </tr>

        <c:choose>
            <c:when test="${rows!=null}">
                <!-- 显示实际查询到的数据 -->
                <c:forEach items="${rows}" var="ins" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${ins.aae102}</td>
                        <td>${ins.aae502}</td>
                        <td>${ins.aac602}</td>
                        <td>${ins.aac603}</td>
                        <td>
                            <c:if test="${ins.cnaac605=='未审核'}" ><span class="label label-default">${ins.cnaac605}</span></c:if>
                            <c:if test="${ins.cnaac605=='审核通过'}" ><span class="label label-success">${ins.cnaac605}</span></c:if>
                            <c:if test="${ins.cnaac605=='审核不通过'}" ><span class="label label-danger">${ins.cnaac605}</span></c:if>
                        </td>
                        <td>${ins.aac606}</td>
                        <td>${ins.aac607}</td>
                        <td>${ins.ac0_aae102}</td>
                        <td>${ins.aac608}</td>
                        <c:choose>
                            <c:when test="${empty ins.ac0_aae102}">
                                <td>
                                    <button class="btn btn-success" onclick="onRev('${ins.aac601}')">审批</button>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>

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
        var theTable = document.getElementById("supReqTable");
        var txtValue = document.getElementById("Text1").value;
        var numberRowsInTable = ${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows))};
        var colunm = ${fn:length(rows)};
    </script>

    <!-- 功能按钮区 -->
    <div style="width:100%;margin-top: 25px;float:left" align="center" >
        <div class="form-group" align="center" >
            <button type="submit" name="next" class="btn btn-success">查询</button>
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
