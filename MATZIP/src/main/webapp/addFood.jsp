<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>음식 등록</title>
</head>
<body>

<fmt:setLocale value='<%= request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message">

<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="mb-4">
      <img src="./resources/images/FoodAddition.jpg" class="img-fluid rounded-3" alt="음식 등록 배너" style="width: 100%; box-shadow: 0 4px 6px rgba(0 0 0 / 10%);">
   </div>
   
   <div class="row align-items-md-stretch">	 	
	  	<div class="text-end mb-3"> 
            <a href="?language=ko" class="btn btn-sm btn-outline-secondary">Korean</a>
            <a href="?language=en" class="btn btn-sm btn-outline-secondary">English</a>
            <a href="member/logoutMember.jsp" class="btn btn-sm btn-danger pull right ms-2">logout</a>
		</div>	
		
        <form name="newFood" action="./processAddFood.jsp" method="post" enctype ="multipart/form-data">
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="code"/></label>
				<div class="col-sm-3">
					<input type="text" name="foodId" id="foodId" class="form-control" placeholder="<fmt:message key='msgCode'/>" >
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="name"/></label>
				<div class="col-sm-3">
					<input type="text" name="name" id="name" class="form-control" placeholder="<fmt:message key='msgName'/>" >
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="price"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" id="unitPrice" class="form-control" placeholder="<fmt:message key='msgPrice'/>" >
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="country"/></label>
				<div class="col-sm-3">
					<input type="text" name="country" class="form-control" placeholder="<fmt:message key='msgCountry'/>">
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="type"/></label>
				<div class="col-sm-3">
					<input type="text" name="type" class="form-control" placeholder="<fmt:message key='msgType'/>">
				</div>
			</div>
	
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="desc"/></label>
				<div class="col-sm-5">
					<textarea name="description" id="description" cols="50" rows="2"
						class="form-control" placeholder="<fmt:message key='msgDesc'/>"></textarea>
				</div>
			</div>			
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="ingredients"/></label>
				<div class="col-sm-5">
					<textarea name="ingredients" cols="50" rows="2"
						class="form-control" placeholder="<fmt:message key='msgIng'/>"></textarea>
				</div>
			</div>

            <div class="mb-3 row">
				<label class="col-sm-2 fw-bold text-danger"><fmt:message key="allergy"/></label>
				<div class="col-sm-5">
					<input type="text" name="allergy" class="form-control" placeholder="<fmt:message key='msgAllergy'/>">
				</div>
			</div>

            <div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="recipe"/></label>
				<div class="col-sm-8">
					<textarea name="recipe" cols="50" rows="5"
						class="form-control" placeholder="<fmt:message key='msgRecipe'/>"></textarea>
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="image"/></label>
				<div class="col-sm-5">
					<input type="file" name="foodImage" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" 
                           class="btn btn-primary px-4" 
                           value="<fmt:message key='btnAdd'/>"
                           onclick="return CheckAddFood()"> </div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</div>	
</fmt:bundle>
</body>
</html>