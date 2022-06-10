<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<ul class="menu">
	<li><a href="../myPage">프로필 수정</a></li>
	<li><a href="myInfo/${id}">개인 정보 설정</a></li>
	<li><a href="myFriend">친구 목록 보기</a></li>
	<li><a href="myChallenges">내 챌린지 보기</a></li>
</ul>

<style>
	*{padding:0; margin:0}
	li{list-style:none}
	a{text-decoration:none;font-size:20px}
	
	h2{
		font-size: 45px;
		border-bottom : 1px solid gray;
		margin : 0px;
		padding: 20px;
	}
	#grid {
		display: grid;
		grid-template-columns: 300px 1fr;
	}
	.menu{
		width: 100%;
		overflow:hidden;
		margin: 0px auto;
		border-right: 1px solid gray;
		
	}
	.menu > li{
		witdh:100%;
		text-align:center;
		line-height:80px;
		background:lightgray;
		border-bottom: 1px solid gray;
	}
	.menu a {
		color:black;
		padding:10px;
		height:
	}
	.menu >li:hover{
		background-color:darkgray;
		transition-duration: 0.5s;
	}
</style>