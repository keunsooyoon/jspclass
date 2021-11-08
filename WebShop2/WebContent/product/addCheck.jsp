<%@page import="util.FileUtil"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>

<%
	String pid =null, pname = null, pdescription = null, pprice = null, pfilename = null;
	byte[] pfile = null;
	
	request.setCharacterEncoding("utf-8");
	
	ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
	// 추출 값들을 객체 형태로 저장 준비
	List items = sfu.parseRequest(request);
	// 입력된 값들을 추출하여 객체로 저장
	Iterator iter = items.iterator();
	// 순차적으로 접근하기 위한 객체 생성

	while(iter.hasNext()) { //요소가 있으면 계속 없으면 종료
		FileItem item = (FileItem) iter.next();
		String name = item.getFieldName();
		
		if(item.isFormField()) { // isFormFiled - 이름과 값으로 즉 맵	형태 (딕) 쌍으로 구성 확인
			String value = item.getString("utf-8");
			if(name.equals("id")) pid = value;
			if(name.equals("name")) pname = value;
			if(name.equals("description")) pdescription = value;
			if(name.equals("price")) pprice = value;
		} else {   // 사진 정보는 별도로 추출
			if(name.equals("filename")) {
				pfilename = item.getName(); //사진 파일의 이름을 추출
				pfile = item.get();  // 진짜 사진만 추출
				
				//사진을 파일로 특정 위치에 저장
/* 				File file = new File("/photos/" + pfilename);
				item.write(file); */
				
				String root = application.getRealPath(java.io.File.separator);
				FileUtil.saveImage(root,pfilename, pfile);
			}
		}
		
	}
	
	// 디비에 저장하기
	
	ProductDAO dao = new ProductDAO();
	pdescription = pdescription.replace("\r\n","<br/>");
	int code = dao.insert(pid, pname, pdescription, pprice, pfilename);
	
	if (code == 1) {
		response.sendRedirect("/product/products.jsp");
	}else{
		response.sendRedirect("addProduct.jsp");
	}
	
	
	
%>