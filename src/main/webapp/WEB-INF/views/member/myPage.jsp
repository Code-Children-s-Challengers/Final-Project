<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	h2{
		font-size: 45px;
		border-bottom : 1px solid gray;
		margin : 0px;
		padding: 20px;
	}
	ul{
		border-right: 1px solid gray;
		width : 200px;
		margin : 0px;
		padding : 0px;
		height: 600px;
		border: 1px solid gray;
		list-style-type : none
	}
	li{
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
	ul{
		font-size : 20px;
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
	
</style>

</head>
<body>
	<sec:authentication property="principal.user.nickname" var="nickname"/>
	<sec:authentication property="principal.user.id" var="id"/>
	<jsp:include page="../common/menu.jsp" flush="true"/><br>
	<h2>마이페이지 입니다</h2>
	
	<div id="grid">
		<ul>
			<li><a href="myPage">프로필 수정</a></li>
			<li><a href="myInfo">개인 정보 설정</a></li>
			<li><a href="myPoint">내 포인트 내역보기</a></li>
			<li><a href="myChallenges">내 챌린지 보기</a></li>
		</ul>
		<div id="content"> 
		<h3>프로필 수정</h3><br/>
		
		프로필 사진
		<div class="box" style="background: #BDBDBD;"><img class="profile" src="/hifive/view/${id}"/></div>
		<br/>
		<form name="form" method="post" action="/hifive/upload" enctype="multipart/form-data">
    	<input type="file" name="file" value="파일 선택"/> 
    	<input type="submit" id="submit" value="저장"/>
  		</form>
  		<br/> 				
		
		<br/>
			
				
		<form name="form2" action="hifive/nickname/${id}" method="post">
			닉네임:<input type="text" value="${nickname}" name="nickname"/>
			<input type="submit" id="submit" value="저장"/>
		</form>

				
		
		</div>
	</div>



</html>