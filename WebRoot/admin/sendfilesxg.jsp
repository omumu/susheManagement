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
  List<HashMap> zlist = new CommDAO().select("select * from rzinfo where ld='"+Info.getUser(request).get("ld")+"'");
	String ids="";
	for(HashMap map:zlist)
	{
	ids+="'"+map.get("uname").toString().split(" - ")[0]+"',";
	}
	if(ids.length()>1)ids=ids.substring(0,ids.length()-1);
new CommDAO().delete(request,"sendfiles"); 
String id = request.getParameter("id"); 
String erjitype = request.getParameter("erjitype"); 
String myztree = request.getParameter("myztree"); 
HashMap ext = new HashMap(); 
ext.put("ld",Info.getUser(request).get("ld")); 
new CommDAO().update(request,response,"sendfiles",ext,true,true); 
HashMap mmm = new CommDAO().getmap(id,"sendfiles"); 
%>
<body>
   
  <form  action="sendfilesxg.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="f1"  onsubmit="return checkform();">
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
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">收件人：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><%=Info.getselect("touname","sysuser","uname~无名;tname~无名"," uname in("+ids+")")%><label id='clabeltouname' />
&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">收件时间：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text size='16' class=''   name='totime' onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">快件说明：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><input type=text  class='' id='tobei' name='tobei' size=35 /><label id='clabeltobei' />&nbsp;                </td>
                </tr>
<tr>
                <td  width="22%" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">快件状态：</td>
                <td width="78%" bgcolor="#f2f2f2" class="left_txt2"><span id="statusdanx"><label><input type=radio name='status' value='未取' />&nbsp;未取 </label>
<label><input type=radio name='status' value='已取' />&nbsp;已取 </label>
</span>&nbsp;                </td>
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
<script language=javascript src='/sflatsys/js/ajax.js'></script> 
<script language=javascript src='/sflatsys/js/popup.js'></script> 
<%@page import="util.Info"%> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
<script language=javascript >  
 
</script>  
<script language=javascript >  
 function checkform(){  
var tounameobj = document.getElementById("touname");  
if(tounameobj.value==""){  
document.getElementById("clabeltouname").innerHTML="&nbsp;&nbsp;<font color=red>请输入收件人</font>";  
return false;  
}else{ 
document.getElementById("clabeltouname").innerHTML="  ";  
}  
return true;   
}   
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
