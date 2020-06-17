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

	$(document).on('click', '#reviewBtn', function(){
		if('${member}'==""){
			alert("로그인해주세요");
		}
		if('${member}'!=""){
			goodsReviewGOForm.submit();
		}
	});
</script>
<body>
<%@include file="../include/Header.jsp"%>
상품설명

${item.name}
${item.price}
${item.value1}
${item.value2}
<div>
	<img src="${pageContext.request.contextPath}/resources/upload/${item.fileName}">
	<table style="position: relative; left 60%;">
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
		<tr>
		</tr>
	</table>
			<input type="button" value="-" id="decreaseBtn"> 수량: ${count}
			<input type="button" value="+" id="increaseBtn"> y원
			<br>
			<input type="button" value="구매하기"> <input type="button" value="장바구니"> <input type="button" value="♥"> 
</div>

<div>
	<table>
		<tr>
			<td><h3><label for="contentField">상품 정보</label></h3></td>
			<td><h3><label for="reviewField">리뷰</label></h3></td>
			<td><h3><label for="QnAField">QnA</label></h3></td>
		</tr>
	</table>
</div>
<div id="contentField">
===============================================================================<h2>상품 정보</h2><br>
	${item.content }<br>
===============================================================================<br>
</div>
<div id="reviewField">
	<h2>리뷰</h2>
		<form action="goodsReviewGO" method="get" id="goodsReviewGOForm">
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
					<a href="#" onclick="window.open('reviewContentGO?idx=${review.idx}','window팝업',
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
	<h2>QnA</h2><input type="button" value = "상품 문의">
	<table border="1">
		<tr>
			<td>제목</td><td>작성자</td><td>등록일</td>
		</tr>
		<tr>
			<td>QnA.title</td><td>QnA.userId</td><td>QnA.regidate</td>
		</tr>
	</table>
</div>

</body>
