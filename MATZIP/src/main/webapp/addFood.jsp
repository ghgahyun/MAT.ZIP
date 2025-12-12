<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/validation.js"></script>

<title>음식 등록</title>
</head>
<body>
<fmt:setLocale value='<%= request.getParameter("language") %>'/>
<fmt:bundle basename="bundle.message" >
<div class="container py-4">
   <%@ include file="menu.jsp"%>	

   <div class="mb-4">
      <img src="./resources/images/FoodAddition.jpg" class="img-fluid rounded-3" alt="음식 등록 배너" style="width: 100%; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
   </div>
   <div class="row align-items-md-stretch">	 	
	  	<div class="text-end mb-3"> <a href="?language=ko" class="btn btn-sm btn-outline-secondary">Korean</a>
            <a href="?language=en" class="btn btn-sm btn-outline-secondary">English</a>
			<a href="logout.jsp" class="btn btn-sm btn-danger pull right ms-2">logout</a>
		</div>	
		
        <form name="newBook" action="./processAddBook.jsp" method="post" enctype ="multipart/form-data">
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="bookId" /></label>
				<div class="col-sm-3">
					<input type="text" name="bookId" id="bookId" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="name" /></label>
				<div class="col-sm-3">
					<input type="text" name="name" id="name" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="unitPrice" /></label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" id="unitPrice" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="author" /></label>
				<div class="col-sm-3">
					<input type="text" name="author" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="publisher" /></label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="releaseDate" /></label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control">
				</div>
			</div>
	
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="description" /></label>
				<div class="col-sm-5">
					<textarea name="description" id="description" cols="50" rows="2"
						class="form-control" placeholder="100자 이상 적어주세요"></textarea>
				</div>
			</div>			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="category" /></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="unitsInStock" /></label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" id="unitsInStock" class="form-control" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="condition" /></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New " checked> <fmt:message key="condition_New" /> 
					<input type="radio" name="condition" value="Old" class="ms-2"> <fmt:message key="condition_Old" /> 
					<input type="radio" name="condition" value="EBook" class="ms-2"> <fmt:message key="condition_Ebook" />
				</div>				
			</div>		
			
			<div class="mb-3 row">
				<label class="col-sm-2 fw-bold"><fmt:message key="bookImage" /></label>
				<div class="col-sm-5">
					<input type="file" name="bookImage" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-success px-4" value="<fmt:message key="button" />" onclick="CheckAddBook()">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</div>	
</fmt:bundle>
</body>
</html>