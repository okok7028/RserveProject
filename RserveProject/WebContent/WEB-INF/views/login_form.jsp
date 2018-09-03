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
<div class="container">
  <div class="row">
  	<h1>로그인</h1>
  </div>
  <div class="row">
	<form class="form-horizontal" action="login.do" method="post">
		<div class="form-group">
			<label for="inputId" class="col-sm-3 control-label">아이디</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="inputId" placeholder="ID"
		      name="userId">
		    </div>
		    <div class="col-sm-2" id="idCheckResult"></div>    
		</div>
		<div class="form-group">
			<label for="inputPw" class="col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-8">
		      <input type="password" class="form-control" id="inputPw" placeholder="PassWord"
		      name="userPw">
		    </div>
		</div>
		<div class="form-group">
		    <div class="col-sm-offset-3 col-sm-8">
		      <button type="submit" class="btn btn-default">로그인</button>
		    </div>  
		</div>
	</form>
  </div>	
</div>	
</body>
</html>