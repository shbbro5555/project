<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<style> 
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
input[type=email] {
  width: 30%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: none;
  border-bottom: 2px solid red;
}
input[type=tel] {
  width: 30%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: none;
  border-bottom: 2px solid red;
}

h1	 { text-align: center; }
form { text-align: center; }
label {
	position:absolute;
	left : 35%;
}
#checkOKOK{
position:absolute;
left : 40%;
}
</style>
<script type="text/javascript">
$(function () {
	$("userId").onkeyup(function () {
			
	})
	
})
function joinCheck() {
	var userId = document.getElementById("userId");
	var userPassword = document.getElementById("userPassword");
	var userPasswordCheck = document.getElementById("userPasswordCheck");
	var userEmail = document.getElementById("userEmail");
	var userName = document.getElementById("userName");
	var userPhoneNumber = document.getElementById("userPhoneNumber");
	var userAddress = document.getElementById("userAddress");
	var checkBox = document.getElementById("checkOK");
	
	// 공백 검사
	if (userId.value =="") {alert("아이디를 입력해주세요"); return false;}
	else if (userPassword.value =="") {alert("비밀번호를 입력해주세요"); return false; }
	else if (userPasswordCheck.value =="") {alert("비밀번호 확인을 입력해주세요"); return false;}
	else if (userEmail.value =="") {alert("이메일을 입력해주세요"); return false;}
	else if (userName.value =="") {alert("이름를 입력해주세요"); return false;}
	else if (userPhoneNumber.value =="") {alert("휴대폰 번호를 입력해주세요"); return false;}
	else if (userAddress.value =="") {alert("주소를 입력해주세요"); return false;}
	
	// 비밀번호 확인 검사
	else if(userPassword.value != userPasswordCheck.value){alert("비밀번호를 다시 확인해주세요"); return false;}
	// 아이디 길이 6글자 이상
	else if(userId.value.length<6){alert("아이디는 6글자이상 입력해주세요."); return false;}
	// 이름 길이
	else if(userName.value.length<2){alert("이름을 2자 이상 입력해주십시오."); return false;}
	// 아이디 공백사용 제한
	else if(userId.value.indexOf(" ") >=0){ alert("아이디에 공백을 사용할 수 없습니다."); return false;}
    // 비밀번호 길이 체크(10~20자 까지 허용)
    else if (userPassword.value.length<10 || userPassword.value.length>20) {
        alert("비밀번호를 10~20자까지 입력해주세요."); return false;
    }
	// 아이디는 영문자,숫자만
	var flag=true;
	for (var i = 0; i < userId.value.length; i++) {
         ch = userId.value.charAt(i)
         if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
             flag=false;
         }
     }
	 if(flag==false){
     	alert("아이디는 영문 대소문자, 숫자만 입력가능합니다."); return false;
      }
	// 체크박스 확인여부
	if (!checkBox.checked) {alert("약관에 동의해주세요");return false;}
	alert("회원가입을 환영합니다!");
}      
	
// 아이디 중복확인 

 </script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%@include file="../include/Header.jsp"%>
	<h1>회원가입</h1>
	<form action="joinDO" method="post" name="loginForm" onsubmit="return joinCheck()" >
			<p>
				<label for="userId">아이디</label><br/>
				<input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" maxlength="45" ><br/>
				<input type="button" onclick="idCheck()" style="position:absolute;left : 35%;" value="아이디 중복확인!!"> 중복확인
			</p>
			<p>
				<label for="userPassword">비밀번호</label><br/>
				<input type="password" id="userPassword" name="userPassword" placeholder="비밀번호를 입력하세요" maxlength="20">
			</p>
			<p>
				<label for="userPasswordCheck">비밀번호 확인</label><br/>
				<input type="password" id="userPasswordCheck" name="userPasswordCheck" placeholder="비밀번호 확인" maxlength="20">
			</p>
			<p>
				<label for="userEmail">이메일</label><br/>
				<input type="email" id="userEmail" name="userEmail" placeholder="이메일을 입력하세요" maxlength="60">
			</p>
			<p>
				<label for="userName">이름</label><br/>
				<input type="text" id="userName" name="userName" placeholder="이름을 입력하세요 " maxlength="10">
			</p>
			<p>
				<label for="userPhoneNumber">휴대폰 번호</label><br/>
				<input type="tel" id="userPhoneNumber" name="userPhoneNumber" placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" maxlength="14">
			</p>
			<p>
				<label for="userAddress">주소</label><br/>
				<input type="text" id="userAddress" name="userAddress" placeholder="주소를 입력하세요" maxlength="100">
			</p>
				<input type="hidden" id="kind" name="kind" value="member">
			<p>
				<label for="checkOK" id="checkOKOK"><a href="">이용약관</a> 및 <a href="">개인정보수집 및 이용</a> 동의<input type="checkbox" id="checkOK" onclick="OK"></label><br/>
			</p>
			<p>
				<input type="submit" value="회원가입 하기"  >
				<input type="reset" value="다시쓰기">
			</p>
		
	</form>
		
</body>
</html>