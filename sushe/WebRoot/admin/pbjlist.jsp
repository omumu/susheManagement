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
  dao.commOper("delete from fangan where id="+did);
  }
  String key = request.getParameter("key")==null?"":request.getParameter("key");
  String f = request.getParameter("f");
  if(f==null)key = Info.getUTFStr(key);
  String hql = "select * from fangan where 1=1 ";
  String url = "/sflatsys/pbjlist.jsp?1=1";
  if(!key.equals(""))
  {
  hql+=" and (faname like'%"+key+"%')";
  url+="&key="+key;
  }
  hql+=" order by id desc ";
   %>
  <form action="/sflatsys/admin/bjlist.jsp?f=f" method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    
    <td width="1212" valign="top" bgcolor="#F7F8F9" class="left_txt2"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td  height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          
          <tr>
            <td  height="110"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td   height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">方案名称</td>
               
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">评测项目</td>
                </tr>
              
              <%
                  
		       PageManager pageManager = PageManager.getPage(url,2, request);
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
                <td width="" height="30" align="center" class="left_txt2"><%=data.get("faname") %></td>
                
                <td height="30" align="center" class="left_txt2">
                <%
                for(int ii=1;ii<11;ii++)
                {
                if(data.get("menu"+ii)==null||data.get("menu"+ii).equals(""))continue;
                out.print(data.get("menu"+ii)+"<br />");  
                }
                %></td>
                </tr>
               <%} %>
             <tr>
              <td class="left_txt2" height="30" colspan="3" align="center">
              
              ${page.info }              </td>
              </tr>
              
              <tr>
                <td class="left_txt2" height="13" colspan="3" align="right" >&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table>          </td>
      </tr>
    </table></td>
    
  </tr>
</table>
</form>
  </body>
</html>
