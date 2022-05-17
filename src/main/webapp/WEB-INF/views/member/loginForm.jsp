<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="/hifive/login" method="POST" ><!-- 로그인은 무조건 post -->
	<input type="text" name="username" placeholder="Username"/><br>
	<input type="password" name="password" placeholder="Password"/><br>	
	<button>로그인</button>
</form>
<!-- OAuth 라이브러리를 사용하면 주소가 고정되어 있다. -->
<a href="oauth2/authorization/google">구글 로그인</a>
<a href="oauth2/authorization/facebook">페이스북 로그인</a>
<a href="oauth2/authorization/naver">네이버 로그인</a>

<a href ="joinForm">회원가입을 아직 하지 않으셨나요?</a>