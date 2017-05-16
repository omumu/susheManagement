<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
HashMap user = new HashMap(); 
if(session.getAttribute("admin")!=null)
{
user = (HashMap)session.getAttribute("admin");
} 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理页面</title>

<script src="/sflatsys/js/prototype.lite.js" type="text/javascript"></script>
<script src="/sflatsys/js/moo.fx.js" type="text/javascript"></script>
<script src="/sflatsys/js/moo.fx.pack.js" type="text/javascript"></script>
<style>
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}
#container {
	width: 182px;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 182px;
	color: #000;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url(/sflatsys/images/menu_bgs.gif);
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}
.content{
	width: 182px;
	height: 26px;
	
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
}
.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
}
.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(/sflatsys/images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(/sflatsys/images/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(/sflatsys/images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(/sflatsys/images/menu_bg1.gif);
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
</style>
</head>

<body>
<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
  <tr>
    <td width="182" valign="top"><div id="container">
    
 
    
      
      <%
      if(user.get("utype").equals("超级管理员"))
      {
       %>
      <h1 class="type" style="display: "><a href="javascript:void(0)">基础信息管理</a></h1>
      <div class="content" style="display: ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/sflatsys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          
          <li><a href="mixinfocx.jsp" target="main">公告管理</a></li>
          <li><a href="nmixinfocx.jsp" target="main">新闻信息管理</a></li>
          <li><a href="messagescx.jsp" target="main">信息下发</a></li>
          <li><a href="rmessagescx.jsp" target="main">信息接收</a></li>
          <li><a href="rzinfocx.jsp" target="main">学生入住</a></li>
          <li><a href="tzinfocx.jsp" target="main">宿舍调整</a></li>
          <li><a href="tsinfocx.jsp" target="main">学生退宿</a></li>
          <li><a href="lsinfocx.jsp" target="main">历史入住信息</a></li>
          <li><a href="zsfinfocx.jsp" target="main">住宿费信息管理</a></li>
          <li><a href="abaoxcx.jsp" target="main">报修信息管理</a></li>
          <li><a href="loudongcx.jsp" target="main">楼幢信息管理</a></li>
          <li><a href="shuscx.jsp" target="main">宿舍信息管理</a></li>
          <li><a href="classcx.jsp" target="main">班级信息管理</a></li>
        </ul>
      </div>
      
      
      
      <h1 class="type" style="display: "><a href="javascript:void(0)">统计报表</a></h1>
      <div class="content" style="display: ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/sflatsys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          
           <li><a href="rzinfocxrep.jsp" target="main">住宿费已缴统计</a></li>
          <li><a href="baoxcxrep.jsp" target="main">维修费已缴统计</a></li>
          <li><a href="shoufcxrep.jsp" target="main">综合费用已缴统计</a></li>
          <li><a href="wrzinfocxrep.jsp" target="main">住宿费未缴统计</a></li>
          <li><a href="wbaoxcxrep.jsp" target="main">维修费未缴统计</a></li>
          <li><a href="wshoufcxrep.jsp" target="main">综合费用未缴统计</a></li>
          
        </ul>
      </div>
      
      
      
      
      <h1 class="type" style="display: "><a href="javascript:void(0)">操作员信息管理</a></h1>
      <div class="content" style="display: ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/sflatsys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          
          <li><a href="studentcx.jsp" target="main">学生用户管理</a></li>
          <li><a href="shugcx.jsp" target="main">宿舍管理员信息管理</a></li> 
          <li><a href="gongzhicx.jsp" target="main">宿舍管理员工资管理</a></li>
          <li><a href="zkaoqcx.jsp" target="main">宿舍管理员考勤管理</a></li>
          <li><a href="caiwcx.jsp" target="main">财务用户管理</a></li>
          <li><a href="supercx.jsp" target="main">超级管理员信息管理</a></li>
          
        </ul>
      </div>
      
      
       <h1 class="type"><a href="javascript:void(0)">基本信息维护</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/sflatsys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          
          <li><a href="psysuserck.jsp?id=<%=user.get("id")%>" target="main">查看个人信息</a></li>
          <li><a href="uppass.jsp" target="main">修改登录密码</a></li>
        </ul>
      </div>
      <%} %>
      
      
      
      
      
      <%
      if(user.get("utype").equals("宿舍管理员"))
      {
       %>
      <h1 class="type" style="display: "><a href="javascript:void(0)">基础信息管理</a></h1>
      <div class="content" style="display: ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/sflatsys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="kaoqcx.jsp" target="main">考勤查看</a></li>
          <li><a href="noticecx.jsp" target="main">公告查看</a></li>
          <li><a href="lfrycx.jsp" target="main">访客信息管理</a></li>
          <li><a href="smessagescx.jsp" target="main">信息上送</a></li>
          <li><a href="rmessagescx.jsp" target="main">信息接收</a></li>
          <li><a href="sendfilescx.jsp" target="main">快件信息发布</a></li>
          <li><a href="yeguicx.jsp" target="main">夜归信息管理</a></li>
          <li><a href="stulfcx.jsp" target="main">学生离返校信息管理</a></li>
          <li><a href="sgbaoxcx.jsp" target="main">报修信息查看</a></li>
          <li><a href="wspbcx.jsp" target="main">卫生检查评比排名</a></li>
          <li><a href="newscx.jsp" target="main">新闻信息查看</a></li>
          <li><a href="sgrzinfocx.jsp" target="main">学生入住情况</a></li> 
          <li><a href="lsinfocx.jsp" target="main">历史入住信息</a></li> 
          <li><a href="sgstudentcx.jsp" target="main">学生信息管理</a></li> 
          <li><a href="sggongzhicx.jsp" target="main">工资查看</a></li>   
        </ul>
      </div>
      
      
       <h1 class="type"><a href="javascript:void(0)">基本信息维护</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/sflatsys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          
          <li><a href="psysuserck.jsp?id=<%=user.get("id")%>" target="main">查看个人信息</a></li>
          <li><a href="uppass.jsp" target="main">修改登录密码</a></li>
        </ul>
      </div>
      <%} %>
      
      
      
      
      
      <%
      if(user.get("utype").equals("学生"))
      {
       %>
      <h1 class="type" style="display: "><a href="javascript:void(0)">基础信息管理</a></h1>
      <div class="content" style="display: ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/sflatsys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM"> 
          <li><a href="noticecx.jsp" target="main">公告查看</a></li>  
          <li><a href="stusendfilescx.jsp" target="main">快件信息查看</a></li>
           
          <li><a href="sgbaoxcx.jsp" target="main">报修信息查看</a></li>
          <li><a href="swspbcx.jsp" target="main">卫生检查评比查看</a></li>
          <li><a href="newscx.jsp" target="main">新闻信息查看</a></li>
           
        </ul>
      </div>
      
      
       <h1 class="type"><a href="javascript:void(0)">基本信息维护</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/sflatsys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          
          <li><a href="psysuserck.jsp?id=<%=user.get("id")%>" target="main">查看个人信息</a></li>
          <li><a href="uppass.jsp" target="main">修改登录密码</a></li>
        </ul>
      </div>
      <%} %>
      
      
      
      
      
      
      <%
      if(user.get("utype").equals("财务"))
      {
       %>
      <h1 class="type" style="display: "><a href="javascript:void(0)">基础信息管理</a></h1>
      <div class="content" style="display: ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/sflatsys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM"> 
          <li><a href="noticecx.jsp" target="main">公告查看</a></li>  
          <li><a href="sfrzinfocx.jsp" target="main">住宿费收缴</a></li>  
          <li><a href="sfbaoxcx.jsp" target="main">维修费收缴</a></li>
          <li><a href="shoufcx.jsp" target="main">综合费用收缴</a></li> 
        </ul>
      </div>
      
      
      <h1 class="type" style="display: "><a href="javascript:void(0)">统计报表</a></h1>
      <div class="content" style="display: ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/sflatsys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">  
          <li><a href="rzinfocxrep.jsp" target="main">住宿费已缴统计</a></li>
          <li><a href="baoxcxrep.jsp" target="main">维修费已缴统计</a></li>
          <li><a href="shoufcxrep.jsp" target="main">综合费用已缴统计</a></li>
          <li><a href="wrzinfocxrep.jsp" target="main">住宿费未缴统计</a></li>
          <li><a href="wbaoxcxrep.jsp" target="main">维修费未缴统计</a></li>
          <li><a href="wshoufcxrep.jsp" target="main">综合费用未缴统计</a></li>
          
           
        </ul>
      </div>
      
      
       <h1 class="type"><a href="javascript:void(0)">基本信息维护</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="/sflatsys/images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          
          <li><a href="psysuserck.jsp?id=<%=user.get("id")%>" target="main">查看个人信息</a></li>
          <li><a href="uppass.jsp" target="main">修改登录密码</a></li>
        </ul>
      </div>
      <%} %>
      
       
      
       
      
      
        <script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('type');
	
		var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 120}
		);
		myAccordion.showThisHideOpen(contents[0]);
	</script>
        </td>
  </tr>
</table>
</body>
</html>