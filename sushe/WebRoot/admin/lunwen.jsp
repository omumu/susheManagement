<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
<%
HashMap user = new HashMap(); 
if(session.getAttribute("admin")!=null)
{
user = (HashMap)session.getAttribute("admin");
}
if(session.getAttribute("stu")!=null)
{
user = (HashMap)session.getAttribute("stu");
}
if(session.getAttribute("tea")!=null)
{
user = (HashMap)session.getAttribute("tea");
}
 %>

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
  String hql = "select * from lunwen where uid='"+user.get("stuxuehao")+"' ";
  String url = "/sflatsys/admin/lunwen.jsp?1=1";
  if(!key.equals(""))
  {
  hql+=" and (lwname like'%"+key+"%'  )";
  url+="&key="+key;
  }
  hql+=" order by savetime desc ";
  System.out.print("hql");
   %>
  <form action="/sflatsys/admin/lunwen.jsp?f=f" method="post" name="f1">
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
                <td class="left_bt2">&nbsp;&nbsp;&nbsp; 论文管理</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="46"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td  width="20%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">请输入关键字：</td>
                <td bgcolor="#f2f2f2" class="left_txt2"><input name="key" value="<%=key %>" type="text" id="title" size="45" />&nbsp; 
                </td>
                </tr>
              

             <tr>
              <td class="left_txt2" height="40" colspan="2" align="center">
              <input type="submit" value="查询论文" name="B1" />   
              &nbsp;&nbsp;&nbsp;      
              <input type="button" onClick="add();" value="提交论文" name="B1" />   
                
                <script type="text/javascript">
                function add()
                {
                pop("/sflatsys/admin/addlunwen.jsp","提交论文",500,180);
                }
                function update(no)
                {
                pop("/sflatsys/admin/updatelunwen.jsp?id="+no,"修改论文",500,180);
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
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">学生</td>
                <td class="left_txt2" height="30" align="center" bgcolor="#f2f2f2">论文名称</td>
                <td class="left_txt2" align="center" bgcolor="#f2f2f2">论文简介</td>
                <td class="left_txt2" align="center" bgcolor="#f2f2f2">论文下载</td>
                <td align="center" bgcolor="#f2f2f2" class="left_txt2">能否修改</td>
                <td align="center" bgcolor="#f2f2f2" class="left_txt2">上传时间</td>
                <td class="left_txt2" align="center" bgcolor="#f2f2f2">批改老师</td>
                 <td class="left_txt2" align="center" bgcolor="#f2f2f2">批改论文</td>
                  <td class="left_txt2" align="center" bgcolor="#f2f2f2">打分</td>
                   <td class="left_txt2" align="center" bgcolor="#f2f2f2">批改时间</td>
                <td class="left_txt2" height="30" align="center" bgcolor="#f2f2f2">操作</td>
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
                <td height="30" align="center" class="left_txt2"><%=data.get("uid") %></td>
                <td class="left_txt2" height="30" align="center"><%=data.get("lwname") %></td>
                <td align="center" class="left_txt2"><%=data.get("lwjj") %></td>
                <td align="center" class="left_txt2"><a href="/sflatsys/upload?filename=<%=data.get("url") %>">下载</a></td>
                <td align="center" class="left_txt2"><%=data.get("isupdate") %></td>
                <td align="center" class="left_txt2"><%=data.get("savetime") %></td>
                <td class="left_txt2" height="30" align="center" ><%=data.get("tid") %></td>
                
                 <td class="left_txt2" align="center" bgcolor="">
                 
                 <%if(!data.get("purl").equals(""))
                 {
                  %>
                  <a href="/sflatsys/upload?filename=<%=data.get("purl") %>">下载</a>
                 <%} %>
                 </td>
                  <td class="left_txt2" align="center" bgcolor=""><%=data.get("dafen")==null?"":data.get("dafen") %></td>
                   <td class="left_txt2" align="center" bgcolor=""><%=data.get("psavetime") %></td>
                   
                <td class="left_txt2" height="30" align="center">
                
                <%
                if(data.get("isupdate").equals("是"))
                {
                 %>
                <a href="javascript:update('<%=data.get("id") %>')">修改</a>
                <%} %>
                
                
                </td>
              </tr>
               <%} %>
             <tr>
              <td class="left_txt2" height="30" colspan="18" align="center">
              
              ${page.info }              </td>
              </tr>
              
              <tr>
                <td class="left_txt2" height="13" colspan="18" align="right" >&nbsp;</td>
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
