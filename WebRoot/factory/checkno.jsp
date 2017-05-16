<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%
String table = request.getParameter("table")==null?"":request.getParameter("table");
String col = request.getParameter("col")==null?"":request.getParameter("col");
String value = request.getParameter("value")==null?"":request.getParameter("value");
String checktype = request.getParameter("checktype")==null?"":request.getParameter("checktype");
if(checktype.equals("insert"))
{
value = Info.getGBKStr(value);
System.out.println(value);
List list = new CommDAO().select("select * from "+table+" where "+col+"='"+value+"'");
if(list.size()>0)
{
out.print("Y");
}else{
out.print("N");
}
}

if(checktype.equals("zhinsert"))
{
value = Info.getGBKStr(value);
System.out.println(value);
String sql = "select * from "+table+" where 1=1 ";
String[] cols = col.split(",");
String[] values = value.split(",");
for(int i=0;i<cols.length;i++)
{
String pcol = cols[i]==null?"":cols[i];
String pvalue = values[i]==null?"":values[i];
if(pcol.equals(""))continue;
if(pvalue.equals(""))continue;
sql+=" and "+pcol+"='"+pvalue+"' " ;
}
System.out.println(sql);
List list = new CommDAO().select(sql);
if(list.size()>0)
{
out.print("Y");
}else{
out.print("N");
}
}

if(checktype.equals("update"))
{
String id = request.getParameter("id")==null?"":request.getParameter("id");
value = Info.getGBKStr(value);
System.out.println(value);
List list = new CommDAO().select("select * from "+table+" where "+col+"='"+value+"' and id!="+id);
System.out.println("select * from "+table+" where "+col+"='"+value+"' and id!="+id);
if(list.size()>0)
{
out.print("Y");
}else{
out.print("N");
}
}


if(checktype.equals("zhupdate"))
{
String id = request.getParameter("id")==null?"":request.getParameter("id");
value = Info.getGBKStr(value);
String sql = "select * from "+table+" where 1=1 ";
String[] cols = col.split(",");
String[] values = value.split(",");
for(int i=0;i<cols.length;i++)
{
String pcol = cols[i]==null?"":cols[i];
String pvalue = values[i]==null?"":values[i];
if(pcol.equals(""))continue;
if(pvalue.equals(""))continue;
sql+=" and "+pcol+"='"+pvalue+"' " ;
}
sql+=" and id!="+id;
System.out.println(sql);
List list = new CommDAO().select(sql);
 
if(list.size()>0)
{
out.print("Y");
}else{
out.print("N");
}
}

%>