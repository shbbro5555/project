<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<style> 

.memberInfo{background: white; margin-left: 40%;}
.text{
  width: 20%;
  padding: 8px 10px;
  margin: 5px 0;
  box-sizing: border-box;
  border: 2px solid green;
}

</style>
<script type="text/javascript">

function joinCheck() {
	var userPassword = document.getElementById("userPassword");
	var userPasswordCheck = document.getElementById("userPasswordCheck");
	var userEmail = document.getElementById("userEmail");
	var userName = document.getElementById("userName");
	var userPhoneNumber = document.getElementById("userPhoneNumber");
	var userAddress = document.getElementById("userAddress");
	var checkBox = document.getElementById("checkOK");
	
	// 공백 검사
	if  (userPassword.value =="") {alert("비밀번호를 입력해주세요"); return false; }
	else if (userPasswordCheck.value =="") {alert("비밀번호 확인을 입력해주세요"); return false;}
	else if (userEmail.value =="") {alert("이메일을 입력해주세요"); return false;}
	else if (userName.value =="") {alert("이름를 입력해주세요"); return false;}
	else if (userPhoneNumber.value =="") {alert("휴대폰 번호를 입력해주세요"); return false;}
	else if (userAddress.value =="") {alert("주소를 입력해주세요"); return false;}
	
	// 비밀번호 확인 검사
	else if(userPassword.value != userPasswordCheck.value){alert("비밀번호를 다시 확인해주세요"); return false;}
	// 이름 길이
	else if(userName.value.length<2){alert("이름을 2자 이상 입력해주십시오."); return false;}
    // 비밀번호 길이 체크(10~20자 까지 허용)
    else if (userPassword.value.length<10 || userPassword.value.length>20) {
        alert("비밀번호를 10~20자까지 입력해주세요."); return false;
    }
	alert("수정완료!");
}      

 </script>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>
	<%@include file="../include/Header.jsp"%>
	<div class="memberInfo">
	<h1>수정하기</h1>
		<form action="memberModifyDO" method="post" name="modifyform" onsubmit="return joinCheck()" >
				<p>
					<label for="userId">아이디</label><br/>
					<input class="text" type="text" id="userId" name="userId" value="${member.userId}" maxlength="45" readonly="readonly"><br/>
				</p>
				<p>
					<label for="userPassword">새로운 비밀번호</label><br/>
					<input class="text" type="password" id="userPassword" name="userPassword"  maxlength="20">
				</p>
				<p>
					<label for="userPasswordCheck">비밀번호 확인</label><br/>
					<input class="text" type="password" id="userPasswordCheck" name="userPasswordCheck"  maxlength="20">
				</p>
				<p>
					<label for="userEmail">이메일</label><br/>
					<input class="text" type="email" id="userEmail" name="userEmail" value="${member.userEmail}" maxlength="60">
				</p>
				<p>
					<label for="userName">이름</label><br/>
					<input class="text" type="text" id="userName" name="userName" value="${member.userName} " maxlength="10">
				</p>
				<p>
					<label for="userPhoneNumber">휴대폰 번호</label><br/>
					<input class="text" type="tel" id="userPhoneNumber" name="userPhoneNumber" value="${member.userPhoneNumber}" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" maxlength="14">
				</p>
				<p>
					<label for="userAddress">주소</label><br/>
					<input class="text" type="text" id="userAddress" name="userAddress" value="${member.userAddress}" maxlength="100">
				</p>
				<p>
					<input type="submit" value="수정하기">
				</p>
		</form>
	</div>
	
		
</body>
</html>