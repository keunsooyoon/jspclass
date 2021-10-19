<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<%@ page import ="dbconnclose.*" %>

<%
	String cust_id = request.getParameter("cust_id");

	request.setCharacterEncoding("UTF-8");
%>    


	
<%@ include file=../common/jsp_sql_dbget.inc %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	conn = DbConnClose.getConnection(); //메소드로 연결
	

%>
<table>

<%@ include file=../common/html_output.inc %>	

</table>
</body>
</html>