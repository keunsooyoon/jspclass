<%@page import="dao.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");

	String year = request.getParameter("birthyy");
	String month = request.getParameter("birthmm");
	String day = request.getParameter("birthdd");	
	String birth = year + "/" + month + "/" + day;
	
	String mail = request.getParameter("mail");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");	

	MemberDAO dao = new MemberDAO();
	int code = dao.join(id, pass, name, gender, birth, mail, phone, address);
	
	if (code == 1) {
		response.sendRedirect("/product/products.jsp");
	}else{
		response.sendRedirect("joinMember.jsp");
	}
%>    
    
    
    