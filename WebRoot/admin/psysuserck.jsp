<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #F8F9FA;
}
-->
</style>
 
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
  </head>
  
  <% 
new CommDAO().delete(request,"sysuser"); 
String id = request.getParameter("id"); 
String erjitype = request.getParameter("erjitype"); 
String myztree = request.getParameter("myztree"); 
HashMap ext = new HashMap(); 
new CommDAO().update(request,response,"sysuser",ext,true,true); 
HashMap mmm = new CommDAO().getmap(id,"sysuser"); 
%>
<body>
   
  <form  action="psysuserck.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="f1"  onsubmit="return checkform();">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">这里要改</div></td>
      </tr>
    </table></td>
    <td class="left_txt2" width="22" valign="top" background="/sflatsys/images/mail_rightbg.gif"><img src="/sflatsys/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td class="left_txt2" height="71" valign="middle" background="/sflatsys/images/mail_leftbg.gif">&nbsp;</td>
    <td class="left_txt2" valign="top" bgcolor="#F7F8F9"><table width="100%" height="101" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td  height="101" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;个人信息查看</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="46"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td  width="17%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">用户名：</td>
                <td width="83%" bgcolor="#f2f2f2" class="left_txt2"><%=mmm.get("uname")%>&nbsp;                </td>
                </tr>
<tr>
                <td  width="17%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">姓名：</td>
                <td width="83%" bgcolor="#f2f2f2" class="left_txt2"><%=mmm.get("tname")%>&nbsp;                </td>
                </tr>
<tr>
                <td  width="17%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">性别：</td>
                <td width="83%" bgcolor="#f2f2f2" class="left_txt2"><%=mmm.get("sex")%>&nbsp;                </td>
                </tr>
<tr>
                <td  width="17%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">联系电话：</td>
                <td width="83%" bgcolor="#f2f2f2" class="left_txt2"><%=mmm.get("tel")%>&nbsp;                </td>
                </tr>
<tr>
                <td  width="17%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">联系邮箱：</td>
                <td width="83%" bgcolor="#f2f2f2" class="left_txt2"><%=mmm.get("email")%>&nbsp;                </td>
                </tr>
<tr>
                <td  width="17%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">联系地址：</td>
                <td width="83%" bgcolor="#f2f2f2" class="left_txt2"><%=mmm.get("addrs")%>&nbsp;                </td>
                </tr>
                <%
                if(mmm.get("utype").equals("学生")){
                 %>
<tr>
                <td  width="17%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">所在班级：</td>
                <td width="83%" bgcolor="#f2f2f2" class="left_txt2"><%=mmm.get("bclass")%>&nbsp;                </td>
                </tr>
                <%} %>
                <%
                if(mmm.get("utype").equals("宿舍管理员")){
                 %>
<tr>
                <td  width="17%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">管理楼幢：</td>
                <td width="83%" bgcolor="#f2f2f2" class="left_txt2"><%=mmm.get("ld")%>&nbsp;                </td>
                </tr>
                <%} %>
<tr>
                <td  width="17%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">相片：</td>
                <td width="83%" bgcolor="#f2f2f2" class="left_txt2">
                <img src="../upfile/<%=mmm.get("filename") %>" height="65" />
                                </td>
                </tr>

              

             <tr>
              <td class="left_txt2" height="40" colspan="2" align="center">
              
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;             
                
                 </td>
              </tr>
              
              
            </table></td>
          </tr>
        </table>
		
		
		
		
		
		
		</td>
      </tr>
    </table></td>
    <td class="left_txt2" background="/sflatsys/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td class="left_txt2" valign="middle" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/buttom_left2.gif" width="17" height="17" /></td>
      <td class="left_txt2" height="17" valign="top" background="/sflatsys/images/buttom_bgs.gif"><img src="/sflatsys/images/buttom_bgs.gif" width="17" height="17" /></td>
    <td class="left_txt2" background="/sflatsys/images/mail_rightbg.gif"><img src="/sflatsys/images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</form>
  </body>
</html>
<script language=javascript src='/sflatsys/js/My97DatePicker/WdatePicker.js'></script> 
<script language=javascript src='/sflatsys/js/ajax.js'></script> 
<script language=javascript src='/sflatsys/js/popup.js'></script> 
<%@page import="util.Info"%> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
<script language=javascript >  
 
</script>  
<script language=javascript >  
 function checkform(){  
return true;   
}   
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
