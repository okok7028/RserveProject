<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
var joinCheck = {
		"idCheck" : false,
		"pwCheck" : false,
		"nameCheck" : false,
		"phoneCheck" : false,
		"emailCheck" : false
	}

//아이디 중복체크
function idDuplicate() {	
	
	var inputId = $("input[name='id']").val();
	
	$.ajax({
		url : "idCheck.do",
		method : "post",
		data : {id : inputId}, 
		datatype : "html",
		success : function(result) {
			if(result=="true"){
				$("#idCheckResult").text("사용 가능한 아이디");
				$("#idCheckResult").css("color", "green");
				$("#idBox").removeClass("has-error");
				$("#idBox").addClass("has-success");
				joinCheck["idCheck"] = true;
			}else{
				$("#idCheckResult").text("이미 존재하는 아이디");
				$("#idCheckResult").css("color", "red");
				$("#idBox").removeClass("has-success");
				$("#idBox").addClass("has-error");
				$("input[name='id']").focus();
				joinCheck["idCheck"] = false;
			}
		},
		error : function(ex) {
			alert(ex);
		}
	})
	
};


//비밀번호 재확인
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
//전화번호 
function phCheck() {
	$("input[name='phone']").val($("input[name='phone1']").val() + "-" 
			+ $("input[name='phone2']").val() + "-" + $("input[name='phone3']").val());
}


$(function() {

$("input[name='phone1']").keyup(function() {
	if($(this).val().length==$(this).attr('maxlength')){
		$("input[name='phone2']").focus();
	}
})
$("input[name='phone2']").keyup(function() {
	if($(this).val().length==$(this).attr('maxlength')){
		$("input[name='phone3']").focus();
	}
})

$("form").submit(function() {
	
		if($("input[name='id']").val() == ""){
			alert("ID를 입력하세요.");
			$("input[name='id']").focus();
			return false; 
		}else{
				idDuplicate();
		}
		if(joinCheck["idCheck"]==false){
			$("input[name='id']").focus();
			return false;
		}
		if($("input[name='password']").val() == ""){
			alert("비밀번호를 입력하세요.");
			$("input[name='password']").focus();
			return false;
		}
		if($("input[name='password']").val().length<4){
			alert("비밀번호가 너무 짧습니다.");
			$("input[name='password']").focus();
			return false;
		}else{
			joinCheck["pwCheck"]=true;
		}
		if($("input[name='name']").val()==""){
			alert("이름 입력");
			$("input[name='name']").focus();
			return false;
		}else{
			joinCheck["nameCheck"]=true;
		}
		if($("input[name='phone']").val()=="--"){
			alert("번호 입력");
			$("input[name='phone1']").focus();
			return false;
		}else if(isNaN($("input[name='phone1']").val()) || isNaN($("input[name='phone2']").val()) 
				   ||isNaN($("input[name='phone3']").val())) {
			  joinCheck["phoneCheck"]=false;
			  alert("숫자만 입력");
			  return false;
		}else if ($("input[name='phone']").val().length != 13) {
			   joinCheck["phoneCheck"]=false;
			   alert("전화번호 확인");
			   return false;
		}else{
			   joinCheck["phoneCheck"]=true;
		}
		if($("input[name='email']").val()==""){
			alert("이메일 입력");
			$("input[name='email']").focus();
			return false;
		}else{
			joinCheck["emailCheck"]=true;
		}
		if(joinCheck["idCheck"]&&joinCheck["pwCheck"]&&joinCheck["nameCheck"]
		&& joinCheck["phoneCheck"] && joinCheck["emailCheck"]){
			return true;
		}else{
			alert("작성내용을 다시 확인해주세요.");
		}
	})
})
</script>
</head>
<body>
<div class="container">
  <div class="row">
  	<h1>회원가입</h1>
  </div>
  <div class="row">
	<form class="form-horizontal" action="join.do" method="post">
		<div class="form-group" id="idBox">
			<label for="inputId" class="col-sm-3 control-label">아이디</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="inputId" placeholder="ID"
		      name="id" onkeyup="idDuplicate()">
		    </div>
		    <div class="col-sm-2" id="idCheckResult"></div>    
		</div>
		<div class="form-group">
			<label for="inputPw" class="col-sm-3 control-label">비밀번호</label>
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
			<label for="inputName" class="col-sm-3 control-label">이름</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputName" placeholder="Name"
		      name="name">
		    </div>
		</div>
		<div class="form-group">
			<label for="inputPhone" class="col-sm-3 control-label">전화번호</label>
		    <div class="col-sm-2">
		      <input type="tel" class="form-control" id="inputPhone" placeholder="010"
		      name="phone1" maxlength="3" onkeyup="phCheck()">
		    </div>
		    <div class="col-sm-1" align="center"><span>－</span></div>
		    <div class="col-sm-2">
		      <input type="tel" class="form-control" id="inputPhone" placeholder="1234"
		      name="phone2" maxlength="4" onkeyup="phCheck()">
		    </div>
		    <div class="col-sm-1" align="center"><span>－</span></div>
		    <div class="col-sm-2">
		      <input type="tel" class="form-control" id="inputPhone" placeholder="5678"
		      name="phone3" maxlength="4" onkeyup="phCheck()">
		    </div>
		    <input type="hidden" name="phone">
		</div>
		<div class="form-group">
			<label for="inputEmail" class="col-sm-3 control-label">이메일</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputEmail" placeholder="example@google.com"
		      name="email">
		    </div>
		</div>
		<div class="form-group">
		    <div class="col-sm-offset-3 col-sm-8">
		      <button type="submit" class="btn btn-default">회원가입</button>
		    </div>  
		</div>
	</form>
  </div>	
</div>	
</body>
</html>