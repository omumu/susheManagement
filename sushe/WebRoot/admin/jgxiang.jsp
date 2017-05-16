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
  String id = request.getParameter("id");
  HashMap map = dao.select("select * from jigou where id="+id).get(0);
   %>
   
 
   
  <form action="/sflatsys/sflatsys?ac=updatejigou&id=<%=id %>" method="post" name="f1">
   
               <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f2f2f2">
               
                <tr>
                <td height="30" colspan="3" align="center" class="left_txt2"><strong>机构信息</strong></td>
                </tr>
               
			    <tr>
                <td width="23%" height="30" align="center" class="left_txt2">机构名称：</td>
                <td width="77%" height="30" colspan="2"><input name="jgname" value="<%=map.get("jgname") %>" type="text" id="useraccount"  size="50" /></td>
                </tr>
              <tr>
                <td width="23%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">负责人：</td>
                <td width="77%" height="30" colspan="2" bgcolor="#f2f2f2"><input name="fzr"   value="<%=map.get("fzr") %>"  type="text" id="userpass" size="20" /></td>
                </tr>
                 <tr>
                <td width="23%" height="30" align="center" class="left_txt2">联系电话：</td>
                <td width="77%" height="30" colspan="2"><input name="tel"  value="<%=map.get("tel") %>"  type="text"   id="tel" size="30" /></td>
                 </tr>
                 
                  <tr>
                <td width="23%" height="30" align="center" class="left_txt2">简介：</td>
                <td width="77%" height="30" colspan="2"><input name="jianjie"  value="<%=map.get("jianjie") %>"  type="text"   id="jianjie" size="60" /></td>
                 </tr>
                 
                  <tr>
                <td width="23%" height="30" align="center" class="left_txt2">地址：</td>
                <td width="77%" height="30" colspan="2"><input name="addr" value="<%=map.get("addr") %>"  type="text"   id="addr" size="60" /></td>
                 </tr>
                 
            
             
               

             <tr>
              <td height="39" colspan="3" align="center">
              <%
             if(request.getParameter("p")==null)
             {
               %>
              <input type="submit"  value="提交信息" name="B1" />        
               &nbsp;&nbsp;
                  <input type="button" onclick="window.location.replace('addjigou.jsp?pid=<%=id %>')" value="添加下级" name="B12" />
                 &nbsp;&nbsp;
                  <input type="button" onclick="window.location.replace('/sflatsys/sflatsys?ac=deljigou&id=<%=id %>')"  value="删除机构" name="B12" /> 
                  <%} %>  
                  </td>
              </tr>
              
              <tr>
                <td height="19" colspan="3" align="right" >&nbsp;</td>
              </tr>
            </table>
                
                
                
</form>
  </body>
</html>
<script type="text/javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
 parent.location.replace("/sflatsys/admin/sslist.jsp");
 <%}%>
 </script>
