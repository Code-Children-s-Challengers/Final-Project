<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	
	.mt-5{
		border-bottom: 1px solid gray;
		padding-bottom: 20px;
		margin-bottom:0;
	}
	.miniHead{
		padding-top:20px;
	}
	a.nav-link:hover{
		background-color:darkgray;
		transition-duration: 0.5s;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../common/menu.jsp" flush="true"/><br>
   	<h1 class="mt-5">&nbsp;&nbsp;My Page</h1>


	<div class="row">
		<div class="col-sm-3">
			<jsp:include page="memberFunction/myPageMenu_myFriend.jsp" flush="true"/><br>
		</div>
		<div class="col-sm-9"> 
 			<h2 class="miniHead">개인정보 수정</h2>
		</div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
</html>