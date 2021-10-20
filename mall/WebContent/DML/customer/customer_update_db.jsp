<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbconnclose.*" %>    
    
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 업데이트</title>
</head>
<body>
	<%@ include file="../../common/include/jsp_id_check_irud.inc" %>
	<%@ include file="../../common/include/jsp_sql_dbset_iu.inc" %>	
	
	<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	conn = DbConnClose.getConnection();
	
	try {
		
		String sql = "UPDATE customer SET "
				+ "cust_pw=?, cust_name=?, "
			    + "cust_tel_no=?, cust_addr=?, "
			    + "cust_gender=?, cust_email=? "
			    + "WHERE cust_id=?";
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,cust_pw);
			pstmt.setString(2,cust_name);
			pstmt.setString(3,cust_tel_no);
			pstmt.setString(4,cust_addr);
			pstmt.setString(5,cust_gender);
			pstmt.setString(6,cust_email);
			pstmt.setString(7,cust_id);
		pstmt.executeUpdate();
	} catch (SQLException sqlerr) {
		out.println("SQL 오류");
	} finally {
		DbConnClose.resourceClose(pstmt, conn);
	}
	
	%>
</body>
</html>