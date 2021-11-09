package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class ShippingDAO {

	public int insert(String cid, String pname, String pprice, String ppricetotal, String paccount, String paddress) 
			throws NamingException, SQLException {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
					
			try {
				String sql = "INSERT INTO shipping VALUES (?,?,?,?,?,?,?,?)";
				conn = ConnectionPool.get();
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, cid);
				stmt.setString(2, pname);
				stmt.setString(3, pprice);
				stmt.setString(4, ppricetotal);
				stmt.setString(5, paccount);
				stmt.setString(6, paddress);
				stmt.setString(7, LocalDate.now().toString());
				stmt.setString(8, "1");

				int count = stmt.executeUpdate();
				return (count == 1) ? 1 : 2;

			} finally {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			}
		}

	
	
	public ArrayList<ShippingObj> getList() throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM shipping";

			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			ArrayList<ShippingObj> goods = new ArrayList<ShippingObj>();

			while (rs.next()) {
				goods.add(new ShippingObj(rs.getString("cid"), rs.getString("pname"), rs.getString("pprice"),
						rs.getString("ppricetotal"), rs.getString("paccount"), rs.getString("paddress"), rs.getString("pdate"), rs.getNString("pstatus")));
			}
			return goods;
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
}
}
