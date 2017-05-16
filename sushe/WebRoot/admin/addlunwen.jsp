<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

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
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
 parent.location.replace("/sflatsys/admin/lunwen.jsp");
 <%}%>
 </script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  
  <body>
  <form action="/sflatsys/sflatsys?ac=addlunwen" enctype="multipart/form-data" method="post" name="f1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="180" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="180" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入论文信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="149"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td width="23%" height="30" align="center" class="left_txt2">论文名称：</td>
                <td width="77%" height="30" colspan="2"><input name="lwname" type="text" id="useraccount"  size="50" /></td>
                </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">论文简述：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input type="text" name="lwjj" id="useraccount" size="50"></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">选择论文：</td>
                <td width="77%" height="30" colspan="2"><input name="txt" type="file"   id="truename" size="40" /></td>
                 </tr>
             
               

             <tr>
              <td height="39" colspan="3" align="center"><input type="submit" onMouseDown="check();" value="提交信息" name="B1" />        
                &nbsp;&nbsp;&nbsp;      
                
                <script type="text/javascript">
                function check()
                {
                var useraccount = f1.uname.value;
                var ajax = new AJAX();
				ajax.post("/sflatsys/sflatsys?ac=checkuname&checkuname="+useraccount);
				var msg = ajax.getValue();
				if(msg=="N")
				{
				alert("该用户名已存在，请使用其他用户名");
				return;
				}
				if(f1.uname.value=="")
				{
				alert("请输入用户名");
				return;
				}
				
				if(f1.upass.value=="")
				{
				alert("请输入密码");
				return;
				}
				
                }
                </script>
                
                  <input type="reset" value="重新填写" name="B12" /></td>
              </tr>
              
              <tr>
                <td height="20" colspan="3" align="right" >&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table>
          </td>
      </tr>
    </table></td>
   
  </tr>
 
</table>
</form>
  </body>
</html>
