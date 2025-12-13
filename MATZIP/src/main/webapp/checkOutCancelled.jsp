<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 취소</title>
</head>
<body>
	
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="mb-4">
      <img src="./resources/menu/OrderCancellation.jpg" class="img-fluid rounded-3" alt="주문 취소 배너" style="width: 100%;">
   </div>
  	
   <div class="row align-items-md-stretch text-center">
		<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
   </div>
   
   <div class="container text-center mt-3">
        <p><a href="./Foods.jsp" class="btn btn-secondary"> &laquo; 메뉴 목록 돌아가기</a></p>
   </div>
	
	<%@ include file="footer.jsp"%>   
  </div>
</body>
</html>