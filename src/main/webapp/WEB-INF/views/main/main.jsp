<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 로그인 완료 시 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.nickname" var="nickname"/>
	<p>로그인 되었습니다</p>
    <c:choose>
    <c:when test="${empty a}">
	<a href="/hifive/additionalInfoForm">회원가입 마저하기</a>
    </c:when>
    <c:otherwise>
	<p style="width:300px; left:-5%; right:0; margin-left:auto; margin-right:auto;">반갑습니다 ${nickname} 님</p>
    </c:otherwise>
</c:choose>
</sec:authorize>