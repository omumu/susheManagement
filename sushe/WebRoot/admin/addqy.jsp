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
 parent.location.replace("/sflatsys/admin/qylist.jsp");
 <%}%>
 </script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  
  <body onLoad="f1.entername.focus();">
  <form action="/sflatsys/sflatsys.do?ac=addqy" method="post" name="f1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入企业信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="229"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td width="23%" height="30" align="center" class="left_txt2">企业名称：</td>
                <td width="77%" height="30" colspan="2"><input name="entername" type="text" id="useraccount" size="30" /></td>
                </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">联系电话：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="contacts" type="text" id="userpass" size="40" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">联系人：</td>
                <td width="77%" height="30" colspan="2"><input name="linkmen" type="text" id="truename" size="20" /></td>
                 </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">所属分局：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><label>
                  <select name="branch" id="branch">
				  <option value="直属分局">直属分局</option>
				  <option value="连江分局">连江分局</option>
				  <option value="福清分局">福清分局</option>
				  <option value="罗源分局">罗源分局</option>
				  <option value="长乐分局">长乐分局</option>
				  <option value="平潭分局">平潭分局</option>
                  </select>
                </label></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">所属港区：</td>
                <td width="77%" height="30" colspan="2"><label> 
                  <select name="subport" id="select">
                      <option value="罗源湾港区" >罗源湾港区</option>
                      <option value="闽江口内港区" >闽江口内港区</option>
                      <option value="松下港区" >松下港区</option>
                      <option value="江阴港区" >江阴港区</option>
                      <option value="平潭岛" >平潭岛</option>
                     </select>
                </label></td>
                </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">备注：</td>
                <td width="77%" colspan="2" bgcolor="#f2f2f2"><input name="notes" type="text" id="notes" size="48" /></td>
                </tr>
               

             <tr>
              <td height="39" colspan="3" align="center"><input type="submit" onMouseDown="check();" value="提交信息" name="B1" />        
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
 
</table>
</form>
  </body>
</html>
