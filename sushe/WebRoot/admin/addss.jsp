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
 parent.location.replace("/sflatsys/admin/sslist.jsp");
 <%}%>
 </script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  
  <body>
  <form action="/sflatsys/sflatsys?ac=addss" method="post" name="f1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入宿舍信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="148"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td width="23%" height="30" align="center" class="left_txt2">宿舍编号：</td>
                <td width="77%" height="30" colspan="2"><input name="ssno" type="text" id="useraccount"  size="30" /></td>
                </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">楼层：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="ssfloor"   type="text" id="userpass" size="20" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">宿舍楼编号：</td>
                <td width="77%" height="30" colspan="2"><input name="louno" type="text" id="louno"  size="30" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" bgcolor="#f2f2f2"  align="center" class="left_txt2">备注：</td>
                <td width="77%" height="30"  bgcolor="#f2f2f2" colspan="2"><input name="bei" type="text"   id="tphone" size="50" /></td>
                 </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">可入住人数：</td>
                <td width="77%" height="30" colspan="2"><input name="krzrs" type="text" id="louno"  size="30" /></td>
                </tr>
             
               

             <tr>
              <td height="39" colspan="3" align="center"><input type="submit" onMouseDown="check();" value="提交信息" name="B1" />        
                &nbsp;&nbsp;&nbsp;      
                
                <script type="text/javascript">
                function check()
                {
                if(f1.ssno.value=="")
                {
                alert("请输入宿舍编号");
                return;
                }
                 if(f1.ssfloor.value=="")
                {
                alert("请输入楼层 ");
                return;
                }
                 if(f1.louno.value=="")
                {
                alert("请输入楼编号 ");
                return;
                }
                if(f1.louno.value=="")
                {
                alert("请输入楼编号 ");
                return;
                }
                if(f1.krzrs.value=="")
                {
                alert("请输入可入住人数 ");
                return;
                }
                if(isNaN(f1.krzrs.value))
                {
                alert("入住人数必须为数字 ");
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
