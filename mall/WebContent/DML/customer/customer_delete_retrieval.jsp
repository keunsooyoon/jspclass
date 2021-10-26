<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%@ page import="dbconnclose.*"%>

<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제</title>
<link rel="stylesheet" href="../../common/CSS/common.css">
<script src="../../common/js/customer_delete.js"></script>
</head>
<body>
	<%@ include file="../../common/include/jsp_id_check_irud.inc"%>

	<% 
	Connection conn = null;			//DB연결
	PreparedStatement pstmt = null; //DB로 SQL전달
	ResultSet rset = null;          //DB에서 결과 받기
	
	conn = DbConnClose.getConnection();
	
	try {
%>

	<%@ include file="../../common/include/jsp_sql_dbget_rud.inc"%>

	<form name="customer_form" method="post" action="customer_delete_db.jsp">
		<table>
			<caption>회원 정보 삭제</caption>
			<tr style="border-style:hidden hidden solid hidden;">
				<td colspan="2" style="background-color:white; text-align:right;">
				<span class="msg_red">* 부분은 필수입력입니다!</span></td>
			</tr>
			
			<%@ include file="../../common/include/html_output_rd.inc" %>
			
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="button" value="탈퇴하시겠습니까?" onClick="confirm_onClick();">
					<input type="button" value="탈퇴 취소" onClick="location.href = './customer_maintenance.jsp';"></td>
			</tr>
		</table>
	</form>
	
	<%
	} catch(SQLException sqlerr) {
		out.print("SQL 오류");
	} finally {
		DbConnClose.resourceClose(rset, pstmt, conn);
	}
	out.print("검색 성공!!!");
	%>
	
	
</body>
</html>










