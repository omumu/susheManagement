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
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
 parent.location.replace("/sflatsys/admin/bjlist.jsp");
 <%}%>
 </script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  <%
  String id = request.getParameter("id");
  CommDAO dao = new CommDAO();
  HashMap data = dao.select("select * from shushe where id="+id).get(0);
   %>
  <body>
  <form action="/sflatsys/sflatsys?ac=updatess&id=<%=id %>" method="post" name="f1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入班级信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="148"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td width="23%" height="30" align="center" class="left_txt2">宿舍编号：</td>
                <td width="77%" height="30" colspan="2"><input name="ssno" type="text" value="<%=data.get("ssno") %>" id="useraccount"  size="30" /></td>
                </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">楼层：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="ssfloor"   value="<%=data.get("ssfloor") %>"  type="text" id="userpass" size="20" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center"  class="left_txt2">宿舍楼编号：</td>
                <td width="77%" height="30" colspan="2" bgcolor=""><input name="louno"   value="<%=data.get("louno") %>"  type="text" id="userpass" size="20" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">备注：</td>
                <td width="77%" height="30" bgcolor="#f2f2f2" colspan="2"><input name="bei" type="text"   value="<%=data.get("bei") %>"  id="tphone" size="50" /></td>
                 </tr>
              <tr>
                <td width="23%" height="30" align="center"  class="left_txt2">可入住人数：</td>
                <td width="77%" height="30" colspan="2" bgcolor=""><input name="krzrs"   value="<%=data.get("krzrs") %>"  type="text" id="userpass" size="20" /></td>
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
 
</table>
</form>
  </body>
</html>
<%dao.close();%>