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
 parent.location.replace("/sflatsys/admin/bjlist.jsp");
 <%}%>
 </script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  
  <body>
  <form action="/sflatsys/sflatsys?ac=addfangan" method="post" name="f1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入方案信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="148"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td width="23%" height="30" align="center" class="left_txt2">方案名称：</td>
                <td width="77%" height="30" colspan="2"><input name="faname" type="text" id="useraccount"  size="50" /></td>
                </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">评测项目一：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="menu1" type="text" id="useraccount2"  size="50" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">评测项目二：</td>
                <td width="77%" height="30" colspan="2"><input name="menu2" type="text" id="useraccount3"  size="50" /></td>
                 </tr>
                  <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">评测项目三：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="menu3" type="text" id="useraccount4"  size="50" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">评测项目四：</td>
                <td width="77%" height="30" colspan="2"><input name="menu4" type="text" id="useraccount5"  size="50" /></td>
                 </tr>
                  <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">评测项目五：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="menu5" type="text" id="useraccount6"  size="50" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">评测项目六：</td>
                <td width="77%" height="30" colspan="2"><input name="menu6" type="text" id="useraccount7"  size="50" /></td>
                 </tr>
                  <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">评测项目七：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="menu7" type="text" id="useraccount8"  size="50" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">评测项目八：</td>
                <td width="77%" height="30" colspan="2"><input name="menu8" type="text" id="useraccount9"  size="50" /></td>
                 </tr>
                  <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">评测项目九：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="menu9" type="text" id="useraccount10"  size="50" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">评测项目十：</td>
                <td width="77%" height="30" colspan="2"><input name="menu10" type="text" id="useraccount11"  size="50" /></td>
                 </tr>
             
               

             <tr>
              <td height="39" colspan="3" align="center"><input type="submit"  value="提交信息" name="B1" />        
                &nbsp;&nbsp;&nbsp;      
                
                <script type="text/javascript">
                function check()
                {
                if(f1.bjname.value=="")
                {
                alert("请输入班级名称");
                return;
                }
                 if(f1.bjteacher.value=="")
                {
                alert("请输入辅导员 ");
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
