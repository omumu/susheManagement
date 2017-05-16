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
 parent.location.replace("/sflatsys/admin/userlist.jsp");
 <%}%>
 </script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  <%
  String id = request.getParameter("id");
  CommDAO dao = new CommDAO();
  HashMap data = (HashMap)dao.select("select * from sysuser where id="+id).get(0);
  String quanx = (data.get("quanx")==null?"":data.get("quanx")).toString();
  String[] q = quanx.split("-");
  String a = "";
  String b = "";
  String c = "";
  for(String bb:q)
  {
   if(bb.equals("日常信息管理"))
  {
   a = "checked=checked";
  }
  if(bb.equals("评分信息管理"))
  {
   b = "checked=checked";
  }
  if(bb.equals("基础信息管理"))
  {
   c = "checked=checked";
  }
  }
   %>
  <body>
  <form action="/sflatsys/sflatsys?ac=updateuser&id=<%=id %>" method="post" name="f1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  
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
                <td width="23%" height="30" align="center" class="left_txt2">用户名：</td>
                <td width="77%" height="30" colspan="2"><input name="uname" type="text" readonly="readonly" id="useraccount" value="<%=data.get("uname") %>" size="20" /></td>
                </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">密码：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="upass"  value="<%=data.get("upass") %>"   type="text" id="userpass" size="20" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">真实姓名：</td>
                <td width="77%" height="30" colspan="2"><input name="truename" type="text"  value="<%=data.get("truename") %>"   id="truename" size="20" /></td>
                 </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">性别：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2" class="left_txt2"><label>
                  <input name="sex" type="radio" value="男" <%if(data.get("sex").equals("男")) {%> checked<%} %>>
                男
                <input name="sex" type="radio" <%if(data.get("sex").equals("女")) {%> checked<%} %> value="女">
                女
                </label></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">联系方式：</td>
                <td width="77%" height="30" colspan="2"><input name="linkphone" type="text"  value="<%=data.get("linkphone") %>"   id="linkphone" size="40" /></td>
                </tr>
                
                 <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">部门：</td>
                <td width="77%" height="30" bgcolor="#f2f2f2"  colspan="2"><input name="bumen" type="text"   value="<%=data.get("bumen") %>"  onclick="choosebj()" readonly="readonly"    id="jigid" size="40" /></td>
                </tr>
                
                
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">人员类别：</td>
                <td width="77%" height="30" colspan="2" class="left_txt2">
                
                <input name="quanx" type="radio" <%if(data.get("quanx").equals("教务人员")) {%> checked<%} %>  value="教务人员">
                 教务人员 
                <input name="quanx" type="radio" <%if(data.get("quanx").equals("财务人员")) {%> checked<%} %>  value="财务人员">  
                 财务人员 
                 <input name="quanx" type="radio" <%if(data.get("quanx").equals("维护人员")) {%> checked<%} %>  value="维护人员"> 
                 维护人员 
                  <input name="quanx" type="radio" <%if(data.get("quanx").equals("教职工")) {%> checked<%} %>  value="教职工">
                 教职工                </td>
                </tr>
                
                
                 <tr>
                
                <td height="30" colspan="3" align="center" bgcolor="#f2f2f2" width="100%" class="left_txt2"> 下列人员类别为教职工时有效</td>
                <script type="text/javascript">
                  function choosebj()
                  {
                  pop("jigou.jsp","选择班级",200,160);
                  }
                  </script>
</tr>


   <tr>
                <td height="30" colspan="3" align="center" class="left_txt2">职称
                  <input name="ksf" type="radio"  value="讲师" checked>
讲师
<input name="ksf" type="radio"  value="教授">
教授 基本公寓
<input name="infoa" type="text"   id="infoa" size="3" />  
地区补贴
<input name="infob" type="text"   id="infob" size="3" />  
<br />
岗位津贴
<input name="infoc" type="text"   id="infoc" size="3" />  
年限公寓
<input name="infod" type="text"   id="infod" size="3" />  


公积金
<input name="infoe" type="text"   id="infoe" size="3" /> 
医保
<input name="infof" type="text"   id="infof" size="3" /> 
<br />
社保
<input name="infog" type="text"   id="infog" size="3" />  
生活补贴  
<input name="infoh" type="text"   id="infoh" size="3" />
交通补贴
<input name="infoi" type="text"   id="infoi" size="3" /> 
行政补贴
<input name="infoj" type="text"   id="infoj" size="3" /></td>
                </tr>
                
                
                
                
                
              <script type="text/javascript">
                  function choosebj()
                  {
                  pop("jigou.jsp","选择班级",200,160);
                  }
                  </script>
               
                
                

             <tr>
              <td height="39" colspan="3" align="center"><input type="submit" onMouseDown="" value="提交信息" name="B1" />        
                &nbsp;&nbsp;&nbsp;      
                
                <script type="text/javascript">
                function check()
                {
                var useraccount = f1.useraccount.value;
                var ajax = new AJAX();
				ajax.post("/sflatsys/sflatsys.do?ac=checkuname&checkuname="+useraccount);
				var msg = ajax.getValue();
				if(msg=="N")
				{
				alert("该用户名已存在，请使用其他用户名");
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
<%=Info.tform(data) %>
<%dao.close(); %>
