<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!--로그인한 클라이언트의 정보를 jsp에 가져올 수 있다-->
<sec:authentication property="principal.user.nickname" var="nickname"/>
<sec:authentication property="principal.user.email" var="email"/>
<sec:authentication property="principal.user.phoneNumber" var="phoneNumber"/>
<sec:authentication property="principal.user.point" var="point"/>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/menu_style.css">

<meta charset="UTF-8">
<title></title>
<style>
	h2{
		font-size: 45px;
		border-bottom : 1px solid gray;
		margin : 0px;
		padding: 20px;
	}
	.mypage ul{
		border-right: 1px solid gray;
		width : 200px;
		margin : 0px;
		padding : 0px;
		height: 600px;
		border: 1px solid gray;
		list-style-type : none
		font-size : 20px;
	}
	.ullimypage li{
		border: 2px solid black;
		height :50px;
	}
	#grid {
		display: grid;
		grid-template-columns: 150px 1fr;
	}
	#content {
		font-size : 30px;
		padding-left : 100px;
	}
	input {
		width:200px;
	  	height:35x;
  		font-size:30px;
	}
	.box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	
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
	<sec:authentication property="principal.user.nickname" var="nickname"/>
	<sec:authentication property="principal.user.id" var="id"/>
	<%--<jsp:include page="../common/menu.jsp" flush="true"/><br>--%> <%-- 영준_20220619--%>
	<h1 class="mt-5">&nbsp;&nbsp;My Page</h1>

		<br/>
		
		<div class="row">
		<div class="col-sm-3">
			<jsp:include page="memberFunction/myPageMenu_myPage.jsp" flush="true"/><br>
		</div>
		<div class="col-sm-9">
			<h2 class="miniHead">프로필 수정</h2>
			<jsp:include page="memberFunction/myPageContent.jsp" flush="true"/><br>
		</div>

		</div>
						
		
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="/hifive/js/myPageProfileImage.js"></script>
	<script src="/hifive/js/myPageNickname.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
	<script>
			$(document).ready(function(){
				
				
			});			
	</script>

</html>