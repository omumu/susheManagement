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
   HashMap user = (HashMap)session.getAttribute("tea");
  String id = user.get("id").toString();
  CommDAO dao = new CommDAO();
  HashMap map = (HashMap)dao.select("select * from teacher where id="+id).get(0);
   %>
  <body>
  <form action="/sflatsys/sflatsys?ac=updatesflatsys2&id=<%=map.get("id") %>" method="post" name="f1">
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
                <td width="24%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">导师编号：</td>
                <td height="30" bgcolor="#f2f2f2"><label>
                  <input type="text" name="teano" readonly="readonly" value="<%=map.get("teano") %>" id="teano">
                </label></td>
                </tr>
                 <tr>
                <td width="24%" height="30" align="center" class="left_txt2">姓名：</td>
                <td height="30" class="left_txt2"><input type="text" name="teaname" value="<%=map.get("teaname") %>"  id="teaname"></td>
                 </tr>
                  <tr>
                <td width="24%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">所属部门：</td>
                <td height="30" bgcolor="#f2f2f2" class="left_txt2"><input type="text"   name="teabm" value="<%=map.get("teabm") %>"  id="teabm">
                
                
               
                
                
                </td>
                  </tr>
                 <tr>
                <td width="24%" height="30" align="center" class="left_txt2">联系电话：</td>
                <td height="30" class="left_txt2"><input type="text" name="teaphone" value="<%=map.get("teaphone") %>"  id="teaphone"></td>
                 </tr>
                  <tr>
                <td width="24%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">研究方向：</td>
                <td height="30" bgcolor="#f2f2f2" class="left_txt2"><input type="text" style="width:80%"  name="fangxiang" value="<%=map.get("fangxiang") %>"  id="fangxiang"></td>
                  </tr>
                 <tr>
                <td width="24%" height="30" align="center" class="left_txt2">相关课题：</td>
                <td height="30" class="left_txt2"><input type="text" style="width:80%" name="ketis" value="<%=map.get("ketis") %>"  id="ketis"></td>
                 </tr>
               
               

             <tr>
              <td height="39" colspan="2" align="center"><input type="submit" onMouseDown="check();" value="提交信息" name="B1" />        
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
