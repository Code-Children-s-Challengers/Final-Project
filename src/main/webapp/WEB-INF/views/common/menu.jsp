<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <!--
  <script src="https://kit.fontawesome.com/kit_code.js" crossorigin="anonymous">
  </script>
  -->
  <script src="https://kit.fontawesome.com/8083bd20a5.js" crossorigin="anonymous"></script>
  <title>Menu Nav Bar</title>
    
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  <link rel="stylesheet" href="css/menu_style.css">
</head>


<body>

<nav class="navbar">
	<!-- 
	<div style="width:350px; left:-5%; right:0; margin-left:auto; margin-right:auto;"> </div>
	-->
	
		<!-- logo_link -->
      	<div class="navbar__logo">
        <i class="fa-solid fa-laptop-code"></i>
        <a href="/hifive/">코린져스</a>
      	</div>
	
	  <!-- menu_link -->
      <ul class="navbar__menu">
	  <!-- 로그인하지 않은 모든 사용자(로그인 중인 사용자에게는 보이지 않음) -->
	  <sec:authorize access="isAnonymous()">
	  <li>
	    <a href="/hifive/loginForm" class ="navbar__menu">Log In</a>
	  </li>  
	  </sec:authorize>
	
	  <!-- 로그인 중인 사용자 -->
	  <sec:authorize access="isAuthenticated()">
	  <li>
	    <a href="/hifive/logout" class ="navbar__menu">Log Out</a>
	  </li>  
	  <li>  
	    <a href="/hifive/myPage" class ="navbar__menu">My Page</a> <%-- 영준_20220619--%>
	  </li>  
	  </sec:authorize>
	  <li>
	  	<a href="/hifive/challenges" class ="navbar__menu a_hover">Challenges</a>
	  </li>
	  <li> 	
	  	<a href="/hifive/board/noticeList?curPage=1"" class ="navbar__menu a_hover">Board</a>
	  </li>	
	  </ul>
	  
	  <ul class="navbar__icons">
        <!-- icon_link -->
        <li><a href="https://github.com/Code-Children-s-Challengers/Final-Project"><i class="fa-brands fa-github"></i></a></li>
        <!-- 
        <li>
          <a href="https://playdata-ai18-finalproject-4team-ccc.jandi.com">
            <i class="fab fa-slack"></i>
          </a>
        </li>
         -->
      </ul>
	
	
	
</nav>


</body>
</html>