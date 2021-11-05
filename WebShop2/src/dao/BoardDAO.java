package dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class BoardDAO {

	public boolean insert(String title, String description, String filename)
	throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		String member = "Austin";
		
		try {
			conn = ConnectionPool.get();
			
			String sql = "INSERT INTO board(btitle, bcontent, bmember, bfilename, bdate) VALUES(?,?,?,?,?)";
			
			stmt = conn.prepareStatement(sql);
				stmt.setString(1,title);
				stmt.setString(2,description);				
				stmt.setString(3,member);				
				stmt.setString(4,filename);				
				stmt.setString(5,LocalDate.now().toString());				
					
				int count = stmt.executeUpdate();
				
				return (count == 1) ? true : false;
		} finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}	
	}
	
	
	
	public ArrayList<BoardObj> getList()
	throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionPool.get();
			
			String sql = "SELECT * FROM board";
			
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();		
					
			ArrayList<BoardObj> boards = new ArrayList<BoardObj>();
			
			while(rs.next()) {
				boards.add(new BoardObj(rs.getString("bid"), rs.getString("btitle"),
						rs.getString("bcontent"), rs.getString("bmember"),
						rs.getString("bfilename"), rs.getString("bdate")));
			}
				return boards;
			
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		
		
		
	}
}
