<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("id");
	String ucon = request.getParameter("content");
	
	String sql = "INSERT INTO feed(id, content) VALUES";
	sql += "('" + uid + "', '" + ucon + "')";
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/mysns","root","0000");
	Statement stmt = conn.createStatement();

	int count = stmt.executeUpdate(sql);
	if (count == 1) {
		out.print("글 작성 완료");
	} else {
		out.print("오류 발생");
	}
	stmt.close(); conn.close();
	
%>