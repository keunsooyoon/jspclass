<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
<% 
Connection conn = null;          // 커넥션
PreparedStatement pstmt = null;  // 구문
ResultSet rset = null;           // 출력

String driverClass = "org.mariadb.jdbc.Driver";

try {
	Class.forName(driverClass);
}catch (ClassNotFoundException err){
	out.print("JDBC 드라이버 연결 실패");
}


//DB 연결
String url = "jdbc:mariadb://localhost:3307/univ";
String id = "root";
String pw = "0000";

try {
	conn = DriverManager.getConnection(url,id,pw);
	
	//SQL.......
	

	//학생 정보 검색 내용 출력 
	String sql = "SELECT * FROM student2";
	pstmt = conn.prepareStatement(sql);
	rset = pstmt.executeQuery();
%>
<table class="table caption-top">
	<caption>학생 정보 검색</caption>
	<tr>
	<th>학번</th>
	<th>이름</th>
	<th>학년</th>
	<th>전공</th>
	<th>주소</th>
	</tr>
<% 	
	while (rset.next()){
		String hakbun = rset.getString("hakbun");
		String name = rset.getString("name");
		String year = rset.getString("year");
		String dept = rset.getString("dept");
		String addr = rset.getString("addr");

%>
		<tr>
			<td><%=hakbun %></td>
			<td><%=name %></td>
			<td><%=year %></td>
			<td><%=dept %></td>
			<td><%=addr %></td>
		</tr>
<% 
}


	} catch (SQLException sqlerr) {
		out.print("MariaDB 실패" + "<br>");
		out.print(sqlerr.getMessage()+ "<br>");
	} finally {
		// 데이터 베이스 연결 종료
		
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception conerr) {
				conerr.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception conerr) {
				conerr.printStackTrace();
			}
		}
	}


	%>
	</table>
	</body>
	</html>	