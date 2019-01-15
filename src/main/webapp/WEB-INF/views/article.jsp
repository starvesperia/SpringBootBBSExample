<%@ page language= "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		.well { background-color:  rgba(100, 180, 250, 0.4); }
	</style>
</head>

<body>

<div class="container">
	<br/>
	<div class="well well-lg">
		<h1>${article.title}<br/></h1>
		<h3><small>작성자 : ${article.author}</small>
        <small style="float:right">게시일 : ${article.regdate}</small></h3>
	</div>


	<!-- Post Content -->
	<article>
		<div>
			${article.content}
		</div>
	</article>
	
	<br/><br/>
	<button class="btn btn-primary" onClick="location.href='/bbs'">☰ 글 목록</button>
	<div class="btn-group">
	<button onclick="location='edit'" class="btn btn-success">글 수정</button>
	<button type="button" class="btn btn-danger"
		onClick=" if(!confirm('글을 삭제합니다')){return false;} else{location.href='Article_${article.id}/delete'} ">
		글 삭제
	</button>
	</div>
</div>
</body>
</html>