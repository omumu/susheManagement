<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
session.removeAttribute("admin");
session.removeAttribute("stu");
session.removeAttribute("tea");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>宿舍管理系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #1D3647;
}
-->
</style>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
<script language="JavaScript">


function correctPNG()
{
    f1.username.focus();
    var arVersion = navigator.appVersion.split("MSIE")
    var version = parseFloat(arVersion[1])
    if ((version >= 5.5) && (document.body.filters)) 
    {
       for(var j=0; j<document.images.length; j++)
       {
          var img = document.images[j]
          var imgName = img.src.toUpperCase()
          if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
          {
             var imgID = (img.id) ? "id='" + img.id + "' " : ""
             var imgClass = (img.className) ? "class='" + img.className + "' " : ""
             var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
             var imgStyle = "display:inline-block;" + img.style.cssText 
             if (img.align == "left") imgStyle = "float:left;" + imgStyle
             if (img.align == "right") imgStyle = "float:right;" + imgStyle
             if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
             var strNewHTML = "<span " + imgID + imgClass + imgTitle
             + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
             + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
             + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" 
             img.outerHTML = strNewHTML
             j = j-1
          }
       }
    }    
}
window.attachEvent("onload", correctPNG);
</script>


<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css">
    
  </head>
  
  <body>
 <table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="42" valign="top"><table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
      <tr>
        <td width="1%" height="21">&nbsp;</td>
        <td height="42">&nbsp;</td>
        <td width="17%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
      <tr>
        <td width="49%" align="right"><table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
            <tr>
              <td height="138" valign="top"><table width="89%" height="427" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="149">&nbsp;</td>
<!--                 </tr> -->
                <tr>
                  <td ><img src="/sflatsys/images/timg.jpg" width="500" height="300"></td>
                </tr>
                <tr>
                  <td height="198" align="right" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    
                  </table></td>
                </tr>
              </table></td>
            </tr>
            
        </table></td>
        <td width="1%" >&nbsp;</td>
        <td width="50%" valign="bottom"><table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%">&nbsp;</td>
              <td width="96%" height="38"><span class="login_txt_bt">欢迎进入学生宿舍管理系统，请登录</span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="21"><table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                  <tr>
                    <td height="164" colspan="2" align="middle"><form name="f1" action="/sflatsys/sflatsys?ac=login" method="post">
                        <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                          <tr>
                            <td width="16%" height="38" class="top_hui_text"><span class="login_txt">用户名： </span></td>
                            <td height="38" colspan="2" class="top_hui_text"><input name="username" class="editbox4" value="" size="20">                            </td>
                          </tr>
                          <tr>
                            <td width="16%" height="35"  class="top_hui_text"><span class="login_txt"> 密 码： &nbsp; </span></td>
                            <td height="35" colspan="2" class="top_hui_text"><input class="editbox4" type="password" size="20" name="pass">
                              <img src="/sflatsys/images/luck.gif" width="19" height="18" > </td>
                          </tr>
                          
                          <tr>
                            <td width="16%" height="35"  class="top_hui_text"><span class="login_txt"> 登录身份： &nbsp; </span></td>
                            <td height="35" colspan="2" class="login_txt">
                        
                <label><input name="utype" type="radio"  value="学生" checked>
                 学生 </label>
                <label><input name="utype" type="radio"  value="宿舍管理员">  
                 宿舍管理员 </label>
                <label><input name="utype" type="radio"  value="收缴员">
                 收缴员</label>
                <label><input name="utype" type="radio"  value="超级管理员"> 
                 超级管理员 </label>
                            
                            
                           </td>
                          </tr>
                          
                        
                          <tr>
                            <td height="35" >&nbsp;</td>
                            <td width="17%" height="35" ><input name="Submit" type="submit" onMouseDown="check();" class="button" id="Submit" value="登 陆"> 
                            
                            <script type="text/javascript">
                            function check()
                            {
                            var username = f1.username.value;
                            var pass = f1.pass.value;
                            if(username=="")
                            {
                            alert("请输入用户名");
                            return;
                            }
                            if(pass=="")
                            {
                            alert("请输入密码");
                            return;
                            }
                            
                            }
                            </script>                            </td>
                            <td width="67%" class="top_hui_text"><input name="cs" type="reset" class="button" id="cs" value="取 消" ></td>
                          </tr>
                        </table>
                        <br>
                    </form></td>
                  </tr>
                  <tr>
                    <td width="433" height="164" align="right" valign="bottom">
                    <td width="57" align="right" valign="bottom">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
          </table>
          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="login-buttom-bg">
      <tr>
        <td align="center"></td>
      </tr>
    </table></td>
  </tr>
</table>
<script type="text/javascript">
<%
String error=(String)request.getAttribute("error");
String random=(String)request.getAttribute("random");
if(error!=null)
{
 %>
 alert("用户名或密码错误");
 <%}else if(random!=null){%>
  alert("验证码输入错误");
 <%}%>
 </script>
  </body>
</html>
