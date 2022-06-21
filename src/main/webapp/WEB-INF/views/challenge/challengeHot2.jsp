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
		
		$(".participateCheck").on("click",function(){
			var cnum = $(this).attr("data-cnum");
			console.log(cnum);
			$('.btn-close').click(); 
			console.log(cnum);
			// 0.5초 후 ajax를 실행한다
			var delayInMilliseconds = 500; 
			setTimeout(function() {
			 	
				//ajax
				$.ajax({
					url:'/hifive/challengeParticipate',
					type:'post',
					data:{
						"cnum":cnum
					},
				dataType:'text',
				success:function(responseData, status, xhr){
						console.log(responseData);
						if(responseData == "success"){
							alert("참가되었습니다!");
						}else if(responseData == "already participated"){
							alert("이미 참가 중입니다!");
						}else if(responseData == "nomoney"){
							alert("참가비가 부족합니다!");
						}else if(responseData == "full"){
							alert("참여자 수가 가득 찼습니다!");
						}else{
							alert("오류 발생");
						}
					}
				});
				
				
			}, delayInMilliseconds);//end of setTimeOut
		}); //end of event

	}); //end of ready
	</script>
	<style>
		div.col{
			display:inline-block;
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
		.participate{
			display:inline-block;
			position:relative;
			left: 170px;
			bottom:10px;
			
		}
	</style>
</head>
 <div class="py-5 mb-5 bg-light  border border-5 justify-content-center" >
    <div class="container justify-content-around" style="width:901px;padding:0;" >
	<!--  -->        
		<div class="row row-cols-md-4 g-4 justify-content-start align-self-center" style="width:100%;margin:0;">
		  	<c:set var="list" value ="${hotList}"></c:set>
		  	<c:forEach var="dto" items="${list}" varStatus="status">	
		  	<!-- card -->
		  	<div class="col ">
		    	<div class="card border-danger h-100 ch">
		      		<img src="/hifive/challengeImage/${dto.getCnum()}" class="card-img-top" alt="...">
		      	<div class="card-body">
		        	<h5 class="card-title">${dto.getName()}</h5>
		        	<p class="card-text">
		        		<span class="badge rounded-pill bg-danger">기간</span>&nbsp;&nbsp;${dto.getSday()}~${dto.getEday()}<br/>
		        		<span class="badge rounded-pill bg-danger">참가 인원</span>&nbsp;&nbsp; ${dto.getParticipant()}/${dto.getMpeople()}<br/>
		        		<span class="badge rounded-pill bg-danger">참가비</span>&nbsp;&nbsp; ${dto.getFee()}P<br/>
		        		<button type="button" class="btn btn-secondary btn-sm participate"  data-cnum="${dto.getCnum()}" data-bs-toggle="modal" data-bs-target="#participateCheck${dto.getCnum()}">참가하기</button>
		        	</p>
		      	</div>
		   	 </div>
		 	</div>
		 	<!-- card -->
		 	<!-- Modal -->
			<div class="modal fade" id="participateCheck${dto.getCnum()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">참여하기</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        챌린지에 참여하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary participateCheck" data-cnum="${dto.getCnum()}">Save changes</button>
			      </div>
			    </div>
			  </div>
			</div>
		 	<!-- Modal -->
		 	</c:forEach>
		</div>
	<!--  -->        
    </div>
</div>






