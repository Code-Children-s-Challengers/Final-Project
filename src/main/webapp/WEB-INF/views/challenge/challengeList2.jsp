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
</style>	
</head>

<div class="py-5 bg-light border border-5 mb-5" style="margin:auto;" >
    <div class="container" style="width:100%;padding:0;margin:auto;" >
		<div class="row row-cols-1 row-cols-md-3 g-4 " style="width:900px;margin:auto;" >
			<c:set var="list" value ="${PageDTO.getList()}"></c:set>
			<c:forEach var="dto" items="${list}" varStatus="status">	
		  		<!-- card -->
		  		<div class="col"  >
		   			<div class="card h-100 ch" data-value="${dto.getCnum()}">
		      			<img src="/hifive/challengeImage/${dto.getCnum()}" class="card-img-top" alt="...">
		       		<div class="card-body">
			        	<h5 class="card-title myTitle">${dto.getName()}</h5>
			        	<p class="card-text">
			        		<span class="badge rounded-pill bg-warning text-dark">기간</span>&nbsp;&nbsp;${dto.getSday()}~${dto.getEday()}<br/>
			        		<span class="badge rounded-pill bg-warning text-dark">참가 인원</span>&nbsp;&nbsp; ${dto.getParticipant()}/${dto.getMpeople()}<br/>
			        		<span class="badge rounded-pill bg-warning text-dark">참가비</span>&nbsp;&nbsp; ${dto.getFee()}P<br/>
	        				<button type="button" class="btn btn-secondary btn-sm participate" id="participate" data-value="${dto.getCnum()}"  data-bs-toggle="modal" data-bs-target="#participateCheck${dto.getCnum()}">참가하기</button>
			        	</p>
				      </div>
		    		</div>
		  		</div>
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
		  		<!-- card -->
			</c:forEach>
		</div>
	</div>
<input type="hidden" id="curPage" data-curPage="${curPage}" />
<input type="hidden" id="tot" data-tot="${totalPage}" />
<nav aria-label="Page navigation example">
  <ul class="pagination mt-4 justify-content-center">
    <li class="page-item" id="previous"><a class="page-link" id="previousLink" >Previous</a></li>
        <c:forEach  begin="1" end="${totalPage}"  varStatus="status2">	
    		<li class="page-item pageNumber" id="page${status2.count}" data-page="${status2.count}"><a class="page-link">${status2.count}</a></li> <!-- 2부터 시작 -->
		 </c:forEach>
    <li class="page-item" id="next"><a class="page-link" id="nextLink">Next</a></li>
  </ul>
</nav>
</div>

<script>
	$(document).ready(function(){
		// 페이지 선택 과정
		var curPage = $("#curPage").attr("data-curPage");
		$("#page"+curPage).addClass("active");
		
		var tot = $("#tot").attr("data-tot");
		if(curPage == 1){
			$('#previousLink').on('click', function(){console.log("why"); return false;});
			$("#previous").addClass("disabled");
		}
		if(curPage == tot ){
			$('#nextLink').on('click', function(){console.log("why"); return false;});
			$("#next").addClass("disabled");
		}
		
		
		$(".pageNumber").on("click",function(){
			var clickPage = $(this).attr("data-page");
			$.ajax({
				type:"get",
				url:"/hifive/challengesAjax?category=study&curPage="+clickPage,
				cache : false,
				success : function(data) {
					$("#content").html(data);
				}
			});
		});
		
		$("#nextLink").on("click",function(){
			var nextPage = Number(curPage)+1;
			$.ajax({
				type:"get",
				url:"/hifive/challengesAjax?category=study&curPage="+nextPage,
				cache : false,
				success : function(data) {
					$("#content").html(data);
				}
			});
		});
		
		$("#previousLink").on("click",function(){
			var previousPage = Number(curPage)-1;
			$.ajax({
				type:"get",
				url:"/hifive/challengesAjax?category=study&curPage="+previousPage,
				cache : false,
				success : function(data) {
					$("#content").html(data);
				}
			});
		});
		// 페이지 선택 과정
	});
</script>






