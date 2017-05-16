<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript"  src="/sflatsys/fckeditor/fckeditor.js"></script>
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
 <script language="javascript">
 function fckinit()
 {
   var of = new FCKeditor("content");
		of.BasePath="/sflatsys/fckeditor/";
		of.Height = "300";
		of.ToolbarSet="Default";
		of.ReplaceTextarea();
 }
 </script>
  </head>
  
  <BODY onLoad="fckinit()">
  
  <%
  CommDAO dao = new CommDAO();
  String title = request.getParameter("title")==null?"系统简介":request.getParameter("title");
  String f = request.getParameter("f");
  if(f!=null)title=Info.getUTFStr(title);
  HashMap map = dao.select("select * from mixinfo where title='"+title+"'").get(0);
  
   %>
  <form action="/sflatsys/sflatsys?ac=mixinfo" method="post" name="f1">
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
    <td class="left_txt2" valign="top" bgcolor="#F7F8F9"><table width="100%" height="205" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td  height="205" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;用户管理</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="174"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td  width="20%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">请选择信息类别：</td>
                <td bgcolor="#f2f2f2" class="left_txt2"><label>
                  <select name="title" onchange="window.location.replace('/sflatsys/admin/mixinfo.jsp?f=f&title='+this.value)" id="select">
                    <option value="系统简介" <%if(map.get("title").equals("系统简介"))out.print("selected=selected") ;%>>系统简介</option>
                    <option value="联系我们" <%if(map.get("title").equals("联系我们"))out.print("selected=selected") ;%>>联系我们</option>
                  </select>
                </label></td>
                </tr>
                
                
                <tr>
                <td height="114" colspan="2" align="center" bgcolor="#f2f2f2" class="left_txt2"><label>
                  <textarea name="content"  id="textarea" cols="45" rows="5"><%=map.get("content") %></textarea>
                </label></td>
                </tr>
                
                
              

             <tr>
              <td class="left_txt2" height="30" colspan="2" align="center"><input type="submit" value="提交信息" name="B1" />        
                &nbsp;&nbsp;&nbsp;        <input type="reset"  value="重新填写" name="B12" />
                
                <script type="text/javascript">
                function adduser()
                {
                pop("/sflatsys/admin/adduser.jsp","添加用户",500,290);
                }
                function updateuser(no)
                {
                pop("/sflatsys/admin/updateuser.jsp?id="+no,"修改用户",500,260);
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
