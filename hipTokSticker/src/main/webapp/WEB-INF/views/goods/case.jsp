<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
.NewTitle{
   text-align: center;
   font-weight: normal;
   letter-spacing: 10px;
   margin-bottom: 40px;
}
.ItemUL{}
.ItemUL li{
   float: left;
   margin-right: 2%;
   width: 32%;
   padding: 5px;
   box-sizing: border-box;
}
.ItemUL li:nth-child(3n){
   margin-right: 0;
}
.ItemUL a{
   width: 100%;
   color: inherit;
   text-decoration: none;
}
.ItemUL a img{
   width: inherit;
   height: 350px;
}
.ItemUL a .itemName{
   display: block;
   margin: 10px 0;
}

.ItemUL .color span{
   display: inline-block;
   font-size: 0;
   line-height: 0;
   width: 12px;
   height: 12px;
}


/*   new아이콘 부분 사이즈 조절은 알아서 바꿔도 됨   */
.ItemUL .newIcon{
   border: 1px solid;
   display: inline-block;
   margin: 15px 0;
   padding: 3px 10px;
}

li{list-style: none; font-family: font-family: 'Noto Sans JP', sans-serif; font-size: 30px;}
a{text-decoration: none}


.product_listmain {
    margin: 0px 0 37px;
    border-bottom: 0px solid #eee;
}
.product_listmain ul.prdList {
    display: table;
    width: 140%;
    margin: 0 auto;
    margin-left: 0px;
    font-size: 0;
    line-height: 0;
    text-align: left;
}
.product_listmain ul.column3 li.item {
    width: 33.3%;
}
.product_listmain ul.column3 li.item .box {
    width: 90%;
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
					<img style="vertical-align: middle; width: 162px; height: 65px;" src="${pageContext.request.contextPath }/resources/images/logo.jpg">
				</a>
			</h1>
			<div class="category">
				<ul>
					<li>
						<a href="homeGO" style="color:black; letter-spacing: 3px"><h6>Main</h6></a>
					</li>
					<li>
						<a href="CaseGO" style="color:black; letter-spacing: 3px"><h6>Case</h6></a>
					</li>
					<li>
						<a href="PouchGO" style="color:black; letter-spacing: 3px"><h6>Pouch</h6></a>
					</li>
					<li>
						<a href="StickerGO" style="color:black; letter-spacing: 3px"><h6>Sticker</h6></a>
					</li>
				</ul>
				<br/>
				<ul>	
				</ul>
			</div>
		</div>
		
		<!-- 오른쪽 틀 -->
		<div id="right">
			<div id="rightTop">
			
			</div>
			<div id="right_menu">
				<ul>
					<c:if test="${name == null}">
						<li><a href="login" style="color:black"><h6>Login</h6></a></li>
					</c:if>
					<c:if test="${name != null}">
						<%session.invalidate();%>
						<li><a href="home" style="color:black"><h6>Logout</h6></a></li>
					</c:if>
					<li><a href=""  style="color:black; letter-spacing: 3px"><h6>Order</h6></a></li>
					
				</ul>
			</div>
		</div>
		
		<!-- 가운대 틀 -->
		<div id="contents">
			<div class="sub_contents_inner">
				<div class="contents_inner">
					<!-- Pouch -->
					<div id="Item">
					   <h2 class="NewTitle" style="font-family: font-family: 'Noto Sans JP', sans-serif;">Case</h2>
					   <ul class="ItemUL">
					      <li style="font-size: 17px;">
					         <a href="#">
					            <!--   img태그에 넣고싶은 사진 넣기   -->
					            <img src="${pageContext.request.contextPath }/resources/images/airpotcase.PNG" alt="Hoodie01">
					            <!--   신상옷의 각각의 제목 적는 곳  -->
					            <span class="itemName">에어팟 케이스</span>
					         </a>
					         <p class="price">
					          
					            <span>4,300won</span>
					         </p>
					      </li>
					
					       <li style="font-size: 17px;">
					         <a href="#">
					            <img src="${pageContext.request.contextPath }/resources/images/PhoneCase.PNG" alt="Sweatshirt02">
					            <span class="itemName">시스루 몽글 폰케이스</span>
					         </a>
					         <p class="price">
					            <span style="text-decoration: line-through; margin-right: 10px; ">18,000won</span>
					            <span>15,000won</span>
					         </p>
					      </li>
					
					     
					      <li style="font-size: 17px;">
					         <a href="#">
					            <img src="${pageContext.request.contextPath }/resources/images/wellsiPhoneCase.PNG" alt="bag01">
					            <span class="itemName">웰시코기 폰케이스</span>
					         </a>
					         <p class="price">
					             <span style="text-decoration: line-through; margin-right: 10px; ">18,000won</span>
					            <span>11,000won</span>
					         </p>
					      </li>
					
					      <li style="font-size: 17px;">
					         <a href="#">
					            <img src="${pageContext.request.contextPath }/resources/images/Phonetok.PNG" alt="bag01">
					            <span class="itemName">베어톡 </span>
					         </a>
					         <p class="price">
					            <span style="text-decoration: line-through; margin-right: 10px; ">4,500won</span>
					            <span>3,000won</span>
					         </p>
					         <p class="newIcon">NEW</p>
					      </li>
					
					     
					
					    
					   </ul>
					</div>					
						
						
								
				</div>
				
			</div>
		</div>
	</div>
</div>

</body>
</html>