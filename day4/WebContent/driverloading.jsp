<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import = "java.sql.*" %> --%>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 드라이버 로딩 </title>
</head>
<body>
<%

	String driverClass = "org.mariadb.jdbc.Driver";
//  com.mysql.jdbc.Driver    oracle.jdbc.driver.OracleDriver

	try {
		Class.forName(driverClass);
		out.print("JDBC 드라이버 로딩 성공");
	} catch(ClassNotFoundException err) {
		out.print("JDBC 드라이버 로딩 실패");
	}

%>
</body>
</html>