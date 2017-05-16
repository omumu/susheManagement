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
 parent.location.replace("/sflatsys/admin/typelist.jsp");
 <%}%>
 </script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
    
  </head>
  <%
  String type = request.getParameter("type");
  
   %>
  <body onload="f1.typename.focus();">
  <form action="/sflatsys/sflatsys.do?ac=addtype&type=<%=type %>" name="f1" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="104" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="104" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入类别名称</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="73"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td height="50" align="center" bgcolor="#f2f2f2" class="left_txt2"><input name="typename" type="text" id="title" size="35" /></td>
                </tr>
              

             <tr>
              <td height="30" align="center"><input type="submit" value="提交信息" name="B1" />        
                &nbsp;&nbsp;&nbsp;        <input type="reset" value="重新填写" name="B12" /></td>
              </tr>
              
              <tr>
                <td height="13" align="right" >&nbsp;</td>
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
