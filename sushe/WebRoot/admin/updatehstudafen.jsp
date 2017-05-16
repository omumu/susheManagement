<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>

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
 parent.location.replace("/sflatsys/admin/wggl.jsp");
 <%}%>
 </script>
 <%
 CommDAO dao = new CommDAO();
 
 String stuname = request.getParameter("stuname");
 String yf = request.getParameter("yf");
 String menu1fen = request.getParameter("menu1fen");
  String menu2fen = request.getParameter("menu2fen");
   String menu3fen = request.getParameter("menu3fen");
   if(menu1fen!=null)
   {
    dao.commOper("update stupinche set menu1fen='"+menu1fen+"',menu2fen='"+menu2fen+"',menu3fen='"+menu3fen+"' where stuno='"+stuname+"' and faname='"+yf+"'");
   %>
   <script type="text/javascript">
    parent.location.replace("/sflatsys/admin/hstudafen.jsp");
     </script>
   <%
   }

 
  %>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  
  <body >
  <form action="/sflatsys/admin/updatehstudafen.jsp?stuname=<%=stuname %>&yf=<%=yf %>" method="post" name="f1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="179" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="179" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入相关信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="148"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
                <td width="24%" height="49" align="center" class="left_txt2">增减：</td>
                <td height="49" class="left_txt2">
                
                <input type=radio name="menu1fen" value="增" checked="checked"> 增
                <input type=radio name="menu1fen" value="减" > 减
                
                </td>
                 </tr>
            
			    <tr>
                <td width="24%" height="49" align="center" bgcolor="#f2f2f2" class="left_txt2">金额：</td>
                <td height="49" bgcolor="#f2f2f2" class="left_txt2">

                <input type="text"  name="menu2fen"  size="8" id="teaname"> (请输入半角数字)

                </td>
                </tr>
                 <tr>
                <td width="24%" height="49" align="center" class="left_txt2">备注：</td>
                <td height="49" class="left_txt2"><input type="text"  name="menu3fen"  size="50" id="teaname"></td>
                 </tr>
                
               

             <tr>
              <td height="39" colspan="2" align="center"><input type="submit"  value="提交信息" name="B1" />        
                &nbsp;&nbsp;&nbsp;      
                
                <script type="text/javascript">
                function check()
                {
                if(f1.jianshu.value=="")
                {
                alert("请输入简述");
                return;
                }
                if(f1.clfs.value=="")
                {
                alert("请输入处理方式");
                return;
                }
                }
                </script>
                
                  <input type="reset" value="重新填写" name="B12" /></td>
              </tr>
              
              <tr>
                <td height="19" colspan="2" align="right" >&nbsp;</td>
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
<script type="text/javascript" src="/sflatsys/js/calendar/WdatePicker.js"></script>