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
  
 
  <form  action="shoufcx.jsp"  method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">综合费用收取</div></td>
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
费用类别 &nbsp;:&nbsp; <select name='sftype'>
<option value="">不限</option>
<option value='水费'>水费</option> 
<option value='电费'>电费</option> 
<option value='公物赔偿费'>公物赔偿费</option> 
<option value='其他'>其他</option> 
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
楼幢 &nbsp;:&nbsp; <%=Info.getselect("ld","datadicinfo","datavalue","dataname='楼幢'")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
宿舍号 &nbsp;:&nbsp; <%=Info.getselect("ssno","datadicinfo","datavalue"," 1=1 ")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<script language=javascript> 
function ldchange(){ 
document.getElementById("ld").onchange=ldchange; 
var ldvalue = document.getElementById("ld").value; 
var ssnoobj = document.getElementById("ssno"); 
ssnoobj.options.length=0; 
var boption = new Option("不限",""); 
ssnoobj.add(boption); 
var ajax = new AJAX(); 
ajax.post("/sflatsys/factory/getsonops.jsp?glb=datadicinfo&glzd=datavalue&jlzd=ld&jlzdb=infob&value="+ldvalue+"&ctype=select&ttime=<%=Info.getDateStr()%>"); 
var msg = ajax.getValue(); 
var msgs = msg.split("@@@"); 
for(var i=1;i<msgs.length;i++){ 
if(msgs[i]!=""){ 
var option = new Option(msgs[i],msgs[i]); 
ssnoobj.add(option); 
} 
} 
} 
</script> 
&nbsp;&nbsp;&nbsp;<input type=submit class='' value='查询信息' /> &nbsp;&nbsp;<input type=button   class=''  value='添加信息' onclick="add();" /> &nbsp;&nbsp;</td>
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
               
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">费用类别</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">收费说明</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">楼幢</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">宿舍号</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">学生</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">应缴日期</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">实缴日期</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">应缴金额</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">实缴金额</td>
<td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">操作</td>
                </tr>
              
             
              <% 
String psftype = request.getParameter("sftype")==null?"":request.getParameter("sftype"); 
String startsftype = request.getParameter("startsftype")==null?"":request.getParameter("startsftype"); 
String endsftype = request.getParameter("endsftype")==null?"":request.getParameter("endsftype"); 
String pld = request.getParameter("ld")==null?"":request.getParameter("ld"); 
String startld = request.getParameter("startld")==null?"":request.getParameter("startld"); 
String endld = request.getParameter("endld")==null?"":request.getParameter("endld"); 
String pssno = request.getParameter("ssno")==null?"":request.getParameter("ssno"); 
String startssno = request.getParameter("startssno")==null?"":request.getParameter("startssno"); 
String endssno = request.getParameter("endssno")==null?"":request.getParameter("endssno"); 
new CommDAO().delete(request,"shouf"); 
if(request.getParameter("sftypeid1")!=null){ 
 new CommDAO().commOper("update shouf set sftype ='' where id="+request.getParameter("sftypeid1"));  
} 
if(request.getParameter("sftypeid2")!=null){ 
 new CommDAO().commOper("update shouf set sftype ='' where id="+request.getParameter("sftypeid2"));  
} 
String sql = "select * from shouf where 1=1 " ;
 if(!psftype.equals("")){ 
 sql+= " and sftype like'%"+psftype+"%' " ;
 }  
 if(!startsftype.equals("")){  
 mmm.put("startsftype",startsftype) ;
 sql+= " and sftype >'"+startsftype+"' " ;
 }  
 if(!endsftype.equals("")){  
 mmm.put("endsftype",endsftype) ;
 sql+= " and sftype <'"+Info.getDay(endsftype,1)+"' " ;
 }  
 if(!pld.equals("")){ 
 sql+= " and ld like'%"+pld+"%' " ;
 }  
 if(!startld.equals("")){  
 mmm.put("startld",startld) ;
 sql+= " and ld >'"+startld+"' " ;
 }  
 if(!endld.equals("")){  
 mmm.put("endld",endld) ;
 sql+= " and ld <'"+Info.getDay(endld,1)+"' " ;
 }  
 if(!pssno.equals("")){ 
 sql+= " and ssno like'%"+pssno+"%' " ;
 }  
 if(!startssno.equals("")){  
 mmm.put("startssno",startssno) ;
 sql+= " and ssno >'"+startssno+"' " ;
 }  
 if(!endssno.equals("")){  
 mmm.put("endssno",endssno) ;
 sql+= " and ssno <'"+Info.getDay(endssno,1)+"' " ;
 }  
  sql +=" order by id desc ";
String url = "shoufcx.jsp?1=1&sftype="+psftype+"&ld="+pld+"&ssno="+pssno+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr  >

               
                <td height="30" align="center" class="left_txt2"><%=map.get("sftype")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("sfbei")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("ld")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("ssno")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("uname")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("yjdate")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("sjdate")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("yjfy")%></td>
               
                <td height="30" align="center" class="left_txt2"><%=map.get("sjfy")%></td>
               
                <td height="30" align="center" class="left_txt2"><a href="javascript:update('<%=map.get("id")%>')">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="shoufcx.jsp?scid=<%=map.get("id")%>">删除</a></td>
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
<script language=javascript src='/sflatsys/js/ajax.js'></script>
<% 
mmm.put("sftype",psftype); 
mmm.put("ld",pld); 
mmm.put("ssno",pssno); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
ldchange(); 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/sflatsys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/sflatsys/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('shoufxg.jsp?id='+no,'信息修改',500,395) 
}
</script> 
<script language=javascript> 
function add(){ 
pop('shouftj.jsp','信息添加',500,395) 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
