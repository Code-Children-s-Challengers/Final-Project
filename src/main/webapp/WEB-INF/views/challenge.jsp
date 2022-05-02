<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge</title>
</head>
<body>
<div>
<jsp:include page="common/menu.jsp" flush="true"/><br>
</div>
<hr>
<jsp:include page="challenge/challengeList.jsp" flush="true"/><br>
</body>
</html>