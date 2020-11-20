<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" 	tagdir="/WEB-INF/tags" %>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 목록 보기</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	.navbar-inverse .navbar-nav > .active > a, 
	.navbar-inverse .navbar-nav > .active > a:focus, 
	.navbar-inverse .navbar-nav > .active > a:hover {
	    color: rgb(255, 255, 255);
	    background-color: red
	}
	</style>
</head>
<body>

<div class="container">
	<h2>게시글 목록</h2>
	<button class="btn btn-primary" onclick="location.href='/board/insert'">글쓰기</button>
	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>Subject</th>
				<th>Content</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>댓글</th>
			</tr>
		</thead>
			<c:forEach var="board" items="${list}">
			<tr>
				<td class="info" onclick="location.href='/board/detail/${board.bno}'">${board.bno}</td>
				<td>${board.subject}</td>
				<td>${board.content}</td>
				<td>${board.writer}</td>
				<td><fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
				<td class="warning" onclick="location.href='/board/detailComment/${board.bno}'">댓글</td>
			</tr>
			</c:forEach>
		<tbody>
		</tbody>
	</table>
	
	
	<ul class="pager justify-content-center">
		<c:if test="${pageMaker.prev}">
			<li class="page-item"><a href="/board/boardList${pageMaker.makeSearch(pageMaker.startPage-1)}">이전</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li class="page-item"><a href="/board/boardList${pageMaker.makeSearch(idx)}">${idx}</a></li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage >0}">
			<li class="page-item"><a href="/board/boardList${pageMaker.makeSearch(pageMaker.endPage+1)}">다음</a></li>
		</c:if>
	</ul>
	
	<!-- 페이지 -->
	<!-- <div class="container">
    <ul class="pager">
     <li><a href="#">이전</a></li>
     <li><a href="#">1</a></li>
     <li><a href="#">2</a></li>
     <li><a href="#">다음</a></li>
    </ul>
	
	</div> -->
	
	
  
  <!-- 검색 창 -->
	 <div class="search">
    <select name="searchType">
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="s"<c:out value="${scri.searchType eq 's' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      <option value="sc"<c:out value="${scri.searchType eq 'sc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
    
    
    
    <!-- 검색 스크립트 -->
    <script>
		$(document).ready(function(){
	        $('#searchBtn').click(function() {
	       self.location = "/board/boardList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	        });
	      }); 
    </script>
    
</div>
</body>
<!-- layoutTag를 적용하므로 bootstrap.jsp 파일이 필요 없어졌다. -->
</html>
</layoutTag:layout>