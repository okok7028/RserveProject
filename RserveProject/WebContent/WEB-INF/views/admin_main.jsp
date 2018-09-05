<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="admin_nav.jsp"/>
	
<div class="container marketing">

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-12">
          <h2 class="featurette-heading">예시1 <span class="text-muted">네이버뉴스제목</span></h2>
          <p class="lead">네이버 뉴스 제목으로 워드클라우드 그리기</p>
          <a href="simpleRequestProc.do?code=wcn">간편분석 워드클라우드</a>
        </div>
      </div>

      <hr class="featurette-divider">	
      
      <div class="row featurette">
        <div class="col-md-12">
          <h2 class="featurette-heading">예시2 <span class="text-muted">학교 위치</span></h2>
          <p class="lead">학교 위치 지도</p>
          <a href="simpleRequestProc.do?code=scm">간편 학교 위치</a>
        </div>
      </div>

      <hr class="featurette-divider">
</div>      
</body>
</html>