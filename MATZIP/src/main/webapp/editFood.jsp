<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
 <link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />

<title>음식 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다!!") == true)
			location.href = "./deleteBook.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="mb-4">
      <img src="./resources/images/FoodEdit.jpg" class="img-fluid rounded-3" alt="음식 편집 배너" style="width: 100%;">
   </div>
   <%@ include file="dbconn.jsp" %>
     <div class="row align-items-md-stretch text-center">
	<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from book";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
      
     	<div class="col-md-4 mb-4">
       		<div class="h-100 p-2 round-3">		
       		    <img src="./resources/images/<%=rs.getString("b_filename")%>" style="width: 100%; max-width: 250px; height: 350px; object-fit: cover;" />	
				<p><h5 class="mt-2"><b><%=rs.getString("b_name")%></b></h5>
				<p><%=rs.getString("b_author")%>
				<br> <%=rs.getString("b_publisher")%> | <%=rs.getString("b_releaseDate")%>
				<p> <%=rs.getString("b_description").substring(0,60)%>....
				<p class="fw-bold"><%=rs.getString("b_unitPrice")%>원
				<p><%
						if (edit.equals("update")) {
					%>
					<a href="./updateBook.jsp?id=<%=rs.getString("b_id")%>" class="btn btn-success" role="button"> 수정 &raquo;</a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("b_id")%>')" class="btn btn-danger" role="button">삭제 &raquo;</a>
				
					<%
						}
					%>		
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
