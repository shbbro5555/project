<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>


<title>Insert title here</title>

<style type="text/css">

#wrap {
    position: relative;
    width: 100%;
    margin: 0 auto;
    padding: 0;
    border: 0px solid #eee;
    border-top: 0;
    border-bottom: 0;
}

#container {
    position: relative;
    float: left;
    width: 100%;
    height: 100%;
    margin: 0 auto;
    *zoom: 1;
    overflow: hidden;
    border-left: 0px solid #eee;
}
/* 가운대 */
#contents {
    position: relative;
    width: 100%;
    max-width: 2000px;
    min-height: 500px;
    margin: 100px auto 20px;
}
.sub_contents_inner {
    width: 80%;
    margin: 0px auto 0;
}
.contents_inner {
    width: 80%;
    margin: 0px auto 0;
}

*{ 
   margin: 0; 
   padding: 0; 
}
ul, ol, li{ 
   list-style: none;
} 

#Item{
   position: relative;
   width: 100%;
   max-width: 2000px;
   margin: 40px auto 50px;
   font-size: 10px;
}

/*   신상품 제목부분 */
.Title{
   text-align: center;
   font-weight: normal;
   letter-spacing: 10px;
   margin-bottom: 40px;
}
.ItemUL{}

/*   new아이콘 부분 사이즈 조절은 알아서 바꿔도 됨   */
.ItemUL .newIcon{
   border: 1px solid;
   display: inline-block;
   margin: 15px 0;
   padding: 3px 10px;
}

li{list-style: none; font-family: font-family: 'Noto Sans JP', sans-serif; font-size: 30px;}
a{text-decoration: none}
 
</style>
</head>
<body>
	<%@include file="../include/header.jsp"%>
<div id="wrap">
	<div id="container">
		<!-- 가운대 틀 -->
		<div id="contents">
			<div class="sub_contents_inner">
				<div class="contents_inner">
					<!-- Center TOP -->
					<div id="Item">
					    <h2 class="Title" style="font-family: font-family: 'Noto Sans JP', sans-serif;">상품 등록 </h2>
					   		<div style="width: 60%; margin: auto;">
								<form action="uploadFormDO" id="form1" method="POST" enctype="multipart/form-data" action="requestupload2">
								 	<table>
								 		<tr>
									        <td>상품 이름 :</td> 
									        <td><input type="text" name="name" /></td>
									    </tr>
									    <tr>    
									        <td>가격 :</td> 
									        <td><input type="text" name="price" /></td>
									    </tr>
									    <tr>
									        <td>재고량 :</td>
									        <td><input type="text" name="stock" /></td>
								       	</tr>
								       	<tr>
								       		<td>
										        <select name="value1">
											        	<option>상품분류</option>
											        	<option value="스티커">스티커</option>
											        	<option value="케이스">케이스</option>
											        	<option value="파우치">파우치</option>
									       		</select>
								       		</td>
								       	</tr>
								       	<tr>
								       		<td>
										        <select name="value2">
											        	<option>색깔</option>
											        	<option value="검정">검정</option>
											        	<option value="파랑">파랑</option>
											        	<option value="녹색">녹색</option>
									       		</select>
								       		</td>
								       	</tr>
								       	<tr>
									        <td>상품설명 :</td>
									        <td><textarea rows="10" cols="100"name="content"></textarea></td>
								       	</tr>
									    <tr>    
									        <td>
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
   }
  });
 </script>
</div>

  <input type="submit" value="등록" />
							    </form>
						</div>
					</div>					
				</div>
				
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
</body>
</html>