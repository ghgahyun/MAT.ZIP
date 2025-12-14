<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page contentType="text/html; charset=utf-8"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/MATZIP"
	driver="com.mysql.jdbc.Driver" user="MATZIP" password="1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM member WHERE id = ?
   <sql:param value="<%=sessionId%>" />
</sql:update>

<c:if test="${resultSet >= 1}">
    <c:import url="logoutMember.jsp" /> 
    
    <script>
        location.href = "../welcome.jsp"; 
    </script>
</c:if>

<c:if test="${resultSet < 1}">
    <script>
        alert("회원 탈퇴에 실패했습니다. 다시 시도해 주세요.");
        history.back(); 
    </script>
</c:if>