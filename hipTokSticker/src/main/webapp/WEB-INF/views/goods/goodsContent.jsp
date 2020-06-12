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
<script type="text/javascript">
var count = 0;
	$(document).on('click', '#decreaseBtn', function(){
		count = count--;
		return count;
	});
	$(document).on('click', '#increaseBtn', function(){
		count = count++;
		alert("증가");
		return count;
	});

</script>
<body>
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
	<h2>리뷰</h2><input type="button" value = "상품 리뷰 작성하기">
	<table border="1">
		<tr>
			<td>제목</td><td>평점</td><td>작성자</td><td>등록일</td>
		</tr>
		<tr>
			<td>review.title</td><td>review.star</td><td>review.userId</td><td>review.regidate</td>
		</tr>
	</table>
</div> <br>
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
