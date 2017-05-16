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
new CommDAO().insert(request,response,"shouf",ext,true,true); 
%>
<body>
   
  <form  action="shouftj.jsp?f=f&tglparentid=<%=tglparentid%>"  method="post" name="f1"  onsubmit="return checkform();">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">综合费用收取添加</div></td>
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
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">费用类别：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><span id="sftypedanx"><label><input type=radio checked=checked name='sftype' id='sftype' value='水费' />&nbsp;水费 </label>
<label><input type=radio  name='sftype' id='sftype' value='电费' />&nbsp;电费 </label>
<label><input type=radio  name='sftype' id='sftype' value='公物赔偿费' />&nbsp;公物赔偿费 </label>
<label><input type=radio  name='sftype' id='sftype' value='其他' />&nbsp;其他 </label>
</span>&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">收费说明：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text  class='' id='sfbei' name='sfbei' size=35 /><label id='clabelsfbei' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">楼幢：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><%=Info.getselect("ld","datadicinfo","datavalue~无名","dataname='楼幢'")%> 
<label id='clabelld' />
&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">宿舍号：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><%=Info.getselect("ssno","datadicinfo","datavalue~无名"," 1=1 ")%> 
<script language=javascript> 
function ldchange(){ 
document.getElementById("ld").onchange=ldchange; 
var ldvalue = document.getElementById("ld").value; 
var ssnoobj = document.getElementById("ssno"); 
ssnoobj.options.length=0; 
var boption = new Option("不限",""); 
ssnoobj.add(boption); 
var ajax = new AJAX(); 
ajax.post("/sflatsys/factory/getsonops.jsp?glb=datadicinfo&glzd=datavalue~无名&jlzd=ld&jlzdb=infob&value="+ldvalue+"&ctype=select&ttime=<%=Info.getDateStr()%>"); 
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
<label id='clabelssno' />
&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">学生：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><%=Info.getselect("uname","sysuser","uname~无名;tname~无名","utype='学生'")%> 
<label id='clabeluname' />
&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">应缴日期：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='12' class=''   name='yjdate' onclick='WdatePicker();'  />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">实缴日期：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='12' class=''   name='sjdate' onclick='WdatePicker();'  />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">应缴金额：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='8' class=''  id='yjfy'  name='yjfy'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'    /><label id='clabelyjfy' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">实缴金额：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='8' class=''  id='sjfy'  name='sjfy'  onkeyup='clearNoNum(this);' onblur='clearNoNum(this);' onmouseup='clearNoNum(this);'    /><label id='clabelsjfy' />&nbsp;                </td>
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
ldchange(); 
 
 function checkform(){  
var ldobj = document.getElementById("ld");  
if(ldobj.value==""){  
document.getElementById("clabelld").innerHTML="&nbsp;&nbsp;<font color=red>请输入楼幢</font>";  
return false;  
}else{
document.getElementById("clabelld").innerHTML="  ";  
}  
  
var ssnoobj = document.getElementById("ssno");  
if(ssnoobj.value==""){  
document.getElementById("clabelssno").innerHTML="&nbsp;&nbsp;<font color=red>请输入宿舍号</font>";  
return false;  
}else{
document.getElementById("clabelssno").innerHTML="  ";  
}  
  
var yjfyobj = document.getElementById("yjfy");  
if(yjfyobj.value==""){  
document.getElementById("clabelyjfy").innerHTML="&nbsp;&nbsp;<font color=red>请输入应缴金额</font>";  
return false;  
}else{
document.getElementById("clabelyjfy").innerHTML="  ";  
}  
  
var sjfyobj = document.getElementById("sjfy");  
if(sjfyobj.value==""){  
document.getElementById("clabelsjfy").innerHTML="&nbsp;&nbsp;<font color=red>请输入实缴金额</font>";  
return false;  
}else{
document.getElementById("clabelsjfy").innerHTML="  ";  
}  
  
return true;   
}   
</script>  
