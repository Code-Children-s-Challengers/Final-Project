<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge</title>
<script>
	function makeChallengePopup(){
		win = window.open("./makeChallengePopup","makechallengepopup","width = 600, height = 700, top = 100, left = 200, location = no");

	}

</script>
</head>
<body>
<div>
<jsp:include page="common/menu.jsp" flush="true"/><br>
</div>
<hr>
<button onclick="makeChallengePopup()">challenge 생성</button>
<jsp:include page="challenge/challengeHot.jsp" flush="true"/><br>
<jsp:include page="challenge/challengeList.jsp" flush="true"/><br>
</body>
</html>