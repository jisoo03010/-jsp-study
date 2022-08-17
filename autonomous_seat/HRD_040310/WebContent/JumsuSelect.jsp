<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<%@include file="header.jsp"%>
<%@include file="nav.jsp"%>
<section id="section">
<br>
	<h3>좌석예약조회</h3>
	<table border="1">
		<tr>
			<th>사원번호</th>
			<th>이름</th>
			<th>부서명</th>
			<th>근무일수</th>
		</tr>
		<%
		try{
			request.setCharacterEncoding("utf-8");
			
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
			
			String sql = "select tr.empno, tt.empname, decode(tt.deptcode, '10', '영업팀', '20', '총무팀', '30', '구매팀'),  COUNT(*) "+
					"from tbl_tmp_202108 tt, tbl_resv_202108 tr "+
					"where tt.empno = tr.empno  "+
					"group by tr.empno, tt.empname,decode(tt.deptcode, '10', '영업팀', '20', '총무팀', '30', '구매팀') ";
			
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
		</tr>
		<%
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		%>
	</table>
	
	
	
</section>
<%@include file="footer.jsp"%>
</body>
</html>