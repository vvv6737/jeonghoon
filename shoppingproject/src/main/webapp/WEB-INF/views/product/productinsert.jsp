<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 업데이트</title>
	<style>
		.select_img img{margin: 20px 0;}
	</style>
</head>
<body>

<div class="container">
	<h2>상품 업데이트</h2>
	<form class="form-horizontal" action="/product/insertProc" method="post" enctype="multipart/form-data">
		
		<div class="inputArea">
			<label for="productimagefile">이미지</label>
			<input type="file" id="productimagefile" name="productimagefile">
			 <div class="select_img"><img src="" /></div>
		<!--이미지 미리보기-->
		<script>
			  $("#productimagefile").change(function(){
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
		<div class="form-group">
			<label for="productname">제 품 명</label>
			<input type="text" class="form-control" id="productname" name="productname" placeholder="제품명을 입력하십시오."/>
		</div>
		<div class="form-group">
			<label for="productprice">가 격</label>
			<input type="number" class="form-control" id="productprice" name="productprice"  placeholder="가격를 입력하십시오."/>
		</div>
		<div class="form-group">
			<label for="productsalescnt">판매수량</label>
			<input type="number" class="form-control" id="productsalescnt" name="productsalescnt"  placeholder="수량를 입력하십시오."/>
		</div>
		<div class="form-group">
					<div class="col-sm-offset-2 col-sm-4">
						<button class="btn btn-success" type="submit" id="submit">작성</button>
						<button class="btn btn-danger" type="reset">취소</button>
					</div>
				</div>
			</form>
		</div>
	</body>


</body>
</html>
</layoutTag:layout>
<!-- layoutTag를 적용하므로 bootstrap.jsp 파일이 필요 업어졌다. -->


















