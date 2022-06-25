<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style>

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body>
<!--  헤더  -->
<hr>
<section class="text-center container">
<jsp:include page="common/menu.jsp" flush="true"/><br>
    <div class="row py-lg-3">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">회원가입 페이지</h1>
        <p class="lead text-muted">더 많은 컨텐츠를 즐기세요!</p>
        <p>
          <a id="toMain" class="btn btn-success my-2" style="display:inline-block" >메인페이지로 돌아가기</a>
        </p>
        <p>
        <sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.user.nickname" var="nickname"/>
		     <span class="badge bg-light text-dark">환영합니다 ${nickname}님!</span>
		</sec:authorize>
    	<sec:authorize access="isAnonymous()">
		     <span class="badge bg-light text-dark">로그인 하시면 더 많은 컨텐츠를 즐길 수 있습니다!</span>
		</sec:authorize>
        <p>
      </div>
    </div>
</section>
<hr/>
<!--  헤더  -->
<div class="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8">
		<jsp:include page="member/joinForm2.jsp" flush="true"/><br>
	</div>
	<div class="col-sm-2">
	</div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script>
	$(document).ready(function(){
		$("#toMain").on("click", function(){
			location.href="/hifive/"
		});
	});
	
</script>
</html>