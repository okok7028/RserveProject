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
      	  <div class="col-md-12" align="right">
    	  	<a href="requestBoardList.do?p=${p }"><button class="btn btn-default">목록</button></a>
    	  	<c:if test="${sessionScope.loginId eq board.writer }">
			<a href="requestModify.do?n=${board.rb_num }"><button class="btn btn-default">글수정</button></a>
			<a href="requestDelete.do?n=${board.rb_num }"><button class="btn btn-default">글삭제</button></a>
			</c:if>
			<a href="requestWriteForm.do?n=${board.rb_num }"><button class="btn btn-default">답글</button></a>
          </div>
          <div class="col-md-12">
          	<p>  </p>
          </div>
          <div class="col-md-12">
          <c:choose>
			<c:when test="${empty board }">
				<script type="text/javascript">
					alert("존재하지 않는 글입니다. 목록으로 돌아갑니다.");
					location.href="requestBoardList.do";
				</script>
			</c:when>
		  <c:otherwise>
          <table class="table">
            <tbody>
			  <tr>
				<td>글번호</td>
				<td>${i }</td>
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
            </tbody>
          </table>
          </c:otherwise>
		  </c:choose>
    	  </div>
      </div>

      <hr class="featurette-divider">
      
</div>	
</body>
</html>