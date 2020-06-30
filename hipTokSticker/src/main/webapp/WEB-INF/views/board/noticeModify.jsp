<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>글쓰기</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
		  	placeholder: '${content}',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR',
	        
	        });
	  });


	
function goModify() {
	var title = document.getElementById("title").value;
	var content = document.getElementById("summernote").value;
	
	if (title == ""){
		alert("제목을 입력해주세요");
		return false;
	}
	if (content == ""){
		alert("내용을 입력해주세요");
		return false;
	}
	if (confirm("수정 하시겠습니까?") == true){
		modifyForm.submit();
	}
}
</script>
<style type="text/css">
</style>
</head>
<body>
<%@include file="../include/header.jsp"%>
<h2 style="text-align: center;">공지글 수정</h2><br><br>

<div style="width: 60%; margin: auto; background: white;">
	<form action="noticeModifyDO" method="post" name="modifyForm" >
		<input type="hidden" name="idx" value="${idx}">
		아이디 : <input type="text" name="userId" value="${member.userId}" readonly="readonly"	style="border: none; border-bottom: 2px solid black;">
		글쓴이 : <input type="text" name="writer" value="${member.userName}" readonly="readonly" style="border: none; border-bottom: 2px solid black;"><br><br>
		<input type="text" id="title" name="title" style="width: 40%;border: none; border-bottom: 2px solid black;" value="${title}">
		<br><br> 
		<textarea id="summernote" name="content"></textarea>
		<input type="button" style="float: right;" value="수정하기" onclick="goModify()">
	</form>
</div>
<%@include file="../include/footer.jsp"%>
</body>
</html>