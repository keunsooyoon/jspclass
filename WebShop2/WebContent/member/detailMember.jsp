<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
<%@ include file = "/header.jsp" %>
	<div class="alert alert-secondary" role="alert">
		<h1 class="display-3">회원 정보</h1>
	</div>
<%
	String a = "555";
	MemberObj member = (new MemberDAO()).getDetail(a);
%>

	<div class="container">
		<form name="newMember" class="form-horizontal"  action="joinCheck.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<%=member.getCid() %>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<%=member.getCname() %>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<%=member.getCgender() %>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-4  ">
					<%=member.getCbirth() %>
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<%=member.getCemail() %>
				</div>				
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<%=member.getCphone() %>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<%=member.getCaddress() %>

				</div>
			</div>
				<div class="form-group  row">
				<label class="col-sm-2 ">가입일</label>
				<div class="col-sm-5">
					<%=member.getCregiday() %>

				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="수정" > 
					<input type="reset" class="btn btn-primary " value="목록 " >
				</div>
			</div>
		</form>
	</div>







<%@ include file = "/footer.jsp" %>
</body>
</html>