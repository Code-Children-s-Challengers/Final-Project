<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						window.location.reload()
					}
				});
				
				
			}, delayInMilliseconds);//end of setTimeOut
		}); //end of event
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
	.participate{
		display:inline-block;
		position:relative;
		left: 170px;
		bottom:10px;
	}
	.myTitle{
		  	overflow: hidden;
		  	text-overflow: ellipsis;
		  	white-space: nowrap;
		  	width: 240px;
		  	height: 25px;
		}
	.hotCh{
			display:inline-block;
			position:relative;
			left: 170px;
			bottom:320px;
			width:100px;
		}
</style>

<div class="pt-5 " style="margin:auto;">
    <div class="container" style="width:100%;padding:0;margin:auto;" >
	<!--  -->        
		<div class="row row-cols-1 row-cols-md-3 g-4 " style="width:900px;margin:auto;">
		  	<c:set var="list" value ="${hotList}"></c:set>
		  	<c:forEach var="dto" items="${list}" varStatus="status">	
		  	<!-- card -->
		  	<div class="col">
		    	<div class="card border border-2 border-danger h-100 ch" data-value="${dto.getCnum()}">
		      		<img src="/hifive/challengeImage/${dto.getCnum()}" class="card-img-top" alt="...">
		      	<div class="card-body">
		        	<h5 class="card-title myTitle">${dto.getName()}</h5>
		        	<div class="card-text">
		        		<span class="badge rounded-pill bg-danger">기간</span>&nbsp;&nbsp;${dto.getSday()}~${dto.getEday()}<br/>
		        		<span class="badge rounded-pill bg-danger">참가 인원</span>&nbsp;&nbsp; ${dto.getParticipant()}/${dto.getMpeople()}<br/>
		        		<span class="badge rounded-pill bg-danger">참가비</span>&nbsp;&nbsp; ${dto.getFee()}P<br/>
		        		<button type="button" class="btn btn-secondary btn-sm participate" id="participate1" data-value="${dto.getCnum()}"  data-bs-toggle="modal" data-bs-target="#participateCheck${dto.getCnum()}">참가하기</button>
		        		<h2><span class="badge rounded-pill bg-danger hotCh">HOT</span></h2>
		        	</div>
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

<div class="mb-5 "  style="margin:auto;">
    <div class="container " style="width:100%;padding:0;margin:auto;" >
	<!--  -->        
		<div class="row row-cols-1 row-cols-md-3 g-4 " style="width:900px;margin:auto;">
			<c:set var="list2" value ="${PageDTO.getList()}"></c:set>
			<c:forEach var="dto" items="${list2}" varStatus="status">	
		  		<!-- card -->
		  		<div class="col">
		   			<div class="card  h-100 ch" data-value="${dto.getCnum()}">
				      	<img src="/hifive/challengeImage/${dto.getCnum()}" class="card-img-top" alt="...">
				      	<div class="card-body">
				        	<h5 class="card-title myTitle">${dto.getName()}</h5>
				        	<p class="card-text">
				        		<span class="badge rounded-pill bg-warning text-dark">기간</span>&nbsp;&nbsp;${dto.getSday()}~${dto.getEday()}<br/>
				        		<span class="badge rounded-pill bg-warning text-dark">참가 인원</span>&nbsp;&nbsp; ${dto.getParticipant()}/${dto.getMpeople()}<br/>
				        		<span class="badge rounded-pill bg-warning text-dark">참가비</span>&nbsp;&nbsp; ${dto.getFee()}P<br/>
		        				<button type="button" class="btn btn-secondary btn-sm participate" id="participate2" data-value="${dto.getCnum()}"  data-bs-toggle="modal" data-bs-target="#participateCheck${dto.getCnum()}">참가하기</button>
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
			        <button type="button" class="btn btn-primary participateCheck" data-cnum="${dto.getCnum()}">참가하기</button>
			      </div>
			    </div>
			  </div>
			</div>
		 	<!-- Modal -->
			</c:forEach>
		</div>
	</div>
<input type="hidden" id="curPage2" data-curPage="${curPage}" />
<input type="hidden" id="tot2" data-tot="${totalPage}" />
<input type="hidden" id="category2" data-category="${category}"/>
<nav aria-label="Page navigation example">
  <ul class="pagination mt-4 justify-content-center">
    <li class="page-item" id="previous" ><a class="page-link" id="previousLink">Previous</a></li>
        <c:forEach  begin="1" end="${totalPage}"  varStatus="status2">	
    		<li class="page-item pageNumber" id="page2${status2.count}" data-page="${status2.count}"><a class="page-link">${status2.count}</a></li> <!-- 2부터 시작 -->
		 </c:forEach>
    <li class="page-item" id="next"><a class="page-link" id="nextLink">Next</a></li>
  </ul>
</nav>	
	
</div>
<script>
	$(document).ready(function(){
		// 페이지 선택 과정
		var category2 = $("#category2").attr("data-category");
		var curPage2 = $("#curPage2").attr("data-curPage");
		$("#page2"+curPage2).addClass("active");
		
		var tot2 = $("#tot2").attr("data-tot");
		console.log(tot2);
		if(curPage2 == 1){
			$("#previous").addClass("disabled");
			$('#previousLink').on('click', function(){console.log("why"); return false;});
		}
		
		if(curPage2 ==tot2 ||tot2 ==0){
			$("#next").addClass("disabled");
			$('#nextLink').on('click', function(){console.log("why"); return false;});
		}
		
		$(".pageNumber").on("click",function(){
			var clickPage2 = $(this).attr("data-page");
			$.ajax({
				type:"get",
				url:"/hifive/challengesAjax?category="+category2+"&curPage="+clickPage2,
				cache : false,
				success : function(data) {
					$("#content").html(data);
				}
			});
		});
		
		$("#nextLink").on("click",function(){
			var nextPage = Number(curPage2)+1;
			$.ajax({
				type:"get",
				url:"/hifive/challengesAjax?category="+category2+"&curPage="+nextPage,
				cache : false,
				success : function(data) {
					$("#content").html(data);
				}
			});
		});
		
		$("#previousLink").on("click",function(){
			var previousPage = Number(curPage2)-1;
			$.ajax({
				type:"get",
				url:"/hifive/challengesAjax?category="+category2+"&curPage="+previousPage,
				cache : false,
				success : function(data) {
					$("#content").html(data);
				}
			});
		});
		// 페이지 선택 과정
		
		
		//챌린지 참여하기 전 로그인 확인
		$(".participate").on("click", function(){
			if( $(".loginChecker").attr("data-id") == 0){
				alert("로그인이 필요합니다.");
				location.href="/hifive/loginForm";
			}
		});
	});
</script>
