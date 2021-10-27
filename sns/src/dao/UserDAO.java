package dao;

import java.sql.*;

import javax.naming.NamingException;

import util.ConnectionPool;

public class UserDAO {
	
	public boolean exists(String uid) 
			throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
				stmt.setNString(1, uid);
		
			rs = stmt.executeQuery();			
			return rs.next();
			
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}
	

	public int login(String uid, String upass) 
			throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id, password FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
				stmt.setNString(1, uid);
		
			rs = stmt.executeQuery();
			if (!rs.next()) {
				return 1;  //아이디가 존재하지 않음
			} 
			if (!upass.equals(rs.getString("password"))) {
				return 2;  //비번이 일치 하지 않는 경우
			}
			return 0;
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}
	
	
	public boolean insert(String uid, String upass, String uname) 
			throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			String sql = "INSERT INTO user(id, password, name) VALUES(?,?,?)";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
				stmt.setNString(1, uid);
				stmt.setNString(2, upass);
				stmt.setNString(3, uname);
			int count = stmt.executeUpdate();
			return (count == 1) ? true : false;
		} finally {
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}
	
	
	
}
