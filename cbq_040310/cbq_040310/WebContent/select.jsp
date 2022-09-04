<%@page import="java.sql.SQLException"%>
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
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<br>
<br>
<%

try{

	request.setCharacterEncoding("utf-8");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

	
	String resvno = request.getParameter("resvno");
	
	String sql ="select * from TBL_VACCRESV_202108 where resvno = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);

	stmt.setString(1, resvno);
	ResultSet rs = stmt.executeQuery();
	
	if(rs.next()){
%>
<h3>예약번호: <%=resvno %>의 접종예약조회</h3>
	
<br>
<br>

<table border="1">

	<tr>
		<th>예약번호</th>
		<th>주민</th>
		<th>백신코드</th>
		<th>병원코드</th>
		<th>예약날짜</th>
		<th>예약시간</th>
	</tr>
	
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
	</tr>
</table>
<%
	}else{
		response.sendRedirect("Exception.jsp");
	}
}catch(SQLException ex){
	ex.printStackTrace();
}


%>
	
</section>


<%@include file="footer.jsp" %>
</body>
</html>