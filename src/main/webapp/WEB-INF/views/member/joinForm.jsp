<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>회원가입 페이지</h1>
<form action="/hifive/join" method="POST">
	<input type="text" name="username" placeholder="Username"/><br>
	<input type="password" name="password" placeholder="Password"/><br>	
	<input type="email" name="email" placeholder="Email"/><br>	
	<input type="text" name="nickname" placeholder="nickname"/><br>	
	<input type="text" name="phoneNumber" placeholder="phoneNumber"/><br>	
	<button>회원가입</button>
</form>