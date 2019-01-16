<%@ page language= "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="page-header">
	<div class="container">
		<h2>게시글 목록</h2><br/>
	</div>
</div>

<div class="container">
	<button onclick="location='bbs/Write'" class="btn btn-primary">글쓰기</button><br/><br/>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="article" items="${articlePage.content}">
				<tr>
					<td>${article.id}</td>
					<td><a href="/bbs/Article_${article.id}">${article.title}</a></td>
					<td>${article.author}</td>
					<td>${article.viewcount}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<ul class="pagination">

			<c:choose>
				<c:when test="${articlePage.number == 0}">
					<li class="page-item disabled"><a href="#">&lt;&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="?page=0">&lt;&lt;</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${pageManager.isFirstSection}">
					<li class="page-item disabled"><a href="#">&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="?page=${pageManager.firstPageInSection-1}">&lt;</a></li>
				</c:otherwise>
			</c:choose>

			<c:forEach var="i" begin="${pageManager.firstPageInSection}" end="${pageManager.lastPageInSection}" step="1">
				<c:choose>
					<c:when test="${i == articlePage.number}">
						<li class="page-item active"><a href="?page=${i}">${i+1}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a href="?page=${i}">${i+1}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${pageManager.isLastSection}">
					<li class="page-item disabled"><a href="#">&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="?page=${pageManager.lastPageInSection+1}">&gt;</a></li>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${articlePage.number == articlePage.totalPages-1}">
					<li class="page-item disabled"><a href="#">&gt;&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="?page=${articlePage.totalPages-1}">&gt;&gt;</a></li>
				</c:otherwise>
			</c:choose>

		</ul>
	</div>
</div>

</body>
</html>
