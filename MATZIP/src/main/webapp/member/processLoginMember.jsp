<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page contentType="text/html; charset=utf-8"%>

<% 
    request.setCharacterEncoding("UTF-8"); 
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/MATZIP?serverTimezone=Asia/Seoul&characterEncoding=UTF-8"
	driver="com.mysql.cj.jdbc.Driver" 
	user="MATZIP" 
	password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM member WHERE id=? AND password=?  
   <sql:param value="${param.id}" />
   <sql:param value="${param.password}" />
</sql:query>

<c:set var="isLogin" value="false" />

<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="isLogin" value="true" />
	
	<c:set var="sessionId" value="${row.id}" scope="session" />
	<c:set var="sessionName" value="${row.name}" scope="session" />
</c:forEach>

<c:choose>
	<c:when test="${isLogin == true}">
		<c:redirect url="resultMember.jsp?msg=2" />
	</c:when>
	<c:otherwise>
		<c:redirect url="loginMember.jsp?error=1" />
	</c:otherwise>
</c:choose>