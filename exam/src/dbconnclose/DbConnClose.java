package dbconnclose;

import java.sql.*;

public class DbConnClose {

	public static Connection getConnection() {
		//JDBC 드라이버 로딩
		String driverClass = "org.mariadb.jdbc.Dirver";
		
		try {
			Class.forName(driverClass);
		} catch (ClassNotFoundException err) {
			System.out.println("JDBC 드라이버 오류! ");
		}
		// database  연결
		String url = "jdbc:mariadb://localhost:3307/univ";
		String id = "root";
		String pw = "0000";
		
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection(url,id,pw);
		} catch (SQLException sqlerr) {
			System.out.println("데이터베이스 연결 오류!");
		}
		return conn;
	}
	
	//데이터 베이스 연결 종료
	public static void resourceClose(ResultSet rset, Statement pstmt, Connection conn) {
		
		try {
			if(rset != null) rset.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException sqlerr) {
			System.out.println("데이베이스 종료 오류!");
		}
	}
	
	public static void resourceClose(Statement pstmt, Connection conn) {
		
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException sqlerr) {
			System.out.println("데이베이스 종료 오류!");
		}
	}	
}
