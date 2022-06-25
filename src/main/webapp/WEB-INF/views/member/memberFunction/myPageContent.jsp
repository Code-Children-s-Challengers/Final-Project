<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	form{
		width:800px;
		margin:0;
	}
	table {
 	 	border-top: 1px solid #444444;
 		border-collapse: collapse;
		margin-left : 50px;
		width:750px;
		height:450px;
	}
	th, td {
 	 border-bottom: 1px solid #444444;
	}
	th{
		text-align:center;
		width: 200px;
		background-color:	#AECDFF;
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
		font-size:20px;
		margin-top:30px;
	}
	
	input#nickname{
		display:inline-block;
		width:200px;
		height:50px;
		font-size:30px;
	}
	.point{
		font-size:15px;
	}
	input#submit{
		width:100px;
		font-size:20px;
		float:right;
	}
</style>

 <form name="form" method="post" action="/hifive/myProfileInfo/${id}" enctype="multipart/form-data">
		<table>
			<tr>
				<th class="profileImage">프로필 사진</th>
				<td>
					<div class="box" style="background: #BDBDBD;"><img id="profile" class="profile" src="/hifive/view/${id}"/></div>
	    			<div class="mb-3">
 						<input class="form-control" type="file" name="file" id="profileImage" accept="image/*">
					</div>		
	  			</td>
			</tr>
			<tr>
				<th class="nickname">닉네임</th>
				<td>
					<input class="form-control" type="text" name="nickname" id="nickname" value="${nickname1}" placeholder="Default input" aria-label="default input example">
					<button type="button" class="btn btn-warning" id="nicknameOverraping">중복 체크</button>
					<br/>
					<span class="point nicknameSuccess"></span>
					<br/>
					<span class="point">※ 영문자, 소문자 입력가능, 최소 4자 이상, 최대 12자 까지 입력</span>
					<input type="hidden" id="nicknameChecker" value="false"/>
					
				</td>
			</tr>		
			
			</table><br/>
			<input type="submit" id="submit" class="btn btn-primary" value="저장"/>
</form>
