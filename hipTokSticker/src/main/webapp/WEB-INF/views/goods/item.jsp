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

<style type="text/css">

.paging_container{
position: relative; 
left : 50%;
transform: translate(-50%);
background-color: yellow;
height: 50px;
width: 700px;
}
.paging_box{
	position: absolute;
	max-width:423px;
	left: 50%;
	transform: translate(-50%);
	background-color: red;
}
</style>

</head>
<body>
<%@include file="../include/header.jsp"%>
<br><br><br><br><br><br><br><br><br><br><br>
						
<h2 style="position: relative; left: 47%">item</h2>
<br><br>
<div style="position: relative; left:7%">			
		<c:forEach var="item" items="${itemList.itemList}">
		   <ul class="ItemUL">
		      <li style="font-size: 17px; width: 500px; height: 400px;">
		         <a href="goodsContentGO?idx=${item.idx}">
		            <!--   img태그에 넣고싶은 사진 넣기   -->
					<c:if test="${item.stock == 0 }">
		             <img 
		            src="${pageContext.request.contextPath}/resources/upload/s/s_${item.fileName}"height="430px" width="430px" 
		            style="border: 1px solid black; opacity: 0.4;"> 
		            <br>
	    	        <span class="itemName">${item.name} (품절입니다 ㅠㅠ)</span>
					</c:if>	      
					<c:if test="${item.stock != 0 }">
		            <img 
		            src="${pageContext.request.contextPath}/resources/upload/s/s_${item.fileName}"height="430px" width="430px" 
		            style="border: 1px solid black;"> 
		            <br>
	    	        <span class="itemName">${item.name}</span>
					</c:if>	      
	    	        <br>
	            	<span>${item.price}원</span>
	        	 </a>
		      </li>
	  	 </ul>
		</c:forEach>
</div>
<br><br><br>
<div class=paging_container>
	<div class=paging_box>
		<!-- 처음으로, 10페이지 앞으로 -->
		<c:if test="${itemList.startPage > 1}">
			<input type="button" value="＜＜" onclick="location.href='?currentPage=1'" title="첫 페이지로 이동합니다."/>
			<input type="button" value="＜" 
					onclick="location.href='?currentPage=${itemList.startPage - 1}'" 
					title="이전 10 페이지로 이동합니다."/>
		</c:if>
		
		<c:if test="${itemList.startPage <= 1}">
			<input type="button" value="＜＜" disabled="disabled" title="이미 첫 페이지 입니다."/>
			<input type="button" value="＜" disabled="disabled" title="이전 10 페이지가 없습니다."/>
		</c:if>
	<!-- 페이지 이동 -->
    <c:forEach var="i" begin="${itemList.startPage}" end="${itemList.endPage}" step="1">
    
       <c:if test="${i == itemList.currentPage}">
          <input type="button" value="${i}" disabled="disabled"/>
       </c:if>
       
       <c:if test="${i != itemList.currentPage}">
          <input type="button" value="${i}" onclick="location.href='?currentPage=${i}'"  style="border: none; color: white; background-color: green;"
             title="${i}페이지로 이동합니다."/>
       </c:if>
    </c:forEach>
    <!-- 마지막으로, 10페이지 뒤로 -->
		<c:if test="${itemList.endPage < itemList.totalPage}">
			<input type="button" value="＞"  
					onclick="location.href='?currentPage=${itemList.endPage + 1}'" title="다음 10 페이지로 이동합니다."/>
			<input type="button" value="＞＞" 
					onclick="location.href='?currentPage=${itemList.totalPage}'" title="마지막 페이지로 이동합니다."/>
		</c:if>

		<c:if test="${itemList.endPage >= itemList.totalPage}">
				<input type="button" value="＞" disabled="disabled" title="다음 10 페이지가 없습니다."/>
			<input type="button" value="＞＞" disabled="disabled" title="이미 마지막 페이지 입니다."/>
		</c:if>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
</body>
</html>