<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8"%>

<style>
    .custom-nav-link {
        color: #547748 !important;
        font-weight: bold;         
        font-size: 1.1rem;        
        margin-left: 10px;       
        transition: color 0.2s;  
        text-decoration: none;    
    }

    .custom-nav-link:hover, .custom-nav-link:focus {
        color: #e08e58 !important; 
    }
</style>

<header class="pb-3 mb-4 border-bottom">
  <div class="container">  
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">   
      
      <a href="<c:url value="/welcome.jsp"/>" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
         <img src="<c:url value="/resources/images/MATZIP.jpg"/>" alt="맛.ZIP 홈" style="height: 40px; width: auto;">
      </a>
      
      <ul class="nav nav-pills align-items-center"> 
      
      <c:choose>
            <c:when test="${empty sessionId}">
                <li class="nav-item">
                    <a class="nav-link custom-nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link custom-nav-link" href='<c:url value="/member/addMember.jsp"/>'>회원가입</a>
                </li>
            </c:when>
            
            <c:otherwise>
                <li style="color: #e08e58; font-weight: bold; margin-right: 15px; font-size: 1.1rem;">
                    ${sessionName}님
                </li>
                <li class="nav-item">
                    <a class="nav-link custom-nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link custom-nav-link" href="<c:url value="/member/updateMember.jsp"/>">회원수정</a>
                </li>
            </c:otherwise>
      </c:choose>
      
        <li class="nav-item">
            <a href="<c:url value="/Foods.jsp"/>" class="nav-link custom-nav-link">음식목록</a>
        </li>
        <li class ="nav-item">
            <a href = "<c:url value="/addFood.jsp"/>" class = "nav-link custom-nav-link">음식등록</a>
        </li>
        <li class ="nav-item">
            <a href = "<c:url value="/editFood.jsp?edit=update"/>" class = "nav-link custom-nav-link">음식수정</a>
        </li>
        <li class ="nav-item">
            <a href = "<c:url value="/editFood.jsp?edit=delete"/>" class = "nav-link custom-nav-link">음식삭제</a>
        </li>

        <c:if test="${not empty sessionId}">
            <li class="nav-item">
                <a href="<c:url value="/cart.jsp"/>" class="nav-link custom-nav-link">
                    장바구니
                </a>
            </li>
        </c:if>

      </ul> 
    </div>
</div>
</header>