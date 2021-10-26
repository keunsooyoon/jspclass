<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.UserDAO" %>
<% 
    request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id");

	UserDAO dao = new UserDAO();
	
	if (dao.delete(uid)) {
		out.print("회원 탈퇴 완료");
	} else {
		out.print("오류 발생");
	}
	
%>