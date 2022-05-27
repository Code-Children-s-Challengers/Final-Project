<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="/hifive/additionalInfo" method="POST">
	<input type="text" name="phoneNumber" placeholder="phoneNumber"/><br>
	<input type="text" name="nickname" placeholder="nickname"/><br>	
	<button>추가 정보 저장</button>
</form>

