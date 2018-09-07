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
          <div align="right">
          <a href="requestWriteForm.do"><button class="btn btn-default" id="ban_btn">글쓰기</button></a>
          </div>
          <table class="table">
            <thead>
              <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
              </tr>
            </thead>
            <tbody>
            <c:if test="${empty boardPage.requestboardList }">
			<tr>
				<td colspan="5">아직 작성된 글이 없습니다.</td>
			</tr>
			</c:if>
			<c:if test="${not empty boardPage.requestboardList }">
			<c:set var="number" value="${boardPage.number }"/>
			<c:forEach items="${boardPage.requestboardList }" var="b" varStatus="i">
				<tr>
					<td>${number-i.index }</td>
					<td>
					<c:if test="${b.rb_level gt 0 }">
						<c:set var="wid" value="${b.rb_level*5 }"/>
						<img src="resource/img/level.gif" width="${wid }">
						<img src="resource/img/re.gif">
					</c:if>
					<a href="readRB.do?n=${b.rb_num }&p=${boardPage.currentPage}&i=${number-i.index }">${b.title }</a>
					<c:if test="${b.readcount ge 20 }">
					<img alt="" src="resource/img/hot.gif"  border="0">
					</c:if>
					</td>
					<td>${b.writer }</td>
					<td>${b.write_date }</td>
					<td>${b.readcount }</td>
				</tr>
			</c:forEach>
		</c:if>
            </tbody>
          </table>
          
          <nav>
          	  <div align="center">
			  <ul class="pagination">
			    <c:if test="${boardPage.startPage gt 1 }">
			    <li>
			      <a href="requestBoardList.do?p=${boardPage.startPage-1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    </c:if>
			    <c:forEach begin="${boardPage.startPage }" end="${boardPage.endPage }" var="i">
			    <li><a href="requestBoardList.do?p=${i }">[${i }]</a></li>
			    </c:forEach>
			    <c:if test="${boardPage.endPage lt boardPage.totalPage }">
			    <li>
			      <a href="requestBoardList.do?p=${boardPage.endPage+1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			    </c:if>
			    
			  </ul>
			  </div>
			</nav>
          
        </div>
    
      </div>

      <hr class="featurette-divider">
      
</div>
	<jsp:include page="foot.jsp"/>
</body>
</html>