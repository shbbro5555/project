<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
<style>
.memberInfo{background: white; margin-left: 30%;}
.text{
  width: 20%;
  padding: 8px 10px;
  margin: 5px 0;
  box-sizing: border-box;
  border: 2px solid green;
}

</style>
</head>

<body>
	<%@include file="../include/header.jsp"%>
	<div class="memberInfo">
		<h1>회원정보</h1>
		
		<form action="memberOutGO" method="post">
				<p>
					<label for="userId">아이디</label><br/>
					<input class="text" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"><br/>
				</p>
				<p>
					<label for="userEmail">이메일</label><br/>
					<input class="text" type="email" id="userEmail" name="userEmail" value="${member.userEmail}" readonly="readonly">
				</p>
				<p>
					<label for="userName">이름</label><br/>
					<input class="text" type="text" id="userName" name="userName" value="${member.userName} " readonly="readonly">
				</p>
				<p>
					<label for="userPhoneNumber">휴대폰 번호</label><br/>
					<input class="text" type="tel" id="userPhoneNumber" name="userPhoneNumber" value="${member.userPhoneNumber}" readonly="readonly">
				</p>
				<p>
					<label for="userAddress">주소</label><br/>
					<input class="text" type="text" id="userAddress" name="userAddress" value="${member.userAddress}" readonly="readonly">
				</p>
				<p>
					<label for="userRegidate">가입일</label><br/>
					<input class="text" type="text" id="userRegidate" name="userRegidate" value="${userRegidate}" readonly="readonly">
				</p>
				<p>
					<input type="submit" value="탈퇴하기">
				</p>
		</form>
		<form action="memberModifyGO">
		<input type="submit" value="수정하기" >
		</form>
	</div>
	<div class=order>
		<h1>내가 쓴 글</h1>
	<table>
			<c:forEach var="qna" items="${MyWrite.qnaList}">
			<tr>
				<td width="500" style="font-size: 12px;"><a href="QnAContentGO?idx=${qna.idx}">${qna.title}(${qna.commentNumber})</a></td>
			</tr>
			</c:forEach>
			<tr>
			<c:if test="${MyWrite.startPage > 1}">
			<input type="button" value="＜＜" onclick="location.href='?currentPage=1&userId=${member.userId}'" title="첫 페이지로 이동합니다."/>
			<input type="button" value="＜" 
					onclick="location.href='?currentPage=${MyWrite.startPage - 1}&userId=${member.userId}'" 
					title="이전 10 페이지로 이동합니다."/>
		</c:if>
		
		<c:if test="${MyWrite.startPage <= 1}">
			<input type="button" value="＜＜" disabled="disabled" title="이미 첫 페이지 입니다."/>
			<input type="button" value="＜" disabled="disabled" title="이전 10 페이지가 없습니다."/>
		</c:if>
	<!-- 페이지 이동 -->
    <c:forEach var="i" begin="${MyWrite.startPage}" end="${MyWrite.endPage}" step="1">
    
       <c:if test="${i == MyWrite.currentPage}">
          <input type="button" value="${i}" disabled="disabled"/>
       </c:if>
       
       <c:if test="${i != MyWrite.currentPage}">
          <input type="button" value="${i}" onclick="location.href='?currentPage=${i}&userId=${member.userId}'"  style="border: none; color: white; background-color: green;"
             title="${i}페이지로 이동합니다."/>
       </c:if>
    </c:forEach>
    <!-- 마지막으로, 10페이지 뒤로 -->
		<c:if test="${MyWrite.endPage < MyWrite.totalPage}">
			<input type="button" value="＞"  
					onclick="location.href='?currentPage=${MyWrite.endPage + 1}&userId=${member.userId}'" title="다음 10 페이지로 이동합니다."/>
			<input type="button" value="＞＞" 
					onclick="location.href='?currentPage=${MyWrite.totalPage}&userId=${member.userId}'" title="마지막 페이지로 이동합니다."/>
		</c:if>

		<c:if test="${MyWrite.endPage >= MyWrite.totalPage}">
				<input type="button" value="＞" disabled="disabled" title="다음 10 페이지가 없습니다."/>
			<input type="button" value="＞＞" disabled="disabled" title="이미 마지막 페이지 입니다."/>
		</c:if>
			</tr>
	</table>			
		
		<h2>주문목록</h2>
		<table border="1">
			<tr>
				<td>상품이름</td>
				<td>갯수</td>
				<td>결제금액</td>
			</tr>
			<tr>
				<td></td>
				<td>${order.price }</td>
				<td></td>
			</tr>
		</table>
	</div>
	<%@include file="../include/footer.jsp"%>
</body>
</html>



