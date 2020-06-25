<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var pri

</script>
<%@include file="../include/header.jsp"%>
<body>
		<h2>주문내용</h2>
		
		<table border="1">
			<tr style="width: 20px;">
				<td>상품정보</td><td>수량</td><td>가격</td><td>배송비</td>
			</tr>
			<tr>
				<td>${item_name}</td><td>${count}</td><td>${price}</td><td>3000</td>
			</tr>
			
			
		</table>	
			결제할금액 : 
<%@include file="../include/footer.jsp"%>
</body>
</html>