<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
	*{
		text-align:center;
		dispaly : inline;
	}
</style>
</head>
<body>
<jsp:include page="common/menu.jsp" flush="true"/><br>
<!--  
<hr>
-->
<jsp:include page="member/loginForm.jsp" flush="true"/><br>
</body>
</html>