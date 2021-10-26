<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import ="java.sql.*" %>
 <%@ page import ="dbconnclose.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../common/CSS/table_retrieval.css">
</head>
<body>

<!-- 1 아이디 오름차순 정렬하여 전체 검색
2 기존의 custoemer_update 과 연결
3 기존의 customer_delete 과 연결

ceil() 전체 페이지수 계산시   올림 사용
format() 천단위 콤마 (전체 회원 표현 )

LINE_PER_PAGE 페이지 당 출력 줄 수
PAGE_PER_BLOCK 블럭당 페이지 수 
nbr_of_row    총 회원 수
nbr_of_page   총 페이지 수
start_pointer DB 검색 시작 위치
cur_page_no   현재 페이지 
block_nbr     블럭 번호
block_startpage_no 블럭의 시작 페이지 번호
block_endpage_no 블럭의 끝 페이지 번호
previous_block_start_pageno  이전 블록 시작 페이지 번호
next_block_start_pageno      다음 블록 시작 페이지 번호
 -->
 
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rset = null;

	conn = DbConnClose.getConnection();
	
	try {
		String sql = "SELECT * FROM customer ORDER BY cust_id ASC";
		stmt = conn.createStatement();
		rset = stmt.executeQuery(sql);
		
		if(!rset.isBeforeFirst()) {
			out.print("<script>alert('고객테이블이 비어 있습니다. ');"
			+ "history.back();"
			+ "</script>");
			
		}
		
%>
		<form name="customer_form_table">
			<table>
				<caption>고객 정보 관리</caption>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>성별</th>
			<th>이메일</th>
			<th>가입일</th>			
			<th>수정</th>
			<th>삭제</th>	
		</tr>		
	<%
		while (rset.next()) {
			String cust_id = rset.getString("cust_id");
			String cust_pw = rset.getString("cust_pw");
			String cust_name = rset.getString("cust_name");
			String cust_tel_no = rset.getString("cust_tel_no");
			String cust_addr = rset.getString("cust_addr");
			String cust_gender = rset.getString("cust_gender");
			if (cust_gender == null) {
				cust_gender = "";
			} else if (cust_gender.equals("M")) {
				cust_gender = "남자";
			} else {
				cust_gender = "여자";
			}
			
			String cust_email = rset.getString("cust_email");
			String cust_join_date = rset.getString("cust_join_date");			
%>			
	<tr>
	<td><%=cust_id %></td>
	<td><%=cust_pw %></td>	
	<td><%=cust_name %></td>	
	<td><%=cust_tel_no %></td>	
	<td><%=cust_addr %></td>
	<td><%=cust_gender %></td>	
	<td><%=cust_email %></td>	
	<td><%=cust_join_date %></td>	
	<td style="text-align:center;">
		<a href="./customer_update_retrieval.jsp?cust_id=<%=cust_id %>">[갱신]</a></td>
	<td style="text-align:center;">
		<a href="./customer_delete_retrieval.jsp?cust_id=<%=cust_id %>">[삭제]</a></td>	
	</tr>
<% 
		}
	} catch(SQLException sqlerr) {
		out.print("SQL 오류");
	} finally {
		%>
		</table>
		</form>
		<%
		rset.last();
		int row_cnt = rset.getRow();
		out.print("고객 테이블 " + row_cnt + "개 레코드 검색 성공!");
		
		DbConnClose.resourceClose(rset, stmt, conn);
	}
	%>		
</body>
</html>





