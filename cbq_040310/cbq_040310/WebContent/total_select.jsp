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
<h3>병원별 접종건수 통계</h3>

<br>
<br>

<table border="1">
	<tr>
		<th>병원코드</th>
		<th>병원명</th>
		<th>접종건수</th>
	</tr><%

try{

	request.setCharacterEncoding("utf-8");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	
	String sql ="select hospcode, hospname, count(hospcode) "+
			"from tbl_hosp_202108 natural join tbl_vaccresv_202108 "+
			"group by hospcode, hospname "+
			"union "+
			"select '' hospcode, '총 누계' hospname, count(hospcode) "+
			"from tbl_hosp_202108 natural join tbl_vaccresv_202108";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	ResultSet rs = stmt.executeQuery();
	while(rs.next()){
%>
	<tr>
		<td><%=rs.getString(1)== null ? "" : rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
	</tr>
<%
	}
}catch(SQLException ex){
	ex.printStackTrace();
}


%>
</table>

	
</section>


<%@include file="footer.jsp" %>
</body>
</html>