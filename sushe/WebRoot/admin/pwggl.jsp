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
  dao.commOper("delete from stusflatsys where id="+did);
  }
  String key = request.getParameter("key")==null?"":request.getParameter("key");
  String f = request.getParameter("f");
  if(f==null)key = Info.getUTFStr(key);
  String hql = "select * from stusflatsys where 1=1 ";
  String url = "/sflatsys/admin/wggl.jsp?1=1";
  if(!key.equals(""))
  {
  hql+=" and (xuehao like'%"+key+"%' or faname like'%"+key+"%'  )";
  url+="&key="+key;
  }
  hql+=" order by id desc ";
  System.out.print("hql");
   %>
  <form action="/sflatsys/admin/wggl.jsp?f=f" method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    
    <td width="1212" valign="top" bgcolor="#F7F8F9" class="left_txt2"><table width="100%" height="141" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td  height="141" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
         
          <tr>
            <td  height="110"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td  width="274" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">姓名-学号</td>
                <td class="left_txt2" width="369" align="center" bgcolor="#f2f2f2">方案名</td>
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">评测结果</td>
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
                <td height="30" align="center" class="left_txt2"><%=data.get("stuno") %></td>
                <td class="left_txt2" align="center"><%=data.get("faname") %></td>
                <td height="30" align="center" class="left_txt2">
                
                <%
                for(int ii=1;ii<11;ii++)
                {
                String text = data.get("menu"+ii+"fen").toString();
                if(text.indexOf("---")==0)continue;
                out.println(text+"<br />");
                }
                 %>                </td>
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
