<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>   
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
            <thead>
              <tr>
                <th>#</th>
                <th>작업종류</th>
                <th>검색어</th>
                <th>처리상태</th>
              </tr>
            </thead>
            <tbody>
            <c:if test="${empty RequestList }">
			<tr>
				<td colspan="4">요청 목록이 없습니다.</td>
			</tr>
			</c:if>
			<c:if test="${not empty RequestList }">
			<c:forEach items="${RequestList }" var="rl" varStatus="i">
			<c:set var="code" value="${fn:split(rl.request_code,'_') }"/>
			<tr>
				<td>${i.index+1}</td>
                <td>
                <c:if test="${code[0] eq 'wcn'}">
                	워드클라우드
                </c:if>
                </td>
                <td>${code[2] }</td>
                <td>
                <c:if test="${rl.request_rc eq 0}">
                	미완료
                </c:if>
                <c:if test="${rl.request_rc eq 3}">
                	완료
                </c:if>
                </td>
			</tr>
			</c:forEach>
			</c:if>
            </tbody>
          </table>
        </div>
    
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
          <div class="col-md-12">
          <table class="table">
            <thead>
              <tr>
                <th>#</th>
                <th>요청번호</th>
                <th>파일1</th>
                <th>파일2</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
              </tr>
              <tr>
                <td>2</td>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
              </tr>
              <tr>
                <td>3</td>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
              </tr>
            </tbody>
          </table>
        </div>
    
      </div>

      <hr class="featurette-divider">


    </div>
    
    <jsp:include page="foot.jsp"/>

</body>
</html>