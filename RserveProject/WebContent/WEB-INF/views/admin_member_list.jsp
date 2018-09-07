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
	<jsp:include page="admin_nav.jsp"/>
<div class="container marketing">

      <hr class="featurette-divider">

      <div class="row featurette">
          <div class="col-md-12">
          <table class="table">
            <thead>
              <tr>
                <th>#</th>
                <th>아이디</th>
                <th>이름</th>
                <th>회원등급</th>
                <th>가입일</th>
                <th>관리하기</th>
              </tr>
            </thead>
            <tbody>
           	<c:if test="${empty memberPage.memberList }">
			  <tr>
				<td colspan="6">no lists</td>
		      </tr>
			</c:if>
			<c:if test="${not empty memberPage.memberList }">
			  <c:set var="number" value="${memberPage.number }"/>
		      <c:forEach items="${memberPage.memberList }" var="m" varStatus="i">
				<tr>
				  <td>${number+i.index }</td>
				  <td>${m.id }</td>
				  <td>${m.name }</td>
		    	  <c:if test="${m.flag_admin eq 'm'}"><td>일반회원</td></c:if>
				  <c:if test="${m.flag_admin eq 'radmin'}"><td>관리자</td></c:if>
				  <c:if test="${m.flag_admin eq 'mb'}"><td>이용정지</td></c:if>
				  <td>${m.regist_date }</td>
				  <td>
					<form class="form-horizontal" action="adminMemberInfo.do" method="post">
						<input type="hidden" name="id" value="${m.id }">
						<div class="form-group">
						    <div class="col-sm-offset-3 col-sm-8">
						      <button type="submit" class="btn btn-default">관리</button>
						    </div>  
						</div>
					</form>
				  </td>
			   </tr>
		      </c:forEach>
			</c:if>	
            </tbody>
          </table>
        
    		
          	<nav>
          	  <div align="center">
			  <ul class="pagination">
			    <c:if test="${memberPage.startPage gt 1 }">
			    <li>
			      <a href="adminMemberList.do?p=${memberPage.startPage-1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    </c:if>
			    <c:forEach begin="${memberPage.startPage }" end="${memberPage.endPage }" var="i">
			    <li><a href="adminMemberList.do?p=${i }">[${i }]</a></li>
			    </c:forEach>
			    <c:if test="${memberPage.endPage lt memberPage.totalPageCount }">
			    <li>
			      <a href="adminMemberList.do?p=${memberPage.endPage+1 }" aria-label="Next">
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
</body>
</html>