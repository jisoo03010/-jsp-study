<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="common.css" rel="stylesheet" type="text/css">
</head><script type="text/javascript">
function check_select() {
	var form = document.formss
	if (!form['resvno'].value){
		alert("예약 번호가 입력되지 않았습니다")
		form['resvno'].focus();
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
<h3>접종예약조회</h3>
<br>
<br>
<br>
<br>
	<form action="select.jsp" name="formss">
		<table border="1"> 	
	
			<tr>
				<th>예약번호를 입력하시오.</th>
				<td><input type="text" name="resvno"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="예약조회" onclick="return check_select()" >
					<a href="index.jsp"><input type="reset" value="홈으로"></a>
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