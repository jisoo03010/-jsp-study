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
</head>
<body>
<%

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String gender = request.getParameter("gender");


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

String sql ="insert into member_tbl_03 values(?, ?, ?)";
PreparedStatement stmt = conn.prepareStatement(sql);


stmt.setString(1, id);
stmt.setString(2, name);
stmt.setString(3, gender);

stmt.executeQuery();

response.sendRedirect("students_select.jsp");

%>
</body>
</html>