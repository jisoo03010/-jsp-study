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
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>

<section>
<br>
<br>
	<h3>학생수정</h3>
<br>
<br>
<br>
<br>
<form action="update_action.jsp" >
	<table style="margin: 0 auto;">
	<%
	try{

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String name = request.getParameter("name");
		
		String sql ="select * from member_tbl_03 where name=?";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, name);
		
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()){
			
	%>
		<tr>
			<th>학번</th>
			<td><input type="text" name="id" value="<%=rs.getString(1)%>"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="<%=rs.getString(2) %>"></td>
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
	<%

		}
	}catch(Exception ex){
		ex.printStackTrace();
	}
	
	%>
	</table>
</form>

</section>

<%@include file="footer.jsp" %>
</body>
</html>