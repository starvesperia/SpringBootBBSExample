<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>Article Edit Page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="//cdn.ckeditor.com/4.11.1/standard/ckeditor.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- csrf 토큰 -->
	<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
</head>
<body>
	<div class="page-header">
		<div class="container">
			<h2>게시글 수정</h2><br/>
		</div>
	</div>
    
	<div class="container">
		<br/>
		<form class="form-horizontal" role="form" id="editorForm" method="post" action="/bbs/Article_${article.id}/Edit">
			<!-- csrf 토큰을 정보와 같이 보내준다. -->
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			
			<div class="form-group">
            	<input id="title" name="title" type="text" class="form-control" value="${article.title}" disabled/><br/><br/>
				<div class="form-group">
					<div class="col-lg-12">
						<textarea id="content" name="content">${article.content}</textarea><br/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-12">
					<button class="btn btn-primary" onClick="location.href='/bbs'">☰ 글 목록</button>
					<button type="submit" class="btn btn-primary" style="float:right">저장</button>
					</div>
				</div>
			</div>
			
		</form>
		
	</div>

	<script>
	$(document).ready(function() {
        CKEDITOR.replace('content', {
        	
        })
	});
	</script>

</body>
</html>
