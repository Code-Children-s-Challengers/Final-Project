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
<meta charset="UTF-8">
<style>
	
	/*기본 css */
	a.nav-link:hover{ /*메뉴 위에 마우스 올릴 시 표시되는 css*/
		background-color:darkgray;
		transition-duration: 0.5s;
	}
	
	.mt-5{ /* 대문 css*/
		border-bottom: 1px solid gray;
		padding-bottom: 20px;
		margin-bottom:0;
	}
	/*기본 css */
	
</style>
<!-- bootstrap / css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

	<!-- 공통 메뉴 -->
	<jsp:include page="../common/menu.jsp" flush="true"/><br>
	<!-- 공통 메뉴 -->
	
	<!-- 대문 => 이후 대문은 수정할 예정입니다! -->
	<h1 class="mt-5">&nbsp;&nbsp;My Page</h1> 
	<!-- 대문 -->
	
	<!-- 기본 틀 -->
	<div class="row">		
	
		<!-- 메뉴(프로필 수정 - 개인 정보 설정 - 프로젝트 현황 보기(?)) -->
		<div class="col-sm-3">
			<jsp:include page="memberFunction/myPageMenu_myData.jsp" flush="true"/><br>
		</div>
		<!-- 메뉴 -->
		
		<!-- 주요 컨텐츠 -->
		<div class="col-sm-9">
			<!--                  영준님께서 작성하시는 공간                              -->
			<!--                  영준님께서 작성하시는 공간                              -->
			<!--                  영준님께서 작성하시는 공간                              -->
			<!--                  영준님께서 작성하시는 공간                              -->
			<!--                  영준님께서 작성하시는 공간                              -->
			<!--                  영준님께서 작성하시는 공간                              -->
			<!--                  영준님께서 작성하시는 공간                              -->
			<!--                  영준님께서 작성하시는 공간                              -->
			<!--                  영준님께서 작성하시는 공간                              -->
			<!--                  영준님께서 작성하시는 공간                              -->
		</div>
		<!-- 주요 컨텐츠 -->

	</div>
	<!-- 기본 틀 -->
	
</body>
<!-- 제이쿼리 CDN -->		
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- bootstrap / js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
<script>
		$(document).ready(function(){
			
			
		});			
</script>

</html>