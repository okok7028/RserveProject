<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function phCheck() {
		$("input[name='phone']").val($("input[name='phone1']").val() + "-" 
				+ $("input[name='phone2']").val() + "-" + $("input[name='phone3']").val());
	}
	$(function() {
		$("#modifybtn").hide();
		
		var userId = "${sessionScope['loginId']}";
		$.ajax({
			url : "getMember.do",
			method : "post",
			data : {id : userId}, 
			datatype : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(result) {
				if(result != "null"){
				var Ca = /\+/g;
				result = decodeURIComponent(result.replace(Ca, " "));
				var member = JSON.parse(result);
				$("input[name='name']").attr("value", member.name);
				$("input[name='email']").attr("value", member.email);
				$("input[name='phone']").attr("value", member.phone);
				$("input[name='phone1']").attr("value", member.phone.substring(0, 3));
				$("input[name='phone2']").attr("value", member.phone.substring(4, 8));
				$("input[name='phone3']").attr("value", member.phone.substring(9, 13));
				$("input[name='date']").attr("value", member.regist_date);
				}else{
					alert("정보가 없습니다.");
				}
			},
			error : function(ex) {
				alert(ex);
			}
			
		})
		
		$("#updatebtn").click(function() {
			$("input[readonly='readonly']").prop("readonly", false);
			$("#updatebtn").hide();
			$("#modifybtn").show();
			return false;
		})
		
		var joinCheck = {
		"nameCheck" : false,
		"phoneCheck" : false,
		"emailCheck" : false
	}	
	
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
			if(joinCheck["nameCheck"] &&joinCheck["phoneCheck"] && joinCheck["emailCheck"]){
				return true;
			}else{
				alert("작성내용을 다시 확인해주세요.");
			}
		})
	})
</script>
</head>
<body>
	<jsp:include page="nav.jsp"/>
	
	<c:if test="${checkpw eq 'getout' }">
		<script type="text/javascript">
			alert("dismatched password");
			location.href='main.do';
		</script>
	</c:if>
	<c:if test="${checkup eq 'success' }">
		<script type="text/javascript">
		alert("update complete");
		</script>
	</c:if>
	
<div class="container">
  <div class="row">
  	<h1>회원정보</h1>
  </div>
  <div class="row">
	<form class="form-horizontal" action="updateMember.do" method="post">
		<div class="form-group" id="idBox">
			<label for="inputId" class="col-sm-3 control-label">아이디</label>
		    <div class="col-sm-6">
		      <input id="inputId" type="text" class="form-control" disabled="disabled" value="${sessionScope.loginId }">
		      <input type="hidden" name="id" value="${sessionScope.loginId }"> 
		    </div>
		</div>
		<div class="form-group">
			<label for="inputDate" class="col-sm-3 control-label">가입일</label>
			<div class="col-sm-6">
			<input id="inputDate" type="text" class="form-control" name="date" disabled="disabled">
			</div>
		</div>
		<div class="form-group">
			<label for="inputName" class="col-sm-3 control-label">이름</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputName" placeholder="Name"
		      name="name" readonly="readonly">
		    </div>
		</div>
		<div class="form-group">
			<label for="inputPhone" class="col-sm-3 control-label">전화번호</label>
		    <div class="col-sm-2">
		      <input type="tel" class="form-control" id="inputPhone" placeholder="010"
		      name="phone1" maxlength="3" readonly="readonly" onkeyup="phCheck()">
		    </div>
		    <div class="col-sm-1" align="center"><span>－</span></div>
		    <div class="col-sm-2">
		      <input type="tel" class="form-control" id="inputPhone" placeholder="1234"
		      name="phone2" maxlength="4" readonly="readonly" onkeyup="phCheck()">
		    </div>
		    <div class="col-sm-1" align="center"><span>－</span></div>
		    <div class="col-sm-2">
		      <input type="tel" class="form-control" id="inputPhone" placeholder="5678"
		      name="phone3" maxlength="4" readonly="readonly" onkeyup="phCheck()">
		    </div>
		    <input type="hidden" name="phone">
		</div>
		<div class="form-group">
			<label for="inputEmail" class="col-sm-3 control-label">이메일</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputEmail" placeholder="example@google.com"
		      name="email" readonly="readonly">
		    </div>
		</div>
		<div class="form-group">
		    <div class="col-sm-offset-3 col-sm-8">
		      <button type="submit" class="btn btn-default" id="modifybtn">정보수정</button>
		      <button id="updatebtn" class="btn btn-default">정보수정</button> 
		    </div>  
		</div>
	</form>
	<div align="center">
	<a href="updatePasswordForm.do"><button class="btn btn-default">비밀번호 변경</button></a>
	<a href="deleteMemberForm.do"><button class="btn btn-default">회원 탈퇴</button></a>
	</div>
  </div>	
</div>	

    <jsp:include page="foot.jsp"/>
</body>
</html>