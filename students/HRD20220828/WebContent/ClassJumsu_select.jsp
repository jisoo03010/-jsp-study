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
			<th>반</th>
			<th>국어평균</th>
			<th>영어평균</th>
			<th>수학평균</th>	
			<th>역사평균</th>
			<th>총점</th>
		</tr>
		
		<%
		try{
			
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

			
			String sql ="select substr(id, 3, 1)||'반',round(avg(korean)),round( avg(english)),round( avg(math)), round(avg(history)) ,sum(korean+ english+ math+history) "+
					"from score_tbl_03 "+
					"group by  substr(id, 3, 1)||'반'  "+
					"order by sum(korean+ english+ math+history) desc";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
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