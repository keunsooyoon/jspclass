<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%@ page import="dbconnclose.*"%>

<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 검색</title>
<link rel="stylesheet" href="../../common/CSS/common.css">
</head>
<body>
	<%@ include file="../../common/include/jsp_id_check_irud.inc"%>

<% 
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rset = null;

conn = DbConnClose.getConnection();

try {
%>
	<%@ include file="../../common/include/jsp_sql_dbget_rud.inc"%>
	<form name="customer_form"></form>
	<table>
		<caption>회원 정보 검색</caption>
		<tr style="border-style: hidden hidden solid hidden;">
			<td colspan="2" style="background-color: white; text-align: right;">
				<span class="msg_red">* 부분은 필수입력 항목입니다!</span>
			</td>
		</tr>
	<%@ include file="../../common/include/html_output_rd.inc"%>
		<tr>
			<td colspan="2" style="text-align: center;"><a
				href="./customer_maintenance.jsp">[ 고객정보 관리 ]</a></td>
		</tr>
	</table>
<% 
}catch (SQLException sqlerr) {
	out.print("SQL 오류");
}finally {
	DbConnClose.resourceClose(rset, pstmt, conn);
}

%>

</body>
</html>










