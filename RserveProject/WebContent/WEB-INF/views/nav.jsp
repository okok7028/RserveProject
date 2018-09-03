<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse">
          <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>	
              <a class="navbar-brand" href="#">RProject</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="main.do">Home</a></li>
                <li><a href="#">메뉴1</a></li>
                <li><a href="#">메뉴2</a></li>
                <c:if test="${not empty sessionScope.loginId}">
                <li><a href="simpleForm.do">간편분석</a></li>
                <li><a href="myRequest.do">나의요청</a></li>
                </c:if>
              </ul>
              <ul class="nav navbar-nav navbar-right">
              <c:choose>
              <c:when test="${empty sessionScope.loginId}">
              	<li><a href="joinForm.do">회원가입</a></li>
              	<li><a href="loginForm.do">로그인</a></li>
              </c:when>
              <c:otherwise>
              	<li><a href="checkPassword.do">${sessionScope.loginId}</a></li>
              	<li><a href="logout.do">로그아웃</a></li>
              </c:otherwise>	
              </c:choose>	
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>
</body>
</html>