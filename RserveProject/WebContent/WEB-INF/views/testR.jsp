<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="admin_nav.jsp"/>
<div align="center">
	<c:if test="${str eq 'success'}">
		작업 완료!!
	</c:if>
	<c:if test="${str eq 'fail'}">
		작업 실패xxxxxxx
	</c:if>
	<c:if test="${str eq 'empty1'}">
		요청이 없음??
	</c:if>
</div>	
</body>
</html>