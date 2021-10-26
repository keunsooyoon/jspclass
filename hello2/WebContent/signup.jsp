<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import = "java.sql.*" %> --%>
<%@ page import = "dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	String uname = request.getParameter("name");
	
	UserDAO dao = new UserDAO();
	
	if (dao.insert(uid,upass,uname)) {
		out.print("회원 가입 완료");
	} else {
		out.print("오류 발생");
	}
	
%>



