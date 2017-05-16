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
 alert("登录成功");
 parent.location.replace("/sflatsys/");
 <%}%>
 
 <%
String error = (String)request.getAttribute("error");
if(error!=null)
{
 %>
 alert("用户名或密码错误");
 <%}%>
 </script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  
  
  <%
  CommDAO dao = new CommDAO();
  List<HashMap> list = dao.select("select * from bclass order by savetime desc");
  
   %>
    <body>
  <form action="/sflatsys/sflatsys?ac=stulogin" method="post" name="f1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入学生信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height=""><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td width="23%" height="30" align="center" class="left_txt2">学生名字：</td>
                <td width="77%" height="30" colspan="2"><input name="stuname" type="text" id="useraccount"  size="30" /></td>
                </tr>
            
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">学号：</td>
                <td width="77%" height="30" colspan="2"><input name="stuxuehao" type="text"   id="truename" size="30" /></td>
                 </tr>
              
                 
              

             <tr>
              <td height="39" colspan="3" align="center"><input type="submit"  onmousedown="check();" value="提交信息" name="B1" />        
                &nbsp;&nbsp;&nbsp;      
                
                <script type="text/javascript">
               function check()
                {
                if(f1.stuname.value=="")
                {
                alert("请输入学生姓名");
                return;
                }
                 if(f1.stuxuehao.value=="")
                {
                alert("请输入学号 ");
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
