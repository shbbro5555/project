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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
//메뉴 상단고정
$(document).ready(function(){
    var jbOffset = $('.menuField').offset();
    $(window).scroll(function() {
      if ($(document).scrollTop() > jbOffset.top) {
        $('.menuField').addClass('fixed');
      }
      else {
        $('.menuField').removeClass('fixed');
      }
    });
});
//	리뷰작성 버튼
	$(document).on('click', '#reviewBtn', function(){
		if('${member}'==""){
			var result=confirm("로그인창으로 가시겠습니까?");
		}
		if (result) {
			location.href="loginGO";
		}
		if('${member}'!=""){
			goodsReviewGOForm.submit();
		}
	});
//	QnA작성 버튼
	$(document).on('click', '#QnABtn', function(){
		if('${member}'==""){
			var result=confirm("로그인창으로 가시겠습니까?");
		}
		if (result) {
			location.href="loginGO";
		}
		if('${member}'!=""){
			goodsQnAGOForm.submit();
		}
	});
//	상품 개수조절
     $(document).ready(function(){
    	var count = 0;
    	var price = 0;
    	document.order_form.count.value=count;
    	document.order_form.price.value=price;
    	if($(document).on('click', '#decreaseBtn', function(){
    		if(count < 1){
    			alert("수량은 0개이하로 설정할 수 없습니다.");
    		}
    		else{
    			count = count - 1;
    			price = price - parseInt('${item.price}');
    			document.order_form.count.value=count;
    			document.order_form.price.value=price;
    		}
    	}));
    	
    	if($(document).on('click', '#increaseBtn', function(){
    		count = count + 1;
    		price = price + parseInt('${item.price}');
    		document.order_form.count.value=count;
    		document.order_form.price.value=price;
	   	}));
//	주문버튼
		$(document).on('click', '#orderBtn', function(){
			if('${member}'==""){
				var result=confirm("로그인창으로 가시겠습니까?");
			}
			if (result) {
				location.href="loginGO";
			}
			if('${member}'!=""){
				if(document.order_form.count.value == "0"){
					alert ("수량을 설정해주세요")
				}
				if(document.order_form.count.value != "0"){
					if(confirm("구매 하시겠습니까?") == true){
						order_form.submit();
					}
				}
			}
		});
//	장바구니 버튼
		$(document).on('click', '#cartBtn', function(){
			if('${member}'==""){
				var result=confirm("로그인창으로 가시겠습니까?");
			}
			if (result) {
				location.href="loginGO";
			}
			if('${member}'!=""){
				if(document.order_form.count.value == "0"){
					alert ("수량을 설정해주세요")
				}
				if(document.order_form.count.value != "0"){
					if(confirm("장바구니에 담겠습니까?") == true){
						cartForm.submit();// 카트폼 만들기
					}
				}
			}
		});	
     });
</script>
<style>

.menuField{
	text-align: center;
    background-color: yellow;
    padding: 10px 0px;
    width: 50%; 
}
.fixed{
	position: fixed;
	top: 0px;
}
.imgField,.goodsField{
	float: left;
	top: 250px;
	box-sizing: border-box;
}

</style>
<body>
<%@include file="../include/Header.jsp"%>

<div class=wrap>

