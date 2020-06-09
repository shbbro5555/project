<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input[type=text] {
  width: 30%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: none;
  border-bottom: 2px solid red;
}
input[type=password] {
  width: 30%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: none;
  border-bottom: 2px solid red;
}
form{text-align: center}
h1{text-align: center}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../include/Header.jsp"%>
	<c:if test="${check}">
		<script type="text/javascript">
			alert("아이디랑 비밀번호를 확인해주세요")
		</script>
	</c:if>
	<br><br><br><br><br><br><br>
	<h1>로그인</h1>
	<form action="loginDO" method="post">
		<p>
			<label for="userId">아이디</label>
			<input type="text" id="userId" name="userId"  maxlength="45" >
		</p>
		<p>
			<label for="userPassword">비밀번호</label>
			<input type="password" id="userPassword" name="userPassword"  maxlength="20">
		</p>
		<p>			
			<a href="">비밀번호 찾기</a><br/><br/>
			<input type="submit" value="로그인">
		<p>
	</form>
	<form action="joinGO">
		<input type="submit" value="회원가입">
	</form>

</body>
</html>





