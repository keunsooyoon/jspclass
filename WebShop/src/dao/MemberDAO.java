package dao;

import java.sql.*;

import javax.naming.NamingException;

import util.ConnectionPool;

public class MemberDAO {

	public int login(String cid, String cpassword) 
		throws NamingException, SQLException {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
		try {
			String sql = "SELECT cid, cpassword FROM member WHERE cid = ?";
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
				stmt.setString(1,cid);
				
			rs = stmt.executeQuery();
			if (!rs.next()) return 1;
			if (!cpassword.equals(rs.getString("cpassword"))) return 2;
			
			return 0;
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
	}
	
	
	
	public boolean join(String cid, String cpass, String cname, String cgender, 
			String cbirth, String cemail, String cphone, String caddr) 
			throws NamingException, SQLException {
		
				Connection conn = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				String timestamp = "2021-11-03";
				
			try {
				String sql = "INSERT INTO member (cid, cpassword, cname, cgender, cbirth, cemail, cphone, caddress, cregiday) "
						+ "VALUES(?,?,?,?,?,?,?,?,?)";
				
				conn = ConnectionPool.get();
				stmt = conn.prepareStatement(sql);
					stmt.setString(1,cid);
					stmt.setString(2,cpass);
					stmt.setString(3,cname);
					stmt.setString(4,cgender);
					stmt.setString(5,cbirth);
					stmt.setString(6,cemail);
					stmt.setString(7,cphone);
					stmt.setString(8,caddr);
					stmt.setString(9,timestamp);
					
				int count = stmt.executeUpdate();
				return (count == 1) ? true : false;
				
			} finally {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			}
		}
	
	
	
}
