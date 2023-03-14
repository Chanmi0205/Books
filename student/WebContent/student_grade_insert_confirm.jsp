<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<meta charset="UTF-8">

<%
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String id = request.getParameter("id");
	String korean = request.getParameter("korean");
	String math = request.getParameter("math");
	String english = request.getParameter("english");
	String history = request.getParameter("history");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_ID = "chanmi";
	String pwd = "1234";
	
	Class.forName("Oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, DB_ID, pwd);
	
	String sql = "INSERT INTO score_tbl(ID, korean, math, english, history) VALUES(?, ?, ?, ?, ?)";

	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, korean);
	pstmt.setString(3, math);
	pstmt.setString(4, english);
	pstmt.setString(5, history);
	
	pstmt.executeUpdate(sql);
	// response.setDateHeader(name, date)("index.jsp?section=student_grade_insert");
	// response.set
%>