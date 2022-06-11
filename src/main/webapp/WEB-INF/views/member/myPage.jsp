<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title></title>
<style>
	#grid {
		display: grid;
		grid-template-columns: 300px 1fr;
	}
	#content {
	}
	h2{
		font-size: 45px;
		border-bottom : 1px solid gray;
		margin : 0px;
		padding: 20px;
	}	
	h3{
		font-size: 25px;
		padding: 20px;
	}
	
	form{
		width:900px;
		margin:0;
	}
	table {
 	 	border-top: 1px solid #444444;
 		border-collapse: collapse;
		margin-left : 50px;
		width:850px;
		height:450px;
	}
	th, td {
 	 border-bottom: 1px solid #444444;
	}
	th{
		width: 200px;
		background-color:lightgray;
	}
	td{
		padding-left:50px;
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
	
	input#profileImage{
		width:100px;
		font-size:20px;
		margin-top:30px;
	}
	
	input#nickname{
		width:200px;
		height:50px;
		font-size:30px;
	}
	.point{
		font-size:20px;
	}
	input#submit{
		width:100px;
		font-size:20px;
		float:right;
	}
	
	
	
	
</style>

</head>
<body>
	<jsp:include page="../common/menu.jsp" flush="true"/><br>
	<h2>마이페이지 입니다</h2>
	<div id="grid">
		<div>
		<jsp:include page="../member/myPageMenu.jsp" flush="true"/><br>
		</div>
		<div id="content"> 
		<h3>프로필 수정</h3>
		<form name="form" method="post" action="/hifive/myProfileInfo/${id}" enctype="multipart/form-data">
		<table>
			<tr>
				<th class="profileImage">프로필 사진</th>
				<td>
					<div class="box" style="background: #BDBDBD;"><img id="profile" class="profile" src="/hifive/view/${id}"/></div>
	    			<input id="profileImage" type="file" name="file" value="파일 선택" accept="image/*"/> 	  				
	  			</td>
			</tr>
			<tr>
				<th class="nickname">닉네임</th>
				<td>
					<input type="text" value="${nickname1}" name="nickname" id="nickname"/>
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







