<%@ page language= "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="/resources/js/formSubmitControl.js"></script>

	<!-- csrf 토큰 -->
	<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
</head>

<body>

<div class="page-header">
	<div class="container">
		<h2>Sign-up page</h2><br/>
	</div>
</div>

<div class="container">
	<form class="signup-form" name="signupForm" action="/SignUp/Result" method="POST">
		<!-- csrf 토큰을 정보와 같이 보내준다. -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div class="row">
			<div class="col-xs-4">
				<label for="user_name">User name</label>
                <input id="user_name" name="uid" type="text" placeholder="Enter User name" pattern="[A-Za-z0-9]{5,}" title="5글자 이상의 영문자 혹은 숫자" class="form-control"/><br/>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-4">
				<label for="email">E-mail</label>
				<input id="email" name="uemail" type="email" placeholder="Enter email" class="form-control"/><br/>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-4">
				<label for="password">Password</label>
				<input id="password" name="upw" type="password" placeholder="Enter password" class="form-control"/><br/>
			</div>
		</div>
		<br/>
		<button type="button" class="btn btn-primary" onClick="fncSubmit(signupForm);">Sign-Up</button>
	</form>
</div>

</body>