<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet"  href="https://han3283.cafe24.com/js/lightslider/css/lightslider.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet"> <!-- Noto Sans JP -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://han3283.cafe24.com/js/lightslider/js/lightslider.js"></script>
<style type="text/css">
#wrap {
    position: relative;
    width: 100%;
    margin: 0 auto;
    padding: 0;
    border: 0px solid #eee;
    border-top: 0;
    border-bottom: 0;
}

#container {
    position: relative;
    float: left;
    width: 100%;
    height: 100%;
    margin: 0 auto;
    *zoom: 1;
    overflow: hidden;
    border-left: 0px solid #eee;
}

/* 왼쪽 라인 */
#left {
    position: fixed;
    float: left;
    width: 13.2%;
    left: 50px;
    top: 0px;
    height: 100%;
    z-index: 999;
    background: none;
}
.logoWidthTop {
    position: relative;
    display: block;
    margin: 70px 0px 50px 0px;
    border-bottom: 0px #ddd solid;
    z-index: 999;
}
.category {
    position: relative;
    display: block;
    width: 140px;
    margin: 0px 0 0px;
    padding: 0px 0 0 50px;
}

/* 오른쪽 라인 */
#right {
    position: fixed;
    float: right;
    right: 50px;
    width: 5%;
    top: 100px;
    height: 90%;
    z-index: 99;
    background: none;
}
.right_menu {
    margin: 144px 0px 0 0;
}
/* 오른쪽 상단 */
#rightTop {
	position: fixed;
    float: right;
    right: 50px;
    width: 5%;
    top: 20px;
    z-index: 99;
    background: none;
    margin: 0px 0px 0px 0px 0 0;
    font-size: 10px;
}

/* 가운대 */
#contents {
    position: relative;
    width: 100%;
    max-width: 2000px;
    min-height: 500px;
    margin: 100px auto 20px;
}
.sub_contents_inner {
    width: 80%;
    margin: 0px auto 0;
}
.contents_inner {
    width: 80%;
    margin: 0px auto 0;
}

*{ 
   margin: 0; 
   padding: 0; 
}
ul, ol, li{ 
   list-style: none;
} 

#Item{
   position: relative;
   width: 100%;
   max-width: 2000px;
   margin: 40px auto 50px;
   font-size: 10px;
}

/*   신상품 제목부분 */
.Title{
   text-align: center;
   font-weight: normal;
   letter-spacing: 10px;
   margin-bottom: 40px;
}
.ItemUL{}

/*   new아이콘 부분 사이즈 조절은 알아서 바꿔도 됨   */
.ItemUL .newIcon{
   border: 1px solid;
   display: inline-block;
   margin: 15px 0;
   padding: 3px 10px;
}

li{list-style: none; font-family: font-family: 'Noto Sans JP', sans-serif; font-size: 30px;}

.category li ul{
background: white;
display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:400px;
z-index:200;
/*top:1em;
/*left:0;*/
}

.category li:hover ul{
display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.category li a:hover, .category ul li:hover a{
background: white;
color:balck;
text-decoration:none;
font-size: 12px;
}

.category li:hover li a{
background:none;
}
</style>
</head>
<body>
<div id="wrap">
	<div id="container">
		<!-- 왼쪽 틀 -->
		<div id="left">
			<h1 class="logoWidthTop">
				<a href="home">
					<img style="vertical-align: middle; width: 162px; height: 65px;" src="${pageContext.request.contextPath }/resources/images/JDWH_Logo.png">
				</a>
			</h1>
			<div class="category">
				<ul>
					<li>
						<a href="" style="color:black; letter-spacing: 3px"><h6>NEW</h6></a>
					</li>
					<li>
						<a href="" style="color:black; letter-spacing: 3px"><h6>BEST</h6></a>
					</li>
					<li>
						<a href="" style="color:black; letter-spacing: 3px"><h6>Pouch</h6></a>
						<ul>
							 <li><a href="#">맨투맨&후드티</a></li>
						</ul>
					</li>
					<li>
						<a href="" style="color:black; letter-spacing: 3px"><h6>Sticker</h6></a>
						 <ul>
					 		<li><a href="#">슬랙스</a></li>
					 	</ul>
					</li>
					<li>
						<a href="" style="color:black; letter-spacing: 3px"><h6>Case</h6></a>
						<ul>
							<li><a href="#">모자</a></li>
					 	</ul>
					</li>
				</ul>
				<br/>
				<ul>	
					<li>
						<a href="" style="color:black; letter-spacing: 3px"><h6>REVIEW</h6></a>
					</li>
					<li>
						<a href="" style="color:black; letter-spacing: 3px"><h6>NOTICE</h6></a>
					</li>
				</ul>
			</div>
		</div>
		
		<!-- 오른쪽 틀 -->
		<div id="right">
			<div id="rightTop">
				<c:if test="${name == null}">
					비회원님
				</c:if>
				<c:if test="${name != null}">
					${name}님
				</c:if>
			</div>
			<div id="right_menu">
				<ul>
					<c:if test="${name == null}">
						<li><a href="login" style="color:black"><h6>Login</h6></a></li>
						<li><a href="join" style="color:black; letter-spacing: 3px"><h6>Join</h6></a></li>
					</c:if>
					<c:if test="${name != null}">
						<%-- <%session.invalidate();%> --%>
						<li><a href="home" style="color:black"><h6>Logout</h6></a></li>
					</c:if>
					<li><a href=""  style="color:black; letter-spacing: 3px"><h6>Order</h6></a></li>
					<li><a href="myPage"  style="color:black; letter-spacing: 3px"><h6>MyPage</h6></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>