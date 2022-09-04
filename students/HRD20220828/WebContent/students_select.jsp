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
	<h3>학생조회/수정</h3>
<br>
<br>
<br>
<br>
	<table style="margin: 0 auto;" border="1">
	
		<tr>
			<th>이름</th>
			<th>학년</th>
			<th>반</th>
			<th>번호</th>	
			<th>성별</th>
		</tr>
		
		<%
		try{
			
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

			
			String sql ="select name, substr(id, 1, 1),  substr(id, 2, 2), substr(id, 4, 2), "+
					"decode(substr(gender, 1, 1), '1', '남', '2', '여') "+
					"from member_tbl_03";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				
		%>
		<tr>
			<td><a href="update.jsp?name=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
		</tr>
		<%
			}

		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		
		%>
	</table>

</section>

<%@include file="footer.jsp" %>
</body>
</html>