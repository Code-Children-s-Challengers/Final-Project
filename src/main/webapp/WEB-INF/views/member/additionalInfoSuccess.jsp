<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script>
	<sec:authentication property="principal.user.nickname" var="nickname"/>
	alert(${nickname}+"님 환영합니다. 선택해주셔서 감사합니다 :)");
    location.href="/hifive/member/myPage";
</script>