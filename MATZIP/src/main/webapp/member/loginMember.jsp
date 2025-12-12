<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>Login</title>
</head>
<body>

<div class="container py-4">
   <jsp:include page="/menu.jsp" />

    <div class="mb-4">
        <img src="../resources/images/MembershipLogin.jpg" class="img-fluid rounded-3" alt="로그인 배너" style="width: 100%; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
    </div>
    <div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading mb-4">다양한 음식을 즐겨보세요!</h3>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
  			<form class="form-signin" action="processLoginMember.jsp" method="post">
  
    			<div class="form-floating mb-3 row">     
      				<input type="text" class="form-control" name='id' id="floatingInput" placeholder="ID" required autofocus>
      				<label for="floatingInput">아이디</label>      
    			</div>
    			<div class="form-floating mb-3 row">     
     	 			<input type="password" class="form-control" name='password' placeholder="Password">
    				 <label for="floatingPassword">비밀번호 </label>
			    </div>

                <button class="btn btn-lg w-100" type="submit" style="background-color: #547748; color: white; border: 1px solid #547748;">로그인</button>
   				
  			</form>

		</div>
	</div>

    <jsp:include page="/footer.jsp" />  
  </div>	
  </body>			
</html>