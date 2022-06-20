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

 	ul {
 	list-style-type:none;
 	margin:0;
 	padding:0;
 	width:25%;
 	background-color: #f1f1f1;
 	position: fixed;
 	height:100%;
 	overflow:auto;
 	}
 	
 	li a{
 	display: block;
 	color: #000;
 	padding: 8px 16px;
 	text-decoration: none;
 	}
 	
 	li a.active{
 	background-color: #555;
 	color:whtie;
 	}
 	li a.hover:not(.active){
 	background-color: #555;
 	color:white;
 	}
	#grid {
		display: grid;
		grid-template-columns: 150px 1fr;
	}
	#content {
		font-size : 30px;
		padding-left : 500px;
	}
</style>

</head>
<body>
	<sec:authentication property="principal.user.nickname" var="nickname"/>
	<sec:authentication property="principal.user.id" var="id"/>
	<jsp:include page="../common/menu.jsp" flush="true"/><br>
	<h2>마이페이지 입니다</h2>
	
	
	<div id="grid">
	
		<ul >
			<li><a class="active" href="">홈</a></li>
			<li><a href="myPage">프로필 수정</a></li>
			<li><a href="myInfo">개인 정보 수정</a></li>
			<li><a href="myFriend">친구 목록 보기</a></li>
			<li><a href="myCallenges">내 챌린지 보기</a></li>
		</ul>
	
		
		<div id="content"> 
		<h3>프로필 수정</h3><br/>
		
		프로필 사진
		<div class="box" style="background: #BDBDBD;"><img class="profile" src="/hifive/view/${id}"/></div>
		<br/>
		<form name="form" method="post" action="/hifive/upload" enctype="multipart/form-data">
    		<input type="file" name="file" value="파일 선택" accept="image/*"/> 
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