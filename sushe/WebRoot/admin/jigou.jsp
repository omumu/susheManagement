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
 <%
  CommDAO dao = new CommDAO();
 
   %>

  <link rel="stylesheet" href="/sflatsys/tree/zTreeStyle/zTreeStyle.css" type="text/css">
  <script type="text/javascript" src="/sflatsys/tree/jquery-1.4.2.js"></script>
  <script type="text/javascript" src="/sflatsys/tree/jquery-ztree-2.5.js"></script>
  <script type="text/javascript" src="/sflatsys/tree/demoTools.js"></script>
  
 <SCRIPT LANGUAGE="JavaScript">
  <!--
	var zTree;
	var demoIframe;

	var setting = {
		isSimpleData: true,
		treeNodeKey: "id",
		treeNodeParentKey: "pId",
		showLine: true,
		root:{ 
			isRoot:true,
			nodes:[]
		},
		
		callback:{
				click: getShu
			}
		
	};

	zNodes =[
		{ id:1, pId:-1, name:"黑河学院", open:true, "url":"addjigou.jsp?pid=1", "target":"testIframe"},
		<%
		List<HashMap> list = dao.select("select * from jigou where jgname!='黑河学院'");
		int i = 0;
		for(HashMap h:list)
		{
		i++;
		if(i!=list.size())
		{
		%>
		{ id:<%=h.get("id")%>, pId:<%=h.get("pid")%>, name:"<%=h.get("jgname")%>", open:true},
		<%
		}else{
		%>
		{ id:<%=h.get("id")%>, pId:<%=h.get("pid")%>, name:"<%=h.get("jgname")%>",open:true}
		<%}
		}
		%>
		
		
		];
		
		function getShu(event, treeId, treeNode)
		{
		parent.document.getElementById("jigid").value=treeNode.name;
		popclose();
		}
		

	$(document).ready(function(){
		setting.expandSpeed = ($.browser.msie && parseInt($.browser.version)<=6)?"":"fast";
		zTree = $("#treeDemo").zTree(setting, zNodes);
		var nodes = zTree.getNodes();
		
	});

	function loadReady() {
		var h = demoIframe.contents().find("body").height();
		if (h < 600) h = 600;
		demoIframe.height(h);
	}

  //-->
  </SCRIPT>
</head>
  
  <body>
  
 
   
 
   
  <form action="/sflatsys/admin/sslist.jsp?f=f" method="post" name="f1">
   
		
		
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         
          
          <tr>
            <td  height="132"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            
              <tr>
                <td height="3" colspan="2" align="left" valign="top" bgcolor="#f2f2f2" class="left_txt2"></td>
              </tr>
              <tr>
                <td width="26%" height="178"  style="border:1px" align="left" valign="top" class="left_txt2">
                
                
                
                 <div class="zTreeDemoBackground">
					<ul id="treeDemo" class="tree"></ul>
				</div>                 </td>
            
              </tr>
            
            </table></td>
          </tr>
        </table>
		
		
		
		

</form>
  </body>
</html>
