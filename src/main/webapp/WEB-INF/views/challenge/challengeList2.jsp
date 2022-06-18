<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="css/challenge_table.css">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
	<script>
	$(document).ready(function(){
		$(".category").on("click",function(){
			$.ajax({
				url:'challengescategory', // Controller의 요청매핑값
				type:'get',
				data:{
					category:this.innerText
				},
			dataType:'text', // 응답 데이터는 간단한 숫자나 영문자로 주는게 좋다
			success:function(responseData, status, xhr){
				//console.log(responseData); // 이 데이터를 사용한다
				//console.log("${list}");
				//$("#cTable").load(location.href + " #cTable");
				var html = `<tr>
					<td height="5"></td>
					</tr>
					<tr>
						<td height="1" colspan="8" bgcolor="CECECE"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>
					<tr>
					<td style="border:1px solid #444444;border-collapse: collapse" rowspan="100" width="100px">
					<a class="category">study</a><br><br>
					<a class="category">fitness</a><br><br>
					<a class="category">others</a>
					</td>
					</tr>`
				html += responseData
				//$("#cTable").html(html);
				//$("#cTable").html(responseData);
				console.log(html)
				$("#table").html(html);
				return false;
			},
			error:function(xhr, status, e){
				console.log("Error: "+e);
			}
			});
		});
		
	});
	
	</script>
<style>
	div.col{
		width:300px;
		height:300px;	
	}
	.card-img-top{
		width:100%;
		height:50%;
	}
</style>	
</head>

<div class="py-5 bg-light" >
    <div class="container"  style="margin-left:85px">
		<div class="row row-cols-1 row-cols-md-4 g-4">
			<c:set var="list" value ="${PageDTO.getList()}"></c:set>
			<c:forEach var="dto" items="${list}" varStatus="status">	
		  		<div class="col">
		   			<div class="card h-100 ch">
		      			<img src="/hifive/challengeImage/${dto.getCnum()}" class="card-img-top" alt="...">
		       			<div class="card-body">
		        			<h5 class="card-title">${dto.getName()}</h5>
		        			<p class="card-text">${dto.getSday()} ~ ${dto.getEday()}<br/>참여인원: ${dto.getParticipant()}/${dto.getMpeople()}<br/>참가비: ${dto.getFee()}P<br/>${dto.getCnum()}</p>
		      			</div>
		    		</div>
		  		</div>
			</c:forEach>
		</div>
	</div>
</div>






