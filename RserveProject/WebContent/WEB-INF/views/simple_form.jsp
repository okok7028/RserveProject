<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
var wordcloudCheck = {
		"keywordCheck" : false,
		"filenameCheck" : false,
	}
	
$(function() {
	$("form[id='wordcloud']").submit(function() {
		
		if($("input[name='keyword']").val() == ""){
			alert("검색어 입력하세요.");
			$("input[name='keyword']").focus();
			return false; 
		}else{
			wordcloudCheck["keywordCheck"]=true;
		}
		if($("input[name='filename']").val()==""){
			alert("파일이름 입력");
			$("input[name='filename']").focus();
			return false;
		}else{
			wordcloudCheck["filenameCheck"]=true;
		}
		if(wordcloudCheck["keywordCheck"]&&wordcloudCheck["filenameCheck"]){
			return true;
		}else{
			alert("작성내용을 다시 확인해주세요.");
		}
	})
})
</script>
</head>
<body>
<jsp:include page="nav.jsp"/>
    
    <div class="container marketing">

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-9">
        <h2 class="featurette-heading">WordCloud <span class="text-muted">Naver News Title</span></h2>
        <form class="form-horizontal" action="simpleRequestWcnews.do" method="post" id="wordcloud">
        	<input type="hidden" name="codeprefix" value="wcn">
        	<input type="hidden" name="id" value="${sessionScope.loginId }">
			<div class="form-group">
				<label for="inputKeyword" class="col-sm-3 control-label">검색어</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="inputKeyword" placeholder="news"
			      name="keyword">
			    </div>
			</div>
			<div class="form-group">
				<label for="inputFilename" class="col-sm-3 control-label">파일이름</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="inputFilename" placeholder="filename"
			      name="filename">
			    </div>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-3 col-sm-8">
			      <button type="submit" class="btn btn-default">요청</button>
			    </div>  
			</div>
		</form>
        </div>
        <div class="col-md-3">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="500X500"
          src="resource/img/ai.png">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-8 col-md-push-3">
          <h2 class="featurette-heading">위치지도 <span class="text-muted">학교 위치 지도</span></h2>
        <form class="form-horizontal" action="simpleRequestWcnews.do" method="post" id="schoolmap">
        	<input type="hidden" name="codeprefix" value="scm">
        	<input type="hidden" name="id" value="${sessionScope.loginId }">
			<div class="form-group">
				<label for="inputKeyword" class="col-sm-3 control-label">지역명</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="inputKeyword" placeholder="지역명"
			      name="keyword">
			    </div>
			</div>
			<div class="form-group">
				<label for="inputFilename" class="col-sm-3 control-label">파일이름</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="inputFilename" placeholder="filename"
			      name="filename">
			    </div>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-3 col-sm-8">
			      <button type="submit" class="btn btn-default">요청</button>
			    </div>  
			</div>
		</form>
        </div>
        <div class="col-md-3 col-md-pull-8">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image"
          src="resource/img/web1.png">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">예시3 <span class="text-muted">Checkmate.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image"
          src="resource/img/test22.png">
		  <p align="center"><a class="btn btn-default" href="#" role="button">해당글3  &raquo;</a></p>
        </div>
      </div>

      <hr class="featurette-divider">


    </div>
    
    <jsp:include page="foot.jsp"/>
</body>
</html>