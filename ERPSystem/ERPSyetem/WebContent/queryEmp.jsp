<%@ page  language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>

    <title>员工管理</title>

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
        <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'员工管理')}">
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

    <h4 align="center">员工${param.dep==1?'清单':'管理'}</h4>
    <!-- 查询条件区 -->

	<table class="table-bordered" border="1" width="100%" align="center">

    <c:if test="${param.dep!=1}">

        <tr>
            <td colspan="12">
                查询条件
            </td>
        </tr>

	  <tr>
	    <td style="width:100px;">姓名</td>
	    <td style="min-width:150px">
	      <e:text styleClass="form-control" name="qaae102" maxlength="6"/>
	    </td>
	    <td style="width:100px;">编号</td>
	    <td style="min-width:150px">
	      <e:text styleClass="form-control" name="qaae103" maxlength="8"/>
	    </td>

          <td>性别</td>
          <td>
              <e:select styleClass="form-control" name="qaae105" value="男:1,女:2,不确定:3" header="true"/>
          </td>
          <td>民族</td>
          <td>
              <e:select styleClass="form-control" name="qaae106" value="汉族:1,蒙古族:2,回族:3,藏族:4,维吾尔族:5,
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
	      基诺族:56,其他:97,外国血统:98" header="true" />
          </td>

          <td>职务</td>
          <td style="min-width:150px">
              <e:select styleClass="form-control" name="qaae1110" value="一般员工:1,部门主管:2,教师:3,班主任:4,门卫:5" header="true" />
          </td>

	  </tr>

	  <tr>
          <td style="width:100px;">所属部门</td>
          <td style="min-width:150px">
              <e:text styleClass="form-control" name="qcnaae301" maxlength="8"/>
          </td>
          <td style="width:100px;">身份证号</td>
          <td style="min-width:150px">
              <e:text styleClass="form-control" name="qaae1114" maxlength="20"/>
          </td>

	    <td>生日[</td>
	    <td>
	      <e:date styleClass="form-control" name="baae104"/>
	    </td>
	    <td>生日]</td>
	    <td>
	      <e:date styleClass="form-control" name="eaae104"/>
	    </td>

          <td>状态</td>
          <td style="min-width:150px">
              <e:select styleClass="form-control" name="qaae1112" value="正常:1,休假:2,离职:3" header="true" />
          </td>
	  </tr>

	</table>
    </c:if>
	<!-- 数据迭代区 -->
	<table class="table-bordered" border="1" width="100%" align="center" id="empTable">
	  <tr>
	    <th>序号</th>
	    <th>姓名</th>
	    <th>部门</th>
        <th>编号</th>
	    <th>性别</th>
	    <th>民族</th>
        <th>籍贯</th>
        <th>职务</th>
	    <th>状态</th>

        <c:if test="${empty param.dep}">
          <th colspan="4">操作</th>
        </c:if>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null}">
	         <!-- 显示实际查询到的数据 -->
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
                              <c:when test="${ins.cnaae1112=='正常'}">
                                  <span class="label label-success">${ins.cnaae1112}</span>
                              </c:when>
                              <c:when test="${ins.cnaae1112=='休假'}">
                                  <span class="label label-warning">${ins.cnaae1112}</span>
                              </c:when>
                              <c:otherwise>
                                  <span class="label label-danger">${ins.cnaae1112}</span>
                              </c:otherwise>
                          </c:choose>
                      </td>


                  <c:if test="${empty param.dep}">

                          <td>
                              <button class="btn btn-primary" onclick="onMod('${ins.aae101}')">查看</button>
                          </td>

                          <td>
                              <button class="btn btn-primary" onclick="onRec('${ins.aae101}')">履历</button>
                          </td>

                          <td>
                              <c:choose>
                                  <c:when test="${ins.cnaae1112!='离职'}">
                                      <button class="btn btn-warning" onclick="onTran('${ins.aae101}')">调职</button>
                                  </c:when>
                                  <c:otherwise>
                                      <button class="btn btn-warning disabled" disabled="disabled">调职</button>
                                  </c:otherwise>
                              </c:choose>

                          </td>

                          <td>
                              <c:choose>
                                  <c:when test="${ins.cnaae1112!='离职'}">
                                      <button class="btn btn-warning" onclick="onDel('${ins.aae101}')">离职</button>
                                  </c:when>
                                  <c:otherwise>
                                      <button class="btn btn-warning disabled" disabled="disabled">离职</button>
                                  </c:otherwise>
                              </c:choose>
                          </td>

                  </c:if>


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
        var theTable = document.getElementById("empTable");
        var txtValue = document.getElementById("Text1").value;
        var numberRowsInTable = ${(fn:length(rows)%10)>0?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows))};
        var colunm = ${fn:length(rows)};
    </script>
	
	<!-- 功能按钮区 -->
    <div style="width:100%;margin-top: 25px;float:left" align="center" >
        <div class="form-group" align="center" >
            <c:if test="${param.dep!=1}">
                <button type="submit" name="next" class="btn btn-success mr-2">查询</button>
                <button type="submit" name="next" class="btn btn-secondary mr-2"
                        formaction="<%=request.getContextPath()%>/addNModEmp.jsp">员工入职</button>
            </c:if>

            <c:if test="${param.dep==1}">
                <button type="submit" name="next" class="btn btn-secondary mr-2"
                        formaction="<%=request.getContextPath()%>/eF0101.html">返回</button>
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