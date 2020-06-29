<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

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
		            <img src="${pageContext.request.contextPath}/resources/upload/s/s_${item.fileName}"height="430px" width="430px" 
		            style="border: 1px solid black;">
		            <!--   신상옷의 각각의 제목 적는 곳  -->
		            <br>
	    	        <span class="itemName">${item.name}</span>
	    	        <br>
	            	<span>${item.price}원</span>
	        	 </a>
		      </li>
	  	 </ul>
		</c:forEach>
</div>
<br><br><br>
<div class=pagingBtn style="position: relative; left : 45%;">
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
<%@include file="../include/footer.jsp"%>
</body>
</html>