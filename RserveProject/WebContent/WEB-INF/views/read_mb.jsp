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
function getList(mb_num) {
	var loginId="${sessionScope.loginId}";
	var mbwriter="${board.writer}";
	$.ajax({	
				url : "${pageContext.request.contextPath}/commentList.do?mb_num="+mb_num,
				type : "get",
				dataType : "xml",
				success : function(data) {
					var table = "";
					$(data).find("comment").each(function() {
							var c_level = $(this).find("c_level").text();
							var writer = $(this).find("writer").text();
							var level = c_level*20;
										table += "<table class='table'><tr id='cName_"+ $(this).find("comment_num").text()+ "'>";
										if($(this).find("flag_lock").text()==3){
											if(loginId == writer){
												table += "<td width="+'20%'+" align="+'left'+"><img src='resource/img/level.gif' width='"+level+"'> "+$(this).find("writer").text()+": "+"</td>";
												table += "<td width="+'50%'+" align="+'left'+">"+ $(this).find("content").text()+ "</td>";
												table += "<td width="+'20%'+" align="+'left'+">"+ $(this).find("write_date").text()+ "</td>";
												table+="<td>"
												table+= "<input type='button' onclick='creply(this)' value='댓글' id='cId_"+$(this).find("comment_num").text()+ "' class='cName_"+ $(this).find("comment_num").text()+ "' /></td>";
											}else if(loginId == mbwriter){
												table += "<td width="+'20%'+" align="+'left'+"><img src='resource/img/level.gif' width='"+level+"'> "+$(this).find("writer").text()+": "+"</td>";
												table += "<td width="+'50%'+" align="+'left'+">"+ $(this).find("content").text()+ "</td>";
												table += "<td width="+'20%'+" align="+'left'+">"+ $(this).find("write_date").text()+ "</td>";
												table+="<td>"
												table+= "<input type='button' onclick='creply(this)' value='댓글' id='cId_"+$(this).find("comment_num").text()+ "' class='cName_"+ $(this).find("comment_num").text()+ "' /></td>";
											}else{
												table += "<td width="+'20%'+" align="+'left'+"></td>";
												table += "<td width="+'50%'+" align="+'left'+">비밀댓글입니다.</td>";
												table += "<td width="+'20%'+" align="+'left'+"></td>";
												table+="<td>";
											}
										}else{
										table += "<td width="+'20%'+" align="+'left'+"><img src='resource/img/level.gif' width='"+level+"'> "+$(this).find("writer").text()+": "+"</td>";
										table += "<td width="+'50%'+" align="+'left'+">"+ $(this).find("content").text()+ "</td>";
										table += "<td width="+'20%'+" align="+'left'+">"+ $(this).find("write_date").text()+ "</td>";
										table+="<td>"
										table+= "<input type='button' onclick='creply(this)' value='댓글' id='cId_"+$(this).find("comment_num").text()+ "' class='cName_"+ $(this).find("comment_num").text()+ "' /></td>";
										}
										
										table += "</tr><table>";
									});
					$("#"+mb_num).append(table);
				},
				 error:function(ex){
						alert('fail');
					}
			});

}	// getList()끝

function creply(ccc) {
	var bb = $(ccc).attr("class");
	var cc = bb.split("cName_");
	var reply ='';
	reply += '<form class="form-inline" name="sendReply" id="sendReply" method="post">';
	reply += '	<input type="hidden" name="con" value="">';
	reply += '	<input type="hidden" name="mb_num" value="${board.mb_num}">';
	reply += '	<input type="hidden" name="p" value="${p}">';
	reply += '<div class="form-group">';
	reply += '	<label for="content1">댓글</label>';
	reply += '		<textarea name="content" cols="80%" rows="2" class="form-control" id="content1"></textarea></div>';
	reply += '<div class="form-group">';
	reply += '	<label for="pass1">비밀번호</label>';
	reply += '	<input type="password" name="comment_pw" size="7" class="form-control" id="pass1">';
	reply += '<div class="checkbox"> <label> <input type="checkbox" id="lock2"> 비밀댓글 </label>';
	reply += '<input type="hidden" name="flag_lock" id="lock3"></div>';
	reply += '	<button type="button" class="btn btn-default" id="submit" onclick="submitreply()">작성</button>';
	reply += '</form>';
	$("#sendReply").remove();
	$("#"+bb).after(reply);
	$("input[name='con']").attr("value", cc[1]);
}

function recommend() {
	$.ajax({
		url : "processUpDown.do",
		method : "post",
		data : {code : "up", mb_num:"${board.mb_num}"}, 
		datatype : "text",
		success : function(result) {
			if(result != "null"){
			var main = JSON.parse(result);
			$("#mainup").text(main.recommend);
			$("#maindown").text(main.opposite);
			}else{
				alert("추천 하루 한번");
			}
		},
		error : function(ex) {
			alert(ex);
		}
	})
}

