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
  String tid = request.getParameter("tid");
  if(tid!=null)
  {
  dao.commOper("update stutea set status='已通过' where id="+tid);
  }
  String did = request.getParameter("did");
  if(did!=null)
  {
  dao.commOper("delete from stutea where id="+did);
  }
  String jid = request.getParameter("jid");
  if(jid!=null)
  {
  dao.commOper("update stutea set status='已拒绝' where id="+jid);
  }
  String key = request.getParameter("key")==null?"":request.getParameter("key");
  String f = request.getParameter("f");
  if(f==null)key = Info.getUTFStr(key);
  String hql = "select a.*,b.id as bid,b.status as bstatus from student a,stutea b where a.id=b.stuid and b.teaid='"+user.get("id")+"' ";
  String url = "/sflatsys/admin/xzxs.jsp?1=1";
  if(!key.equals(""))
  {
  hql+=" and (a.stuname like'%"+key+"%' or a.stuxuehao like'%"+key+"%'  )";
  url+="&key="+key;
  }
  hql+=" order by b.savetime desc ";
  System.out.print("hql");
   %>
  <form action="/sflatsys/admin/xzxs.jsp?f=f" method="post" name="f1">
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
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;学生管理</td>
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
              <td class="left_txt2" height="40" colspan="2" align="center"><input type="submit" value="查询学生" name="B1" />         
                
                
                <script type="text/javascript">
                function addstu()
                {
                pop(sflatsyshi/admin/addstu.jsp","添加学生",500,230);
                }
                function updatestu(no)
                {
                pop(sflatsyshi/admin/updatestu.jsp?id="+no,"修改学生",500,230);
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
                <td  class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;学生列表</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td  height="110"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td  width="202" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">学生名字</td>
                <td class="left_txt2" width="202" height="30" align="center" bgcolor="#f2f2f2">班级</td>
                <td class="left_txt2" width="202" align="center" bgcolor="#f2f2f2">电话</td>
                <td class="left_txt2" width="203" align="center" bgcolor="#f2f2f2">学号</td>
                <td width="203" align="center" bgcolor="#f2f2f2" class="left_txt2">当前状态</td>
                <td class="left_txt2" width="100" height="30" align="center" bgcolor="#f2f2f2">操作</td>
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
              HashMap m = dao.select("select * from jigou where id="+data.get("stubj")).get(0);
               %>
              <tr bgcolor="<%=color %>">
                <td width="202" height="30" align="center" class="left_txt2"><%=data.get("stuname") %></td>
                <td class="left_txt2" width="202" height="30" align="center"><%=m.get("jgname") %></td>
                <td class="left_txt2" align="center"><%=data.get("stuphone") %></td>
                <td class="left_txt2" align="center"><%=data.get("stuxuehao") %></td>
                <td align="center" class="left_txt2"><%=data.get("bstatus") %></td>
                <td class="left_txt2" width="100" height="30" align="center">
                <%
                if(data.get("bstatus").equals("申请中"))
                {
                 %>
                <a href=sflatsyshi/admin/xzxs.jsp?tid=<%=data.get("bid") %>">通过</a>
                &nbsp;|&nbsp;&nbsp;
                <a href=sflatsyshi/admin/xzxs.jsp?jid=<%=data.get("bid") %>">拒绝</a>
                <%} %>
                
                
                <%
                if(data.get("bstatus").equals("已通过"))
                {
                 %>
                <a href=sflatsyshi/admin/xzxs.jsp?did=<%=data.get("bid") %>">删除</a>
                <%} %>
                
                </td>
              </tr>
               <%} %>
             <tr>
              <td class="left_txt2" height="30" colspan="7" align="center">
              
              ${page.info }              </td>
              </tr>
              
              <tr>
                <td class="left_txt2" height="13" colspan="7" align="right" >&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table>
		
		
		
		
		
		
          </td>
      </tr>
    </table></td>
    <td class="left_txt2" background=sflatsyshi/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td class="left_txt2" valign="middle" background=sflatsyshi/images/mail_leftbg.gif"><img src=sflatsyshi/images/buttom_left2.gif" width="17" height="17" /></td>
      <td class="left_txt2" height="17" valign="top" background=sflatsyshi/images/buttom_bgs.gif"><img src=sflatsyshi/images/buttom_bgs.gif" width="17" height="17" /></td>
    <td class="left_txt2" background=sflatsyshi/images/mail_rightbg.gif"><img src=sflatsyshi/images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</form>
  </body>
</html>
<%dao.close(); %>
