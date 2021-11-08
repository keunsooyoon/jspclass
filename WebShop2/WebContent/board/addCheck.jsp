<%@page import="util.FileUtil"%>
<%@page import="dao.BoardDAO"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("utf-8");

	String title = null, description = null, filename = null;
	byte[] ufile = null;
	
	ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
	List items = sfu.parseRequest(request);
	
	Iterator iter = items.iterator();
	
	while(iter.hasNext()) {
		FileItem item = (FileItem) iter.next();
		String name = item.getFieldName();
		if(item.isFormField()) {
			String value = item.getString("utf-8");
			if (name.equals("title")) title = value;
			else if (name.equals("description")) description = value;
		} else {
			if(name.equals("filename")) {
				filename = item.getName();
				ufile = item.get();
				
				//사진을 파일로 특정 위치에 저장
/* 				File file = new File("/photos/" + filename);
				item.write(file); */
				
				String root = application.getRealPath(java.io.File.separator);
				FileUtil.saveImage(root, filename, ufile);
			}
		}
	}
	
	BoardDAO dao = new BoardDAO();
	
	if (dao.insert(title, description, filename)) {
		response.sendRedirect("listBoard.jsp");
	} else {
		response.sendRedirect("listBoard.jsp");
	}
%>  
    
    
    
    