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
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  
  <%
  CommDAO dao = new CommDAO();
  String f = request.getParameter("f");
  if(f!=null)
  {
  String mjsa =  request.getParameter("jsa");
  String mjsb =  request.getParameter("jsb");
  dao.commOper("update mixinfo set content='"+mjsa+"' where title='讲师'");
   dao.commOper("update mixinfo set content='"+mjsb+"' where title='教授'");
  }
  String jsa = dao.select("select * from mixinfo where title='讲师'").get(0).get("content").toString();
  String jsb = dao.select("select * from mixinfo where title='教授'").get(0).get("content").toString();
  
   %>
  <form action="/sflatsys/admin/ksf.jsp?f=f" method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">系统管理</div></td>
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
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;信息管理</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="46"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">讲师：</td>
                <td bgcolor="#f2f2f2" class="left_txt2"><input name="jsa" value="<%=jsa %>" type="text" id="title" size="7" />
                (请输入半角数字)                </td>
                <td align="center" bgcolor="#f2f2f2" class="left_txt2">教授：</td>
                <td bgcolor="#f2f2f2" class="left_txt2"><input name="jsb"  value="<%=jsb %>"  type="text" id="title2" size="7" />
(请输入半角数字) </td>
			    </tr>
              

             <tr>
              <td class="left_txt2" height="40" colspan="4" align="center"><input type="submit" value="提交信息" name="B1" />
                <script type="text/javascript">
                function adduser()
                {
                pop("/sflatsys/admin/adduser.jsp","添加用户",520,380);
                }
                function updateuser(no)
                {
                pop("/sflatsys/admin/updateuser.jsp?id="+no,"修改用户",520,380);
                }
                </script>                </td>
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
