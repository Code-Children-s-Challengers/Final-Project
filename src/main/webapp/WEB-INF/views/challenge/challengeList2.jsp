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
	$(document).ready(function(){
		
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
	div.card:hover{
		background-color:darkgray;
		transition-duration: 0.5s;
	}
	div.card:hover .card-img-top{
		opacity:0.5;
	}
	#participate{
		display:inline-block;
		position:relative;
		left: 170px;
		bottom:10px;
	}
</style>	
</head>

<div class="py-5 bg-light border border-5 mb-5 justify-content-center" >
    <div class="container justify-content-around" style="width:910px;padding:0;" >
		<div class="row row-cols-1 row-cols-md-4 g-4   justify-content-start align-self-center" style="width:100%;margin:0;" >
			<c:set var="list" value ="${PageDTO.getList()}"></c:set>
			<c:forEach var="dto" items="${list}" varStatus="status">	
		  		<div class="col"  >
		   			<div class="card h-100 ch" data-value="${dto.getCnum()}">
		      			<img src="/hifive/challengeImage/${dto.getCnum()}" class="card-img-top" alt="...">
		       			<div class="card-body">
				        	<h5 class="card-title">${dto.getName()}</h5>
				        	<p class="card-text">
				        		<span class="badge rounded-pill bg-warning text-dark">기간</span>&nbsp;&nbsp;${dto.getSday()}~${dto.getEday()}<br/>
				        		<span class="badge rounded-pill bg-warning text-dark">참가 인원</span>&nbsp;&nbsp; ${dto.getParticipant()}/${dto.getMpeople()}<br/>
				        		<span class="badge rounded-pill bg-warning text-dark">참가비</span>&nbsp;&nbsp; ${dto.getFee()}P<br/>
				        		<button type="button" class="btn btn-secondary btn-sm" id="participate">참가하기</button>
				        	</p>
				      	</div>
		    		</div>
		  		</div>
			</c:forEach>
		</div>
	</div>
</div>






