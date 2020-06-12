<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

<html>
<head>
<style>
.menu filed{background-color: white;}
a {
  text-decoration: none;
  color: black;
  font-size: 20px;
  padding: 15px;
  display:inline-block;
}
ul {
  display: inline;
  margin: 0;
  padding: 0;
}
ul li {display: inline-block;}
ul li:hover {background: yellow;}
ul li:hover ul {display: block; margin-left: 300px;}
ul li ul {
  position: absolute;
  width: 200px;
  display: none;
}
ul li ul li { 
  background: white; 
  display: block; 
}
ul li ul li a {display:white !important;} 
ul li ul li:hover {background: gray;}

</style>
</head> 
<body>
<!-- logo -->
<a href="homeGO" style="margin-left: 30%; " ><img src="./resources/images/logo.jpg" height="150" ></a>


<!-- 마이페이지/장바구니 아이콘 -->
	<c:if test="${member == null }">
		<a id="login_icon" href="loginGO" style="margin-left: 80%; height= 50;"><img src="./resources/images/login_icon.png" 
		onmouseover="this.src='./resources/images/login_icon2.png'" onmouseout="this.src='./resources/images/login_icon.png'"height="30" ></a>
		<a href="loginGO" ><img src="./resources/images/cart_icon.png" 
		onmouseover="this.src='./resources/images/cart_icon2.png'" onmouseout="this.src='./resources/images/cart_icon.png'" height="30"></a>
	</c:if>
	<c:if test="${member != null }">
		<a href="myPageGO?userId=${member.userId}" style="margin-left: 80%; height= 50;"><img src="./resources/images/login_icon.png" 
		onmouseover="this.src='./resources/images/login_icon2.png'" onmouseout="this.src='./resources/images/login_icon.png'"height="30" ></a>
		<a href="shoppingCartGO" ><img src="./resources/images/cart_icon.png" 
		onmouseover="this.src='./resources/images/cart_icon2.png'" onmouseout="this.src='./resources/images/cart_icon.png'" height="30"></a>
		<a href="logoutDO"><img src="./resources/images/logout_icon.png" 
		onmouseover="this.src='./resources/images/logout_icon2.png'" onmouseout="this.src='./resources/images/logout_icon.png'" height="30"></a>
		<c:if test="${member.kind == 'manager' }">
			(관리자)
		</c:if>
			${member.userName}님 반갑습니다!
	</c:if>
<div class="menu filed">
  <ul>
    <li>
      <a href="#" style="margin-left: 300px;">Category</a>
      <ul>
        <li><a href="#">Pouch</a></li>
        <li><a href="#">Case</a></li>
        <li><a href="#">Sticker</a></li>
      </ul>
    </li>
  </ul>
  
 <ul>
    <li>
      <a href="introductionGO" style="margin-left: 300px;">About</a>
      <ul>
      </ul>
    </li>
 </ul>
 
 <ul>
    <li>
      <a href="#" style="margin-left: 300px;">Board</a>
      <ul>
        <li><a href="noticeGO">Notice</a></li>
        <li><a href="QnAGO">QnA</a></li>
        <li><a href="#">Review</a></li>
      </ul>
    </li>
 </ul>
 
</div>
</body>
</html>