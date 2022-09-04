<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<script type="text/javascript">
function selec_check() {
	var form = document.forms
	if(!form['empno'].value){
		alert("사원번호가 입력되지 않았습니다.")
		form['empno'].focus();
		return false;
	}
	return true;
}
</script>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>

<br>
<br>
<br>
<h3>좌석예약조회</h3>
<br>
<br>
<br>
<form action="select_action.jsp" name="forms">
	<table border="1">
		<tr>
			<td>사원번호를 입력하시오.</td>
			<td><input type="text" name="empno"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" value="좌석예약조회" onclick="return selec_check()">
				 <a href="index.jsp"><input type="button" value="홈으로"></a>
			</td>
		</tr>
	</table>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>