package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class UserDAO {

	public boolean insert(String uid, String upass, String uname) 
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			String sql = "INSERT INTO user(id, password, name) VALUES(?,?,?)";
		
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
				stmt.setString(1, uid);
				stmt.setString(2, upass);
				stmt.setString(3, uname);
				
			int count = stmt.executeUpdate();
			return (count == 1) ? true : false;
			
		}finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public boolean exists(String uid) 
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT id FROM user WHERE id = ?";
		
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
				stmt.setString(1, uid);

				
			rs = stmt.executeQuery();
			return rs.next();
			
		}finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}	
	

	public boolean delete(String uid) 
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			String sql = "DELETE FROM user WHERE id = ?";
		
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
				stmt.setString(1, uid);

				
			int count = stmt.executeUpdate();
			return (count == 1) ? true : false;
			
		}finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
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
				stmt.setString(1, uid);

				
			rs = stmt.executeQuery();
			if(!rs.next()) return 1;  //아이디가 존재하지 않는 경우
			if(!upass.equals(rs.getString("password"))) return 2;
			//아이디는 존재하지만 패스워드가 불일치하는 경우
			return 0;  //로그인 성공
			
		}finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}	
	
	public ArrayList<UserObj> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM user ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
		ArrayList<UserObj> users = new ArrayList<UserObj>();
			while(rs.next()) {
				users.add(new UserObj(rs.getString("id"), rs.getString("name"), rs.getString("ts")));
			} return users;
			
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
			
		}
	}
	
	
}
