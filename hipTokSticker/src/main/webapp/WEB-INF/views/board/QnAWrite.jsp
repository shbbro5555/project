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
		
 	    	placeholder: '내용을 입력해주세요',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR',
	       
	  
		});
});

function goWrite() {
	var title = document.getElementById("title").value;
	var content = document.getElementById("summernote").value;
	var kind = document.getElementById("kind").value;
	if (title == ""){
		alert("제목을 입력해주세요");
		return false;
	}
	if (content == ""){
		alert("내용을 입력해주세요");
		return false;
	}
	if (kind == "null"){
		alert("분류를 선택해주세요");
		return false;
	}
	if (confirm("등록 하시겠습니까?") == true){
		writeForm.submit();
	}
	
}
</script>
<style type="text/css">
</style>
</head>
<body>
<%@include file="../include/header.jsp"%>
<%@include file="../include/footer.jsp"%>
<h2 style="text-align: center;">QnA 작성</h2><br><br>

<div style="width: 60%; margin: auto; background: white;">
	<form action="QnAWriteDO" method="post" name="writeForm">
		아이디 : <input type="text" name="userId" value="${member.userId}" readonly="readonly"	style="border: none; border-bottom: 2px solid black;">
		글쓴이 : <input type="text" name="writer" value="${member.userName}" readonly="readonly" style="border: none; border-bottom: 2px solid black;"><br><br>
		<input type="text" id="title" name="title" style="width: 40%;border: none; border-bottom: 2px solid black;" placeholder="제목" ><br><br>
		분류 : <select name="kind" id="kind">
				<option value="null">선택해주세요</option>		
                <option value="상품">상품</option> 
                <option value="배송">배송</option>
                <option value="주문/결제">주문/결제</option>
                <option value="반품/교환">반품/교환</option>
                <option value="기타">기타</option>
            </select>
		<br><br> 
		<textarea id="summernote" name="content"></textarea>
		<input type="button" style="float: right;" value="글 작성" onclick="goWrite()">
	</form>
</div>

</body>
</html>