<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.item, .price{position: relative; float: left;}
</style>
</head>
<script type="text/javascript">

</script>
<%@include file="../include/header.jsp"%>
<body>
	<h2>주문내용</h2>
	<div class=field1>
		<div class=item>	
			<table border="1">
				<tr style="width: 20px;">
					<td>상품정보</td><td>수량</td><td>가격</td><td>배송비</td>
				</tr>
				<tr>
					 
					<td>
					<img src="${pageContext.request.contextPath}/resources/upload/${item.fileName}">
					${itemName}
					</td><td>${count}</td><td>${price}</td><td>3000</td>
				</tr>
			</table>
		</div>	
		<div class=price>
			<p>
				상품 합계 : ${price}
			</p>
			<p>
				배송비 : 3000
			</p>
			<p>
				총 합계: 
			</p>
		</div>
	</div>
	<div class=field2>
		<div class=memberInfo style="position: relative;">
				<form action="itemOrderDO" method="post">
					<input type="hidden" name="count" value="${count}">								
					<input type="hidden" name="itemIdx" value="${itemIdx}">								
					<input type="hidden" name="itemName" value="${itemName}">								
					<input type="hidden" name="userId" value="${member.userId}">								
					<input type="hidden" name="userName" value="${member.userName}">
					<input type="hidden" name="itemidx" value="${itemIdx}">
					<input type="hidden" name="price" value="${price}">								
				<p>
					<label for="addressNum">우편번호</label><br/>
					<input type="text" id="addressNum" name="addressNum"><br/>
				</p>
				<p>
					<label for="address">주소</label><br/>
					<input type="text" id="address" name="address"><br/>
				</p>
				<p>
					<label for="phoneNum">연락처</label><br/>
					<input type="text" id="phoneNum" name="phoneNum"><br/>
				</p>
				<p>
					<label for="email">이메일</label><br/>
					<input type="text" id="email" name="email"><br/>
				</p>
				<p>
					<label for="request">요청사항</label><br/>
					<input type="text" id="request" name="request"><br/>
				</p>
				<p>
					<input type="submit" value="결제하기">
				</p>
			</form>
		</div>
	</div>
<%@include file="../include/footer.jsp"%>
</body>
</html>