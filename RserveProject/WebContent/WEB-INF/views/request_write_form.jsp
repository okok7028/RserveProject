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
	<jsp:include page="nav.jsp"/>
<div class="container marketing">

      <hr class="featurette-divider">

      <div class="row featurette">
          <div class="col-md-12">
          <div class="row">
		  <form class="form-horizontal" action="writeRB.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${num }">
			<input type="hidden" name="rb_ref" value="${rb_ref }">
			<input type="hidden" name="rb_seq" value="${rb_seq }">
			<input type="hidden" name="rb_level" value="${rb_level }">
			<input type="hidden" name="writer" value="${writer }">
			<div class="form-group">
				<label for="title" class="col-sm-3 control-label">제목</label>
			    <div class="col-sm-8">
			    <c:if test="${num eq 0 }">
			      <input type="text" class="form-control" id="title" name="title" size="50">
			    </c:if>
			    <c:if test="${num ne 0 }">
			      <input type="text" class="form-control" id="title" name="title" size="50" value="[답글]">
			    </c:if>   
			    </div>   
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-3 control-label">작성자</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="writer" value="${sessionScope.loginId }" disabled="disabled">
			    </div>
			</div>
			<div class="form-group">
				<label for="file" class="col-sm-3 control-label">파일</label>
			    <div class="col-sm-8">
			      <input type="file" class="form-control" id="file" name="file" >
			    </div>
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-3 control-label">내용</label>
			    <div class="col-sm-8">
			      <textarea rows="10" cols="90%" name="content" id="content"></textarea>
			    </div>   
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-3 col-sm-8">
			      <button type="submit" class="btn btn-default">글작성</button>
			    </div>  
			</div>
		</form>
  	  </div>	
    	  </div>
      </div>

      <hr class="featurette-divider">
      
</div>	
	<jsp:include page="foot.jsp"/>
</body>
</html>