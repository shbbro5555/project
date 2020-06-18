<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../include/Header.jsp"%>
<div>
	<form action="goodsQnAWriteDO" method="post">
			<input type="hidden" value="${member.userId}" name="userId">
			<input type="hidden" value="${idx}" name="main_idx">
		<table>
			<tr>
				<td>제목 : <input type="text" name="title"></td> 
			</tr>
			<tr>
				<td>내용 : <textarea cols="100" name="content" ></textarea></td>
			</tr>
		</table>
		<input type="submit" value="등록하기">
	</form>
</div>
</body>
</html>