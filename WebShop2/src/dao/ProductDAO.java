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
}
