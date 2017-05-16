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
  String sql1="delete from stutea where stuid='"+user.get("id")+"' ";
  dao.commOper(sql1);
  String sql="insert into stutea values(null,'"+user.get("id")+"','"+tid+"','申请中','"+Info.getDateStr()+"')";
  dao.commOper(sql);
  }
   String did = request.getParameter("did");
  if(did!=null)
  {
  String sql1="delete from stutea where id='"+did+"' ";
  dao.commOper(sql1);
  }
  String key = request.getParameter("key")==null?"":request.getParameter("key");
  String f = request.getParameter("f");
  if(f==null)key = Info.getUTFStr(key);
  String hql = "select * from teacher where 1=1 ";
  String url = "/sflatsys/admin/xzls.jsp?1=1";
  if(!key.equals(""))
  {
  hql+=" and (teano like'%"+key+"%' or teaname like'%"+key+"%'  )";
  url+="&key="+key;
  }
  hql+=" order by id desc ";
  System.out.print("hql");
   %>
  <form action="/sflatsys/admin/xzls.jsp?f=f" method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">基础信息管理</div></td>
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
                <td class="left_bt2">&nbsp;&nbsp;&nbsp; 选择老师</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="46"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td  width="20%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">请输入关键字：</td>
                <td bgcolor="#f2f2f2" class="left_txt2"><input name="key" value="<%=key %>" type="text" id="title" size="45" /> 
                (注 : 可输入姓名,导师编号)                </td>
                </tr>
              

             <tr>
              <td class="left_txt2" height="40" colspan="2" align="center"><input type="submit" value="查询信息" name="B1" />         
                
                
                <script type="text/javascript">
                function addwg()
                {
                pop("sflatsysi/admin/addwg.jsp","添加信息",500,260);
                }
                function updatewg(no)
                {
                pop("sflatsysi/admin/updatewg.jsp?id="+no,"修改信息",500,260);
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
                <td  class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;信息列表</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td  height="110"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">导师编号</td>
                <td class="left_txt2" align="center" bgcolor="#f2f2f2">登录密码</td>
                <td align="center" bgcolor="#f2f2f2" class="left_txt2">姓名</td>
                <td class="left_txt2" align="center" bgcolor="#f2f2f2">所属部门</td>
                <td align="center" bgcolor="#f2f2f2" class="left_txt2">联系电话</td>
                <td align="center" bgcolor="#f2f2f2" class="left_txt2">研究方向</td>
                <td align="center" bgcolor="#f2f2f2" class="left_txt2">相关课题</td>
                <td align="center" bgcolor="#f2f2f2" class="left_txt2">已选择人数</td>
                <td align="center" bgcolor="#f2f2f2" class="left_txt2">状态</td>
                <td class="left_txt2" align="center" bgcolor="#f2f2f2">操作</td>
               
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
              String dsql = "select * from stutea where stuid='"+user.get("id")+"' and teaid='"+data.get("id")+"' and status='已通过' order by id desc";
			  List<HashMap> dlist= dao.select(dsql);
               %>
              <tr bgcolor="<%=color %>">
                <td height="30" align="center" class="left_txt2"><%=data.get("teano") %></td>
                <td align="center" class="left_txt2"><%=data.get("teapass") %></td>
                <td align="center" class="left_txt2"><%=data.get("teaname") %></td>
                <td align="center" class="left_txt2"><%=data.get("teabm") %></td>
                <td align="center" class="left_txt2"><%=data.get("teaphone") %></td>
                <td align="center" class="left_txt2"><%=data.get("fangxiang") %></td>
                <td align="center" class="left_txt2"><%=data.get("ketis") %></td>
                
                <%
                int xz = dao.getInt("select count(distinct(stuid)) from stutea where teaid='"+data.get("id")+"'");
                HashMap m = new HashMap(); 
                if(dao.select("select * from stutea where stuid='"+user.get("id")+"' and teaid='"+data.get("id")+"' order by id desc").size()>0)
                {
                m = dao.select("select * from stutea where stuid='"+user.get("id")+"' and teaid='"+data.get("id")+"' order by id desc").get(0);
                }
                System.out.println(m);
                 %>
                
                <td align="center" class="left_txt2"><%=xz %></td>
                <td align="center" class="left_txt2"><%=m.get("status")==null?"未申请":m.get("status") %></td>
                <td class="left_txt2" height="30" align="center"  style="cursor: hand">
               
               
                <%
                if(m.get("status")==null||m.get("status").equals("已拒绝"))
                {
                 %>
                <a href="sflatsysi/admin/xzls.jsp?tid=<%=data.get("id") %>">选择</a>
                <%} %>
                
                 <%
                if(dlist.size()>0)
                {
                 %>
                <a href="sflatsysi/admin/xzls.jsp?did=<%=dlist.get(0).get("id") %>">删除</a>
                <%} %>
               
               
               
               
                </td>
                
              </tr>
               <%} %>
             <tr>
              <td class="left_txt2" height="30" colspan="15" align="center">
              
              ${page.info }              </td>
              </tr>
              
              <tr>
                <td class="left_txt2" height="13" colspan="15" align="right" >&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table>
		
		
		
		
		
		
          </td>
      </tr>
    </table></td>
    <td class="left_txt2" background="sflatsysi/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td class="left_txt2" valign="middle" background="sflatsysi/images/mail_leftbg.gif"><img src="sflatsysi/images/buttom_left2.gif" width="17" height="17" /></td>
      <td class="left_txt2" height="17" valign="top" background="sflatsysi/images/buttom_bgs.gif"><img src="sflatsysi/images/buttom_bgs.gif" width="17" height="17" /></td>
    <td class="left_txt2" background="sflatsysi/images/mail_rightbg.gif"><img src="sflatsysi/images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</form>
  </body>
</html>
