<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>
<h1>메인 페이지입니다.</h1>
<div>
<jsp:include page="common/menu.jsp" flush="true"/><br>
</div>

<!-- 로그인하지 않은 모든 사용자(로그인 중인 사용자에게는 보이지 않음) -->
<sec:authorize access="isAnonymous()">
    <a href="/hifive/loginForm">로그인</a>
</sec:authorize>

<!-- 로그인 중인 사용자 -->
<sec:authorize access="isAuthenticated()">
<p>user: <sec:authentication property="principal.user"/></p>
<p>사용자이름: <sec:authentication property="principal.user.username"/></p>
<p>사용자이메일: <sec:authentication property="principal.user.email"/></p>
<p>사용한 sns: <sec:authentication property="principal.user.provider"/></p>
    <a href="/hifive/logout">로그아웃</a>
</sec:authorize>
</body>
</html>