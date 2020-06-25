<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../include/header.jsp"%>
	<img src="${pageContext.request.contextPath}/resources/upload/s/s_${review.filename}">
	<table style="border: 1">
		<tr>
			<td>
				${review.idx}번 리뷰내용
			</td>
		<tr>
			<td>
				제목 : ${review.title}
			</td>
		</tr>
		<tr>
			<td>
				${review.content}
			</td>
		</tr>
		<tr>
			<td>
				${review.rating}
			</td>
		</tr>
		<tr>
			<td>
				${review.regidate}
			</td>
		</tr>
	</table>
<%@include file="../include/footer.jsp"%>
</body>
</html>