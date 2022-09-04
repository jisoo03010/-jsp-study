<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="common.css" type="text/css">
</head>
<script type="text/javascript">
function check(){
	var form = document.formsk
	
	if(!form['saleno'].value){
		alert("매출전표번호가 입력되지 않았습니다!");
		form['saleno'].focus();
		return false;
		
	}else if(!form['scode'].value){
		alert("지점코드가 입력되지 않았습니다!");
		form['scode'].focus();
		return false;
		
	}else if(!form['saledate'].value){
		alert("판매일자가 입력되지 않았습니다!");
		form['saledate'].focus();
		return false;
		
	}else if(!form['pcode'].value){
		alert("피자코드가 입력되지 않았습니다!");
		form['pcode'].focus();
		return false;
		
	}else if(!form['amount'].value){
		alert("판매수량이 입력되지 않았습니다!");
		form['amount'].focus();
		return false;
		
	}

	alert("매출전표가 정상적으로 등록 되었습니다.");
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
<br>
<h3>매출전표등록</h3>
<br>
<br>
<br>
<br>
<form action="insert_action.jsp" name="formsk">
	<table border="1">
		<tr>
			<th>매출전표번호</th>
			<td><input type="text" name="saleno"></td>
		</tr>
		
		<tr>
			<th>지점코드</th>
			<td><input type="text" name="scode"></td>
		</tr>
		
		<tr>
			<th>판매일자</th>
			<td><input type="text" name="saledate"></td>
		</tr>
		
		<tr>
			<th>피자코드</th>
			<td>
				<select name="pcode">
					<option value="AA01">[AA01] 고르골졸라피자</option>
					<option value="AA02">[AA02] 치즈피자</option>
					<option value="AA03">[AA03] 페퍼로니피자</option>
					<option value="AA04">[AA04] 콤비네이션피자</option>
					<option value="AA05">[AA05] 고구마피자</option>
					<option value="AA06">[AA06] 포테이토피자</option>
					<option value="AA07">[AA07] 불고기피자</option>
					<option value="AA08">[AA08] 나폴리파자</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>판매수량</th>
			<td><input type="text" name="amount"></td>
		</tr>
		
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="submit" value="전표등록"  onclick="return check();">
				<input type="reset" value="다시쓰기">
			</td>
		</tr>
		
	</table>
</form>





</section>
<%@include file="footer.jsp" %>
</body>
</html>