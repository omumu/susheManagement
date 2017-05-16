<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
  
  <body>
  <form action="/sflatsys/sflatsys?ac=uppass1" name="f1" method="post">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31" ><div class="titlebt">基本信息维护</div></td>
      </tr>
    </table></td>
    <td width="22" valign="top" background="/sflatsys/images/mail_rightbg.gif"><img src="/sflatsys/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td height="71" valign="middle" background="/sflatsys/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;修改登录密码</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="110"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td width="16%" height="30" align="center" bgcolor="" class="left_txt2">请输入原密码：</td>
                <td width="84%" height="30" colspan="2" bgcolor=""><input name="olduserpass" type="password" id="title" size="30" /></td>
                </tr>
              <tr>
                <td width="16%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">请输入新密码：</td>
                <td width="84%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="userpass" type="password" id="title" size="30" /></td>
                </tr>
              <tr>
                <td height="30" align="center" class="left_txt2">请再次输入新密码：</td>
                <td height="30" colspan="2"><input type="password" name="copyuserpass" size="30" /></td>
                </tr>
             <tr>
              <td height="30" colspan="3" align="center"><input type="submit" onmousedown="check();" value="提交信息" name="B1" />        
             
             <script type="text/javascript">
             function check()
             {
             var olduserpass = f1.olduserpass.value;
             var userpass  = f1.userpass.value;
             var copyuserpass = f1.copyuserpass.value;
             if(olduserpass=="")
             {
             alert("请输入旧密码");
             return;
             }
             if(userpass=="")
             {
             alert("请输入新密码");
             return;
             }
             if(copyuserpass=="")
             {
             alert("请再次输入新密码");
             return;
             }
             if(copyuserpass!=userpass)
             {
             alert("两次新密码输入不一致");
             return;
             }
             }
             </script>
             
             
                &nbsp;&nbsp;&nbsp;        <input type="reset" value="取消设置" name="B12" /></td>
              </tr>
              
              <tr>
                <td height="13" colspan="3" align="right" >&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table>
          </td>
      </tr>
    </table></td>
    <td background="/sflatsys/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/buttom_left2.gif" width="17" height="17" /></td>
      <td height="17" valign="top" background="/sflatsys/images/buttom_bgs.gif"><img src="/sflatsys/images/buttom_bgs.gif" width="17" height="17" /></td>
    <td background="/sflatsys/images/mail_rightbg.gif"><img src="/sflatsys/images/buttom_right2.gif" width="16" height="17" /></td>
  </tr> 
</table>
</form>
  </body>
</html>
<script type="text/javascript">
<!--


<%
String error = (String)request.getAttribute("error");
if(error!=null)
{
 %>
 alert("原密码输入错误");
<%}%>


<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("修改成功");
<%}%>
 
 //-->
</script>