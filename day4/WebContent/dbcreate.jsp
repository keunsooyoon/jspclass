<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%-- <%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %> --%>


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
		out.print("JDBC 드라이버 로딩 성공" + "<br>");
	} catch(ClassNotFoundException err) {
		out.print("JDBC 드라이버 로딩 실패" + "<br>");
	}

	String url = "jdbc:mariadb://localhost:3307/";
	String id = "root";
	String pw = "0000";

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		conn = DriverManager.getConnection(url, id, pw);
		out.print("MariaDB 서버 연결 성공" + "<br>");
		
		// SQL 처리
		
		String sql = "CREATE DATABASE univ";
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		out.print("데이터 베이스 생성 성공" + "<br>");
		
	} catch (SQLException sqlerr) {
		out.print("MariaDB 실패" + "<br>");
		out.print(sqlerr.getMessage());
	} finally {
		// 데이터 베이스 연결 종료
		
		if (pstmt != null) {
			try {
				pstmt.close();
				out.println("구문 닫기 성공" + "<br>");
			} catch (Exception conerr) {
				conerr.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
				out.println("MariaDB 서버 연결 종료" + "<br>");
			} catch (Exception conerr) {
				conerr.printStackTrace();
			}
		}
	}
	
	
	
	
	
%>
</body>
</html>