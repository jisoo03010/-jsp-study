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
	<br>
	<h3>좌석예약조회</h3>
	<form action="select_go.jsp" method="post">
		<table border="1">
			<tr>
				<th>사원번호를 입력 하시오.</th>
				<td><input type="text" name="empno"></td>
			</tr>
			<tr>
			<td colspan="2"style="text-align: center;"><input type="submit" value="좌석예약조회"> <a href="index.jsp"><button>홈으로</button></a></td>
			</tr>
		</table>
	</form>
</section>
<%@include file="footer.jsp"%>

</body>
</html>