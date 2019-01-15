<%@ page language= "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<%
	String name = request.getParameter("uid");
%>
<!--
	String name = request.getParameter("uid");
	String email = request.getParameter("uemail");
	String password = request.getParameter("upw");
-->
<%= name %> 님. 정상적으로 가입되었습니다.
<a href="/Home"><button>홈으로</button></a>