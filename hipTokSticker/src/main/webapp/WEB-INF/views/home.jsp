<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="include/Header.jsp"%>
	<%@include file="./include/footer.jsp"%>
	<%-- <c:if test="${member != null }">
			<c:if test="${member.kind =='manager'}">(관리자)</c:if>
			${member.userName}님 반갑습니다!
		<form action="logout">
			<input type="submit" value="로그아웃">
		</form>
		<form action="myPage">
			<input type="submit" value="마이페이지">
		</form>
	</c:if>
		<form action="introductionGO">
			<input type="submit" value="사이트 소개">
		</form>
		<form action="noticeGO">
			<input type="submit" value="공지사항">
		</form>
		<form action="QnAGO">
			<input type="submit" value="Q&A">
		</form>
		 --%>
		 <br><br><br><br><br><br><br><br><br>
	
</body>	
</html>