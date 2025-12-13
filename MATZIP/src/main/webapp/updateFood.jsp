<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />

<title>음식 정보 수정</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">음식 정보 수정</h1>
        <p class="col-md-8 fs-4">Food Updating</p>      
      </div>
    </div>
  <%@ include file="dbconn.jsp"%>
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
				<img src="./resources/images/Food/<%=rs.getString("f_image")%>" alt="image" style="width: 100%; border-radius: 10px;" />
		</div>
		<div class="col-md-7">	
		<form name="updateFood" action="./processUpdateBook.jsp" method="post" enctype ="multipart/form-data">
		
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold">음식코드</label>
				<div class="col-sm-5">
					<input type="text" name="foodId" id="foodId" class="form-control" value='<%=rs.getString("f_id")%>' readonly>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold">음식명</label>
				<div class="col-sm-5">
					<input type="text" name="name" id="name" class="form-control" value='<%=rs.getString("f_name")%>'>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold">가격</label>
				<div class="col-sm-5">
					<input type="text" name="unitPrice" id="unitPrice" class="form-control" value='<%=rs.getString("f_price")%>'>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold">나라</label>
				<div class="col-sm-5">
					<input type="text" name="country" class="form-control" value='<%=rs.getString("f_country")%>'>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold">종류</label>
				<div class="col-sm-5">
					<input type="text" name="type" class="form-control" value='<%=rs.getString("f_type")%>'>
				</div>
			</div>
	
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold">짧은 설명</label>
				<div class="col-sm-8">
					<textarea name="description" id="description" cols="50" rows="2"
						class="form-control"><%=rs.getString("f_shortDesc")%></textarea>
				</div>
			</div>			
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold">재료</label>
				<div class="col-sm-8">
					<textarea name="ingredients" cols="50" rows="3" class="form-control"><%=rs.getString("f_ingredients")%></textarea>
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold">조리 방법</label>
				<div class="col-sm-8">
					<textarea name="recipe" cols="50" rows="5" class="form-control"><%=rs.getString("f_recipe")%></textarea>
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold text-danger">알레르기</label>
				<div class="col-sm-5">
					<input type="text" name="allergy" class="form-control" value='<%=rs.getString("f_allergy") != null ? rs.getString("f_allergy") : ""%>'>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold">이미지</label>
				<div class="col-sm-8">
					<input type="file" name="bookImage" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-success" value="수정 완료" >
					<a href="./editFood.jsp?edit=update" class="btn btn-secondary">취소</a>
				</div>
			</div>
		</form>
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
