<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../include/Header.jsp"%>
<div>
	<form action="goodsReviewWriteDO" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${member.userId}" name="userId">
			<input type="hidden" value="${idx}" name="main_idx">
		<table>
			<tr>
				<td>제목 : <input type="text" name="title"></td> 
				<td>
					별점:
					<select name="rating">
			        	<option>선택해주세요</option>
			        	<option value="1">★</option>
			        	<option value="2">★★</option>
			        	<option value="3">★★★</option>
			        	<option value="4">★★★★</option>
			        	<option value="5">★★★★★</option>
		       		</select>
		       	</td>
			</tr>
			<tr>
				<td>내용 : <textarea cols="100" name="content" ></textarea></td>
			</tr>
		</table>
		<div class="inputArea">
			 <label for="file">이미지</label>
			 <input type="file" id="file" name="file" />
			 <div class="select_img"><img src="" /></div>
		 
			 <script>
				  $("#file").change(function(){
				   if(this.files && this.files[0]) {
		 		   var reader = new FileReader;
		 		   reader.onload = function(data) {
		 		    $(".select_img img").attr("src", data.target.result).width(500);        
			    }
		  		  reader.readAsDataURL(this.files[0]);
				   }0.
				  });
			</script>
		</div>
		<input type="submit" value="등록하기">
	</form>
</div>
</body>
</html>