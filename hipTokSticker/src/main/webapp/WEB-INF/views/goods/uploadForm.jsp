<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>


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
a{text-decoration: none}
 
</style>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>

<script>
function goWrite(frm) {
	var title = frm.title.value;

	var content = frm.content.value;
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	
	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>

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
						<a href="Pouch" style="color:black; letter-spacing: 3px"><h6>Pouch</h6></a>
					</li>
					<li>
						<a href="Sticker" style="color:black; letter-spacing: 3px"><h6>Sticker</h6></a>
					</li>
					<li>
						<a href="Case" style="color:black; letter-spacing: 3px"><h6>Case</h6></a>
					</li>
				</ul>
				<br/>
				<ul>	
					<li>
						<a href="" style="color:black; letter-spacing: 3px"><h6>REVIEW</h6></a>
					</li>
					<li>
						<a href="list" style="color:black; letter-spacing: 3px"><h6>NOTICE</h6></a>
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
						<li><a href="home" style="color:black"><h6>Logout</h6></a></li>
					</c:if>
					<li><a href=""  style="color:black; letter-spacing: 3px"><h6>Order</h6></a></li>
					<li><a href="myPage"  style="color:black; letter-spacing: 3px"><h6>MyPage</h6></a></li>
				</ul>
			</div>
		</div>
		
		<!-- 가운대 틀 -->
		<div id="contents">
			<div class="sub_contents_inner">
				<div class="contents_inner">
					<!-- Center TOP -->
					<div id="Item">
					    <h2 class="Title" style="font-family: font-family: 'Noto Sans JP', sans-serif;">상품 등록 </h2>
					   		<div style="width: 60%; margin: auto;">
								<form action="uploadForm" id="form1" method="POST" enctype="multipart/form-data" action="requestupload2">
								 	<table>
								 		<tr>
									        <td>상품 이름 :</td> 
									        <td><input type="text" name="gdsName" /></td>
									    </tr>
									    <tr>    
									        <td>가격 :</td> 
									        <td><input type="text" name="gdsPrice" /></td>
									    </tr>
									    <tr>
									        <td>재고량 :</td>
									        <td><input type="text" name="gdsStock" /></td>
								       	</tr>
								       	  <tr>
									        <td>주문 순서</td>
									        <td><input type="text" name="gdsDes" /></td>
								       	</tr>
								       	  <tr>
									        <td>주문 날짜 :</td>
									        <td><input type="text" name="register_date" /></td>
								       	</tr>
								       	  <tr>
									        <td>상품설명 :</td>
									        <td><input type="text" name="goods_value" /></td>
								       	</tr>
									    <tr>    
									        <td>
								        </tr>
								        <tr>
								        	<td>카테고리 :</td>
								        	<td> 
								        		<select name="category">
										        	<option>선택해 주세요.</option>
										        	<option value="Sticker">스티커</option>
										        	<option value="Case">케이스</option>
										        	<option value="Pouch">파우치</option>
								       			</select>
								        	</td>
								        </tr>
								        
								        <tr>
									        <td>
										        <!-- <input type="file" name="file" />
										        <input type="submit"/> -->
										        <input type="file" name="file" />
								     			   <input type="submit" value="전송" />
									        </td>
								     	</tr>
								       <!--  <input type="hidden" value="${ savedFileName }" name="name"> -->
									</table>
							    </form>
							 	  	<h6>저장된 상품이름 : ${ savedFileName }</h6>
						</div>
					</div>					
				</div>
				
			</div>
		</div>
	</div>
</div>
</body>
</html>