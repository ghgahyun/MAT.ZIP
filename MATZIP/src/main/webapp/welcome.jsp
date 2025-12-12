<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
	<title>Welcome</title>
</head>
<body>
<div class="container py-4">
   <%@ include file="menu.jsp"%>

    <div class="mb-4">
        <img src="./resources/images/welcome.jpg" class="img-fluid rounded-3" alt="맛.ZIP 배너" style="width: 100%;">
    </div>

    <div class="row align-items-md-stretch text-center mb-4">
      
      <div class="col-md-6 mb-3">
        <div class="h-100">
            <a href="./Foods.jsp">
                <img src="./resources/images/FoodListgo.jpg" class="img-fluid rounded-3" alt="바로가기" style="width: 100%; cursor: pointer;">
            </a>
        </div>
      </div>

      <div class="col-md-6 mb-3">
        <div class="h-100">
            <img src="./resources/images/top5.jpg" class="img-fluid rounded-3" alt="TOP5" style="width: 100%;">
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