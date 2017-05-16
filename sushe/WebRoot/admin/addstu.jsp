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
 parent.location.replace("/sflatsys/admin/stulist.jsp");
 <%}%>
 </script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
<script type="text/javascript" src="/sflatsys/js/calendar/WdatePicker.js"></script>
  </head>
  
  
  <%
  CommDAO dao = new CommDAO();
  List<HashMap> list = dao.select("select * from sysuser where quanx='教职工'");
  
   %>
    <body>
  <form action="/sflatsys/sflatsys?ac=addstu" method="post" name="f1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入考勤信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="178"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td width="23%" height="39" align="center" class="left_txt2">日期：</td>
                <td width="77%" height="39" colspan="2"><input type="text" onclick="WdatePicker();" name="stubj" id="jigid" size="20"></td>
                </tr>
              <tr>
                <td width="23%" height="39" align="center" bgcolor="#f2f2f2" class="left_txt2">教职工：</td>
                <td width="77%" height="39" colspan="2" bgcolor="#f2f2f2"><label>
                  
                  
                  
                
                   <script type="text/javascript">
                  function choosebj()
                  {
                  pop("jigou.jsp","选择班级",200,160);
                  }
                  </script>
                     <select name="stuname" type="text" id="useraccount"   >
                <%
              for(HashMap map:list)
              {
                %>
                <option value="<%=map.get("uname") %>"><%=map.get("uname") %></option>
               <%} %>
                </select>
                  
                </label>				</td>
                </tr>
                 <tr>
                <td width="23%" height="39" align="center" class="left_txt2">出勤时间：</td>
                <td width="77%" height="39" colspan="2"><input name="stuxuehao" type="text"   id="truename" size="30" /></td>
                 </tr>
              <tr>
                <td width="23%" height="39" align="center" bgcolor="#f2f2f2" class="left_txt2">退勤时间：</td>
                <td width="77%" height="39" colspan="2" bgcolor="#f2f2f2"><input type="text" name="stuphone" id="truename" size="30"></td>
                </tr>
                 
                <tr>
                <td width="23%" height="39" align="center" class="left_txt2">考勤状态：</td>
                <td width="77%" height="39" colspan="2"  class="left_txt2">
                <input name="status" type="radio"  value="正常出勤" checked />正常出勤
                <input name="status" type="radio"  value="迟到" />迟到
                <input name="status" type="radio"  value="早退" />早退
                <input name="status" type="radio"  value="迟到早退" />迟到早退
                </td>
                 </tr>

             <tr>
              <td height="39" colspan="3" align="center"><input type="submit"    value="提交信息" name="B1" />        
                &nbsp;&nbsp;&nbsp;      
                
                <script type="text/javascript">
               function check()
                {
                if(f1.stuname.value=="")
                {
                alert("请输入考勤姓名");
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
