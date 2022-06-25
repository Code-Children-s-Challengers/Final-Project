<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!--  <h1>메인 페이지입니다.</h1> -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!DOCTYPE html>
<html>



<body>
<!-- 
 <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.nickname" var="nickname"/>
	<p>로그인 되었습니다</p>
    <c:choose>
    <c:when test="${empty nickname}">
	<a href="/hifive/additionalInfoForm">회원가입 마저하기</a>
    </c:when>
    <c:otherwise>
	<p>반갑습니다 ${nickname} 님</p>
    </c:otherwise>
	</c:choose>
</sec:authorize>
 -->  
<sec:authorize access="isAuthenticated()">
	<p>로그인 되었습니다</p>
	<p>반갑습니다 ${nickname1} 님</p>
</sec:authorize> 
  


<div class="pb-5" style="width: 800px; height: 600px; text-align:center; margin:0 auto;">  
<div id="mainPage" class="carousel slide " data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#mainPage" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#mainPage" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#mainPage" data-bs-slide-to="3" aria-label="Slide 4"></button>
    <button type="button" data-bs-target="#mainPage" data-bs-slide-to="4" aria-label="Slide 5"></button>
    <button type="button" data-bs-target="#mainPage" data-bs-slide-to="5" aria-label="Slide 6"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
    	<img src="images/main/challenge_image1.jpg" style="width:100%">          
    </div>
    <div class="carousel-item">
   	 	<img src="images/main/challenge_image2.jpg" style="width:100%">          
    </div>
    <div class="carousel-item">
    	<img src="images/main/challenge_image3.jpg" style="width:100%">          
    </div>
     <div class="carousel-item">
    <img src="images/main/challenge_image4.png" style="width:100%">          
    </div>
     <div class="carousel-item">
    <img src="images/main/challenge_image5.jpg" style="width:100%">          
    </div>
     <div class="carousel-item">
    <img src="images/main/challenge_image6.jpg" style="width:100%">          
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#mainPage" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#mainPage" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>    
   $(document).ready(function(){
	   $("#mainPage").carousel({        
		    // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
		    // 슬리아딩 자동 순환 지연 시간        
		    // false면 자동 순환하지 않는다.        
		    interval: 2000,        
		    // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.        
		    pause: "hover",        
		    // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복        
		    wrap: true,        
		    // 키보드 이벤트 설정 여부(?)        
		    keyboard : true	  });	   
   });
 
</script>

</body>
</html>