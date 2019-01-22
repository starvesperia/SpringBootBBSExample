<%@ page language= "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/resources/js/dropDownMenu.js"></script>
</head>
<body>

<div class="page-header">
	<div class="container">
		<h2>게시글 목록</h2><br/>
	</div>
</div>

<div class="container">
	<c:if test="${!empty keyword}">
		<button class="btn btn-default" onClick="location.href='/bbs'">전체 목록</button>
	</c:if>
	<button onclick="location='bbs/Write'" class="btn btn-primary" style="float:right">글쓰기</button><br/><br/>
	<c:choose>
		<c:when test="${articlePage.totalElements == 0}">
			<p>게시글이 존재하지 않습니다.</p><br/>
		</c:when>
		<c:otherwise>
			<c:if test="${!empty keyword}">
			<p>${articlePage.totalElements}개의 게시글이 검색되었습니다.</p><br/>
			</c:if>
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
			</div>
		</c:otherwise>
	</c:choose>

	<c:if test="${articlePage.totalPages != 0}">
		<ul class="pagination">
			<c:choose>
				<c:when test="${articlePage.number == 0}">
					<li class="page-item disabled"><a href="#">&lt;&lt;</a></li>
				</c:when>
				<c:when test="${empty keyword}">
					<li><a href="?page=0">&lt;&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="?category=${category}&keyword=${keyword}&page=0">&lt;&lt;</a></li>
				</c:otherwise>
			</c:choose>
	
			<c:choose>
				<c:when test="${pageManager.isFirstSection}">
					<li class="page-item disabled"><a href="#">&lt;</a></li>
				</c:when>
				<c:when test="${empty keyword}">
					<li><a href="?page=${pageManager.firstPageInSection-1}">&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="?category=${category}&keyword=${keyword}&page=${pageManager.firstPageInSection-1}">&lt;</a></li>
				</c:otherwise>
			</c:choose>
	
			<c:forEach var="i" begin="${pageManager.firstPageInSection}" end="${pageManager.lastPageInSection}" step="1">
				<c:choose>
					<c:when test="${i == articlePage.number}">
						<li class="page-item active"><a href="?category=${category}&keyword=${keyword}&page=${i}">${i+1}</a></li>
					</c:when>
					<c:when test="${empty keyword}">
						<li><a href="?page=${i}">${i+1}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a href="?category=${category}&keyword=${keyword}&page=${i}">${i+1}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	
			<c:choose>
				<c:when test="${pageManager.isLastSection}">
					<li class="page-item disabled"><a href="#">&gt;</a></li>
				</c:when>
				<c:when test="${empty keyword}">
					<li><a href="?page=${pageManager.lastPageInSection+1}">&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="?category=${category}&keyword=${keyword}&page=${pageManager.lastPageInSection+1}">&gt;</a></li>
				</c:otherwise>
			</c:choose>
	
			<c:choose>
				<c:when test="${articlePage.number == articlePage.totalPages-1}">
					<li class="page-item disabled"><a href="#">&gt;&gt;</a></li>
				</c:when>
				<c:when test="${empty keyword}">
					<li><a href="?page=${articlePage.totalPages-1}">&gt;&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="?category=${category}&keyword=${keyword}&page=${articlePage.totalPages-1}">&gt;&gt;</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</c:if>
	
	<form class="form-search row" method="get" action="/bbs">
		<div class="col-xs-5">
			<div class="input-group">
				<div class="input-group-btn btn-group">
					<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">${category}
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						<li><a href="#" data-value="제목">제목</a></li>
						<li><a href="#" data-value="본문">본문</a></li>
						<li><a href="#" data-value="작성자">작성자</a></li>
					</ul>
					<input class="hidden-input" name="category" value="${category}"/>
				</div>

				<input type="text" class="form-control" placeholder="Search" name="keyword" value="${keyword}">
				<span class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</span>
			</div>
		</div>
	</form>

	<script>
	$(".dropdown-menu li a").click(function(e) {
	    var selText = $(this).text();
	    $(this).parents('.input-group').find('.dropdown-toggle').html(selText+'<span class="caret"></span>');
	    $('.hidden-input').val(selText);
	});
	</script>
	
</div>

</body>
</html>
