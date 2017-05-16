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
  
 
  <form  action="stusendfilescx.jsp"  method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">这里要改</div></td>
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
                <td colspan=7 height="45" align="left" bgcolor="#f2f2f2" class="left_txt2">                &nbsp;&nbsp;&nbsp;
<%
 HashMap mmm = new HashMap();%> 
&nbsp;&nbsp;收件时间 &nbsp;:&nbsp; <input type=text class=''  size=12 name='starttotime' onclick='WdatePicker();' />&nbsp;&nbsp;至&nbsp;&nbsp;
<input type=text class=''  size=12 name='endtotime' onclick='WdatePicker();' />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;<input type=submit class='' value='查询信息' /> &nbsp; &nbsp; &nbsp; <br></td>
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
               
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">收件人</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">收件时间</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">物品说明</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">楼幢</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">状态</td>
 
                </tr>
              
             
              <% 
String ptotime = request.getParameter("totime")==null?"":request.getParameter("totime"); 
String starttotime = request.getParameter("starttotime")==null?"":request.getParameter("starttotime"); 
String endtotime = request.getParameter("endtotime")==null?"":request.getParameter("endtotime"); 
new CommDAO().delete(request,"sendfiles"); 
if(request.getParameter("tounameid1")!=null){ 
 new CommDAO().commOper("update sendfiles set touname ='' where id="+request.getParameter("tounameid1"));  
} 
if(request.getParameter("tounameid2")!=null){ 
 new CommDAO().commOper("update sendfiles set touname ='' where id="+request.getParameter("tounameid2"));  
} 
String sql = "select * from sendfiles where 1=1 " ;
 if(!ptotime.equals("")){ 
 sql+= " and totime like'%"+ptotime+"%' " ;
 }  
 if(!starttotime.equals("")){  
 mmm.put("starttotime",starttotime) ;
 sql+= " and totime >'"+starttotime+"' " ;
 }  
 if(!endtotime.equals("")){  
 mmm.put("endtotime",endtotime) ;
 sql+= " and totime <'"+Info.getDay(endtotime,1)+"' " ;
 }  
  sql +="  and (1!=1 " ; 
  sql +="  or  touname like'%"+Info.getUser(request).get("uname")+" %' " ;
  sql +="  ) ";
  sql +=" order by id desc ";
String url = "stusendfilescx.jsp?1=1&totime="+ptotime+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr  >

               
                <td height="30" align="center" class="left_txt2"><%=map.get("touname")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("totime")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("tobei")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("ld")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("status")%></td>
 
</tr>
<%}%>
                
             <tr>
              <td colspan=7 class="left_txt2" height="30" colspan="6" align="center">${page.info}</td>
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
<script language=javascript src='/sflatsys/js/ajax.js'></script>
<% 
mmm.put("totime",ptotime); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/sflatsys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/sflatsys/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('stusendfilesxg.jsp?id='+no,'信息修改',500,280) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('stusendfilestj.jsp','信息添加',500,280) 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
