<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage = "exceptionNoProductId.jsp"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>음식 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
<style>
    .country-badge {
        font-size: 0.6em;
        color: #D9534F;
        border: 1px solid #D9534F;
        padding: 2px 8px;
        border-radius: 10px;
        vertical-align: middle;
        margin-left: 10px;
    }
    .type-badge {
        font-size: 0.6em;
        color: #0d6efd;
        border: 1px solid #0d6efd;
        padding: 2px 8px;
        border-radius: 10px;
        vertical-align: middle;
        margin-left: 5px;
    }
    .sub-title {
        color: #547748; 
        font-weight: bold;
        font-size: 1.2rem;
        margin-top: 20px;
        margin-bottom: 5px;
    }
</style>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="mb-4">
      <img src="./resources/images/FoodInfo.jpg" class="img-fluid rounded-3" alt="음식 정보 배너" style="width: 100%; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
   </div>
   <%@ include file="dbconn.jsp" %>
   <%
		String foodId = request.getParameter("id"); 

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from food where f_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, foodId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>		
	 <div class="row align-items-md-stretch">	 	
	 		<div class="col-md-5">
                <img src="<%=request.getContextPath()%>/resources/images/Food/<%=rs.getString("f_image")%>" style="width: 100%; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
			</div>
			
            <div class="col-md-6">
                <h3>
                    <b><%=rs.getString("f_name")%></b> 
                    <span class="country-badge"><%=rs.getString("f_country")%></span>
                    <span class="type-badge"><%=rs.getString("f_type")%></span>
                </h3>
				
                <p class="text-muted"><%=rs.getString("f_shortDesc")%></p>
                
                <hr>

                <div class="sub-title">[재료]</div>
                <p><%=rs.getString("f_ingredients")%></p>

                <div class="sub-title">[조리 방법]</div>
                <p><%=rs.getString("f_recipe")%></p>
				
                <h3 class="fw-bold mt-4" style="color: #333;"><%=rs.getString("f_price")%>원</h3>
				
				<p class="mt-4">
                <form name="addForm" action="./addCart.jsp?id=<%=rs.getString("f_id")%>" method="post">
                    <a href="#" class="btn btn-lg" style="background-color: #547748; color: white; border: 1px solid #547748;" onclick="addToCart()"> 장바구니 담기 </a> 
				    <a href="./cart.jsp" class="btn btn-lg btn-secondary"> 장바구니 이동 </a>
					<a href="./Foods.jsp" class="btn btn-lg btn-outline-secondary"> 목록으로 </a>
				</form>
			</div>
		</div>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>	
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>