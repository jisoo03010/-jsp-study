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
<%
request.setCharacterEncoding("utf-8");

String empno = request.getParameter("empno");


%>

<h3>사원번호 : <%=empno %>님의 좌석예약 조회</h3>
	<table border="1">

		<tr>
			<td>사원번호</td>
			<td>이름</td>
			<td>근무일자</td>
			<td>좌석번호</td>
			<td>좌석위치</td>
			<td>내선번호</td>
		</tr>	
	<%
	try{
		
		request.setCharacterEncoding("utf-8");

		String empndo = request.getParameter("empno");
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

		
		String sql="select tt.empno, tt.empname, tr.resvdate, tr.seatno, ts.office,ts.calno "+
				"from TBL_resv_202108 tr ,TBL_TMP_202108 tt, TBL_seat_202108 ts "+
				"where tr.seatno = ts.seatno and tt.empno = tr.empno and empno = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, empndo);
		
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
	<a href="select.jsp"><input type="button" value="돌아가기"></a>
</section>
<%@include file="footer.jsp" %>
</body>
</html>