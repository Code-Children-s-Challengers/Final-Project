<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="css/login_form.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LoginForm</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    
    <style>
  
	  body {
	    height: 100vh;
	    background: url(images/main/challenge_image1.jpg) no-repeat center;
	    background-size: cover;
	  }
  
	</style>

</head>
<body>

     <div class="wrap">
        <div class="login">
            <h2>Log-in</h2><br>
            <div class="login_sns">
				<!-- 구글 로그인  -->
				<a href="oauth2/authorization/google">
				<img src="images/login/google_login.png" style= "width:250px; height:50px;"/>
				</a><br>
				
				<!-- 페이스북 로그인  -->
				<a href="oauth2/authorization/facebook">
				<img src="images/login/facebook_login.png" style= "width:250px; height:50px;"/>
				</a><br>
				
				<!-- 네이버 로그인  -->
				<a href="oauth2/authorization/naver">
				<img src="images/login/naver_login.png" style= "width:250px; height:50px;"/>
				</a><br>
            </div>
            
            <form action="/hifive/login" method="POST" ><!-- 로그인은 무조건 post -->
            <div class="login_id">
                <h4>ID</h4>
                <input type="text" id="username" name="username" placeholder="ID"/><br>
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" id="password" name="password" placeholder="Password"/><br>	
            </div>
            <div class="submit">
                <!--  <button id="login">Login</button> -->
                 <input id="login" type="submit" value="submit">
            </div>
            </form>
            
            
            <div class="login_etc">
                <a href="joinForm">아직 회원가입을 하지 않으셨나요?</a>    
            </div>
            
        </div>
    </div>
    

	

    
    
    
    
    <!-- OAuth 라이브러리를 사용하면 주소가 고정되어 있다. -->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	$(document).ready(function(){
		$("#login").click(function(){
			if($("#username").val().length == 0){
				alert("id를 정확하게 입력해주세요")	;
				$("#username").focus();
				event.preventDefault();
			}else if($("#password").val().length == 0){
				alert("비밀번호를 정확하게 입력해주세요");
				$("#password").focus();
				event.preventDefault();
			}
			
		});	
	});
	
</script>
  
</body>

</html>