<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
<script type="text/javascript">

 </script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  <%
   HashMap user = (HashMap)session.getAttribute("admin");
  String id = user.get("id").toString();
  CommDAO dao = new CommDAO();
  HashMap data = (HashMap)dao.select("select * from sysuser where id="+id).get(0);
   %>
  <body>
  <form action="/sflatsys/sflatsys?ac=pupdateuser&id=<%=data.get("id") %>" method="post" name="f1">
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
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入用户信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="229"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td width="23%" height="30" align="center" class="left_txt2">用户名：</td>
                <td width="77%" height="30" colspan="2"><input name="useraccount" type="text" readonly="readonly" id="useraccount" value="<%=data.get("uname") %>" size="20" /></td>
                </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">密码：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="userpass" readonly="readonly" value="<%=data.get("upass") %>"   type="text" id="userpass" size="20" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">真实姓名：</td>
                <td width="77%" height="30" colspan="2"><input name="truename" type="text"  value="<%=data.get("truename") %>"   id="truename" size="20" /></td>
                 </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">性别：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><label>
                  <input name="sex" type="radio" value="男" <%if(data.get("sex").equals("男")) {%> checked<%} %>>
                男
                <input name="sex" type="radio" <%if(data.get("sex").equals("女")) {%> checked<%} %> value="女">
                女
                </label></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">联系方式：</td>
                <td width="77%" height="30" colspan="2"><input name="linkphone" type="text"  value="<%=data.get("linkphone") %>"   id="linkphone" size="20" /></td>
                </tr>
             

             <tr>
              <td height="39" colspan="3" align="center"><input type="submit" onMouseDown="" value="提交信息" name="B1" />        
                &nbsp;&nbsp;&nbsp;      
                
                <script type="text/javascript">
                function check()
                {
                var useraccount = f1.useraccount.value;
                var ajax = new AJAX();
				ajax.post("/sflatsys/sflatsys.do?ac=checkuname&checkuname="+useraccount);
				var msg = ajax.getValue();
				if(msg=="N")
				{
				alert("该用户名已存在，请使用其他用户名");
				return;
				}
                }
                </script>
                
                  <input type="reset" value="重新填写" name="B12" /></td>
              </tr>
              
              <tr>
                <td height="19" colspan="3" align="right" >&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table>
          </td>
      </tr>
    </table></td>
   
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
<%
dao.close();
 %>
