<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>회원 정보</title>
</head>
<body>

<div class="container py-4">
   <jsp:include page="/menu.jsp" />

 <div class="mb-4">
      <img src="../resources/images/MembershipInfo.jpg" class="img-fluid rounded-3" alt="회원 정보/가입 배너" style="width: 100%; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
   </div>
    
	
	<div class="row align-items-md-stretch text-center">
		<%
			String msg = request.getParameter("msg");
            if(msg == null) msg = "";

			if (msg != null && !msg.isEmpty()) {
				if (msg.equals("0"))
					out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
				else if (msg.equals("1"))
					out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
				else if (msg.equals("2")) {

					String loginName = (String) session.getAttribute("sessionName");
                    

                    if (loginName == null) loginName = "";
                    
					out.println(" <h2 class='alert alert-success'>" + loginName + "님 환영합니다!</h2>");
				}				
			} else {
				out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
			}
		%>
	</div>	
    
    <jsp:include page="/footer.jsp" />
</div>	
</body>
</html>