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
  
  <% 
HashMap ext = new HashMap(); 
String tglparentid=request.getParameter("tglparentid")==null?"":request.getParameter("tglparentid"); 
ext.put("tglparentid",tglparentid); 
new CommDAO().insert(request,response,"wspb",ext,true,true); 
%>
<body>
   
  <form  action="wspbtj.jsp?f=f&tglparentid=<%=tglparentid%>"  method="post" name="f1"  onsubmit="return checkform();">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">添加评比信息</div></td>
      </tr>
    </table></td>
    <td class="left_txt2" width="22" valign="top" background="/sflatsys/images/mail_rightbg.gif"><img src="/sflatsys/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td class="left_txt2" height="71" valign="middle" background="/sflatsys/images/mail_leftbg.gif">&nbsp;</td>
    <td class="left_txt2" valign="top" bgcolor="#F7F8F9"><table width="100%" height="101" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td  height="101" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;请输入相关信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="46"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">宿舍号：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><%=Info.getselect("ssno","datadicinfo","datavalue~无名"," datavalue in(select datavalue from datadicinfo where infob='"+Info.getUser(request).get("ld")+"')")%> 
<label id='clabelssno' />
&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">评比月份：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='16' class=''   name='pbmonth' onclick="WdatePicker({dateFmt:'yyyy-MM'});" />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">卫生排名：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text  class='' id='mc' name='mc' size=35 /><label id='clabelmc' />&nbsp;                </td>
                </tr>

              

             <tr>
              <td class="left_txt2" height="40" colspan="2" align="center">
              
              <input type="submit" value="提交信息" name="B1" />         
              
                &nbsp;&nbsp;&nbsp;
                
                <input type=button value='返回上页' onclick='popclose();' />             
                
                 </td>
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
<script language=javascript src='/sflatsys/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/sflatsys/js/popup.js'></script>
<script language=javascript src='/sflatsys/js/ajax.js'></script>
<%@page import="util.Info"%>
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
<script language=javascript >  
 
 function checkform(){  
var ssnoobj = document.getElementById("ssno");  
if(ssnoobj.value==""){  
document.getElementById("clabelssno").innerHTML="&nbsp;&nbsp;<font color=red>请输入宿舍号</font>";  
return false;  
}else{
document.getElementById("clabelssno").innerHTML="  ";  
}  
  
var mcobj = document.getElementById("mc");  
if(mcobj.value==""){  
document.getElementById("clabelmc").innerHTML="&nbsp;&nbsp;<font color=red>请输入卫生排名</font>";  
return false;  
}else{
document.getElementById("clabelmc").innerHTML="  ";  
}  
  
var zhwystr = '';  
var zhwystrvalue = '';  
zhwystr+="ssno"+",";  
if(document.getElementsByName("ssno").length==1){  
zhwystrvalue += document.getElementById("ssno").value+",";  
}else{  
for(var i=0;i<document.getElementsByName("ssno").length;i++){  
if(document.getElementsByName("ssno")[i].checked ){  
zhwystrvalue += document.getElementsByName("ssno")[i].value+",";  
}  
}  
}  
zhwystr+="pbmonth"+",";  
if(document.getElementsByName("pbmonth").length==1){  
zhwystrvalue += document.getElementById("pbmonth").value+",";  
}else{  
for(var i=0;i<document.getElementsByName("pbmonth").length;i++){  
if(document.getElementsByName("pbmonth")[i].checked ){  
zhwystrvalue += document.getElementsByName("pbmonth")[i].value+",";  
}  
}  
}  
var ajax = new AJAX();
ajax.post("/sflatsys/factory/checkno.jsp?table=wspb&col="+zhwystr+"&value="+zhwystrvalue+"&checktype=zhinsert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabelssno").innerHTML="&nbsp;&nbsp;<font color=red>宿舍号已存在</font>";  
return false;
}else{
document.getElementById("clabelssno").innerHTML="  ";  
}  
return true;   
}   
</script>  
