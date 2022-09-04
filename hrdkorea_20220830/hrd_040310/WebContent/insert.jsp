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
	function check() {
		var form = document.formd
		if(!form['resvno'].value){
			alert("예약번호가 입력되지 않았습니다.")
			form['resvno'].focus()
			return false;
		}else if(!form['empno'].value){
			alert("사원번호가 입력되지 않았습니다.")
			form['empno'].focus()
			return false;
		}else if(!form['resvdate'].value){
			alert("근무일자 입력되지 않았습니다.")
			form['resvdate'].focus()
			return false;
		}else if(!form['seatno'].value){
			alert("좌석번호 입력되지 않았습니다.")
			form['seatno'].focus()
			return false;
		}
		alert("근무좌석예약이 완료되었습니다.")
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
<h3>근무좌석예약</h3>

<br>
<br>
<br>
<br>
<form action="insert_action.jsp" name="formd">
	<table border="1">
		<tr>
			<th>예약번호</th>
			<td><input type="text" name="resvno">예) 20210001</td>
		</tr>
		<tr>
			<th>사원번호</th>
			<td><input type="text" name="empno">예) 1001</td>
		</tr>
		<tr>
			<th>근무일자</th>
			<td><input type="text" name="resvdate">예) 20211231</td>
		</tr>
		<tr>
			<th>좌석번호</th>
			<td><input type="text" name="seatno">예) S001 ~ S009</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" value="등록" onclick="return check()">
				<input type="reset" value="다시쓰기"> 
			</td>
		</tr>
	</table>
</form>

</section>
<%@include file="footer.jsp" %>
</body>
</html>