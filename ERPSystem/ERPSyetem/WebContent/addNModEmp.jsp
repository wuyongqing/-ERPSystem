<%@ page pageEncoding="GBK" language="java" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>员工信息${empty param.aae101?'导入':'详情'}</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

    <c:choose>
        <c:when test="${empty sessionScope.role}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:when>
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'员工管理')}">
            <jsp:forward page="menu.jsp"></jsp:forward>
        </c:when>
    </c:choose>

    <style type="text/css">
        msg{
            color: crimson;
        }
        hh{
            color: red;
        }
    </style>
</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div><div style="width:100%" align="center">
<form class="forms-sample" name="addNModEmp" action="<%=request.getContextPath()%>/eF0202.html" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
        <h4 align="center">
            员工信息${empty param.aae101?'导入':'详情'}
        </h4>

        <div class="form-group" align="left">
            <label for="aae102">姓名 :</label>
            <e:text styleClass="form-control" name="aae102" id="aae102" maxlength="6" autofocus="true" required="true" defval="${ins.aae102}"/>
        </div>

        <div class="form-group" align="left">
            <label for="cnaae301">部门(<hh>全名</hh>) :</label>
            <e:text styleClass="form-control" name="cnaae301" id="cnaae301" maxlength="8" readonly="${!empty param.aae101}" defval="${ins.cnaae301}"/>
        </div>

        <c:if test="${!empty param.aae101}">
            <div class="form-group" align="left">
                <label for="aae103">编号 :</label>
                <e:text styleClass="form-control" name="aae103" id="aae103" maxlength="8" readonly="true" defval="${ins.aae103}"/>
            </div>
        </c:if>

        <div class="form-group" align="left">
            <label for="aae104">生日 :</label>
            <e:date styleClass="form-control" name="aae104" id="aae104" required="true" defval="${ins.aae104}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae105">性别 :</label>
            <e:select styleClass="form-control" name="aae105" id="aae105" value="男:1,女:2,不确定:3" defval="${empty param.aae101?'1':ins.aae105}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae106">民族 :</label>
            <e:select styleClass="form-control" name="aae106" id="aae106" value="汉族:1,蒙古族:2,回族:3,藏族:4,维吾尔族:5,
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
	      基诺族:56,其他:97,外国血统:98" defval="${ins.aae106}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae107">籍贯 :</label>
            <e:text styleClass="form-control" name="aae107" id="aae107" maxlength="15" required="true" defval="${ins.aae107}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae1114">身份证号 :</label>
            <e:text styleClass="form-control" name="aae1114" id="aae1114" maxlength="20" required="true" defval="${ins.aae1114}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae108">手机号码 :</label>
            <e:text styleClass="form-control" name="aae108" id="aae108" maxlength="15" required="true" defval="${ins.aae108}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae109">电子邮件 :</label>
            <e:email styleClass="form-control" name="aae109" id="aae109" maxlength="25" required="true" defval="${ins.aae109}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae1110">职务 :</label>
            <c:choose>
                <c:when test="${empty param.aae101}">
                    <e:select styleClass="form-control" name="aae1110" id="aae1110" value="一般员工:1,部门主管:2,教师:3,班主任:4,门卫:5"/>
                </c:when>
                <c:otherwise>
                    <e:text styleClass="form-control" name="aae1110" id="aae1110" readonly="true" defval="${ins.pos}"/>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="form-group" align="left">
            <label for="aae1111">档案工资(单位:元/月) :</label>
            <e:number styleClass="form-control" name="aae1111" id="aae1111" onchange="if(value.length>8)value=value.slice(0,8)" step="0.01" required="true" defval="${ins.aae1111}"/>
        </div>

        <c:if test="${!empty param.aae101}">
        <div class="form-group" align="left">
            <label for="aae1112">状态 :</label>
            <e:select name="aae1112" id="aae1112" styleClass="form-control" value="正常:1,休假:2${(ins.aae1112+1)==4?',离职:3':''}"
                           defval="${ins.aae1112}"/>
        </div>
        </c:if>

        <div class="form-group" align="left">
            <label for="aae1113">备注 :</label>
            <e:textarea styleClass="form-control" name="aae1113" id="aae1113" rows="6" cols="30" defval="${ins.aae1113}"/>
        </div>

        <c:if test="${empty param.aae101}">
            <div class="form-group" align="left">
                <label for="aae205">入职日期 :</label>
                <e:date styleClass="form-control" name="aae205" id="aae205" required="true"/>
            </div>
        </c:if>

        <div class="form-group" align="center">
            <c:if test="${(ins.aae1112+1)!=4}">
                <button type="submit" name="next" class="btn btn-success mr-2"
                        formaction="<%=request.getContextPath()%>/${empty param.aae101?'eF0202':'eF0203'}.html">${empty param.aae101?'导入':'更新'}</button>
            </c:if>
            <button type="submit" class="btn btn-secondary mr-2" name="next"
                   formaction="<%=request.getContextPath()%>/eF0201.html"
                    formnovalidate="formnovalidate">返回</button>
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
