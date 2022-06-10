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
	.profileImage{
		padding: 5px;
	}
	.nickname{
		padding: 10px;
	}
	table {
  border-top: 1px solid #444444;
  border-collapse: collapse;
}
	th, td {
  border-bottom: 1px solid #444444;
  padding: 10px;
}
	th{
		background-color:lightgray;
	}
	td{
		padding-left:50px;
	}
	.point{
		font-size:20px;
	}
	
</style>

</head>
<body>
	<jsp:include page="../common/menu.jsp" flush="true"/><br>
	<h2>마이페이지 입니다</h2>
	
	<div id="grid">
		<ul>
			<li><a href="myPage">프로필 수정</a></li>
			<li><a href="myInfo/${id}">개인 정보 설정</a></li>
			<li><a href="myFriend/${id}">친구 목록 보기</a></li>
			<li><a href="myChallenges/${id}">내 챌린지 보기</a></li>
		</ul>
		<div id="content"> 
		<h3>프로필 수정</h3>
		
		<form name="form" method="post" action="/hifive/myProfileInfo/${id}" enctype="multipart/form-data">
		
		<table>
			<tr>
				<th class="profileImage">프로필 사진</th>
				<td>
					<div class="box" style="background: #BDBDBD;"><img id="profile" class="profile" src="/hifive/view/${id}"/></div><br/>
	    			<input id="profileImage" type="file" name="file" value="파일 선택" accept="image/*"/> 	  				
	  			</td>
			</tr>
			<tr>
				<th class="nickname">닉네임</th>
				<td>
					<input type="text" value="${nickname}" name="nickname" id="nickname"/>
					<span class="point nicknameSuccess"></span><br/>
					<span class="point">※ 영문자, 소문자 입력가능, 최소 4자 이상, 최대 12자 까지 입력</span>
					<input type="hidden" id="nicknameChecker"/>
				</td>
			</tr>		
			
		</table><br/>
		<input type="submit" id="submit" value="저장"/>
		</form>		
		</div>
	</div>
	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/hifive/js/myPageProfileImage.js"></script>
<script src="/hifive/js/myPageNickname.js"></script>
<script>
			$(document).ready(function(){
				
				
			});			
</script>

</html>
