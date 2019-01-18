<%@ page language= "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/resources/js/buttonEventControl.js"></script>
</head>

<body>

<div class="container">
	<br/>
	<div class="well" style="background-color: rgba(100, 180, 250, 0.4);">
		<h4>${article.title}<br/></h4>
		<h4><small>${article.author}</small>
        <small style="float:right">${article.regdate}</small></h4>
	</div>


	<!-- Post Content -->
	<div class="well well-lg" style="background-color: rgba(200, 200, 200, 0.4);">
		${article.content}
	</div>
	
	<button class="btn btn-primary" onClick="location.href='/bbs'">☰ 글 목록</button>
	<div style="float:right">
		<c:if test="${editable || isAdmin}">
			<c:if test="${editable}">
				<button class="btn btn-primary" onclick="execute('Article_${article.id}/Edit')">글 수정</button>
			</c:if>
				<button class="btn btn-danger"
					onclick="if(!confirm('글을 삭제합니다')){return false;} else{execute('Article_${article.id}/Delete')}" >글 삭제
				</button>
		</c:if>
	</div>
</div>
</body>
</html>