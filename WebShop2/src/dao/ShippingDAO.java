package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.naming.NamingException;

import util.ConnectionPool;

public class ShippingDAO {

	public int insert(String cid, String pname, String pprice, String ppricetotal, String paccount, String pstatus, String pdate,
			String address) throws NamingException, SQLException {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;

			try {
				String sql = "INSERT INTO shipping VALUES (?,?,?,?,?,?,?)";
				conn = ConnectionPool.get();
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, cid);
				stmt.setString(2, pname);
				stmt.setString(3, pprice);
				stmt.setString(4, ppricetotal);
				stmt.setString(5, paccount);
				stmt.setString(6, pstatus);
				stmt.setString(7, LocalDate.now().toString());
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

}
