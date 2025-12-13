<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	

	String realFolder = "C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\MATZIP\\resources\\images\\Food";
	String encType = "utf-8"; 
	int maxSize = 10 * 1024 * 1024; 
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());


	String foodId = multi.getParameter("foodId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String country = multi.getParameter("country");
	String type = multi.getParameter("type");
	String description = multi.getParameter("description");	
	String ingredients = multi.getParameter("ingredients");
	String recipe = multi.getParameter("recipe");
	String allergy = multi.getParameter("allergy");


	int price;
	if (unitPrice == null || unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);


	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname); 
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

	String sql = "select * from food where f_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, foodId);
	rs = pstmt.executeQuery();	
	
	if (rs.next()) {
	
		if (fileName != null) {
			sql = "UPDATE food SET f_name=?, f_price=?, f_country=?, f_type=?, f_shortDesc=?, f_ingredients=?, f_recipe=?, f_allergy=?, f_image=? WHERE f_id=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, country);
			pstmt.setString(4, type);
			pstmt.setString(5, description);
			pstmt.setString(6, ingredients);
			pstmt.setString(7, recipe);
			pstmt.setString(8, allergy);		
			pstmt.setString(9, fileName); 	
			pstmt.setString(10, foodId); 	
			pstmt.executeUpdate();
			

		} else {
			sql = "UPDATE food SET f_name=?, f_price=?, f_country=?, f_type=?, f_shortDesc=?, f_ingredients=?, f_recipe=?, f_allergy=? WHERE f_id=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, country);
			pstmt.setString(4, type);
			pstmt.setString(5, description);
			pstmt.setString(6, ingredients);
			pstmt.setString(7, recipe);
			pstmt.setString(8, allergy);		
			pstmt.setString(9, foodId);	
			pstmt.executeUpdate();
		}		
	}
	
	if (rs != null) rs.close();
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();


	response.sendRedirect("editFood.jsp?edit=update");
%>
