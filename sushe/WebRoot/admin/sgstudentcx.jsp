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
 
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  
 
  <form  action="sgstudentcx.jsp"  method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">学生信息管理</div></td>
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
                <td class="left_bt2">&nbsp;&nbsp;&nbsp; 请输入查询信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td colspan=10 height="45" align="left" bgcolor="#f2f2f2" class="left_txt2">                &nbsp;&nbsp;&nbsp;
<%
 HashMap mmm = new HashMap();%> 
&nbsp;&nbsp;用户名 &nbsp;:&nbsp; <input type=text class=''  size=15 name='uname' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名 &nbsp;:&nbsp; <input type=text class=''  size=15 name='tname' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit class='' value='查询信息' /> &nbsp; &nbsp; &nbsp; <br></td>
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
            <td  height="90"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
               
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">用户名</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">姓名</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">性别</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">联系电话</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">联系邮箱</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">联系地址</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">所在班级</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">保存时间</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">操作</td>
                </tr>
              
             
              <% 
              List<HashMap> zlist = new CommDAO().select("select * from rzinfo where ld='"+Info.getUser(request).get("ld")+"'");
              String ids="";
              for(HashMap map:zlist)
              {
              ids+="'"+map.get("uname").toString().split(" - ")[0]+"',";
              }
              if(ids.length()>1)ids=ids.substring(0,ids.length()-1);
String puname = request.getParameter("uname")==null?"":request.getParameter("uname"); 
String startuname = request.getParameter("startuname")==null?"":request.getParameter("startuname"); 
String enduname = request.getParameter("enduname")==null?"":request.getParameter("enduname"); 
String ptname = request.getParameter("tname")==null?"":request.getParameter("tname"); 
String starttname = request.getParameter("starttname")==null?"":request.getParameter("starttname"); 
String endtname = request.getParameter("endtname")==null?"":request.getParameter("endtname"); 
new CommDAO().delete(request,"sysuser"); 
if(request.getParameter("unameid1")!=null){ 
 new CommDAO().commOper("update sysuser set uname ='' where id="+request.getParameter("unameid1"));  
} 
if(request.getParameter("unameid2")!=null){ 
 new CommDAO().commOper("update sysuser set uname ='' where id="+request.getParameter("unameid2"));  
} 
String sql = "select * from sysuser where utype='学生' and uname in("+ids+") " ;
 if(!puname.equals("")){ 
 sql+= " and uname like'%"+puname+"%' " ;
 }  
 if(!startuname.equals("")){  
 mmm.put("startuname",startuname) ;
 sql+= " and uname >'"+startuname+"' " ;
 }  
 if(!enduname.equals("")){  
 mmm.put("enduname",enduname) ;
 sql+= " and uname <'"+Info.getDay(enduname,1)+"' " ;
 }  
 if(!ptname.equals("")){ 
 sql+= " and tname like'%"+ptname+"%' " ;
 }  
 if(!starttname.equals("")){  
 mmm.put("starttname",starttname) ;
 sql+= " and tname >'"+starttname+"' " ;
 }  
 if(!endtname.equals("")){  
 mmm.put("endtname",endtname) ;
 sql+= " and tname <'"+Info.getDay(endtname,1)+"' " ;
 }   
  sql +=" order by id desc ";
String url = "sgstudentcx.jsp?1=1&uname="+puname+"&tname="+ptname+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr  >

               
                <td height="30" align="center" class="left_txt2"><%=map.get("uname")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("tname")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("sex")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("tel")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("email")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("addrs")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("bclass")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("savetime")%></td>
               
                <td height="30" align="center" class="left_txt2"><a href="javascript:update('<%=map.get("id")%>')">修改</a> </td>
</tr>
<%}%>
                
             <tr>
              <td colspan=10 class="left_txt2" height="30" colspan="6" align="center">${page.info}</td>
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
<% 
mmm.put("uname",puname); 
mmm.put("tname",ptname); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript src='/sflatsys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/sflatsys/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('sgsysuserxg.jsp?id='+no,'信息修改',550,405) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('sysusertj.jsp','信息添加',550,430) 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
