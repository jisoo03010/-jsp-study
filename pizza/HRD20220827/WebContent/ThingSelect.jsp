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
<link rel="stylesheet" href="common.css" type="text/css">
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<br>
<br>
<h3>피자전문점 판매관리 프로그램</h3>
<br>
<br>
<br>
<br>
<table border="1">
	<tr>
		<th>피자 코드</th>
		<th>피자 명</th>
		<th>총 매출액</th>
	</tr>
	
	<%
		try{
				
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

			String sql = "select  tp.pcode, tp.pname, to_char(sum(ts.amount*tp.cost) , 'L999,999,999') "+
					"from tbl_salelist_01 ts, tbl_shop_01 tss, tbl_pizza_01 tp "+
					"where ts.scode = tss.scode and tp.pcode =ts.pcode "+
					"group by tp.pcode, tp.pname "+
					"order by to_char(sum(ts.amount*tp.cost) , 'L999,999,999') desc";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			

			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){

	%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
		</tr>
	<%	}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	
	%>
</table>


</section>
<%@include file="footer.jsp" %>
</body>
</html>