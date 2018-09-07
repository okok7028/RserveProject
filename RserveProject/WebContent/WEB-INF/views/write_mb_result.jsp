<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="nav.jsp"/>
<div class="container marketing">

      <hr class="featurette-divider">

      <div class="row featurette">
          <div class="col-md-12">
          <table class="table">
            	<tr>
					<td>글번호</td>
					<td>${insertedMB.mb_num}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${insertedMB.title}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${insertedMB.writer}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${insertedMB.content}</td>
				</tr>
          </table>
          </div>
          
      </div>

      <hr class="featurette-divider">
</div>	
</body>
</html>