<div class=topField>
	<input type="text" value="${item.name}" readonly="readonly"style="position: absolute; left:38%; top:50%; text-align: center; font-size:35px;border:0;">
	<div class=imgField style="position:relative; left:18%;">
		<img src="${pageContext.request.contextPath}/resources/upload/${item.fileName}" height="550px" width="550px" border="1">
	</div>
	<div class=goodsField style="position:relative; left: 40%;">
		<table>
			<tr>
				<td>상품명 :${item.name}</td>
			</tr> 
			<tr>
				<td>가격 :${item.price}</td>
			</tr> 
			<tr>
				<td>배송방법 : 택배</td>
			</tr>
			<tr>
				<td>배송비: 3000원</td>
			</tr>
		</table>
			<form action="orderFormGO" name="order_form">
				<input type="button" value="-" id="decreaseBtn"> 
				수량 : <input type="text" name="count" id="count" style="width: 25px; text-align:center;" readonly="readonly" value="">
				<input type="button" value="+" id="increaseBtn">
				금액 : <input type="text" name="price" style="width: 200px; text-align:left; border: 0; " readonly="readonly" value="">
				<input type="hidden" name="item_name" value="${item.name}">
				<input type="hidden" name="idx" value="${item.idx}">
				<br>
				<input type="button" value="구매하기" id="orderBtn"> 
			</form>	
			<form action="shoppingCartGO" name="cartForm">
				<input type="hidden" name="count" value="">
				<input type="hidden" name="price" value="">
				<input type="hidden" name="item_name" value="${item.name}">
				<input type="hidden" name="idx" value="${item.idx}">
				<input type="button" value="장바구니 담기" id="cartBtn"> 
			</form>	
				<input type="button" value="♥">
	</div>
</div>		

<div id=bottomField>

<div class="menuField">
	<table>
		<tr>
			<td><h3><a href="#contentField">상품 정보</a></h3></td>
			<td><h3><a href="#reviewField">리뷰</a></h3></td>
			<td><h3><a href="#QnAField">QnA</a></h3></td>
		</tr>
	</table>
</div>
<div id="contentField">
===============================================================================<h2>상품 정보</h2><br>
	${item.content }<br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	123123123213
	12312312
	<br>
===============================================================================<br>
</div>
<div id="reviewField">
	<h2>리뷰</h2>
		<form action="goodsReviewWriteGO" method="get" id="goodsReviewGOForm">
			<input type="hidden" value="${item.idx}" name="idx">
			<input type="button" value="상품 리뷰 작성하기" id="reviewBtn">
		</form>
		
	<table border="1">
			<tr>
				<td>등록일</td>
				<td>평점</td>
				<td>제목</td>
				<td>작성자</td>
			</tr>
		<c:forEach var="review" items="${reviewList.reviewList}">
			<tr>
				<td><fmt:formatDate value="${review.regidate}" pattern="yyyy.MM.dd(E) HH:MM"></fmt:formatDate></td>
				<td>${review.rating}</td>
				<td>
					<a onclick="window.open('goodsReviewContentGO?idx=${review.idx}','window팝업',
					'width=800, height=700, menubar=no, status=no, toolbar=no, left=500, top=100');">${review.title}</a>
				</td>
				<td>${review.userId}</td>
				
			</tr>
		</c:forEach>
		
	</table>
	<!-- 처음으로, 10페이지 앞으로 -->
		<c:if test="${reviewList.startPage > 1}">
			<input type="button" value="＜＜" onclick="location.href='?currentPage=1'" title="첫 페이지로 이동합니다."/>
			<input type="button" value="＜" 
					onclick="location.href='?currentPage=${reviewList.startPage - 1}'" 
					title="이전 10 페이지로 이동합니다."/>
		</c:if>
		
		<c:if test="${reviewList.startPage <= 1}">
			<input type="button" value="＜＜" disabled="disabled" title="이미 첫 페이지 입니다."/>
			<input type="button" value="＜" disabled="disabled" title="이전 10 페이지가 없습니다."/>
		</c:if>
	<!-- 페이지 이동 -->
    <c:forEach var="i" begin="${reviewList.startPage}" end="${reviewList.endPage}" step="1">
    
       <c:if test="${i == reviewList.currentPage}">
          <input type="button" value="${i}" disabled="disabled"/>
       </c:if>
       
       <c:if test="${i != reviewList.currentPage}">
          <input type="button" value="${i}" onclick="location.href='?currentPage=${i}'"  style="border: none; color: white; background-color: green;"
             title="${i}페이지로 이동합니다."/>
       </c:if>
    </c:forEach>
    <!-- 마지막으로, 10페이지 뒤로 -->
		<c:if test="${reviewList.endPage < reviewList.totalPage}">
			<input type="button" value="＞"  
					onclick="location.href='?currentPage=${reviewList.endPage + 1}'" title="다음 10 페이지로 이동합니다."/>
			<input type="button" value="＞＞" 
					onclick="location.href='?currentPage=${reviewList.totalPage}'" title="마지막 페이지로 이동합니다."/>
		</c:if>

		<c:if test="${reviewList.endPage >= reviewList.totalPage}">
				<input type="button" value="＞" disabled="disabled" title="다음 10 페이지가 없습니다."/>
			<input type="button" value="＞＞" disabled="disabled" title="이미 마지막 페이지 입니다."/>
		</c:if>
	</div>
