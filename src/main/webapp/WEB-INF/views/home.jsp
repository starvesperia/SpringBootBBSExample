<%@ page language= "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<title>Home</title>
</head>
<body>
<div class="jumbotron">
	<div class="container">
	<h1>BBS Test page</h1>
	<P>  The time on the server is ${serverTime}. </P>
	<sec:authorize access="isFullyAuthenticated()">
        <P># Signed in by id / password.</P>
    </sec:authorize>
    <sec:authorize access="isRememberMe()">
        <P># Signed in by Remember-me.</P>
    </sec:authorize>
	</div>
</div>

<div class="container">
	<P>  Your IP address is ${clientIP}. </P>

	<c:choose>
		<c:when test="${empty user}">
			<br/>
			<button onclick="location='SignUp'" class="btn btn-primary">Sign-Up</button><br/><br/>
			<button onclick="location='SignIn'" class="btn btn-primary">Sign-In</button><br/><br/>
		</c:when>
		<c:otherwise>
			<p> Welcome ${uid} </p><br/>
			<button onclick="location='SignOut'" class="btn btn-primary">Sign-Out</button><br/><br/>
		</c:otherwise>
	</c:choose>
	<button onclick="location='bbs'" class="btn btn-primary">BBS</button><br/>
</div>
</body>
</html>
