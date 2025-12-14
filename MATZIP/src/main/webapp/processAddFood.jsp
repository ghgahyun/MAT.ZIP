<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String savePath = "/resources/images/Food";
	String realFolder = request.getServletContext().getRealPath(savePath);
	String encType = "utf-8";
	int maxSize = 10 * 1024 * 1024; 
	

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String f_id = multi.getParameter("foodId");
	String f_name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String f_country = multi.getParameter("country");
	String f_type = multi.getParameter("type");
	String f_shortDesc = multi.getParameter("description");
	String f_ingredients = multi.getParameter("ingredients");
	String f_recipe = multi.getParameter("recipe");
	String f_allergy = multi.getParameter("allergy");


	int price;
	if (unitPrice == null || unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);


	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;	
	
	
	String sql = "insert into food values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, f_id);
	pstmt.setString(2, f_name);
	pstmt.setInt(3, price);
	pstmt.setString(4, f_country);
	pstmt.setString(5, f_type);
	pstmt.setString(6, f_shortDesc);
	pstmt.setString(7, f_ingredients);
	pstmt.setString(8, f_recipe);
	pstmt.setString(9, f_allergy); 
	pstmt.setString(10, fileName); 
	
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	

	response.sendRedirect("Foods.jsp");
%>