function opposite() {
	$.ajax({
		url : "processUpDown.do",
		method : "post",
		data : {code : "down", mb_num:"${board.mb_num}"}, 
		datatype : "text",
		success : function(result) {
			if(result != "null"){
			var main = JSON.parse(result);
			$("#mainup").text(main.recommend);
			$("#maindown").text(main.opposite);
			}else{
				alert("반대 하루 한번");
			}
		},
		error : function(ex) {
			alert(ex);
		}
	})
}

function submitreply() {
	var mb_num = "${board.mb_num}";
	 $.ajax({
         url : "${pageContext.request.contextPath}/comment.do?mb_num="+mb_num,
         type : "get",
         dataType : "text",
         data : $("#sendReply").serialize(), // 파라미터를 직렬화
         success : function(data) {
             if(data == 1){
                 alert("success send commentReply");
                 $("#"+mb_num).empty();
					getList(mb_num);
                 $("textarea").val("");
                 $("input[type=password]").val("");
             }else{
                 alert("insert commentReply fail");    
             }
         },
         error:function(ex){
				alert(ex)
			}
     })
}

$(function() {
	var mb_num = $("input[name=mb_num]").val();
	getList(mb_num);
	
	$("#lock1").change(function() {	
			if($(this).is(":checked")){
				$("#lock").val('y');
			}else{
				$("#lock").val('n');
			}
	});

	$(document).on("click", "#lock2", function() {	
			if($("#lock2").is(":checked")){
				$("#lock3").val('y');
			}else{
				$("#lock3").val('n');
			}
	});
	
	$("#submit").click(function() {
        $.ajax({
            url : "${pageContext.request.contextPath}/comment.do?mb_num="+mb_num,
            type : "get",
            dataType : "text",
            data : $("#sendComment").serialize(), // 파라미터를 직렬화
            success : function(data) {
                if(data == 1){
                    alert("success send comment");
                    $("#"+mb_num).empty();
					getList(mb_num);
                    $("textarea").val("");
                    $("input[type=password]").val("");
                }else{
                    alert("insert comment fail");    
                }
            },
            error:function(ex){
				alert(ex)
			}
        })
 return false;		
 })      		
 
 $.ajax({
		url : "processUpDown.do",
		method : "post",
		data : {code : "check", mb_num:"${board.mb_num}"}, 
		datatype : "text",
		success : function(result) {
			if(result != "null"){
			var main = JSON.parse(result);
			$("#mainup").text(main.recommend);
			$("#maindown").text(main.opposite);
			}
		},
		error : function(ex) {
			alert(ex);
		}
	})
	 
})
</script>
</head>
<body>
	<jsp:include page="nav.jsp"/>


<div class="container marketing">

      <hr class="featurette-divider">

      <div class="row featurette">
      	  <div class="col-md-12">
    	  	<a href="mainBoardList.do?p=${p }"><button class="btn btn-default">목록</button></a>
    	  	<c:if test="${sessionScope.loginId eq board.writer }">
			<a href="mainModify.do?n=${board.mb_num }"><button class="btn btn-default">글수정</button></a>
			<a href="mainDelete.do?n=${board.mb_num }"><button class="btn btn-default">글삭제</button></a>
			</c:if>
			<a href="mainWriteForm.do?n=${board.mb_num }"><button class="btn btn-default">답글</button></a>
          </div>
          <div class="col-md-12">
          	<p>  </p>
          </div>
          <div class="col-md-12">
          <c:choose>
			<c:when test="${empty board }">
				<script type="text/javascript">
					alert("존재하지 않는 글입니다. 목록으로 돌아갑니다.");
					location.href="mainBoardList.do";
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
			<tr>
				<td></td>
				<td><button class="btn btn-default" id="recommend" onclick="recommend()">↑</button></td>
				<td><label for="recommend" id="mainup"></label></td>
				<td><button class="btn btn-default" id="opposite" onclick="opposite()">↓</button></td>
				<td><label for="opposite" id="maindown"></label></td>
				<td></td>
			</tr>
            </tbody>
          </table>
          </c:otherwise>
		  </c:choose>
    	  </div>
    	  
    	  <div class="col-md-12" id="comment">
      	    <hr>
			<form class="form-inline" name="sendComment" id="sendComment" method="post">
				<input type="hidden" name="mb_num" value="${board.mb_num }">
				<input type="hidden" name="p" value="${p }">
				<div class="form-group">
					<label for="content1">댓글</label>
					<textarea name="content" cols="80%" rows="2" class="form-control" id="content1"></textarea>
				</div>
				<div class="form-group">
					<label for="pass1">비밀번호</label>
					<input type="password" name="comment_pw" size="7" class="form-control" id="pass1"> 
				</div>
				<div class="checkbox">
			    	<label>
			     	 <input type="checkbox" id="lock1"> 비밀댓글
			    	</label>
			    	<input type="hidden" name="flag_lock" id="lock">
			  	</div>
				<button type="button" class="btn btn-default" id="submit">작성</button>
			</form>
			<hr>
			
			<div class="col-md-12" id="${board.mb_num}">
			
			</div>
			
      	  </div>
      	  
      </div>	  

      <hr class="featurette-divider">
   
</div>	
</body>
</html>