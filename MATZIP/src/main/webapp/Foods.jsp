<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
 <title>음식 목록</title>
 <style>
    .category-nav a {
        color: #888;
        text-decoration: none;
        font-size: 1.1rem;
        margin: 0 15px;
        padding-bottom: 5px;
        font-weight: bold;
    }
    .category-nav a:hover, .category-nav a.active {
        color: #000;
        border-bottom: 3px solid #000; 
    }

    .food-card {
        background-color: #EEE8DF; 
        border-radius: 15px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        padding-bottom: 15px;
        transition: transform 0.2s;
        border: none;
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

    .pagination {
        display: flex;
        justify-content: center;
        margin-top: 30px;
    }
    .pagination a {
        color: #547748;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
        border: 1px solid #ddd;
        margin: 0 4px;
        border-radius: 5px;
    }
    .pagination a.active {
        background-color: #547748;
        color: white;
        border: 1px solid #547748;
    }
    .pagination a:hover:not(.active) {
        background-color: #ddd;
    }
 </style>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="mb-4">
      <img src="./resources/images/Foods.jpg" class="img-fluid rounded-3" alt="음식 목록 배너" style="width: 100%;">
   </div>

   <%@ include file="dbconn.jsp" %>
   
   <%
        String category = request.getParameter("category");
        if (category == null) category = "All"; 

        int pageNum = 1; 
        if (request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }

        int itemsPerPage = 9; 
        int startRow = (pageNum - 1) * itemsPerPage; 

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int totalItems = 0;
        
        String countSql = "";
        if (category.equals("All")) {
            countSql = "select count(*) from food";
            pstmt = conn.prepareStatement(countSql);
        } else {
            countSql = "select count(*) from food where f_country = ?";
            pstmt = conn.prepareStatement(countSql);
            pstmt.setString(1, category);
        }
        rs = pstmt.executeQuery();
        if (rs.next()) {
            totalItems = rs.getInt(1);
        }
        rs.close();
        pstmt.close();

        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
   %>

   <div class="d-flex justify-content-center mb-5 border-bottom pb-3 category-nav">
       <a href="?category=All&pageNum=1" class="<%= category.equals("All") ? "active" : "" %>">전체</a>
       <a href="?category=한국&pageNum=1" class="<%= category.equals("한국") ? "active" : "" %>">한국</a>
       <a href="?category=일본&pageNum=1" class="<%= category.equals("일본") ? "active" : "" %>">일본</a>
       <a href="?category=중국&pageNum=1" class="<%= category.equals("중국") ? "active" : "" %>">중국</a>
       <a href="?category=스페인&pageNum=1" class="<%= category.equals("스페인") ? "active" : "" %>">스페인</a>
       <a href="?category=이탈리아&pageNum=1" class="<%= category.equals("이탈리아") ? "active" : "" %>">이탈리아</a>
       <a href="?category=프랑스&pageNum=1" class="<%= category.equals("프랑스") ? "active" : "" %>">프랑스</a>
       <a href="?category=터키&pageNum=1" class="<%= category.equals("터키") ? "active" : "" %>">터키</a>
   </div>

   <div class="row align-items-md-stretch text-center">
	<%
        String sql = "";
        if (category.equals("All")) {
            sql = "select * from food order by f_country desc, f_name asc limit ?, ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, itemsPerPage);
        } else {
            sql = "select * from food where f_country = ? order by f_name asc limit ?, ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, category);
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, itemsPerPage);
        }

        rs = pstmt.executeQuery();
        while (rs.next()) {
	%>
      
     	<div class="col-md-4 mb-5">
            <div class="h-100 food-card">		
                <img src="<%=request.getContextPath()%>/resources/images/Food/<%=rs.getString("f_image")%>" class="food-img mb-3" />	
				
                <h4 class="fw-bold"><%=rs.getString("f_name")%></h4>
                
                <p class="px-3 text-muted" style="font-size: 0.9rem;">
                    <%=rs.getString("f_shortDesc")%>
                </p>
				
                <h5 class="fw-bold mt-3"><%=rs.getString("f_price")%>원</h5>
				
                <a href="./Food.jsp?id=<%=rs.getString("f_id")%>" class="btn mt-2" style="background-color: #547748; color: white; border: 1px solid #547748; width: 150px; border-radius: 20px;">
                    상세 정보
                </a>
			</div>	
		</div>			
	<%
		}
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
	%>
	</div>	

    <div class="pagination">
        <%
            int pageBlock = 3; 
            int startPage = ((pageNum - 1) / pageBlock) * pageBlock + 1;
            int endPage = startPage + pageBlock - 1;
            
            if (endPage > totalPages) {
                endPage = totalPages;
            }

            if (startPage > 1) {
        %>
            <a href="?category=<%=category%>&pageNum=<%=startPage - 1%>">&laquo; 이전</a>
        <%
            }

            for (int i = startPage; i <= endPage; i++) {
        %>
            <a href="?category=<%=category%>&pageNum=<%=i%>" class="<%= (i == pageNum) ? "active" : "" %>"><%=i%></a>
        <%
            }

            if (endPage < totalPages) {
        %>
            <a href="?category=<%=category%>&pageNum=<%=endPage + 1%>">다음 &raquo;</a>
        <%
            }
        %>
    </div>

	<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>