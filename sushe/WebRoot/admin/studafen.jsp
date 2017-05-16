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
  
      String stuno = request.getParameter("stuno");
               String faname = request.getParameter("faname");
               if(faname!=null)
               dao.commOper("insert into stupinche(stuno,faname) values('"+stuno+"','"+faname+"')");
               
  
  String tid = request.getParameter("tid");
  if(tid!=null)
  {
  dao.commOper("update stutea set status='已通过' where id="+tid);
  }
  String did = request.getParameter("did");
  if(did!=null)
  {
  dao.commOper("delete from studafen where id="+did);
  }
  String jid = request.getParameter("jid");
  if(jid!=null)
  {
  dao.commOper("update stutea set status='已拒绝' where id="+jid);
  }
  String key = request.getParameter("key")==null?"":request.getParameter("key");
  String f = request.getParameter("f");
  if(f==null)key = Info.getUTFStr(key);
  String hql = "select  stuname,substring(stubj, 1, 7) yf  from   student where 1=1 ";
  String url = "/sflatsys/admin/studafen.jsp?1=1";
  if(!key.equals(""))
  {
  hql+=" and (stuname like'%"+key+"%'  )";
  url+="&key="+key;
  }
  hql+=" group by substring(stubj, 1, 7),stuname ";
   %>
  <form action="/sflatsys/admin/studafen.jsp?f=f" method="post" name="f1">
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
                <td class="left_bt2">&nbsp;&nbsp;&nbsp; 信息查询</td>
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
              <td class="left_txt2" height="40" colspan="2" align="center"><input type="submit" value="查询信息" name="B1" />
                
                <script type="text/javascript">
                function add()
                {
                pop("/sflatsys/admin/addstudafen.jsp","添加信息",500,230);
                }
                function update(no)
                {
                pop("/sflatsys/admin/updatestudafen.jsp?id="+no,"修改信息",500,230);
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
                <td  class="left_bt2">&nbsp;&nbsp;&nbsp; 信息列表</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td  height="110"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                 <td  width="" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">教职工</td>
                <td class="left_txt2" width="" height="30" align="center" bgcolor="#f2f2f2">月份</td>
                <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">出勤天数<br></td>
                <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">迟到早退次数<br></td>
                 <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">课时费</td>
                 
                 <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">基本公寓   </td>
                 
                 <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">地区补贴</td>
                 
                 <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">岗位津贴</td>
                 
                 <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">年限公寓</td>
                 
                 <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">公积金</td>
                 
                 <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">医保</td>
                 
                 <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">社保</td>
                 
                 <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">生活补贴
                 </td>
                 
                 <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">交通补贴
                 </td>
                 
                 <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">行政补贴 </td>
                 
                 <td class="left_txt2" width="" align="center" bgcolor="#f2f2f2">合计</td>
                <td class="left_txt2" width="" height="30" align="center" bgcolor="#f2f2f2">操作</td>
			    </tr>
              
              <%
                  System.out.println(hql);
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
              int cq = dao.getInt("select count(*) from student where stuname='"+data.get("stuname")+"' and stubj like'%"+data.get("yf")+"%'");
              int cqj = 0;
              if(22-cq>0)
              {
              cqj = (22-cq)*30;
              }
              
              int cd = dao.getInt("select count(*) from student where stuname='"+data.get("stuname")+"' and stubj like'%"+data.get("yf")+"%' and (status like'%迟到%' or status like'%早退%' )");
              int cdj = 0;
              if(cd>0)
              {
              cdj = cd*10;
              }
             
               String ksfstr = dao.select("select * from mixinfo where title=(select ksf from sysuser where uname='"+data.get("stuname")+"') ").get(0).get("content").toString();
             
              String ksstr = "0";
              if(dao.select("select * from teacher where teano='"+data.get("stuname")+"' and teabm like'%"+data.get("yf")+"%'").size()>0)
              {
              ksstr = dao.select("select * from teacher where teano='"+data.get("stuname")+"' and teabm like'%"+data.get("yf")+"%'").get(0).get("teaname").toString();
              }
              int gz = 0;
              if(!ksstr.equals(""))
              {
              gz = Integer.parseInt(ksfstr)*Integer.parseInt(ksstr);
              }
              
              HashMap suser  = dao.select("select * from sysuser where uname='"+data.get("stuname")+"'").get(0);
              System.out.println(suser);
               %>
              <tr bgcolor="<%=color %>">
                <td width="" height="30" align="center" class="left_txt2"><%=data.get("stuname") %></td>
                <td class="left_txt2" width="" height="30" align="center"><%=data.get("yf") %></td>
                <td class="left_txt2" align="center"><%=cq %> 
                
                <%
                if(22-cq>0)
              {
                 %>
                ( -<%=cqj %> )
                <%} %>
                
                </td>
                <td class="left_txt2" align="center"><%=cd %>
                
                <%
                if(cd>0)
              {
                 %>
                ( -<%=cdj %> )
                <%} %>
                
                </td>
                 <td class="left_txt2" align="center"><%=gz %>
                 
                  (课时：<%=ksstr %>&nbsp;&nbsp;课时费：<%=ksfstr %>)
                 
                 </td>
                 
                 
                 <td class="left_txt2" align="center"><%=suser.get("infoa") %></td>
                 <td class="left_txt2" align="center"><%=suser.get("infob") %></td>
                 <td class="left_txt2" align="center"><%=suser.get("infoc") %></td>
                 <td class="left_txt2" align="center"><%=suser.get("infod") %></td>
                 <td class="left_txt2" align="center">-<%=suser.get("infoe") %></td>
                 <td class="left_txt2" align="center">-<%=suser.get("infof") %></td>
                 <td class="left_txt2" align="center">-<%=suser.get("infog") %></td>
                 <td class="left_txt2" align="center"><%=suser.get("infoh") %></td>
                 <td class="left_txt2" align="center"><%=suser.get("infoi") %></td>
                 <td class="left_txt2" align="center"><%=suser.get("infoj") %></td>
                 
                 
                 
                  <td class="left_txt2" align="center">
                  
                  <%=gz-cdj-cqj+Integer.parseInt(suser.get("infoa").toString())+Integer.parseInt(suser.get("infob").toString())+Integer.parseInt(suser.get("infoc").toString())+Integer.parseInt(suser.get("infod").toString())-Integer.parseInt(suser.get("infoe").toString())-Integer.parseInt(suser.get("infof").toString())-Integer.parseInt(suser.get("infog").toString())+Integer.parseInt(suser.get("infoh").toString())+Integer.parseInt(suser.get("infoi").toString())+Integer.parseInt(suser.get("infoj").toString()) %>
                 
                
                 
                 </td>
                 
                 
                <td class="left_txt2" width="" height="30" align="center">
               
               
               <%
               if(dao.select("select * from stupinche where stuno='"+data.get("stuname")+"' and faname='"+data.get("yf")+"'").size()==0)
               {
                %>
                <a href="/sflatsys/admin/studafen.jsp?stuno=<%=data.get("stuname")%>&faname=<%=data.get("yf")%>">确认</a>
            <%}else{ %>
                已确认,如有问题请进行公寓核算
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
<%dao.close(); %>
