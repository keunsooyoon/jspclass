<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   
<%@ page import = "util.*" %>
    
<%
/* 	Class.forName("com.mysql.jdbc.Driver"); */
	//MySql 드라이버를 메모리에 올린다. 

/* 	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/mysns","root","0000"); */
	//conn 객체 생성 
	
	Connection conn = ConnectionPool.get();
	
	Statement stmt = conn.createStatement();
	//Statement 객체 생성 
	
	ResultSet rs = stmt.executeQuery("SELECT id, name FROM user");
	//SQL  을 실행하고 그 실행 결과를 객체로 받는다. 

	String str = "";
	while(rs.next()) { 
		str += rs.getString("id") + ", "+ rs.getString("name") + "<br>";
	}
	// 결과를 한줄한줄 반복해서 목록 생성
	// ResultSet클래스의 주요 매서드들
	//next() 반환 boolean 다음레코드가 존재하면 true 없으면 False
	//first() 반환 boolean 첫번째 레코드로 이동
	//last() 마지막 레코드로 이동
	out.print(str);
	
	// 목록 출력
	rs.close(); stmt.close(); conn.close();
	// 객체들을 모두 닫아준다. 
%>

