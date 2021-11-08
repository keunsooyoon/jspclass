package dao;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class ProductDAO {

	public ArrayList<ProductObj> getList()
		throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM product";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			ArrayList<ProductObj> products = new ArrayList<ProductObj>();

			while(rs.next()) {
				products.add(new ProductObj(rs.getNString("pid"),
						rs.getNString("pname"),rs.getNString("pdescription"),
						rs.getNString("pprice"),rs.getNString("pfilename")
						));
			} return products;
		}finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
	}
	
	
	
	
	
	// insert(pid, pname, pdescription, pprice, pfilename)
	
	public int insert(String pid, String pname, String pdescription, String pprice, String pfilename)
	throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			String sql = "INSERT INTO product(pid, pname, pdescription, pprice, pfilename) VALUES (?,?,?,?,?)";
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
				stmt.setString(1, pid);
				stmt.setString(2, pname);
				stmt.setString(3, pdescription);
				stmt.setString(4, pprice);
				stmt.setString(5, pfilename);
			int count = stmt.executeUpdate();
			return (count == 1) ? 1 : 0;
		}finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}
	
	
	
	public ProductObj getDetail(String pid) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try { 
			String sql = "SELECT * FROM product WHERE pid = ?";
			
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
				stmt.setString(1, pid);
			rs = stmt.executeQuery();
			
			rs.next();
			
			String id = rs.getString(1);
			String name = rs.getString(2);
			String description = rs.getString(3);
			String price = rs.getString(4);
			String filename = rs.getString(5);

			ProductObj product = new ProductObj(id, name, description, price, filename);
			
			return product;
		}finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
		
		
		
		
	}
	
	
	
	
	
	
	
}
