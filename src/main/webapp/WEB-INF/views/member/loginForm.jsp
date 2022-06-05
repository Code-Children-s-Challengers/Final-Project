<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>로그인 페이지</h1>
<a href="oauth2/authorization/google">구글 로그인</a><br>
<a href="oauth2/authorization/facebook">페이스북 로그인</a><br>
<a href="oauth2/authorization/naver">네이버 로그인</a><br>
<a href="joinForm">아직 회원가입하지 않으셨나요?</a><br>
<form action="/hifive/login" method="POST" ><!-- 로그인은 무조건 post -->
	<input type="text" id="username" name="username" placeholder="Username"/><br>
	<input type="password" id="password" name="password" placeholder="Password"/><br>	
	<button id="login">로그인</button>
</form>
<!-- OAuth 라이브러리를 사용하면 주소가 고정되어 있다. -->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

	$(document).ready(function(){
		$("#login").click(function(){
			if($("#username").val().length == 0){
				alert("id를 정확하게 입력해주세요")	;
				$("#username").focus();
				event.preventDefault();
			}else if($("#password").val().length == 0){
				alert("비밀번호를 정확하게 입력해주세요");
				$("#password").focus();
				event.preventDefault();
			}
			
		});	
	});
	
</script>
