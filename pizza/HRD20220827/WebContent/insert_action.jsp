<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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

int saleno = Integer.parseInt(request.getParameter("saleno"));
String scode = request.getParameter("scode");
String saledate = request.getParameter("saledate");
String pcode = request.getParameter("pcode");
String amount = request.getParameter("amount");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

String sql = "insert into tbl_salelist_01 values(?, ? , ?, ?, ?)";
PreparedStatement stmt = conn.prepareStatement(sql);

stmt.setInt(1, saleno);
stmt.setString(2,scode);
stmt.setString(3, saledate);
stmt.setString(4, pcode);
stmt.setString(5, amount);


stmt.executeUpdate();

response.sendRedirect("totalSelect.jsp");

%>
</body>
</html>