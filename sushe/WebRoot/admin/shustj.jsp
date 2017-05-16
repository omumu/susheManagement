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
ext.put("dataname","宿舍"); 
new CommDAO().insert(request,response,"datadicinfo",ext,true,true); 
%>
<body>
   
  <form  action="shustj.jsp?f=f&tglparentid=<%=tglparentid%>"  method="post" name="f1"  onsubmit="return checkform();">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">宿舍信息添加</div></td>
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
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text  class='' id='datavalue' name='datavalue' size=35 /><label id='clabeldatavalue' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">床位数：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='8' class=''  id='infoa'  name='infoa'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'    /><label id='clabelinfoa' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">楼幢号：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><%=Info.getselect("infob","datadicinfo","datavalue~无名"," dataname='楼幢'")%> 
<label id='clabelinfob' />
&nbsp;                </td>
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
var datavalueobj = document.getElementById("datavalue");  
if(datavalueobj.value==""){  
document.getElementById("clabeldatavalue").innerHTML="&nbsp;&nbsp;<font color=red>请输入宿舍号</font>";  
return false;  
}else{
document.getElementById("clabeldatavalue").innerHTML="  ";  
}  
  
var infoaobj = document.getElementById("infoa");  
if(infoaobj.value==""){  
document.getElementById("clabelinfoa").innerHTML="&nbsp;&nbsp;<font color=red>请输入床位数</font>";  
return false;  
}else{
document.getElementById("clabelinfoa").innerHTML="  ";  
}  
  
var infoaobj = document.getElementById("infoa");  
if(infoaobj.value!=""){  
if(isNaN(infoaobj.value)){  
document.getElementById("clabelinfoa").innerHTML="&nbsp;&nbsp;<font color=red>床位数只能是数字</font>";  
return false;
}else{  
document.getElementById("clabelinfoa").innerHTML="";  
}  
}  
var zhwystr = '';  
var zhwystrvalue = '';  
zhwystr+="datavalue"+",";  
if(document.getElementsByName("datavalue").length==1){  
zhwystrvalue += document.getElementById("datavalue").value+",";  
}else{  
for(var i=0;i<document.getElementsByName("datavalue").length;i++){  
if(document.getElementsByName("datavalue")[i].checked ){  
zhwystrvalue += document.getElementsByName("datavalue")[i].value+",";  
}  
}  
}  
zhwystr+="infob"+",";  
if(document.getElementsByName("infob").length==1){  
zhwystrvalue += document.getElementById("infob").value+",";  
}else{  
for(var i=0;i<document.getElementsByName("infob").length;i++){  
if(document.getElementsByName("infob")[i].checked ){  
zhwystrvalue += document.getElementsByName("infob")[i].value+",";  
}  
}  
}  
var ajax = new AJAX();
ajax.post("/sflatsys/factory/checkno.jsp?table=datadicinfo&col="+zhwystr+"&value="+zhwystrvalue+"&checktype=zhinsert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabeldatavalue").innerHTML="&nbsp;&nbsp;<font color=red>宿舍号已存在</font>";  
return false;
}else{
document.getElementById("clabeldatavalue").innerHTML="  ";  
}  
return true;   
}   
</script>  
