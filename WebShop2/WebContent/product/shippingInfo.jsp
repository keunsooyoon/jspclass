<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "/header.jsp" %>
	<div class="alert alert-secondary" role="alert">
		<h1 class="display-3">배송 정보 입력</h1>
	</div>
	
	
	
	
	
		<div class="container">
		<form name="newMember" class="form-horizontal"  action=" shippingCookie.jsp" method="post">
			<div class="form-group  row">
				<label class="col-sm-2 ">상품명</label>
				<div class="col-sm-3">
					<input name="pname" type="text" class="form-control" disabled value=<%=request.getParameter("pname")%>>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">가격</label>
				<div class="col-sm-3">
					<input name="pprice" type="text" class="form-control" disabled value=<%=request.getParameter("pprice")%>>
				</div>
			</div>



			<div class="form-group  row">
				<label class="col-sm-2 ">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="name" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">배송일</label>
				<div class="col-sm-3">
					<input name="shippingdate" type="text" class="form-control" placeholder="date" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">입금계좌</label>
				<div class="col-sm-3">
					<input name="account" type="text" class="form-control" placeholder="password confirm" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input name="zipcode" type="text" class="form-control" placeholder="zip code" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-10">
					<input name="address" type="text" class="form-control" placeholder="address" >
				</div>
			</div>

			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
				</div>
			</div>

			
		</form>
			</div>

	
<%


%>





<%@ include file = "/footer.jsp" %>

</body>
</html>