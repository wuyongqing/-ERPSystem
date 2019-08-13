<%@ page pageEncoding="GBK" language="java" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>咨询记录${empty param.aae701?'添加':'详情'}</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

    <c:choose>
        <c:when test="${empty sessionScope.role}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:when>
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'咨询管理')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div><div style="width:100%" align="center">
<form name="addNModCstt" class="forms-sample" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
                <h4 align="center">咨询记录${empty param.aae701?'添加':'详情'}</h4>

        <div class="form-group" align="left">
            <label for="aae702">咨询时间 :</label>
            <e:date styleClass="form-control" name="aae702" id="aae702" required="true" defval="${ins.aae702}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae703">咨询地点 :</label>
            <e:text styleClass="form-control" name="aae703" id="aae703" maxlength="20" required="true" defval="${ins.aae703}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae704">咨询人姓名 :</label>
            <e:text styleClass="form-control" name="aae704" id="aae704" maxlength="6" required="true" defval="${ins.aae704}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae707">学生姓名 :</label>
            <e:text styleClass="form-control" name="aae707" id="aae707" maxlength="6" required="true" defval="${ins.aae707}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae705">咨询者关系 :</label>
            <e:select styleClass="form-control" name="aae705" id="aae705" required="true" value="本人:1,父亲:2,母亲:3,其他:4" defval="${ins.aae705}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae706">咨询人电话 :</label>
            <e:text styleClass="form-control" name="aae706" id="aae706" maxlength="15" required="true" defval="${ins.aae706}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae708">学生年龄 :</label>
            <e:number styleClass="form-control" step="1" onchange="if(value.length>3)value=value.slice(0,3)" name="aae708" id="aae708" required="true" defval="${ins.aae708}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae709">学生概况 :</label>
            <e:textarea styleClass="form-control" name="aae709" id="aae709" required="true" cols="30" rows="6" defval="${ins.aae709}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae710">咨询意向 :</label>
            <e:textarea styleClass="form-control" name="aae710" id="aae710" required="true" cols="30" rows="6" defval="${ins.aae710}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae712">备注 :</label>
            <e:textarea styleClass="form-control" name="aae712" id="aae712" rows="6" cols="30" defval="${ins.aae712}"/>
        </div>

                <div class="form-group" align="center">
                <c:choose>
                    <c:when test="${empty param.aae701}">
                        <button type="submit" class="btn btn-success mr-2" name="next"
                                formaction="<%=request.getContextPath()%>/eE0103.html">添加</button>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${(ins.aae101+1)==(sessionScope.user+1)}">
                            <button type="submit" class="btn btn-success mr-2" name="next"
                                    formaction="<%=request.getContextPath()%>/eE0104.html">更新</button>
                        </c:if>
                    </c:otherwise>
                </c:choose>
                <button type="submit" class="btn btn-secondary mr-2" name="next"
                       formaction="<%=request.getContextPath()%>/eE0101.html"
                        formnovalidate="formnovalidate">返回</button>
                </div>

    <input type="hidden" name="aae701" value="${param.aae701}">

    <e:hidden name="qaae102"/>
    <e:hidden name="qaae103"/>
    <e:hidden name="baae702"/>
    <e:hidden name="eaae702"/>
    <e:hidden name="baae104"/>
    <e:hidden name="qaae703"/>
    <e:hidden name="qaae704"/>
    <e:hidden name="qaae707"/>
    <e:hidden name="qaae710"/>
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
