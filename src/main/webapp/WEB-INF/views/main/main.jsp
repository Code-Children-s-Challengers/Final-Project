<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 로그인 완료 시 -->
<style>

	h1 {
		font-size:80px;
		text-align: center;
	}
	p{
		text-align: center;
	}
	a{		
		display: inline-block;
		text-align: center;
	}
</style>
<h1>메인 페이지입니다.</h1>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.nickname" var="nickname"/>
	<p>로그인 되었습니다</p>
    <c:choose>
    <c:when test="${empty nickname}">
	<a href="/hifive/additionalInfoForm">회원가입 마저하기</a>
    </c:when>
    <c:otherwise>
	<p>반갑습니다 ${nickname} 님</p>
    </c:otherwise>
</c:choose>
</sec:authorize>