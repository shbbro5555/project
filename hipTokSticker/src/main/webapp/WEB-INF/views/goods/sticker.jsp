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
<%@include file="../include/header.jsp"%>
<div id="wrap">
	<div id="container">
		<!-- 가운대 틀 -->
		<div id="contents">
			<div class="sub_contents_inner">
				<div class="contents_inner">
					<!-- Pouch -->
					<div id="Item">
					   <h2 class="NewTitle" style="font-family: font-family: 'Noto Sans JP', sans-serif;">Sticker</h2>
					   <ul class="ItemUL">
					      <li style="font-size: 17px;">
					         <a href="#">
					            <!--   img태그에 넣고싶은 사진 넣기   -->
					            <img src="${pageContext.request.contextPath }/resources/images/longSticker1.PNG" alt="Hoodie01">
					            <!--   신상옷의 각각의 제목 적는 곳  -->
					            <span class="itemName">기다란 스티커</span>
					         </a>
					         <p class="price">
					          
					            <span>4,300won</span>
					         </p>
					      </li>
					
					           <li style="font-size: 17px;">
					         <a href="#">
					            <img src="${pageContext.request.contextPath }/resources/images/sticker2.PNG" alt="shoes01">
					            <span class="itemName">큰곰 </span>
					         </a>
					         <p class="price">
					            <span style=" margin-right: 10px; ">4,000won</span>
					         </p>
					         <p class="newIcon">NEW</p>
					      </li>
					
					     
					        <li style="font-size: 17px;">
					         <a href="#">
					            <img src="${pageContext.request.contextPath }/resources/images/sticker3.PNG" alt="denim01">
					            <span class="itemName">레인보우 스티커</span>
					         </a>
					         <p class="price">
					            <span style=" margin-right: 10px; ">3,000won</span>
					         </p>
					         <p class="newIcon">NEW</p>
					      </li>
					
					            <li style="font-size: 17px;">
					         <a href="#">
					            <img src="${pageContext.request.contextPath }/resources/images/tape.PNG" alt="denim01">
					            <span class="itemName">과일 테이프  스티커</span>
					         </a>
					         <p class="price">
					            <span style=" margin-right: 10px; ">3,000won</span>
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
<%@include file="../include/footer.jsp"%>
</body>
</html>