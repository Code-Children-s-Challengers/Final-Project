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
		$(".ch").on("click",function(){
			var cnum = $(this).attr("data-value");
			console.log(cnum);
			win = window.open("./participantPopup?cnum="+cnum,"participant","width = 500, height = 500, top = 100, left = 200, location = no");
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
		   			<div class="card h-100 ch" data-value="${dto.getCnum()}">
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






