<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String cid = request.getParameter("id");
	String cpass = request.getParameter("pass");
	String cname = request.getParameter("name");
	String cgender = request.getParameter("gender");	
	String cbirth = request.getParameter("birth");
	String cemail = request.getParameter("email");	
	String cphone = request.getParameter("phone");
	String caddr = request.getParameter("addr");	
	
	MemberDAO dao = new MemberDAO();
	boolean code = dao.join(cid, cpass, cname, cgender, 
							cbirth, cemail, cphone, caddr);
	
	if (code == true) {
		response.sendRedirect("/product/products.jsp");


	}

%>   
    