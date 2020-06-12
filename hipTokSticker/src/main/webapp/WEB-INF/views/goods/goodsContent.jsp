<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).on('click', '#decreaseBtn', function(){
		
	}

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
			<input type="button" value="-" id="decreaseBtn"> 수량: x <input type="button" value="+" id="increaseBtn"> y원
			<br>
			<input type="button" value="구매하기"> <input type="button" value="장바구니"> <input type="button" value="♥"> 
</div>


</body>
</html>