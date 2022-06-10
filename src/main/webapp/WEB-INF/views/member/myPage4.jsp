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
	#profileImage{
		padding: 50px;
	}
	#nickname{
		padding: 50px;
	}
	table {
  border-top: 1px solid #444444;
  border-collapse: collapse;
}
th, td {
  border-bottom: 1px solid #444444;
  padding: 10px;
}
	
</style>

</head>
<body>
	<jsp:include page="../common/menu.jsp" flush="true"/><br>
	<h2>마이페이지 입니다</h2>
	
	<div id="grid">
		<ul>
			<li><a href="myPage">프로필 수정</a></li>
			<li><a href="myInfo">개인 정보 설정</a></li>
			<li><a href="myFriend">친구 목록 보기</a></li>
			<li><a href="myChallenges">내 챌린지 보기</a></li>
		</ul>
		<div id="content"> 
		<h3>프로필 수정</h3><br/>
		
		<form name="form" method="post" action="/hifive/upload" enctype="multipart/form-data">
		
		<table border=1px>
			<tr>
				<th id="profileImage">프로필 사진</th>
				<td><!-- <div class="box" style="background: #BDBDBD;"><img class="profile" src="/hifive/view/${id}"/></div> -->
					<div class="box" style="background: #BDBDBD;"><img id="profile" class="profile" src="/hifive/view/${id}"/></div><br/>
	    			<input id="profileImage" type="file" name="file" value="파일 선택" accept="image/*"/> 
	    			<input type="submit" id="submit" value="저장"/>
	  				
	  			</td>
			</tr>
			<tr>
				<th id="nickname">닉네임</th>
				<td>
					<form name="form2" action="hifive/nickname/${id}" method="post">
					<input type="text" value="${nickname}" name="nickname"/>
					<input type="submit" id="submit" value="저장"/>
					</form>
				</td>
			</tr>		
			
		</table>
		</form>		
		
		</div>
	</div>
	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
			$(document).ready(function(){
				$("#profileImage").on("change",handleProfileImage);
				;
			});
			
			var sel_file;
			function handleProfileImage(e){
				console.log("hi")
				var files = e.target.files;
				var filesArr =Array.prototype.slice.call(files);
				filesArr.forEach(function(f){
					if(!f.type.match("image.*")){
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_file = f;
					var reader = new FileReader();
					reader.onload = function(e){
						$("#profile").attr("src", e.target.result);
					}
					reader.readAsDataURL(f);
				});
			}
		
</script>

</html>
