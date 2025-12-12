<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
 <title>음식 목록</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="mb-4">
      <img src="./resources/images/Foods.jpg" class="img-fluid rounded-3" alt="음식 목록 배너" style="width: 100%;">
   </div>
   <%@ include file="dbconn.jsp" %>
     <div class="row align-items-md-stretch text-center">
	<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				// DB에서 데이터를 가져오는 로직은 그대로 유지했습니다.
				String sql = "select * from book";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
      
     	<div class="col-md-4 mb-4"> <div class="h-100 p-2 round-3">		
       		    <img src="./resources/images/<%=rs.getString("b_filename")%>" style="width: 100%; max-width: 250px; height: 350px; object-fit: cover;" />	
				<p><h5 class="mt-2"><b><%=rs.getString("b_name")%></b></h5>
				<p><%=rs.getString("b_author")%>
				<br> <%=rs.getString("b_publisher")%> | <%=rs.getString("b_releaseDate")%>
				<p> <%=rs.getString("b_description").substring(0,60)%>....
				<p class="fw-bold"><%=rs.getString("b_unitPrice")%>원
				<p><a href="./book.jsp?id=<%=rs.getString("b_id")%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
			</div>	
		</div>			
		<%
			}
		%>
	
		</div>	
		<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>
