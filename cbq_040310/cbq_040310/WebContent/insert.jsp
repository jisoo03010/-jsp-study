<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="common.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function check() {
	var form = document.forms
	if (!form['resvno'].value){
		alert("접종예약번호가 입력되지 않았습니다.")
		form['resvno'].focus();
		return false;
	}else  if(!form['jumin'].value){
		alert("주민번호가 입력되지 않았습니다.")
		form['jumin'].focus();
		return false;
	}else  if(!form['vcode'].value){
		alert("백신코드가 입력되지 않았습니다.")
		form['vcode'].focus();
		return false;
	}else  if(!form['hospcode'].value){
		alert("병원코드가 입력되지 않았습니다.")
		form['hospcode'].focus();
		return false;
	}else  if(!form['resvdate'].value){
		alert("예약 일자가 입력되지 않았습니다.")
		form['resvdate'].focus();
		return false;
	}else  if(!form['resvtime'].value){
		alert("예약시간이 입력되지 않았습니다.")
		form['resvtime'].focus();
		return false;
	}
	alert("접종예약정보가 등록되었습니다.")
	return true;
}



</script>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<br>
<br>
<h3>백신접종예약</h3>
<br>
<br>
<br>
<br>
<form action="insert_action.jsp" name="forms">
	<table border="1"> 
		<tr>
			<th>접종예약번호</th>
			<td><input type="text" name="resvno"> 예) 20210001</td>
		</tr>
		<tr>
			<th>주민번호</th>
			<td><input type="text" name="jumin"> 예) 710101-1000001</td>
		</tr>
		<tr>
			<th>백신코드</th>
			<td><input type="text" name="vcode"> 예)V001 ~ V003</td>
		</tr>
		<tr>
			<th>병원코드</th>
			<td><input type="text" name="hospcode"> 예) H001</td>
		</tr>
		<tr>
			<th>예약일자</th>
			<td><input type="text" name="resvdate"> 예) 20211231</td>
		</tr>
		<tr>
			<th>예약시간</th>
			<td><input type="text" name="resvtime"> 예) 1230</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" value="등 록" onclick="check()">
				<input type="reset" value="다시 쓰기">
			</td>
		</tr>
	</table>
	
</form>
<br>
<br>
<br>

	
</section>


<%@include file="footer.jsp" %>
</body>
</html>