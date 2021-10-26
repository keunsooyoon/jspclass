<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<%@ page import = "dbconnclose.*" %>

<%@ page import = "java.lang.Math.*" %> <!-- ceil() 전체 페이지수 계산시   올림 사용 -->
<%@ page import = "java.text.DecimalFormat" %><!-- format() 천단위 콤마 (전체 회원 표현 ) -->




    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 제어 </title>
<link rel="stylesheet" href="../../common/CSS/table_retrieval.css">
</head>
<body>
<%
int LINE_PER_PAGE = 1; //페이지 당 출력 줄 수
int PAGE_PER_BLOCK = 2; //블럭당 페이지 수 

int nbr_of_row = 0;  //총 회원 수
int nbr_of_page = 0;    //총 페이지 수

int cur_page_no = 0;
int start_pointer  = 0; //DB 검색 시작 위치
int page_no = 0;    //현재 페이지 
int block_nbr = 0;      //블럭 번호
int block_startpage_no = 0;  //블럭의 시작 페이지 번호
int block_endpage_no = 0; //블럭의 끝 페이지 번호
int previous_block_start_pageno = 0;  // 이전 블록 시작 페이지 번호 
int next_block_start_pageno =0;      //다음 블록 시작 페이지 번호    

Connection conn = null;
PreparedStatement pstmt = null;
Statement stmt = null;
ResultSet rset = null;

conn = DbConnClose.getConnection();

try {
	String sql = "SELECT count(*) FROM customer"; //전체 회원 수 검색
	stmt = conn.createStatement();
	rset = stmt.executeQuery(sql);

	// 모든 회원수
	rset.next();
	
	nbr_of_row = Integer.parseInt(rset.getString("count(*)"));	
	
	// 모든 페이지 수 
	nbr_of_page = (int)Math.ceil((float)nbr_of_row / LINE_PER_PAGE);
	
	//검색 페이지
	if (request.getParameter("pageno") == null) {
		cur_page_no = 1;
	} else if (nbr_of_page < Integer.parseInt(request.getParameter("pageno"))) {
		//검색 시작 위치
		cur_page_no = nbr_of_page;
	} else {
		cur_page_no = Integer.parseInt(request.getParameter("pageno"));
	}
	
	start_pointer = (cur_page_no -1) * LINE_PER_PAGE;
	
	
	sql = "SELECT * FROM customer ORDER BY cust_id ASC LIMIT ?,?";
	pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, start_pointer);
		pstmt.setInt(2, LINE_PER_PAGE);
	rset = pstmt.executeQuery();
	
	if(!rset.isBeforeFirst()) {
		out.print("<script>alert('고객테이블이 비어 있습니다. ');"
				+"history.back();"
				+"</script>");
		
	}
%>
<form name="customer_form_table">
	<table>
		<caption> 고객 정보 테이블 검색 결과 페이징 </caption>
		<tr style="border-style:hidden hidden solid hidden;">
		<td colspan="8" style = "background-color:white; text-align:right; color:blue;">
		현재 회원 수 <%=nbr_of_row %> 명    &nbsp;&nbsp;&nbsp;
		(전체 <%=nbr_of_page %> 쪽 중 현재 <%=cur_page_no %> 쪽) </td>
 		</tr>
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
 	</tr>
<%
		}
%> 		
 	<tr>
 	<td colspan="8" style="text-align:center;">
 	
<%
	// 페이지 제어 

	//블록 번호
	block_nbr = ((cur_page_no - 1) / PAGE_PER_BLOCK) + 1;
	
	//블록 시작 페이지 번호
	block_startpage_no = ((block_nbr - 1) * PAGE_PER_BLOCK) + 1;
	
	//블록 끝 페이지 번호
	block_endpage_no = (block_startpage_no + PAGE_PER_BLOCK) - 1;
	
	if (block_nbr > 1) {
		out.print("&nbsp[<a href = './customer_retrieval_table_paging.jsp?pageno=1'>"
				+ "맨 처음</a>]&nbsp");
		//한 페이지씩 앞으로 이동
		previous_block_start_pageno = block_startpage_no - PAGE_PER_BLOCK;
		out.print("&nbsp[<a href='./customer_retrieval_table_paging.jsp?pageno="
				+ previous_block_start_pageno + "'>이전</a>]&nbsp");
	}
	
	for (int pgn = block_startpage_no; pgn <= block_endpage_no; pgn++) {
		if (pgn > nbr_of_page) {
			break;
		}
		
		if (pgn == cur_page_no) {
			out.print("&nbsp" + pgn + "&nbsp");
		} else {
			out.print("&nbsp[" + "<a href='./customer_retrieval_table_paging.jsp?"
							   + "pageno=" + pgn + "'>" + pgn + "</a>]&nbsp");
		}
		
	}

	if (block_endpage_no < nbr_of_page) {
		next_block_start_pageno = block_endpage_no + 1;
		out.print("&nbsp[<a href='./customer_retrieval_table_paging.jsp?pageno="
				+ next_block_start_pageno + "'>다음</a>]&nbsp");
		out.print("&nbsp[<a href='./customer_retrieval_table_paging.jsp?pageno="
				+ nbr_of_page + "'>맨 끝</a>]&nbsp");
	}

%>
 		</td>
 		</tr>
 		
 		
 <% 
} catch (SQLException sqlerr) {
	out.print("SQL 오류");
} finally {
	DbConnClose.resourceClose(rset, pstmt, conn);
}
 %>
 
	
	</table>

</form>

	<a href="./customer_maintenance.jsp">[고객정보관리]</a>
</body>
</html>







