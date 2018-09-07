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
<div class="container marketing">

      <hr class="featurette-divider">

      <div class="row featurette">
      	  <div class="col-md-12">
    	  	<a href="mainBoardList.do?p=${p }"><button class="btn btn-default">목록</button></a>
    	  	<c:if test="${sessionScope.loginId eq board.writer }">
			<a href="mainModify.do?n=${board.mb_num }"><button class="btn btn-default">글수정</button></a>
			<a href="mainDelete.do?n=${board.mb_num }"><button class="btn btn-default">글삭제</button></a>
			</c:if>
			<a href="mainWriteForm.do?n=${board.mb_num }"><button class="btn btn-default">답글</button></a>
          </div>
          <div class="col-md-12">
          	<p>  </p>
          </div>
          <div class="col-md-12">
          <c:choose>
			<c:when test="${empty board }">
				<script type="text/javascript">
					alert("존재하지 않는 글입니다. 목록으로 돌아갑니다.");
					location.href="mainBoardList.do";
				</script>
			</c:when>
		  <c:otherwise>
          <table class="table">
            <tbody>
			  <tr>
				<td>글번호</td>
				<td>${board.mb_num+1 }</td>
				<td>작성자</td>
				<td>${board.writer }</td>
				<td>작성일시</td>
				<td>${board.write_date }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${board.title }</td>
				<td>조회수</td>
				<td>${board.readcount }</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td colspan="5">${board.content }</td>
			</tr>
			<tr>
				<td></td>
				<td><button class="btn btn-default" id="recommend" onclick="recommend()">↑</button></td>
				<td><label for="recommend" id="mainup"></label></td>
				<td><button class="btn btn-default" id="opposite" onclick="opposite()">↓</button></td>
				<td><label for="opposite" id="maindown"></label></td>
				<td></td>
			</tr>
            </tbody>
          </table>
          </c:otherwise>
		  </c:choose>
    	  </div>
    	  
    	  <div class="col-md-12" id="comment">
      	    <hr>
			<form class="form-inline" name="sendComment" id="sendComment" method="post">
				<input type="hidden" name="mb_num" value="${board.mb_num }">
				<input type="hidden" name="p" value="${p }">
				<div class="form-group">
					<label for="content1">댓글</label>
					<textarea name="content" cols="60%" rows="2" class="form-control" id="content1"></textarea>
				</div>
				<div class="form-group">
					<label for="pass1">비밀번호</label>
					<input type="password" name="comment_pw" size="10" class="form-control" id="pass1"> 
				</div>
				<div class="checkbox">
			    	<label>
			     	 <input type="checkbox" name="secret"> 비밀댓글
			    	</label>
			  	</div>
				<button type="button" class="btn btn-default" id="submit">작성</button>
			</form>
			<hr>
      	  </div>
      	  
      </div>	  

      <hr class="featurette-divider">
   
</div>	
</body>
</html>