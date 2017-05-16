package control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;


import util.Info;

import dao.CommDAO;

public class MainCtrl extends HttpServlet {

	public MainCtrl() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	this.doPost(request, response);
	}

		public void go(String url,HttpServletRequest request, HttpServletResponse response)
		{
		try {
			request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
		
		public void gor(String url,HttpServletRequest request, HttpServletResponse response)
		{
			try {
				response.sendRedirect(url);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		HashMap user = new HashMap(); 
		user = (HashMap)session.getAttribute("admin");
		
		HashMap member = (HashMap)session.getAttribute("member");
		String ac = request.getParameter("ac");
		if(ac==null)ac="";
		CommDAO dao = new CommDAO();
		String date = Info.getDateStr();
		String today = date.substring(0,10);
		String tomonth = date.substring(0,7);
		
		//登录
		if(ac.equals("login"))
		{
			String username = request.getParameter("username");
			String password = request.getParameter("pass");
			String utype = request.getParameter("utype");
			String pagerandom = request.getParameter("pagerandom")==null?"":request.getParameter("pagerandom");
			String random = (String)session.getAttribute("random");
			if(!pagerandom.equals(random)&&request.getParameter("a")!=null)
			{
				request.setAttribute("random", "");
				go("/admin/login.jsp", request, response);
			}
			else{
				String sql1 = "select * from sysuser where uname='"+username+"' and upass='"+password+"' and utype='"+utype+"'";
				System.out.println(sql1);
			List<HashMap> userlist1 = dao.select(sql1);
			if(userlist1.size()==1)
			{
				request.getSession(). setAttribute("admin", userlist1.get(0));  
				gor("/sflatsys/admin/index.jsp", request, response);
			}else{
				request.setAttribute("error", "");
				go("/admin/login.jsp", request, response);
			}
			
			
			
			}
		}
		
		 
		
		//修改密码
		if(ac.equals("uppass"))
		{
			String olduserpass = request.getParameter("olduserpass");
			String userpass = request.getParameter("userpass");
			String copyuserpass = request.getParameter("copyuserpass");   
			user = dao.getmap(user.get("id").toString(), "sysuser");
			if(!(((String)user.get("upass")).equals(olduserpass)))
			{
				request.setAttribute("error", "");
				go("/admin/uppass.jsp", request, response);
			}else{
			String id = (String)user.get("id");
			String sql = "update sysuser set upass='"+userpass+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/uppass.jsp", request, response);
			}
		}
		

		
		if(ac.equals("uploaddoc"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			    
			     items = upload.parseRequest(request);
			     
			    FileItem fileItem = (FileItem) items.get(0);
			   if(fileItem.getName()!=null && fileItem.getSize()!=0)
			    {
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    }
			}
			
			go("/js/uploaddoc.jsp?docname="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		
		//导excel
		if(ac.equals("importexcel"))
		{
			String page = request.getParameter("page");
			String whzdstr = request.getParameter("whzdstr");
			String tablename = request.getParameter("tablename");
			try {
				String filename="";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			    
			     items = upload.parseRequest(request);
			     
			    FileItem fileItem = (FileItem) items.get(0);
			   if(fileItem.getName()!=null && fileItem.getSize()!=0)
			    {
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    }
			    
			   if(filename.indexOf(".xls")>-1)
				{
					Workbook workbook;
					try {
						workbook = Workbook.getWorkbook(new File(request.getRealPath("/upfile/")+"/"+filename));
		               //通过Workbook的getSheet方法选择第一个工作簿（从0开始）
						Sheet sheet = workbook.getSheet(0); 
		               //通过Sheet方法的getCell方法选择位置为C2的单元格（两个参数都从0开始）
						//int empty = 0;
						for(int i=1;i<1000;i++)
						{
							Cell cell = null;
							try{
								String isql = "insert into "+tablename+"(";
								
								for(String str:whzdstr.split("-"))
								{ 
									isql+=str+",";
								}
								isql = isql.substring(0,isql.length()-1);
								isql+=")values(";
								
								int j=0;
								int empty = 1;
								for(String str:whzdstr.split("-"))
								{
								cell = sheet.getCell(j,i); 
								isql+="'"+cell.getContents()+"',";
								String content = cell.getContents()==null?"":cell.getContents();
								if(!"".equals(content.trim()))
								{
									empty = 0;
								}
								j++;
								}
								if(empty==1)continue;
								isql = isql.substring(0,isql.length()-1);
								isql+=")";
								dao.commOper(isql);
							}catch (Exception e) {
							continue;
							}
						    
						 } 
						 workbook.close(); 
		            } catch (Exception e) {
						e.printStackTrace();
					} 
                  }
			}
			go("/admin/"+page+"?docname="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	  

		if(ac.equals("uploadimg"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			    
			     items = upload.parseRequest(request);
			     
			    FileItem fileItem = (FileItem) items.get(0);
			   if(fileItem.getName()!=null && fileItem.getSize()!=0)
			    {
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    }
			}
			
			go("/js/uploadimg.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		
		
		if(ac.equals("uploadimg2"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			    
			     items = upload.parseRequest(request);
			     
			    FileItem fileItem = (FileItem) items.get(0);
			   if(fileItem.getName()!=null && fileItem.getSize()!=0)
			    {
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    }
			}
			
			go("/js/uploadimg2.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		
		if(ac.equals("uploadimg3"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			    
			     items = upload.parseRequest(request);
			     
			    FileItem fileItem = (FileItem) items.get(0);
			   if(fileItem.getName()!=null && fileItem.getSize()!=0)
			    {
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    }
			}
			
			go("/js/uploadimg3.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		
		if(ac.equals("uploadimg4"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			    
			     items = upload.parseRequest(request);
			     
			    FileItem fileItem = (FileItem) items.get(0);
			   if(fileItem.getName()!=null && fileItem.getSize()!=0)
			    {
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    }
			}
			
			go("/js/uploadimg4.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		
		if(ac.equals("uploadimg5"))
		{
			try {
				String filename="";
			request.setCharacterEncoding("utf-8");
			RequestContext  requestContext = new ServletRequestContext(request);
			if(FileUpload.isMultipartContent(requestContext)){

			   DiskFileItemFactory factory = new DiskFileItemFactory();
			   factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
			   ServletFileUpload upload = new ServletFileUpload(factory);
			   upload.setSizeMax(100*1024*1024);
			   List items = new ArrayList();
			    
			     items = upload.parseRequest(request);
			     
			    FileItem fileItem = (FileItem) items.get(0);
			   if(fileItem.getName()!=null && fileItem.getSize()!=0)
			    {
			    if(fileItem.getName()!=null && fileItem.getSize()!=0){
			      File fullFile = new File(fileItem.getName());
			      filename = Info.generalFileName(fullFile.getName());
			      File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
			      try {
			       fileItem.write(newFile);
			      } catch (Exception e) {
			       e.printStackTrace();
			      }
			     }else{
			     }
			    }
			}
			
			go("/js/uploadimg5.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			    }
		}
		
		dao.close();
		out.flush();
		out.close();
	}


	public void init() throws ServletException {
		// Put your code here
	}
	
	

}
