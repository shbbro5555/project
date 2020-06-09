<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).on('click', '#saveBtn', function(){
		if('${member}' == ""){
			var result=confirm("로그인창으로 가시겠습니까?");
		}
		if (result) {
			location.href="loginGO";
		}
		if('${member}' != ""){
			if($("#content").val() == null){
				alert("댓글을 입력해주세요");
			}
			if($("#content").val() != null){
				if(confirm("댓글을 등록 하시겠습니까?") == true ){
					commentForm.submit();
				}
			}
		}
	});
	
	$(document).on('click', '#noticeDeleteBtn', function(){
		if(confirm("해당 게시글을 삭제하시겠습니까?") == true){
			noticeDeleteForm.submit();
		}
	});
	
	$(document).on('click', '#noticeModifyBtn', function(){
		if(confirm("해당 게시글을 수정 하시겠습니까?") == true){
			noticeModifyForm.submit();
		}
	});

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../include/Header.jsp"%>
	<%@include file="../include/footer.jsp"%>
		<c:if test="${member.kind =='manager'}">
			<form action="noticeModifyGO" method="post" id="noticeModifyForm">
				<input type="button" value="수정하기" id="noticeModifyBtn">	
				<input type="hidden" value="${notice.idx}" name="idx">
				<input type="hidden" value="${notice.title}" name="title">
				<input type="hidden" value="${notice.content}" name="content">
			</form>
			<form action="noticeDelete" method="post" id="noticeDeleteForm">
				<input type="button" value="삭제하기" id="noticeDeleteBtn">
				<input type="hidden" value="${notice.idx}" name="idx">
			</form>
		</c:if>
	<div>
		<table>
			<tr>
				<td>제목</td><td colspan="3">${notice.title}</td>
			</tr>
			<tr>
				<td>작성자</td><td>${notice.writer}</td><td>조회수</td><td>${notice.nov}</td>
			</tr>
			<tr>
				<td colspan="4">${notice.content}</td>
			</tr>
		</table>
	</div>
	
	<div>
		<form action="noticeCommentDO" method="post" id="commentForm">
			<textarea rows="10" cols="60" name="content" id="content"></textarea>>
			<input type="hidden" name="main_idx" value="${notice.idx}">
			<input type="hidden" name="idx" value="${notice.idx}">
			<input type="hidden" name="userId" value="${member.userId}">
			<input type="button" value="작성" id="saveBtn">
		</form>
	</div>

	<div>
		<table>
		<c:forEach var="comment" items="${comment}">
				<tr align="center">
					<td>${comment.userId}</td>
					<td><fmt:formatDate value="${comment.regidate}" pattern="yyyy.MM.dd(E) HH:MM"></fmt:formatDate></td>
					<c:if test="${member.userId == comment.userId}">
						<td><a href="noticeCommentDelete?idx=${comment.idx}&main_idx=${comment.main_idx}"
							onclick="if(!confirm('해당 댓글을 삭제 하시겠습니까?')){return false;}"><img src="./resources/images/x.png"></a></td>
					</c:if>
					<td></td>
				</tr>
					
				<tr>
					<td>${comment.content}</td>
				</tr>
		</c:forEach>
		</table>
	</div>
	
	
</body>
</html> 	