<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Food"%>
<%@ page import="dao.FoodRepository"%>
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("Foods.jsp");
		return;
	}

	FoodRepository dao = FoodRepository.getInstance();
	
	Food food = dao.getFoodById(id); 
	if (food == null) {
		response.sendRedirect("exceptionNoFoodId.jsp"); 
	}

	ArrayList<Food> cartList = (ArrayList<Food>) session.getAttribute("cartlist");
	
	if (cartList != null) {
		for (int i = 0; i < cartList.size(); i++) { 
			Food goodsQnt = cartList.get(i); 
			if (goodsQnt.getFoodId().equals(id)) {
				cartList.remove(goodsQnt); 
				break; 
			}
		}
	}

	response.sendRedirect("cart.jsp"); 
%>