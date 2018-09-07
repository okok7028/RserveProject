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
        <div class="col-md-7">
          <h2 class="featurette-heading">간편분석 1 <span class="text-muted">워드클라우드</span></h2>
          <p class="lead"> <br>1. 검색하고 싶은 뉴스 키워드 입력<br>
          2. 저장할 파일 이름 입력<br>
          3. 간편요청<br>
          4. 네이버에서 키워드로 검색<br>
          5. 1-50페이지의 뉴스 제목을 크롤링<br>
          6. 2글자 이상의 명사만 마이닝<br>
          7. 빈도수에 따른 워드클라우드 파일 완성</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="500X500"
          src="resource/img/webtoon.png">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading">간편분석 2 <span class="text-muted">학교 분포 지도</span></h2>
          <p class="lead"> <br>1. 원하는 지역명 입력<br>
          2. 지역명은 행정구역명으로 정확히 표기<br>
          3. 추가적인 지역명 입력시 공백으로 구분<br>
          4. 예시) 서울특별시<br>
          5. 예시) 서울특별시 강남구<br>
          6. 간편요청<br>
          7. 지역에 해당하는 초중고등학교 위치 표시 <br>
          8. 초등학교(파랑) / 중학교(빨강) / 고등학교(초록)</p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image"
          src="resource/img/seoul.png">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading"> 분석요청 <span class="text-muted">원하는 분석</span></h2>
          <p class="lead">구체적인 요구사항이나 정밀한 분석이 필요하면 분석요청게시판에서 신청해주세요</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image"
          src="resource/img/test22.png">
        </div>
      </div>

      <hr class="featurette-divider">


    </div>
</body>
</html>