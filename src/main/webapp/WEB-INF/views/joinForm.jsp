<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style>

</style>

</head>
<body>
<jsp:include page="common/menu.jsp" flush="true"/><br>
<hr>
<div class="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8">
		<jsp:include page="member/joinForm.jsp" flush="true"/><br>
	</div>
	<div class="col-sm-2">
	</div>
</div>
</body>
</html>