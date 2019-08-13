<%@ page pageEncoding="GBK" language="java" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>新建报名</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

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
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px">
<label id="msg1">${msg }</label></div>
<div style="width:100%" align="center">
<form class="forms-sample" name="addSup" action="<%=request.getContextPath()%>/eE0202.html" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
        <h4 align="center">
            新建报名
        </h4>

        <div class="form-group" align="left">
            <label for="aae804">学生姓名 :</label>
            <e:text styleClass="form-control" name="aae804" id="aae804" maxlength="6" autofocus="true" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab104">身份证号 :</label>
            <e:text styleClass="form-control" name="aab104" id="aab104" maxlength="20" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab105">生日 :</label>
            <e:date styleClass="form-control" name="aab105" id="aab105" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab106">性别 :</label>
            <e:select styleClass="form-control" name="aab106" id="aab106" value="男:男,女:女"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab107">民族 :</label>
            <e:select styleClass="form-control" name="aab107" id="aab107" value="汉族:1,蒙古族:2,回族:3,藏族:4,维吾尔族:5,
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
	      基诺族:56,其他:97,外国血统:98"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab108">籍贯 :</label>
            <e:text styleClass="form-control" name="aab108" id="aab108" maxlength="20" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab109">手机号码 :</label>
            <e:text styleClass="form-control" name="aab109" id="aab109" maxlength="15" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab110">电子邮件 :</label>
            <e:email styleClass="form-control" name="aab110" id="aab110" maxlength="25" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab112">监护人 :</label>
            <e:text styleClass="form-control" name="aab112" id="aab112" maxlength="6" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aab113">监护人电话 :</label>
            <e:text styleClass="form-control" name="aab113" id="aab113" maxlength="15" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae803">报名地点 :</label>
            <e:text styleClass="form-control" name="aae803" id="aae803" maxlength="20" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae805">报名课程 :</label>
            <e:text styleClass="form-control" name="aae805" id="aae805" required="true" defval="${param.aab302}" readonly="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae806">备注 :</label>
            <e:textarea styleClass="form-control" name="aae806" id="aae806" rows="6" cols="30"/>
        </div>

        <div class="form-group" align="center">
            <button type="submit" class="btn btn-success mr-2" name="next">提交</button>
            <button type="submit" class="btn btn-secondary mr-2" name="next" formaction="<%=request.getContextPath()%>/eA0301QueryForSub.html"
                    formnovalidate="formnovalidate">返回</button>
        </div>

    <input hidden="hidden" name="aab111" value="${param.aab301 }">


    <e:hidden name="qaab302"/>
    <e:hidden name="qaab303"/>
    <e:hidden name="qteacher"/>
    <e:hidden name="qheadmaster"/>
    <e:hidden name="qcourse"/>
    <e:hidden name="qaab3011"/>
    <e:hidden name="baab306"/>
    <e:hidden name="eaab306"/>

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
