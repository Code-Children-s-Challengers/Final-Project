<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="width:350px; left:-5%; right:0; margin-left:auto; margin-right:auto;">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<a href="">main</a> 
<!-- 로그인하지 않은 모든 사용자(로그인 중인 사용자에게는 보이지 않음) -->
<sec:authorize access="isAnonymous()">
    <a href="/hifive/loginForm">로그인</a>
</sec:authorize>
<!-- 로그인 중인 사용자 -->
<sec:authorize access="isAuthenticated()">
    <a href="/hifive/logout">로그아웃</a>
    <a href="/hifive/myPage">마이페이지</a>
</sec:authorize>
<a href="">challenges</a> 
<a href="">board</a>


</div>