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
  
 
  <form  action="lfrycx.jsp"  method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">访客信息管理</div></td>
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
                <td colspan=11 height="45" align="left" bgcolor="#f2f2f2" class="left_txt2">                &nbsp;&nbsp;&nbsp;
<%
 HashMap mmm = new HashMap();%> 
&nbsp;&nbsp;拜访学生 &nbsp;:&nbsp; <input type=text class=''  size=15 name='touname' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来访人姓名 &nbsp;:&nbsp; <input type=text class=''  size=15 name='lfname' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit class='' value='查询信息' /> &nbsp;&nbsp;<input type=button   class=''  value='来访登记' onclick="add();" /> &nbsp;&nbsp;</td>
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
               
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">拜访学生</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">来访人姓名</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">来访人身份证号</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">来访人电话</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">来访事由</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">存放物品</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">来访时间</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">离开时间</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">来访楼幢</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">操作</td>
                </tr>
              
             
              <% 
String ptouname = request.getParameter("touname")==null?"":request.getParameter("touname"); 
String starttouname = request.getParameter("starttouname")==null?"":request.getParameter("starttouname"); 
String endtouname = request.getParameter("endtouname")==null?"":request.getParameter("endtouname"); 
String plfname = request.getParameter("lfname")==null?"":request.getParameter("lfname"); 
String startlfname = request.getParameter("startlfname")==null?"":request.getParameter("startlfname"); 
String endlfname = request.getParameter("endlfname")==null?"":request.getParameter("endlfname"); 
new CommDAO().delete(request,"lfry"); 
if(request.getParameter("tounameid1")!=null){ 
 new CommDAO().commOper("update lfry set touname ='' where id="+request.getParameter("tounameid1"));  
} 
if(request.getParameter("tounameid2")!=null){ 
 new CommDAO().commOper("update lfry set touname ='' where id="+request.getParameter("tounameid2"));  
} 
String sql = "select * from lfry where 1=1 " ;
 if(!ptouname.equals("")){ 
 sql+= " and touname like'%"+ptouname+"%' " ;
 }  
 if(!starttouname.equals("")){  
 mmm.put("starttouname",starttouname) ;
 sql+= " and touname >'"+starttouname+"' " ;
 }  
 if(!endtouname.equals("")){  
 mmm.put("endtouname",endtouname) ;
 sql+= " and touname <'"+Info.getDay(endtouname,1)+"' " ;
 }  
 if(!plfname.equals("")){ 
 sql+= " and lfname like'%"+plfname+"%' " ;
 }  
 if(!startlfname.equals("")){  
 mmm.put("startlfname",startlfname) ;
 sql+= " and lfname >'"+startlfname+"' " ;
 }  
 if(!endlfname.equals("")){  
 mmm.put("endlfname",endlfname) ;
 sql+= " and lfname <'"+Info.getDay(endlfname,1)+"' " ;
 }  
  sql +="  and (1!=1 " ; 
  sql +="  or  ld like'%"+Info.getUser(request).get("ld")+"%' " ;
  sql +="  ) ";
  sql +=" order by id desc ";
String url = "lfrycx.jsp?1=1&touname="+ptouname+"&lfname="+plfname+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr  >

               
                <td height="30" align="center" class="left_txt2"><%=map.get("touname")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("lfname")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("lfsfid")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("tel")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("shiyou")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("wuping")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("rtime")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("ctime")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("ld")%></td>
               
                <td height="30" align="center" class="left_txt2"><a href="javascript:update('<%=map.get("id")%>')">访客离开</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="lfrycx.jsp?scid=<%=map.get("id")%>">删除</a></td>
</tr>
<%}%>
                
             <tr>
              <td colspan=11 class="left_txt2" height="30" colspan="6" align="center">${page.info}</td>
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
mmm.put("touname",ptouname); 
mmm.put("lfname",plfname); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript src='/sflatsys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/sflatsys/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('lfryxg.jsp?id='+no,'信息修改',550,367) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('lfrytj.jsp','信息添加',550,337) 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
