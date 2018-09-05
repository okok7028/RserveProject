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
                <c:if test="${code[0] eq 'scm'}">
                	학교지도
                </c:if>
                </td>
                <td>${code[1] }</td>
                <td>
                <c:if test="${rl.request_rc eq 0}">
                	미완료
                </c:if>
                <c:if test="${rl.request_rc eq 3}">
                	요청번호 ${rl.request_num } 완료
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
            <c:if test="${empty FileList }">
			<tr>
				<td colspan="4">목록이 없습니다.</td>
			</tr>
			</c:if>
			<c:if test="${not empty FileList }">
			<c:forEach items="${FileList }" var="fl" varStatus="j">
			<tr>
				<td>${j.index+1}</td>
                <td>${fl.request_num }</td>
                <c:if test="${fl.request_code eq 'wcn' }">
                <td><a href="download.do?f=${fl.request_num }&t=x1">${fl.original_name }.csv</a></td>
                <td><a href="download.do?f=${fl.request_num }&t=i1">${fl.original_name }.png</a></td>
                </c:if>
                <c:if test="${fl.request_code eq 'scm' }">
                <td><a href="download.do?f=${fl.request_num }&t=i1">${fl.original_name }.png</a></td>
                <td></td>
                </c:if>
			</tr>
			</c:forEach>
			</c:if>
            </tbody>
          </table>
        </div>
    
      </div>

      <hr class="featurette-divider">


    </div>
    
    <jsp:include page="foot.jsp"/>

</body>
</html>