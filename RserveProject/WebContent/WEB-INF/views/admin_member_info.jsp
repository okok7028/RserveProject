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
<script type="text/javascript">
	$(function() {
		$("#reset_btn").click(function() {
			var flag = confirm('Do you want to reset password?');
			var targetId = '${member.id}';
			
			if(flag){
				$.ajax({
					url : "adminResetPassword.do",
					method : "post",
					data : {id : targetId}, 
					datatype : "html",
					success : function(result) {
						if(result=="true"){
							alert("reset password");
							location.href="adminMain.do";
						}else{
							alert("fail");
						}
					},
					error : function(ex) {
						alert(ex);
					}
				})	
				return false;
			}else{
				return false;
			}
		})
		
		$("#grant_btn").click(function() {
			var flag = confirm('Do you want to grant admin?');
			var targetId = '${member.id}';
			
			if(flag){
				$.ajax({
					url : "adminGrant.do",
					method : "post",
					data : {id : targetId}, 
					datatype : "html",
					success : function(result) {
						if(result=="true"){
							alert("grant admin");
							location.href="adminMain.do";
						}else{
							alert("fail");
						}
					},
					error : function(ex) {
						alert(ex);
					}
				})	
				return false;
			}else{
				return false;
			}
		})
		
		$("#revoke_btn").click(function() {
			var flag = confirm('Do you want to revoke admin?');
			var targetId = '${member.id}';
			
			if(flag){
				$.ajax({
					url : "adminRevoke.do",
					method : "post",
					data : {id : targetId}, 
					datatype : "html",
					success : function(result) {
						if(result=="true"){
							alert("revoke admin");
							location.href="adminMain.do";
						}else{
							alert("fail");
						}
					},
					error : function(ex) {
						alert(ex);
					}
				})	
				return false;
			}else{
				return false;
			}
		})
		
		$("#ban_btn").click(function() {
			var flag = confirm('Do you want to ban user?');
			var targetId = '${member.id}';
			
			if(flag){
				$.ajax({
					url : "adminBan.do",
					method : "post",
					data : {id : targetId}, 
					datatype : "html",
					success : function(result) {
						if(result=="true"){
							alert("ban user");
							location.href="adminMain.do";
						}else{
							alert("fail");
						}
					},
					error : function(ex) {
						alert(ex);
					}
				})	
				return false;
			}else{
				return false;
			}
		})
		
		$("#unban_btn").click(function() {
			var flag = confirm('Do you want to unban user?');
			var targetId = '${member.id}';
			
			if(flag){
				$.ajax({
					url : "adminUnban.do",
					method : "post",
					data : {id : targetId}, 
					datatype : "html",
					success : function(result) {
						if(result=="true"){
							alert("unban user");
							location.href="adminMain.do";
						}else{
							alert("fail");
						}
					},
					error : function(ex) {
						alert(ex);
					}
				})	
				return false;
			}else{
				return false;
			}
		})
		
		$("#kick_btn").click(function() {
			var flag = confirm('Do you want to kick user?');
			var targetId = '${member.id}';
			
			if(flag){
				$.ajax({
					url : "adminKick.do",
					method : "post",
					data : {id : targetId}, 
					datatype : "html",
					success : function(result) {
						if(result=="true"){
							alert("kick user");
							location.href="adminMain.do";
						}else{
							alert("fail");
						}
					},
					error : function(ex) {
						alert(ex);
					}
				})	
				return false;
			}else{
				return false;
			}
		})
	})
	
</script>
</head>
<body>
	<jsp:include page="admin_nav.jsp"/>
<div class="container marketing">

      <hr class="featurette-divider">

      <div class="row featurette">
          <div class="col-md-12">
          <table class="table">
            <tr>
				<th>아이디</th>
				<td>${member.id }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${member.name }</td>
			</tr>				
			<tr>
				<th>번호</th>
				<td>${member.phone }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${member.email }</td>
			</tr>
			<tr>
				<th>회원등급</th>
				<td>
				<c:if test="${member.flag_admin eq 'm'}">
					<c:out value="일반회원"/>
				</c:if>
				<c:if test="${member.flag_admin eq 'radmin'}">
					<c:out value="관리자"/>
				</c:if>
				<c:if test="${member.flag_admin eq 'mb'}">
					<c:out value="이용정지"/>
				</c:if>
				</td>	
			</tr>
			<tr>
				<th>가입일</th>	
				<td>${member.regist_date }</td>
			</tr>	
          </table>
          </div>
          <div class="col-md-12">
          	<c:choose>
				<c:when test="${member.flag_admin eq 'mb'}">
				<button id="unban_btn">정지해제</button>
				</c:when>
			<c:otherwise>
				<button class="btn btn-default" id="reset_btn">비밀번호 리셋</button>
				<c:if test="${member.flag_admin eq 'm'}">
				<button class="btn btn-default" id="ban_btn">이용정지</button>
				<button class="btn btn-default" id="kick_btn">강퇴</button>
				<button class="btn btn-default" id="grant_btn">관리자 권한부여</button>
				</c:if>
				<c:if test="${member.flag_admin eq 'radmin'}">
				<button class="btn btn-default" id="revoke_btn">관리자 권한회수</button>
				</c:if>
			</c:otherwise>
			</c:choose>
          </div>
      </div>

      <hr class="featurette-divider">
</div>	
</body>
</html>