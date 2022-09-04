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

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");


String resvno = request.getParameter("resvno");
String jumin = request.getParameter("jumin");
String vcode = request.getParameter("vcode");
String hospcode = request.getParameter("hospcode");
String resvdate = request.getParameter("resvdate");
String resvtime = request.getParameter("resvtime");

String sql ="insert into TBL_VACCRESV_202108 values(?, ?, ?, ?, ?, ?)";
PreparedStatement stmt = conn.prepareStatement(sql);

stmt.setString(1, resvno);
stmt.setString(2, jumin);
stmt.setString(3, vcode);
stmt.setString(4, hospcode);
stmt.setString(5, resvdate);
stmt.setString(6, resvtime);

stmt.executeQuery();

%>
</body>
</html>