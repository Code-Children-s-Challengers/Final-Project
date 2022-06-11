<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 로그인 완료 시 -->
<style>

	h1 {
		font-size:80px;
		text-align: center;
	}
	p{
		text-align: center;
	}
	a{		
		display: inline-block;
		text-align: center;
	}
</style>
<!--  <h1>메인 페이지입니다.</h1> -->


<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>Main</title>
  <!-- Bootstrap cdn 설정 --> 	
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">	
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

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
  
  
  
<!-- bootstrap 반응형 슬라이드 이미지 추가_20220608 영준 -->  
<!-- carousel를 구성할 영역 설정 -->  
<div style="width: 800px; height: 600px; text-align:center; margin:0 auto;">    
<!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. -->    
<!-- carousel는 특이하게 id를 설정해야 한다.-->    
<div id="carousel-example-generic" class="carousel slide" >      
<!-- carousel의 지시자 -->      
<!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->      
<ol class="carousel-indicators">        
<!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->        
<!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->        
<!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->        
<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>        
<li data-target="#carousel-example-generic" data-slide-to="1"></li>
<li data-target="#carousel-example-generic" data-slide-to="2"></li>
<li data-target="#carousel-example-generic" data-slide-to="3"></li>
<li data-target="#carousel-example-generic" data-slide-to="4"></li>
<li data-target="#carousel-example-generic" data-slide-to="5"></li>
<li data-target="#carousel-example-generic" data-slide-to="6"></li>
</ol>      
  
<!-- 실제 이미지 아이템 -->      
<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->      
<div class="carousel-inner" role="listbox">        
<!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->        


  <div class="item active">          
    <!-- 아미지 설정- -->          
    <img src="images/main/challenge_image1.jpg" style="width:100%">          
    <!-- 캡션 설정 (생략 가능) -->          
    <!-- 글자 색은 검은색 -->          
    <div class="/carousel-caption" style="color:black;"></div>        
  </div>        
    
  <div class="item">          
    <img src="images/main/challenge_image2.jpg" style="width:100%">          
    <div class="carousel-caption" style="color:black;"></div>        
  </div>      

  <div class="item">          
    <img src="images/main/challenge_image3.jpg" style="width:100%">          
    <div class="carousel-caption" style="color:black;"></div>        
  </div>    

  <div class="item">          
    <img src="images/main/challenge_image4.png" style="width:100%">          
    <div class="carousel-caption" style="color:black;"></div>        
  </div>    

  <div class="item">          
    <img src="images/main/challenge_image5.jpg" style="width:100%">          
    <div class="carousel-caption" style="color:black;"></div>        
  </div>    

  <div class="item">          
    <img src="images/main/challenge_image6.jpg" style="width:100%">          
    <div class="carousel-caption" style="color:black;"></div>        
  </div>    

  <div class="item">          
    <img src="images/main/challenge_image7.jpg" style="width:100%">          
    <div class="carousel-caption" style="color:black;"></div>        
  </div>    

  
</div>      

  
<!-- 왼쪽 화살표 버튼 -->      
<!-- href는 carousel의 id를 가르킨다. -->      
<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">        
<!-- 왼쪽 화살표 -->        
<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>      
</a>     
<!-- 오른쪽 화살표 버튼 -->      
<!-- href는 carousel의 id를 가르킨다. -->      
<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">        
<!-- 오른쪽 화살표 -->        
<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>      
</a>   
  
</div>  
</div>  

<script>    
  $(function(){      
  $('#carousel-example-generic').carousel({        
    // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
    // 슬리아딩 자동 순환 지연 시간        
    // false면 자동 순환하지 않는다.        
    interval: 2000,        
    // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.        
    pause: "hover",        
    // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복        
    wrap: true,        
    // 키보드 이벤트 설정 여부(?)        
    keyboard : true	  });	});  
</script>

</body>
</html>