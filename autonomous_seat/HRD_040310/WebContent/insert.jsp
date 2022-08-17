<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="common.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="header.jsp"%>
<%@include file="nav.jsp"%>
<section id="section">
<form action="insert_action.jsp" name="formT">
	<table border="1">
		<tr>
			<th>예약번호</th>
			<td><input type="text" name="resvno">예 ) 20210001</td>
		</tr>
		<tr>
			<th>사원번호</th>
			<td><input type="text" name="empno">예 ) 1001</td>
		</tr>
		<tr>
			<th>근무일자</th>
			<td><input type="text" name="resvdate">예 ) 20211231</td>
		</tr>
		<tr>
			<th>좌석번호</th>
			<td><input type="text" name="seatno">예 ) 5001 ~ 5009</td>
		</tr>
		<tr>
			<td colspan="2"style="text-align: center;"><input type="submit" value="등록"> <input type="reset" value="다시쓰기"></td>
		</tr>
	</table>
</form>
</section>
<%@include file="footer.jsp"%>
</body>
</html>