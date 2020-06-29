<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
html, body { width: 100%; height: 100%; }
.buttonField{
	position: absolute;
	left: 38%
}
.ListTable {
  width: 1200px; height: 160px;
  position: absolute; 
  left:50%; top:50%; 
  margin-left: -600px; margin-top: -80px;
  border-collapse: collapse;
  border-top: 3px solid #168;
}  
.ListTable th {
  color: #168;
  background: #f0f6f9;
  text-align: center;
}
.ListTable th, .ListTable td {
  padding: 10px;
  border: 1px solid #ddd;
}
.ListTable th:first-child, .ListTable td:first-child {
  border-left: 0;
}
.ListTable th:last-child, .ListTable td:last-child {
  border-right: 0;
}
.ListTable tr td:first-child{
  text-align: center;
}
.ListTable caption{caption-side: bottom; display: none;}

.writeBtn {
	position: absolute;
	right: 19%;
}
.searchForm{
	width: 200px; height: 50px;
	position: absolute; 
	left:20%; top:140%; 
	margin-left: -100px; margin-top: -25px;
}
</style>
<script>

</script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<%@include file="../include/footer.jsp"%>
	<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>

	<h1 style="text-align: center; font-family: ">QnA</h1>
	
	<div class="ListTable">
	<!-- 관리자일때만 QnA에 글을 쓸 수 있음. -->
	<c:if test="${member.kind == 'manager'}">
		<form action="QnAWriteGO" style="text-align: right">
			<input type=submit value="글 쓰기">
		</form>
	</c:if>
	
	<div >
	<table>
		<tr height="32" align="center">
			<td width="100" style="">작성일</td>
			<td width="500">제목</td>
			<td width="50">글쓴이</td>
			<td width="50">조회수</td> 
		</tr>
	</table>
	
	<br><br>
	
	<table>
		<c:forEach var="qna" items="${searchQnA.qnaList}">
				<tr align="center">
					<td width="100" style="font-size: 8px;"><fmt:formatDate value="${qna.regidate}" pattern="yyyy.MM.dd(E) HH:MM"></fmt:formatDate></td>
					<c:if test="${qna.commentNumber == '0'}">
					<td width="500" style="font-size: 12px;"><a href="QnAContentGO?idx=${qna.idx}">${qna.title}</a></td>
					</c:if>
					<c:if test="${qna.commentNumber != '0'}">
					<td width="500" style="font-size: 12px;"><a href="QnAContentGO?idx=${qna.idx}">${qna.title}(${qna.commentNumber})</a></td>
					</c:if>
					<td width="50" style="font-size: 10px;">${qna.writer}</td>
					<td width="10" style="font-size: 8px;">${qna.nov}</td>
				</tr>
		</c:forEach>
	</table>	
	
	</div>

	<br>
	
	<div id="searchForm">
        <form action="search" method="get">
            <select name="searchType" id="searchType">
                <option value="title">제목</option> 
                <option value="content">내용</option>
                <option value="title_content">제목+내용</option>
                <option value="writer">글쓴이</option>
            </select>
            <input type="text" size="20" name="keyWord" id="keyWord">
            <input type="submit" value="검색">
        </form>    
    </div>
    <br><br><br>
    
    
    
    <div class="buttonField">
    <!-- 처음으로, 10페이지 앞으로 -->
		<c:if test="${searchQnA.startPage > 1}">
			<input type="button" value="＜＜" onclick="location.href='?currentPage=1'" title="첫 페이지로 이동합니다."/>
			<input type="button" value="＜" 
					onclick="location.href='?currentPage=${searchQnA.startPage - 1}'" 
					title="이전 10 페이지로 이동합니다."/>
		</c:if>
		
		<c:if test="${searchQnA.startPage <= 1}">
			<input type="button" value="＜＜" disabled="disabled" title="이미 첫 페이지 입니다."/>
			<input type="button" value="＜" disabled="disabled" title="이전 10 페이지가 없습니다."/>
		</c:if>
	<!-- 페이지 이동 -->
    <c:forEach var="i" begin="${searchQnA.startPage}" end="${searchQnA.endPage}" step="1">
    
       <c:if test="${i == searchQnA.currentPage}">
          <input type="button" value="${i}" disabled="disabled"/>
       </c:if>
       
       <c:if test="${i != searchQnA.currentPage}">
          <input type="button" value="${i}" onclick="location.href='?currentPage=${i}&keyWord=${searchQnA.keyWord}&searchType=${searchQnA.searchType}'"  style="border: none; color: white; background-color: green;"
             title="${i}페이지로 이동합니다."/>
       </c:if>
    </c:forEach>
    <!-- 마지막으로, 10페이지 뒤로 -->
		<c:if test="${searchQnA.endPage < searchQnA.totalPage}">
			<input type="button" value="＞"  
					onclick="location.href='?currentPage=${searchQnA.endPage + 1}'" title="다음 10 페이지로 이동합니다."/>
			<input type="button" value="＞＞" 
					onclick="location.href='?currentPage=${searchQnA.totalPage}'" title="마지막 페이지로 이동합니다."/>
		</c:if>

		<c:if test="${searchQnA.endPage >= searchQnA.totalPage}">
				<input type="button" value="＞" disabled="disabled" title="다음 10 페이지가 없습니다."/>
			<input type="button" value="＞＞" disabled="disabled" title="이미 마지막 페이지 입니다."/>
		</c:if>
	</div>
	</div>
</body>
</html>