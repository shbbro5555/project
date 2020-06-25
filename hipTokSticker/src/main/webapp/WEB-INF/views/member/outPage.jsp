<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		var password = document.getElementById("userPassword").value;
		var realPassword =  document.getElementById("real").value;
		if(password != realPassword){
			alert("비밀번호가 일치하지 않습니다.");		
		}else{
			if (confirm("정말 탈퇴하시겠습니까??") == true){    //확인
				outForm.submit();
				alert("회원 탈퇴 완료.")
			}else{   //취소
			}
		}
	}
</script>
<style type="text/css">
.text{
  width: 20%;
  padding: 8px 10px;
  margin: 5px 0;
  box-sizing: border-box;
  border-color: rgba(700, 76, 76, 0.3);
}
.memberInfo{background: white; text-align: center; margin-top: 90px;}
</style>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<div class="memberInfo">
	<h1>회원 탈퇴</h1>
	<form action="memberOutDO" method="post" name="outForm">
		<p>
			<label for="userId">아이디</label><br/>
			<input class="text" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"><br/>
		</p>
		<p>
			<label for="userPassword">비밀번호</label><br/>
			<input class="text" type="password" id="userPassword" name="userPassword"><br/>
		</p>
		<input type="hidden" value="${member.userPassword}" id="real">
		<input type="button" value="탈퇴하기" onclick="check()">
	</form>
	</div>
	<%@include file="../include/footer.jsp"%>
</body>
</html>