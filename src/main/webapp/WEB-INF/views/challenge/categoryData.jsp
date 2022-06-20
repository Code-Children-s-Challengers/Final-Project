<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
div.card:hover{
		background-color:darkgray;
		transition-duration: 0.5s;
	}
	div.card:hover .card-img-top{
		opacity:0.5;
	}
	#participate1{
		display:inline-block;
		position:relative;
		left: 170px;
		bottom:10px;
	}
	#participate2{
		display:inline-block;
		position:relative;
		left: 170px;
		bottom:10px;
	}
</style>

<div class="py-5 mb-5 bg-light border border-5">
    <div class="container"  style="margin-left:85px">
	<!--  -->        
		<div class="row row-cols-1 row-cols-md-4 g-4">
		  	<c:set var="list" value ="${hotList}"></c:set>
		  	<c:forEach var="dto" items="${list}" varStatus="status">	
		  	<div class="col">
		    	<div class="card h-100 ch" data-value="${dto.getCnum()}">
		      	<img src="/hifive/challengeImage/${dto.getCnum()}" class="card-img-top" alt="...">
		      	<div class="card-body">
		        	<h5 class="card-title">${dto.getName()}</h5>
		        	<p class="card-text">
		        		<span class="badge rounded-pill bg-danger">기간</span>&nbsp;&nbsp;${dto.getSday()}~${dto.getEday()}<br/>
		        		<span class="badge rounded-pill bg-danger">참가 인원</span>&nbsp;&nbsp; ${dto.getParticipant()}/${dto.getMpeople()}<br/>
		        		<span class="badge rounded-pill bg-danger">참가비</span>&nbsp;&nbsp; ${dto.getFee()}P<br/>
		        		<button type="button" class="btn btn-secondary btn-sm" id="participate1">참가하기</button>
		        	</p>
		      	</div>
		 	</div>
		 	</div>
		 	</c:forEach>
		</div>
	<!--  -->        
    </div>
</div>

<div class="py-5 mb-5 bg-light border border-5" >
    <div class="container"  style="margin-left:85px">
		<div class="row row-cols-1 row-cols-md-4 g-4">
			<c:set var="list2" value ="${PageDTO.getList()}"></c:set>
			<c:forEach var="dto" items="${list2}" varStatus="status">	
		  		<div class="col">
		   			<div class="card h-100 ch" data-value="${dto.getCnum()}">
				      	<img src="/hifive/challengeImage/${dto.getCnum()}" class="card-img-top" alt="...">
				      	<div class="card-body">
				        	<h5 class="card-title">${dto.getName()}</h5>
				        	<p class="card-text">
				        		<span class="badge rounded-pill bg-warning text-dark">기간</span>&nbsp;&nbsp;${dto.getSday()}~${dto.getEday()}<br/>
				        		<span class="badge rounded-pill bg-warning text-dark">참가 인원</span>&nbsp;&nbsp; ${dto.getParticipant()}/${dto.getMpeople()}<br/>
				        		<span class="badge rounded-pill bg-warning text-dark">참가비</span>&nbsp;&nbsp; ${dto.getFee()}P<br/>
				        		<button type="button" class="btn btn-secondary btn-sm" id="participate2">참가하기</button>
				        	</p>
				      	</div>
				   	</div>
		  		</div>
			</c:forEach>
		</div>
	</div>
</div>

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
<script>
$(document).ready(function(){
	
});
</script>