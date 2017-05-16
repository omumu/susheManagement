<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
<script type="text/javascript">
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
 parent.location.replace("/sflatsys/admin/yjmessage.jsp");
 <%}%>
 </script>
<link href="/sflatsys/images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/sflatsys/js/popup.js"></script>
<script type="text/javascript" src="/sflatsys/js/ajax.js"></script>
  </head>
  <%
  String id = request.getParameter("id");
  CommDAO dao = new CommDAO();

 HashMap data = dao.select("select * from yjmessage where id="+id).get(0);
  %>

  <body>
  <form action="/sflatsys/sflatsys?ac=upyj&id=<%=id %>" method="post" name="f1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td height="120" valign="top" bgcolor="#F7F8F9"><table width="100%" height="120" border="0" cellpadding="0" cellspacing="0"><tr><td height="120" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"><tr><td height="120"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td height="120" colspan="3" align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td height="120" valign="top" bgcolor="#F7F8F9"><table width="100%" height="120" border="0" cellpadding="0" cellspacing="0"><tr><td height="120" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"><tr><td height="69"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td height="120" align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="120" valign="top" bgcolor="#F7F8F9"><table width="100%" height="120" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="120" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="120"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="120" colspan="3" align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td height="120" valign="top" bgcolor="#F7F8F9"><table width="100%" height="120" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                      <td height="120" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                          <tr>
                                            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
                                                <tr>
                                                  <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;请输入意见内容</td>
                                                </tr>
                                            </table></td>
                                          </tr>
                                          <tr>
                                            <td height="69"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                  <td height="75" align="center" class="left_txt2">
                                                  
                                                  <textarea name="content" id="content" cols="45" rows="3"><%=data.get("content") %></textarea>
                                                  
                                                  
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <td height="39" align="center"><input type="submit"  value="提交信息" name="B1" />
                                                    &nbsp;&nbsp;&nbsp;
                                                    <script type="text/javascript">
                function check()
                {
                if(f1.bjname.value=="")
                {
                alert("请输入班级名称");
                return;
                }
                 if(f1.bjteacher.value=="")
                {
                alert("请输入辅导员 ");
                return;
                }
                 
                }
                </script>
                                                    <input type="reset" value="重新填写" name="B12" /></td>
                                                </tr>
                                            </table></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                </table></td>
                              </tr>
                          </table></td>
                    </tr>
                    </table></td>
                </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
    </table>
    </td>
                        </tr>
  </table></td>
                  </tr>
  </table></td>
            </tr>
  </table></td>
      </tr>
  </table></td>
              </tr>
  </table></td>
          </tr>
  </table>
          </td>
      </tr>
  </table></td>
   
  </tr>
  </table>
</form>
  </body>
</html>
