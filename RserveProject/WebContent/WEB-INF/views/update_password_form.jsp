<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>비밀번호변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function pwCheck() {
		if($("input[name='password']").val() == $("input[name='passwordre']").val()){
			$("#pwCheckResult").text("비밀번호 일치");
			$("#pwCheckResult").css("color", "green");
		}else{
			$("#pwCheckResult").text("비밀번호 불일치");
			$("#pwCheckResult").css("color", "red");
			joinCheck["pwCheck"]=false;
			$("input[name='passwordre']").focus();
		}
	}
</script>
</head>
<body>
	<jsp:include page="nav.jsp"/>
<div class="container">
  <div class="row">
  	<h1>비밀번호변경</h1>
  </div>
  <div class="row">
	<form class="form-horizontal" action="updatePassword.do" method="post">
		<div class="form-group">
			<label for="inputPw" class="col-sm-3 control-label">현재 비밀번호</label>
		    <div class="col-sm-8">
		      <input type="password" class="form-control" id="inputPw" placeholder="PassWord"
		      name="beforepassword">
		    </div>
		</div>
		<div class="form-group">
			<label for="inputPw" class="col-sm-3 control-label">변경할 비밀번호</label>
		    <div class="col-sm-8">
		      <input type="password" class="form-control" id="inputPw" placeholder="PassWord"
		      name="password">
		    </div>
		</div>
		<div class="form-group">
			<label for="inputPwre" class="col-sm-3 control-label">비밀번호확인</label>
		    <div class="col-sm-8">
		      <input type="password" class="form-control" id="inputPwre" placeholder="PassWordCheck"
		      name="passwordre" onkeyup="pwCheck()">
		    </div>
			<div id="pwCheckResult"></div>
		</div>
		<div class="form-group">
		    <div class="col-sm-offset-3 col-sm-8">
		      <button type="submit" class="btn btn-default">변경하기</button>
		    </div>  
		</div>
	</form>
  </div>	
</div>	
    <jsp:include page="foot.jsp"/>
</body>
</html>