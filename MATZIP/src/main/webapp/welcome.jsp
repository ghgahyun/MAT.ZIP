<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>

<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
	<title>Welcome</title>
    <style>
        .recommend-box {
            border: 3.5px solid black;
            border-radius: 10px;
            padding: 25px;
            height: 98%;
            display: flex;
            flex-direction: column;
            background-color: white;
        }
        
    
        .reco-title {
            font-size: 2.0rem; 
            font-weight: 900; 
            margin-bottom: 20px; 
            color: #333;
        }
        
        .food-title {
            font-size: 1.5rem;
            font-weight: bold;
        }
        
        .food-country {
            font-size: 0.9rem;
            color: #D9534F;
            font-weight: bold;
            margin-left: 5px;
        }
    </style>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>

    <div class="mb-4">
        <img src="./resources/images/welcome.jpg" class="img-fluid rounded-3" alt="맛.ZIP 배너" style="width: 100%;">
    </div>

    <%@ include file="dbconn.jsp" %>

    <div class="row align-items-md-stretch text-center mb-4">
      
      <div class="col-md-6 mb-3">
        <div class="h-100">
            <a href="./Foods.jsp">
                <img src="./resources/images/FoodListgo.jpg" class="img-fluid rounded-3" alt="바로가기" style="width: 100%; height: 100%; object-fit: cover; cursor: pointer;">
            </a>
        </div>
      </div>

      <div class="col-md-6 mb-3">
        <div class="recommend-box">
            <div class="reco-title">맛.ZIP의 추천 음식</div>
            
            <%
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                String sql = "select * from food order by rand() limit 1";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                
                if (rs.next()) {
            %>
            <div class="row align-items-center mt-3">
                <div class="col-5">
                    <img src="<%=request.getContextPath()%>/resources/images/Food/<%=rs.getString("f_image")%>" class="img-fluid rounded-3" style="width: 100%; height: 130px; object-fit: cover; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
                </div>
                
                <div class="col-7 text-start">
                    <div class="mb-2">
                        <span class="food-title"><%=rs.getString("f_name")%></span>
                        <span class="food-country"><%=rs.getString("f_country")%></span>
                    </div>
                    <p class="text-muted" style="font-size: 0.95rem; margin: 0; line-height: 1.4;">
                        <%=rs.getString("f_shortDesc")%>
                    </p>
                </div>
            </div>
            <%
                }
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            %>
        </div>
      </div>
      
 	</div> 

    <div class="text-center">
        <h3 class="mt-4">Welcome to MAT.ZIP!!</h3>
        <%
            Date day = new java.util.Date();
            String am_pm;
            int hour = day.getHours();
            int minute = day.getMinutes();
            int second = day.getSeconds();
            if (hour / 12 == 0) {
                am_pm = "AM";
            } else {
                am_pm = "PM";
                hour = hour - 12;
            }
            String CT = hour + ":" + minute + ":" + second + " " + am_pm;
            out.println("<p>현재 접속 시각: " + CT + "</p>");
        %>
    </div>
	
	<%@ include file="footer.jsp"%>
   
  </div>
</body>
</html>