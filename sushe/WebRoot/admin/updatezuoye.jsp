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
 parent.location.replace("/sflatsys/admin/zuoye.jsp");
 <%}%>
 </script>
 

<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  <%
CommDAO dao = new CommDAO();
String id = request.getParameter("id");
HashMap map = dao.select("select * from zuoye where id="+id).get(0);
 %>
  
  <body>
  <form action="/sflatsys/sflatsys?ac=updatezuoye&id=<%=id %>" method="post"  enctype="multipart/form-data"  name="f1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入作业信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="119"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td width="22%" height="30" align="center" class="left_txt2">作业说明：</td>
                <td width="78%" height="30" colspan="2"><input name="userpass" value="<%=map.get("title") %>"   type="text" id="userpass2" size="40" /></td>
                </tr>
              <tr>
                <td width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">作业：</td>
                <td width="78%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="zhenghao"   type="file" id="userpass" size="40" /></td>
                </tr>
             

             <tr>
              <td height="39" colspan="3" align="center"><input type="submit" onMouseDown="check();" value="提交信息" name="B1" />        
                &nbsp;&nbsp;&nbsp;      
                
                <script type="text/javascript">
                function check()
                {
                if(f1.fkname.value=="")
                {
                alert("请输入访客姓名");
                return;
                }
                 if(f1.zhenghao.value=="")
                {
                alert("请输入证件");
                return;
                }
                 if(f1.zhenghaoma.value=="")
                {
                alert("请输入证件号码");
                return;
                }
                 if(f1.yuanyin.value=="")
                {
                alert("请输入事由");
                return;
                }
                 if(f1.starttime.value=="")
                {
                alert("请输入进入时间");
                return;
                }
                 if(f1.lasttime.value=="")
                {
                alert("请输入逗留时间");
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
