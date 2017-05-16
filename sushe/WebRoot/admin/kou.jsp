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
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
<script type="text/javascript">

 alert("操作成功");
 parent.location.replace("/sflatsys/admin/sszpf.jsp");
 </script>
 <%}else{%>
 
 
 <%
  CommDAO dao = new CommDAO();
 List<HashMap> list = dao.select("select * from student order by id desc");
 List<HashMap> sslist = dao.select("select * from shushe order by id desc");
 
 String ids = request.getParameter("ids").split("and")[0];
 String times = request.getParameter("ids").split("and")[1];
  %>
 
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  
  <body>
  <form action="/sflatsys/sflatsys?ac=koufen&ids=<%=ids %>&dtimes=<%=times %>" method="post" name="f1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入扣分信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="132"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td width="15%" height="30" align="center" class="left_txt2">分数：</td>
                <td width="15%" height="30"><label>
                  <select name="fens">
				  <option value="1">1</option>
				  <option value="2">2</option>
				  <option value="3">3</option>
				  <option value="4">4</option>
				  <option value="5">5</option>
				  <option value="6">6</option>
				  <option value="7">7</option>
				  <option value="8">8</option>
				  <option value="9">9</option>
				  <option value="10">10</option>
                  </select>
                </label></td>
                <td width="15%" align="center" class="left_txt2">原因：</td>
                <td width="44%" height="30"><input name="yuanyin" type="text" id="fkname"  size="30" /></td>
			    <td width="11%"><label>
			      <input type="submit" name="Submit" value=" 扣 ">
			    </label></td>
			    </tr>
              <tr>
                <td height="23" colspan="5" align="center" bgcolor="#f2f2f2" class="left_txt2"><strong>已扣分及原因</strong></td>
                </tr>
               
               <%
               List<HashMap> klist = dao.select("select * from koufen where ktype='0' and datetimes ='"+times+"' and ssorstuid='"+ids+"'");
               for(HashMap m:klist)
               {
                %>
                 <tr>
                <td height="30" colspan="5" align="left" class="left_txt2">&nbsp;&nbsp;扣&nbsp;<%=m.get("fens") %>&nbsp;分&nbsp;&nbsp;<%=m.get("yuanyin") %></td>
                </tr>
             <%
             }
              %>


             <tr>
              <td height="30" colspan="5" align="center">&nbsp;</td>
              </tr>
              
              <tr>
                <td height="19" colspan="5" align="right" >&nbsp;</td>
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
<%} %>
