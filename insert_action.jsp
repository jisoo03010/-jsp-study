<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert action</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String std_no = request.getParameter("in_num");
	String std_name = request.getParameter("in_name");
	String std_phone = request.getParameter("in_tel");
	String std_address = request.getParameter("in_address");
	String std_join = request.getParameter("in_birth");
	String std_dem = request.getParameter("in_reward");
	String std_sups = request.getParameter("check_radio");
	
	System.out.println("std_no : " + std_sups);
	
	Connection conn= null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	Class.forName("oracle.jdbc.OracleDriver");
	String url = "jdbc:oracle:thin:@//localhost:1521/xe";
	conn = DriverManager.getConnection(url, "system", "1234");
	
	String sql = "INSERT INTO student_tbl_00 values(?,?,?,?,?,?,?)";
	stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, std_no);
	stmt.setString(2, std_name);
	stmt.setString(3, std_phone);
	stmt.setString(4, std_address);
	stmt.setString(5, std_join);
	stmt.setInt(6, Integer.parseInt(std_dem));
	stmt.setString(7, std_sups);
	
	stmt.executeUpdate();
	
	
	conn.close();
	stmt.close();





%>
</body>
</html>