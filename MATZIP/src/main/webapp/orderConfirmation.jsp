<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Food"%>
<%@ page import="dao.FoodRepository"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();

	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 정보</title>
</head>
<body>

<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="mb-4">
      <img src="./resources/menu/OrderInfo.jpg" class="img-fluid rounded-3" alt="주문 정보 배너" style="width: 100%;">
   </div>
  	
    <div class="row align-items-md-stretch" style="background-color: #EEE8DF; border: 2px solid #547748; border-radius: 15px; padding: 30px;">	 	
		
		<div class="text-center mb-4">
			<h1 style="color: #547748; font-weight: bold;">영수증</h1>
		</div>

		<div class="row justify-content-between mb-3" style="font-size: 1.1rem;">
			<div class="col-6" align="left">
				<strong style="color: #547748;">[배송지 정보]</strong> <br> 
				성명 : <% out.println(shipping_name); %><br> 
				우편번호 : <% 	out.println(shipping_zipCode);%><br> 
				주소 : <%	out.println(shipping_addressName);%>(<%	out.println(shipping_country);%>)<br>
			</div>
			<div class="col-6" align="right">
				<p>	<em>배송 예정일: <span style="color: #d9534f; font-weight: bold;"><% out.println(shipping_shippingDate); %></span></em>
			</div>
		</div>
		
		<div class="py-3" style="background-color: white; border-radius: 10px; padding: 20px;">
			<table class="table table-hover">			
			<tr>
				<th class="text-center">음식</th> 
				<th class="text-center">수량</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>
			<%
				int sum = 0;

				ArrayList<Food> cartList = (ArrayList<Food>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Food>();
				
				for (int i = 0; i < cartList.size(); i++) { 
					Food food = cartList.get(i); 
					int total = food.getUnitPrice() * food.getQuantity();
					sum = sum + total;
			%>
			<tr>
				<td class="text-center"><em><%=food.getName()%> </em></td>
				<td class="text-center"><%=food.getQuantity()%></td>
				<td class="text-center"><%=food.getUnitPrice()%>원</td>
				<td class="text-center"><%=total%>원</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right" style="font-size: 1.2rem;"> <strong>총액: </strong></td>
				<td class="text-center" style="color: #d9534f; font-size: 1.2rem;"><strong><%=sum%>원 </strong></td>
			</tr>
			</table>
			
			<div class="text-center mt-4">
				<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary" role="button"> 이전 </a>
				<a href="./thankCustomer.jsp"  class="btn btn-success" style="background-color: #547748; border: 1px solid #547748;" role="button"> 주문 완료 </a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button"> 취소 </a>			
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</div>		
</body>
</html>
