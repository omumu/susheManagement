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
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  
  <%
  CommDAO dao = new CommDAO();
  List<HashMap> list = dao.select("select * from shushe order by id desc");
  Date date = new Date();
  int  day = date.getDay();
  String day1="";if(day==1)day1="red";
  String day2="";if(day==2)day2="red";
  String day3="";if(day==3)day3="red";
  String day4="";if(day==4)day4="red";
  String day5="";if(day==5)day5="red";
  String day6="";if(day==6)day6="red";
  String day0="";if(day==0)day0="red";
  String days1 = Info.getDay(Info.getDateStr(),-day+1);
  String days2 = Info.getDay(Info.getDateStr(),-day+2);
  String days3 = Info.getDay(Info.getDateStr(),-day+3);
  String days4 = Info.getDay(Info.getDateStr(),-day+4);
  String days5 = Info.getDay(Info.getDateStr(),-day+5);
  String days6 = Info.getDay(Info.getDateStr(),-day+6);
  String days0 = Info.getDay(Info.getDateStr(),-day+7);
  

   %>
  <form action="/sflatsys/admin/wggl.jsp?f=f" method="post" name="f1">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="left_txt2" width="17" height="29" valign="top" background="/sflatsys/images/mail_leftbg.gif"><img src="/sflatsys/images/left-top-right.gif" width="17" height="29" /></td>
    <td class="left_txt2" width="1212" height="29" valign="top" background="/sflatsys/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td class="left_txt2" height="31"><div class="titlebt">系统管理</div></td>
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
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;信息管理</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">每周总分100分，扣完为止</td>
                </tr>
              

              
              
            </table></td>
          </tr>
        </table>
		
		
		
		
		
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          <tr>
            <td ><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td  class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;信息列表</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td  height="110"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
                <td  width="144" height="30" align="center" bgcolor="#f2f2f2" class="left_txt2">宿舍</td>
                <td class="left_txt2" width="144" align="center" bgcolor="#f2f2f2"><font color="<%=day1 %>">周一</font></td>
                <td class="left_txt2" width="144" align="center" bgcolor="#f2f2f2"><font color="<%=day2 %>">周二</font></td>
                <td class="left_txt2" width="144" align="center" bgcolor="#f2f2f2"><font color="<%=day3 %>">周三</font></td>
                <td class="left_txt2" width="144" align="center" bgcolor="#f2f2f2"><font color="<%=day4 %>">周四</font></td>
                <td width="144" align="center" bgcolor="#f2f2f2" class="left_txt2"><font color="<%=day5 %>">周五</font></td>
                <td class="left_txt2" width="144" align="center" bgcolor="#f2f2f2"><font color="<%=day6 %>">周六</font></td>
                <td class="left_txt2" width="144" align="center" bgcolor="#f2f2f2"><font color="<%=day0 %>">周日</font></td>
                <td class="left_txt2" width="60" height="30" align="center" bgcolor="#f2f2f2">总分</td>
			    </tr>
              
              
              
              <%
                  
		     
			    int i=1;
              for(HashMap data:list)
              {
              i++;
              int d1 = dao.getInt("select sum(fens) from koufen where datetimes='"+days1+"' and ssorstuid='"+data.get("id")+"' and ktype='0'");
              int d2 = dao.getInt("select sum(fens) from koufen where datetimes='"+days2+"' and ssorstuid='"+data.get("id")+"' and ktype='0'");
              int d3 = dao.getInt("select sum(fens) from koufen where datetimes='"+days3+"' and ssorstuid='"+data.get("id")+"' and ktype='0'");
              int d4 = dao.getInt("select sum(fens) from koufen where datetimes='"+days4+"' and ssorstuid='"+data.get("id")+"' and ktype='0'");
              int d5 = dao.getInt("select sum(fens) from koufen where datetimes='"+days5+"' and ssorstuid='"+data.get("id")+"' and ktype='0'");
              int d6 = dao.getInt("select sum(fens) from koufen where datetimes='"+days6+"' and ssorstuid='"+data.get("id")+"' and ktype='0'");
              int d0 = dao.getInt("select sum(fens) from koufen where datetimes='"+days0+"' and ssorstuid='"+data.get("id")+"' and ktype='0'");
              int dall = 100-d1-d2-d3-d4-d5-d6-d0;
              String color="";
              if(i%2!=0)color="#f2f2f2";
               %>
              <tr bgcolor="<%=color %>">
                <td style="cursor: hand" height="30" align="center" class="left_txt2"><%=data.get("ssno") %></td>
                <td style="cursor: hand" onclick="kou('<%=data.get("id")%>and<%=days1 %>');"   align="center" class="left_txt2"><%=d1 %></td>
                <td style="cursor: hand" onclick="kou('<%=data.get("id")%>and<%=days2 %>');"   align="center" class="left_txt2"><%=d2 %></td>
                <td style="cursor: hand" onclick="kou('<%=data.get("id")%>and<%=days3 %>');"   align="center" class="left_txt2"><%=d3 %></td>
                <td style="cursor: hand" onclick="kou('<%=data.get("id")%>and<%=days4 %>');"   align="center" class="left_txt2"><%=d4 %></td>
                <td style="cursor: hand" onclick="kou('<%=data.get("id")%>and<%=days5 %>');"   align="center" class="left_txt2"><%=d5 %></td>
                <td style="cursor: hand" onclick="kou('<%=data.get("id")%>and<%=days6 %>');"   width="144" height="30" align="center" class="left_txt2"><%=d6 %></td>
                <td style="cursor: hand" onclick="kou('<%=data.get("id")%>and<%=days0 %>');"   width="144" height="30" align="center" class="left_txt2"><%=d0 %></td>
                <td style="cursor: hand"  class="left_txt2" width="60" height="30" align="center"><%=dall %></td>
              </tr>
               <%} %>
             
              
              <tr>
                <td class="left_txt2" height="13" colspan="9" align="right" >
               <script type="text/javascript">
               function kou(ids)
               {
               pop("kou.jsp?ids="+ids,"扣分详情",550,300);
               }
               
               </script>

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
