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
  
 
  <form  action="shuscx.jsp"  method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">宿舍信息管理</div></td>
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
                <td colspan=5 height="45" align="left" bgcolor="#f2f2f2" class="left_txt2">                &nbsp;&nbsp;&nbsp;
<%
 HashMap mmm = new HashMap();%> 
&nbsp;&nbsp;宿舍号 &nbsp;:&nbsp; <input type=text class=''  size=15 name='datavalue' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit class='' value='查询信息' /> &nbsp;&nbsp;<input type=button   class=''  value='添加信息' onclick="add();" /> &nbsp;&nbsp;</td>
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
               
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">宿舍号</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">床位数</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">楼幢号</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">操作</td>
                </tr>
              
             
              <% 
String pdatavalue = request.getParameter("datavalue")==null?"":request.getParameter("datavalue"); 
String startdatavalue = request.getParameter("startdatavalue")==null?"":request.getParameter("startdatavalue"); 
String enddatavalue = request.getParameter("enddatavalue")==null?"":request.getParameter("enddatavalue"); 
new CommDAO().delete(request,"datadicinfo"); 
if(request.getParameter("datanameid1")!=null){ 
 new CommDAO().commOper("update datadicinfo set dataname ='' where id="+request.getParameter("datanameid1"));  
} 
if(request.getParameter("datanameid2")!=null){ 
 new CommDAO().commOper("update datadicinfo set dataname ='' where id="+request.getParameter("datanameid2"));  
} 
String sql = "select * from datadicinfo where 1=1 " ;
 if(!pdatavalue.equals("")){ 
 sql+= " and datavalue like'%"+pdatavalue+"%' " ;
 }  
 if(!startdatavalue.equals("")){  
 mmm.put("startdatavalue",startdatavalue) ;
 sql+= " and datavalue >'"+startdatavalue+"' " ;
 }  
 if(!enddatavalue.equals("")){  
 mmm.put("enddatavalue",enddatavalue) ;
 sql+= " and datavalue <'"+Info.getDay(enddatavalue,1)+"' " ;
 }  
  sql +="  and (1!=1 " ; 
  sql +="  or  dataname like'%宿舍%' " ;
  sql +="  ) ";
  sql +=" order by id desc ";
String url = "shuscx.jsp?1=1&datavalue="+pdatavalue+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr  >

               
                <td height="30" align="center" class="left_txt2"><%=map.get("datavalue")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("infoa")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("infob")%></td>
               
                <td height="30" align="center" class="left_txt2"><a href="javascript:update('<%=map.get("id")%>')">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="shuscx.jsp?scid=<%=map.get("id")%>">删除</a></td>
</tr>
<%}%>
                
             <tr>
              <td colspan=5 class="left_txt2" height="30" colspan="6" align="center">${page.info}</td>
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
mmm.put("datavalue",pdatavalue); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript src='/sflatsys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/sflatsys/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('shusxg.jsp?id='+no,'信息修改',500,215) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('shustj.jsp','信息添加',500,215) 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
