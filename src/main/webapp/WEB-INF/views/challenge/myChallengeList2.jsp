<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script>
	
	</script>
<style>
	div.cal{
		width:80%;
		height:700px;
	}
	.card-img-top{
		width:100%;
		height:200px;
	}
	div.card:hover{
		background-color:darkgray;
		transition-duration: 0.5s;
	}
	div.card:hover .card-img-top{
			opacity:0.5;
	}
</style>	
</head>

<div class="py-5 bg-light" >
    <div class="container"  style="margin-left:85px">
		<div class="row row-cols-1 row-cols-md-1 g-4">
			
			<c:set var="list" value ="${PageDTO.getList()}"></c:set>
			<c:forEach var="dto" items="${list}" varStatus="status">	
		  		<div class="col">
		   			<div class="card mb-3">
				  		<div class="row g-0">
				    	<div class="col-md-4">
		      				<img src="/hifive/challengeImage/${dto.getCnum()}" class="card-img-top" alt="...">
				    	</div>
				    	<div class="col-md-8">
				      		<div class="card-body">
				        		<h5 class="card-title">${dto.getName()}</h5>
		        			<p class="card-text">${dto.getSday()} ~ ${dto.getEday()}<br/>참여인원: ${dto.getParticipant()}/${dto.getMpeople()}<br/>참가비: ${dto.getFee()}P<br/>${dto.getCnum()}</p>
				      		</div>
				   		</div>
					  	</div>
					</div>
		  		</div>
			</c:forEach>
			
		</div>
	</div>
</div>



