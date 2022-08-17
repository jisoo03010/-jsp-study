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
</head>
<body>
<%

request.setCharacterEncoding("utf-8");
Class.forName("oracle.jdbc.driver.OracleDriver"); //driver

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


Class.forName("oracle.jdbc.OracleDriver");
String url = "jdbc:oracle:thin:@//localhost:1521/xe";
conn = DriverManager.getConnection(url, "system", "1234");


String resvno = request.getParameter("resvno");
String empno = request.getParameter("empno");
String resvdate = request.getParameter("resvdate");
String seatno = request.getParameter("seatno");


System.out.print("resvno=>>>" + resvno);
System.out.print("empno=>>>" + empno);
System.out.print("resvdate=>>>" + resvdate);
System.out.print("seatno=>>>" + seatno);

String sql ="insert into tbl_resv_202108 values(?,?,?,?)";

PreparedStatement stmt = conn.prepareStatement(sql);

stmt.setString(1, resvno);
stmt.setString(2, empno);
stmt.setString(3, resvdate);
stmt.setString(4, seatno);
stmt.executeUpdate();







%>
</body>
</html>