<br>
================================================================================<br>
<div id="QnAField">
	<h2>QnA</h2>
	<form action="goodsQnAWriteGO" method="get" id="goodsQnAGOForm">
		<input type="hidden" value="${item.idx}" name="idx">
		<input type="button" value="상품 문의하러 가기" id="QnABtn">
	</form>
	<table border="1">
			<tr>
				<td>등록일</td>
				<td>제목</td>
				<td>작성자</td>
			</tr>
		<c:forEach var="QnA" items="${QnAList.goodsQnAList}">
			<tr>
				<td><fmt:formatDate value="${QnA.regidate}" pattern="yyyy.MM.dd(E) HH:MM"></fmt:formatDate></td>
				<td>
					<a onclick="window.open('goodsReviewContentGO?idx=${QnA.idx}','window팝업',
					'width=800, height=700, menubar=no, status=no, toolbar=no, left=500, top=100');">${QnA.title}</a>
				</td>
				<td>${QnA.userId}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 처음으로, 10페이지 앞으로 -->
		<c:if test="${QnAList.startPage > 1}">
			<input type="button" value="＜＜" onclick="location.href='?currentPage=1'" title="첫 페이지로 이동합니다."/>
			<input type="button" value="＜" 
					onclick="location.href='?currentPage=${QnAList.startPage - 1}'" 
					title="이전 10 페이지로 이동합니다."/>
		</c:if>
		
		<c:if test="${QnAList.startPage <= 1}">
			<input type="button" value="＜＜" disabled="disabled" title="이미 첫 페이지 입니다."/>
			<input type="button" value="＜" disabled="disabled" title="이전 10 페이지가 없습니다."/>
		</c:if>
	<!-- 페이지 이동 -->
    <c:forEach var="i" begin="${QnAList.startPage}" end="${QnAList.endPage}" step="1">
    
       <c:if test="${i == QnAList.currentPage}">
          <input type="button" value="${i}" disabled="disabled"/>
       </c:if>
       
       <c:if test="${i != QnAList.currentPage}">
          <input type="button" value="${i}" onclick="location.href='?currentPage=${i}'"  style="border: none; color: white; background-color: green;"
             title="${i}페이지로 이동합니다."/>
       </c:if>
    </c:forEach>
    <!-- 마지막으로, 10페이지 뒤로 -->
		<c:if test="${QnAList.endPage < QnAList.totalPage}">
			<input type="button" value="＞"  
					onclick="location.href='?currentPage=${QnAList.endPage + 1}'" title="다음 10 페이지로 이동합니다."/>
			<input type="button" value="＞＞" 
					onclick="location.href='?currentPage=${QnAList.totalPage}'" title="마지막 페이지로 이동합니다."/>
		</c:if>

		<c:if test="${QnAList.endPage >= QnAList.totalPage}">
				<input type="button" value="＞" disabled="disabled" title="다음 10 페이지가 없습니다."/>
			<input type="button" value="＞＞" disabled="disabled" title="이미 마지막 페이지 입니다."/>
		</c:if>
</div>

</div>

</div>
</body>
