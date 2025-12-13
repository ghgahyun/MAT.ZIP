<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%

	String foodId = request.getParameter("id");

	PreparedStatement pstmt = null;	

	String sql = "DELETE FROM food WHERE f_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, foodId);
	pstmt.executeUpdate(); 


	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editFood.jsp?edit=delete");
%>