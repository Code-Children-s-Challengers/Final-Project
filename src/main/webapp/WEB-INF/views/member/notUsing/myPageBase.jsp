<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!--로그인한 클라이언트의 정보를 jsp에 가져올 수 있다-->
<sec:authentication property="principal.user.nickname" var="nickname"/>
<sec:authentication property="principal.user.email" var="email"/>
<sec:authentication property="principal.user.phoneNumber" var="phoneNumber"/>
<sec:authentication property="principal.user.point" var="point"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	#grid {
		display: grid;
		grid-template-columns: 300px 1fr;
	}
	#content {
	}
	h2{
		font-size: 45px;
		border-bottom : 1px solid gray;
		margin : 0px;
		padding: 20px;
	}	
	h3{
		font-size: 25px;
		padding: 20px;
	}
	
	
	
</style>

</head>
<body>
	<jsp:include page="../common/menu.jsp" flush="true"/><br>
	<h2>마이페이지 입니다</h2>
	<div id="grid">
		
		<div><jsp:include page="../member/myPageMenu.jsp" flush="true"/><br></div>
		<div id="content"> 
 			<h3>개인정보 수정</h3>
		</div>
	</div>
</body>

</html>