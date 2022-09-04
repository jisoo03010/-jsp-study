<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>

<section>
<br>
<br>
	<h3>학생조회/수정</h3>
<br>
<br>
<br>
<br>
<form action="insert_action.jsp" name="formks">
	<table style="margin: 0 auto;">
		<tr>
			<th>학번</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>성명</th>
			<td>
				<select name="gender">
					<option value="1">남자</option>
					<option value="2">여자</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="등록"></td>
		</tr>
	
	</table>
</form>

</section>

<%@include file="footer.jsp" %>
</body>
</html>