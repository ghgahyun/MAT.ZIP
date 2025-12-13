<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<%

	String sessionId = (String) session.getAttribute("sessionId");

	if (sessionId == null) {
%>
	<script>
		alert("로그인이 필요합니다.");
		location.href = "./member/loginMember.jsp";
	</script>
<%
		return; 
	}
%>

<html>
<head>
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
 <title>음식 편집</title>
 <script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("정말로 이 음식을 삭제하시겠습니까?") == true)
			location.href = "./deleteFood.jsp?id=" + id; 
		else
			return;
	}
 </script>
 <style>
    .food-card {
        background-color: #EEE8DF;
        border-radius: 15px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        padding-bottom: 15px;
        transition: transform 0.2s;
        border: none;
        
        display: flex;
        flex-direction: column;
        height: 100%; 
    }
    .food-card:hover {
        transform: translateY(-5px);
    }
    .food-img {
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        width: 100%;
        height: 250px;
        object-fit: cover;
    }
    .btn-custom {
        width: 150px; 
        border-radius: 20px;
        margin-top: 10px;
    }

    .search-container {
        max-width: 500px;
        margin: 0 auto;
    }
 </style>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="mb-4">
      <img src="./resources/images/FoodEdit.jpg" class="img-fluid rounded-3" alt="음식 편집 배너" style="width: 100%; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
   </div>
   
   <div class="mb-5 text-center search-container">
       <form action="editFood.jsp" method="get" class="d-flex justify-content-center"> 
           <input type="hidden" name="edit" value="<%=edit%>">
           
           <input type="text" name="search" class="form-control me-2" placeholder="음식 이름을 검색해보세요" style="border-radius: 20px;">
           
           <button type="submit" class="btn" style="background-color: #547748; color: white; border-radius: 20px; padding: 0 20px; white-space: nowrap;">검색</button>
       </form>
   </div>
   
   <%@ include file="dbconn.jsp" %>
   
   <div class="row align-items-md-stretch text-center">
	<%
        String searchText = request.getParameter("search");

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "";
   
        if (searchText != null && !searchText.trim().isEmpty()) {
            sql = "select * from food where f_name like ? order by f_name asc";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + searchText + "%");
        } else {
            sql = "select * from food order by f_name asc";
            pstmt = conn.prepareStatement(sql);
        }

        rs = pstmt.executeQuery();

        boolean hasData = false;
        
        while (rs.next()) {
            hasData = true;
	%>
      
     	<div class="col-md-4 mb-5">
       		<div class="h-100 food-card">		
       		    <img src="./resources/images/Food/<%=rs.getString("f_image")%>" class="food-img mb-3" />	
				
				<h4 class="fw-bold"><%=rs.getString("f_name")%></h4>
				
				<p class="text-secondary"><%=rs.getString("f_country")%> | <%=rs.getString("f_type")%></p>
				
				<p class="px-3 text-muted" style="font-size: 0.9rem;"> 
                <%
					String desc = rs.getString("f_shortDesc");
					if (desc != null && desc.length() > 40) {
						out.print(desc.substring(0, 40) + "...");
					} else {
						out.print(desc);
					}
				%>
                </p>
				
				<h5 class="fw-bold mt-3"><%=rs.getString("f_price")%>원</h5>
				
				<div class="mt-auto pb-2 w-100">
				<%
					if (edit != null && edit.equals("update")) {
				%>
					<a href="./updateFood.jsp?id=<%=rs.getString("f_id")%>" class="btn btn-custom" style="background-color: #547748; color: white; border: 1px solid #547748;" role="button"> 수정 &raquo;</a>
				<%
					} else if (edit != null && edit.equals("delete")) {
				%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("f_id")%>')" class="btn btn-danger btn-custom" role="button">삭제 &raquo;</a>
				<%
					}
				%>		
                </div>
			</div>	
		</div>			
		<%
			}
            
      
            if (!hasData) {
        %>
            <div class="col-12" style="padding: 50px 0;">
                <h3 class="text-muted">검색 결과가 없습니다.</h3>
                <a href="editFood.jsp?edit=<%=edit%>" class="btn btn-outline-secondary mt-3">전체 목록 보기</a>
            </div>
        <%
            }
            
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		%>
	
	</div>	
	<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>