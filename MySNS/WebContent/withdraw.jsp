<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.UserDAO" %>

<% 
	String uid = request.getParameter("id");
	
	UserDAO dao = new UserDAO();
	
	if(dao.exists(uid) == false) {
		out.print("회원 정보를 찾을 수 없습니다. ");
		return;
	}
	
	if(dao.delete(uid)) {
		out.print("회원 탈퇴 완료");
		session.removeAttribute("id");
	} else {
		out.print("오류 발생");
	}
	
%>