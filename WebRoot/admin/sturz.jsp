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
 parent.location.replace("/sflatsys/admin/rzgl.jsp");
 <%}%>
 </script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  
  
  <%
  CommDAO dao = new CommDAO();
  String id = request.getParameter("id");
 List<HashMap> list = dao.select("select * from bclass order by id desc");
  List<HashMap> sslist = dao.select("select * from shushe order by id desc");
 HashMap data = dao.select("select * from student where id="+id).get(0);
   %>
    <body>
  <form action="/sflatsys/sflatsys?ac=updatesturz&id=<%=id %>" method="post" name="f1">
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
            <td height="178"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td width="23%" height="30" align="center" class="left_txt2">学生名字：</td>
                <td width="77%" height="30" colspan="2"><input name="stuname" readonly="readonly" value="<%=data.get("stuname") %>" type="text" id="useraccount"  size="20" /></td>
                </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">班级：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><label>
                  <select name="stubj" disabled="disabled">
                  <%
                  for(HashMap map:list)
                  {
                   %>
                    <option value="<%=map.get("id") %>" <%if(data.get("stubj").equals(map.get("id")))out.print("selected=selected"); %>><%=map.get("bjname") %></option>
                <%
                }
                 %>
                  </select>
                </label>				</td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">学号：</td>
                <td width="77%" height="30" colspan="2"><input name="stuxuehao" readonly="readonly" type="text"  value="<%=data.get("stuxuehao") %>"   id="truename" size="30" /></td>
                 </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">电话：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input type="text" readonly="readonly" value="<%=data.get("stuphone") %>"  name="stuphone" id="truename" size="30"></td>
                </tr>
                 
                 
                  <tr>
                <td width="23%" height="30" align="center" bgcolor="" class="left_txt2">入住宿舍编号：</td>
                <td width="77%" height="30" colspan="2" bgcolor="">

              <select name="stuss">
                  <%
                  for(HashMap map:sslist)
                  {
                   %>
                    <option value="<%=map.get("id") %>"><%=map.get("ssno") %></option>
                <%
                }
                 %>
                  </select>


</td>
                </tr>
                
                
                
                 <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">床号：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2">
               <input type="text"  value="<%=data.get("stuch") %>"   name="stuch" size="30">
               </td>
                </tr>
                
                 <tr>
                <td width="23%" height="30" align="center" bgcolor="" class="left_txt2">床位：</td>
                <td width="77%" height="30" colspan="2" bgcolor="">
               <input type="text"   value="<%=data.get("stucw") %>"  name="stucw"  size="30">
               </td>
                </tr>
                
               

             <tr>
              <td height="39" colspan="3" align="center"><input type="submit" onmousedown="check();"  value="提交信息" name="B1" />        
                &nbsp;&nbsp;&nbsp;      
                
                <script type="text/javascript">
                function check()
                {
                if(f1.stuch.value=="")
                {
                alert("请输入床号");
                return;
                }
                if(f1.stucw.value=="")
                {
                alert("请输入床位");
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
