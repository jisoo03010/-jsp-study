<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보등록</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<script>
		
	function check(){
		var form = document.forms['in_table'];
		
		if( !form['in_num'].value ){
			alert("학번 미입력.");
			form.in_num.focus();
			return false;
		}else if( !form['in_name'].value){
			alert("이름 미입력.");
			form.in_name.focus();
			return false;
		}else if( !form['in_tel'].value){
			alert("전화번호 미입력.");
			form.in_tel.focus();
			return false;
		}else if( !form['in_address'].value){
			alert("주소 미입력.");
			form.in_address.focus();
			return false;
		}else if( !form['in_birth'].value){
			alert("입학년월일 미입력.");
			form.in_birth.focus();
			return false;
		}else if( !form['in_reward'].value){
			alert("상벌점 미입력.");
			form.in_reward.focus();
			return false;
		}
		else if( !form['check_radio'].value ){
			alert("상벌점 미입력.");
			form.in_reward.focus();
			return false;
		}
		
		let ch = document.querySelector('input[name="check_radio"]:checked').value
		if(ch == "비장학생"){
			form['check_radio'].value = "0"
		}else if(ch == "장학생"){
			form['check_radio'].value = "1"
		}
		return true;
		
	}

	function reset(){
		var form = document.forms['in_table'];
		form.value() = ""
	}


</script>
<body>
<header>
		<h2>유효성검사 연습페이지</h2>
		<nav>
			<ul>
				<li><a href="#">학생정보등록</a></li>
				<li><a href="#">학생정보조회</a></li>
				<li><a href="#">홈으로</a></li>
			</ul>
		</nav>
	</header>
	
	
	
	<section>
	<h3>학생 정보 등록</h3>
		<form method="post" action="insert_action.jsp" name="in_table" onsubmit="return check();">
			<table border="1">
				<tr>
					<td>학번</td>
					<td> <input type="text" name="in_num"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td> <input type="text"name="in_name"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td> <input type="text"name="in_tel"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td> <input type="text"name="in_address"></td>
				</tr>
				<tr>
					<td>입학년월일</td>
					<td> <input type="text"name="in_birth"></td>
				</tr>
				<tr>
					<td>상벌점</td>
					<td> <input type="text"name="in_reward"></td>
				</tr>
				<tr>
					<td>장학여부</td>
					<td>
						 <input type="radio" name="check_radio" value="0">비장학생 <input value="1" type="radio" name="check_radio">장학생
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="등록">
						<input type="button" value="초기화" onclick="reset()">
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	
	<footer> Copyright @ sdhs</footer>

</body>
</html>