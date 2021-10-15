<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<% //한글 처리
	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 테이블에 학생 정보 저장</title>
</head>
<body>
<% 
	//참조 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;

	//JDBC 드라이버 로딩
	String driverClass = "org.mariadb.jdbc.Driver";

	try {
	Class.forName(driverClass);
	out.print("드라이버 로드 성공<br>");
	}catch (ClassNotFoundException err) {
	out.print("드라이버 로드 실패<br>");
	}

	//mariaDB 연결
	String url = "jdbc:mariadb://localhost:3307/univ";
	String id = "root";
	String pw = "0000";

	try {
		conn = DriverManager.getConnection(url, id, pw);
		out.print("데이터베이스 연결 성공<br>");
		
		// 전송 받아서 변수 대입
		 String hakbun = request.getParameter("hakbun");
		 String name = request.getParameter("name");
		 String year = request.getParameter("year");
		 String dept = request.getParameter("dept");
		 String addr = request.getParameter("addr");
		
		// 변수값들을 디비에 삽입
		String sql ="INSERT INTO student VALUES(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hakbun);
			pstmt.setString(2, name);		
			pstmt.setString(3, year);
			pstmt.setString(4, dept);
			pstmt.setString(5, addr);
		pstmt.executeUpdate();
		out.print("테이블 데이터 삽입 성공");
		
	} catch (SQLException sqlerr) {
		out.print("MariaDB 실패" + "<br>");
		out.print(sqlerr.getMessage()+ "<br>");
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