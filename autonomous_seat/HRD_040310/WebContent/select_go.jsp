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
<%@include file="header.jsp"%>
<%@include file="nav.jsp"%>
<section id="section">
	<%
	String empno1 = request.getParameter("empno");
	%>
	<br>
		<h3>
			사원번호 : <%=empno1 %>님의 좌석예약조회
		</h3>
		<table border="1">
			<tr>
				<th>사원번호</th>
				<th>이름</th>
				<th>근무일자</th>
				<th>좌석번호</th>
				<th>좌석위치</th>
				<th>내선번호</th>
			</tr>
	
				<%
					try{
						request.setCharacterEncoding("utf-8");
						String empno = request.getParameter("empno");
						
						Class.forName("oracle.jdbc.OracleDriver");
						Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
						
						String sql = "select tt.empno, tt.empname, tr.resvdate, tr.seatno , ts.office, ts.callno "+
								 	"from tbl_tmp_202108 tt,tbl_seat_202108 ts, tbl_resv_202108 tr "+
									"where tt.empno = tr.empno and tr.empno = ?";
						PreparedStatement stmt = conn.prepareStatement(sql);
						
						stmt.setString(1, empno);
						ResultSet rs = stmt.executeQuery();
						

						System.out.println("rs=>>" + rs);
						if(rs.next()){
								do{
					%>
									

									<tr>
										<th><%=rs.getString(1) %></th>
										<th><%=rs.getString(2) %></th>
										<th><%=rs.getString(3) %></th>
										<th><%=rs.getString(4) %></th>
										<th><%=rs.getString(5) %></th>
										<th><%=rs.getString(6) %></th>
									</tr>
			<% 						
			}while(rs.next());%>


			<% 	}else{%>
		
						<h1>접종예약정보가 존재하지 않습니다.</h1>
						
						<a href="MemberSelect.jsp"><input type="button" value="돌아가기"></a>
		
					

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