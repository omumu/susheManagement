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
ext.put("ld",Info.getUser(request).get("ld")); 
new CommDAO().insert(request,response,"lfry",ext,true,true); 
%>
<body>
   
  <form  action="lfrytj.jsp?f=f&tglparentid=<%=tglparentid%>"  method="post" name="f1"  onsubmit="return checkform();">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">添加访客信息</div></td>
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
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">拜访学生：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><%=Info.getselect("touname","sysuser","uname~无名;tname~无名"," utype='学生'")%> 
<label id='clabeltouname' />
&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">来访人姓名：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text  class='' id='lfname' name='lfname' size=35 /><label id='clabellfname' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">来访人身份证号：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text  class='' id='lfsfid' name='lfsfid' size=35 /><label id='clabellfsfid' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">来访人电话：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text  class='' id='tel' name='tel' size=35 /><label id='clabeltel' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">来访事由：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text  class='' id='shiyou' name='shiyou' size=35 /><label id='clabelshiyou' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">存放物品：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text  class='' id='wuping' name='wuping' size=35 /><label id='clabelwuping' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">来访时间：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='16' class=''   name='rtime' onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" />&nbsp;                </td>
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
var tounameobj = document.getElementById("touname");  
if(tounameobj.value==""){  
document.getElementById("clabeltouname").innerHTML="&nbsp;&nbsp;<font color=red>请输入拜访学生</font>";  
return false;  
}else{
document.getElementById("clabeltouname").innerHTML="  ";  
}  
  
var lfnameobj = document.getElementById("lfname");  
if(lfnameobj.value==""){  
document.getElementById("clabellfname").innerHTML="&nbsp;&nbsp;<font color=red>请输入来访人姓名</font>";  
return false;  
}else{
document.getElementById("clabellfname").innerHTML="  ";  
}  
  
var lfsfidobj = document.getElementById("lfsfid");  
if(lfsfidobj.value==""){  
document.getElementById("clabellfsfid").innerHTML="&nbsp;&nbsp;<font color=red>请输入来访人身份证号</font>";  
return false;  
}else{
document.getElementById("clabellfsfid").innerHTML="  ";  
}  
  
var lfsfidobj = document.getElementById("lfsfid");  
if(lfsfidobj.value!=""){  
var c = new RegExp();   
c = /^[A-Za-z0-9]+$/;   
if(!((lfsfidobj.value.length==15||lfsfidobj.value.length==18)&&c.test(lfsfidobj.value))){ 
document.getElementById("clabellfsfid").innerHTML="&nbsp;&nbsp;<font color=red>来访人身份证号为15或18位数字与字母组合</font>";  
return false;
}else{  
document.getElementById("clabellfsfid").innerHTML="";  
}  
}  
var telobj = document.getElementById("tel");  
if(telobj.value!=""){  
if(telobj.value.length>11||telobj.value.length<8||isNaN(telobj.value)){ 
document.getElementById("clabeltel").innerHTML="&nbsp;&nbsp;<font color=red>来访人电话必须为8-11位数字</font>";  
return false;
}else{  
document.getElementById("clabeltel").innerHTML="";  
}  
}  
var shiyouobj = document.getElementById("shiyou");  
if(shiyouobj.value==""){  
document.getElementById("clabelshiyou").innerHTML="&nbsp;&nbsp;<font color=red>请输入来访事由</font>";  
return false;  
}else{
document.getElementById("clabelshiyou").innerHTML="  ";  
}  
  
return true;   
}   
</script>  
