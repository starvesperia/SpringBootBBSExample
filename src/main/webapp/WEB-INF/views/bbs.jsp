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
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="article" items="${articleList}">
				<tr>
					<td>${article.id}</td>
					<td><a href="/bbs/Article_${article.id}">${article.title}</a></td>
					<td>${article.author}</td>
					<td>${article.regdate}</td>
					<td>${article.viewcount}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>
