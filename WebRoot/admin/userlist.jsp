<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
  </head>
  
  <body>
  
  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  dao.commOper("delete from sysuser where id="+did);
  }
  String key = request.getParameter("key")==null?"":request.getParameter("key");
  String f = request.getParameter("f");
  if(f==null)key = Info.getUTFStr(key);
  String hql = "select * from sysuser where 1=1 ";
  String url = "/sflatsys/admin/userlist.jsp?1=1";
  if(!key.equals(""))
  {
  hql+=" and (uname like'%"+key+"%' or truename like'%"+key+"%' or  sex like'%"+key+"%' or  linkphone like'%"+key+"%' )";
  url+="&key="+key;
  }
  hql+=" order by savetime desc ";
  System.out.print("hql");
   %>
  <form action="/sflatsys/admin/userlist.jsp?f=f" method="post" name="f1">
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
    <td class="left_txt2" valign="top" bgcolor="#F7F8F9"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td  height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;用户管理</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="46"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td  width="20%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">请输入关键字：</td>
                <td bgcolor="#f2f2f2" class="left_txt2"><input name="key" value="<%=key %>" type="text" id="title" size="45" />
                (注 : 可输入用户名，性别，真名，联系电话)
                </td>
                </tr>
              

             <tr>
              <td class="left_txt2" height="40" colspan="2" align="center"><input type="submit" value="查询用户" name="B1" />        
                &nbsp;&nbsp;&nbsp;        <input type="reset" onClick="adduser();" value="添加用户" name="B12" />
                
                <script type="text/javascript">
                function adduser()
                {
                pop("/sflatsys/admin/adduser.jsp","添加用户",520,380);
                }
                function updateuser(no)
                {
                pop("/sflatsys/admin/updateuser.jsp?id="+no,"修改用户",520,380);
                }
                </script>                </td>
              </tr>
              
              
            </table></td>
          </tr>
        </table>
		
		
		
		
		
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td ><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td  class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;用户列表</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td  height="110"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td  width="152" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">用户名</td>
                <td class="left_txt2" width="148" height="30" align="center" bgcolor="#f2f2f2">密码</td>
                <td class="left_txt2" width="148" align="center" bgcolor="#f2f2f2">真实姓名</td>
                <td class="left_txt2" width="148" align="center" bgcolor="#f2f2f2">性别</td>
                <td width="200" align="center" bgcolor="#f2f2f2" class="left_txt2">联系方式</td>
                <td width="200" align="center" bgcolor="#f2f2f2" class="left_txt2">所属部门</td>
                <td width="200" align="center" bgcolor="#f2f2f2" class="left_txt2">职称</td>
                <td width="200" align="center" bgcolor="#f2f2f2" class="left_txt2">人员类别</td>
                <td class="left_txt2" width="100" align="center" bgcolor="#f2f2f2">修改</td>
                <td class="left_txt2" width="100" height="30" align="center" bgcolor="#f2f2f2">删除</td>
			    </tr>
              
              <%
                  
		       PageManager pageManager = PageManager.getPage(url,10, request);
			    pageManager.doList(hql);
			    
			    PageManager bean= (PageManager)request.getAttribute("page");
			    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
			    int i=1;
              for(HashMap data:nlist)
              {
              i++;
              String color="";
              if(i%2!=0)color="#f2f2f2";
               %>
              <tr bgcolor="<%=color %>">
                <td width="152" height="30" align="center" class="left_txt2"><%=data.get("uname") %></td>
                <td class="left_txt2" width="148" height="30" align="center"><%=data.get("upass") %></td>
                <td class="left_txt2" align="center"><%=data.get("truename") %></td>
                <td class="left_txt2" align="center"><%=data.get("sex") %></td>
                <td align="center" class="left_txt2"><%=data.get("linkphone") %></td>
                <td align="center" class="left_txt2"><%=data.get("bumen") %></td>
                <td align="center" class="left_txt2">
                <%
                if(data.get("quanx").equals("教职工"))
                {
                 %>
                <%=data.get("ksf") %>
                <%} %>
                </td>
                <td align="center" class="left_txt2"><%=data.get("quanx") %></td>
                <td class="left_txt2" width="100" height="30" align="center" onClick="updateuser('<%=data.get("id") %>');" style="cursor: hand">修改</td>
                <td class="left_txt2" width="100" height="30" align="center"><a href="/sflatsys/admin/userlist.jsp?did=<%=data.get("id") %>">删除</a></td>
              </tr>
               <%} %>
             <tr>
              <td class="left_txt2" height="30" colspan="8" align="center">
              
              ${page.info }              </td>
              </tr>
              
              <tr>
                <td class="left_txt2" height="13" colspan="8" align="right" >&nbsp;</td>
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
