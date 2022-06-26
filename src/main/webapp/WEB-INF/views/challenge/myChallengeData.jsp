<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/hifive/css/myChallengeList.css"/>
	<style>
	</style>
</head>
<script src="/hifive/js/myChallengeList.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//여기다가 설정해주어야 되는 군...
		$.fn.isValid = function(){
			  return this[0].checkValidity()
			}
		
		$(".realCancle").on("click", function(){
			var cnum = $(this).attr("data-cnum");
			var unum = $(this).attr("data-unum");
			$.ajax({
				url:"/hifive/cancle/"+cnum+"/"+unum,
				type :'get',
				contentType: 'text',
				dataType:"text",
				success: function(data){
					alert(data);
					$(".btn-close").click();
					window.location.reload();
				}
			});
			
		});
		
	});
	
</script>
<input type="hidden" value="${tab}" id="curTab"/>
<div class="py-5 justify-content-center"  >
    <div class="container justify-content-around"  style="width:901px;padding:0;">
	<!--  -->     	
		<div class="row row-cols-1 row-cols-md-1 g-5 justify-content-start align-self-center" style="width:100%;margin:0;">	
		
			<c:set var="list" value ="${PageDTO2.getList()}"></c:set>
			<c:forEach var="dto" items="${list}" varStatus="status">	
		  		<!-- card -->
		  		<div class="col " data-bs-toggle="modal" data-bs-target="#closely${dto.getCnum()}">
		   			
		   			<!-- 큰 조건절 -->
		   			<c:choose>
		   			<c:when test="${tab == 'complete'}"><!-- 완료한 챌린지일 때-->
		   				<div class="card border border-3 border-dark" id="myCh${dto.getCnum()}" data-sday="${dto.getSday()}" data-eday="${dto.getEday()}" data-cnum="${dto.getCnum()}" data-unum="${unum}" data-comment="${dto.getCommentList()}">
		   				<span class="badge rounded-pill bg-dark text-white success">종료한 챌린지입니다</span>
		   			</c:when>
		   			<c:when test="${tab == 'wait'}"> <!-- 대기 중인 챌린지일 때-->
		   				<div class="card border border-3 border-secondary" id="myCh${dto.getCnum()}" data-sday="${dto.getSday()}" data-eday="${dto.getEday()}" data-cnum="${dto.getCnum()}" data-unum="${unum}" data-comment="${dto.getCommentList()}">
		   				<span class="badge rounded-pill bg-secondary notYet">대기 중인 챌린지입니다</span>
					</c:when>
					<c:when test="${tab == 'ing'}"> <!-- 참여 중인 챌린지일 때-->
		   				<c:choose>
		   					<c:when test="${dto.getTodayCheck() eq 1}"><!-- 오늘 인증을 완료했을 때 -->
				   				<div class="card border border-3 border-success" id="myCh${dto.getCnum()}" data-sday="${dto.getSday()}" data-eday="${dto.getEday()}" data-cnum="${dto.getCnum()}" data-unum="${unum}" data-comment="${dto.getCommentList()}">
				   				<span class="badge rounded-pill bg-success success">Success</span>
				   			</c:when>
				   			<c:when test="${dto.getTodayCheck() eq 0}"> <!-- 아직 인증을 하지 않았을 때-->
				   				<div class="card border border-3 border-warning" id="myCh${dto.getCnum()}" data-sday="${dto.getSday()}" data-eday="${dto.getEday()}" data-cnum="${dto.getCnum()}" data-unum="${unum}" data-comment="${dto.getCommentList()}">
		   						<span class="badge rounded-pill bg-warning text-dark notYet">인증이 필요합니다</span>
				   			</c:when>
		   				</c:choose>
					</c:when>
		   			</c:choose>
		   			<!-- 큰 조건절 -->
		   			
		   			  	
				  		<div class="row g-0 ">
				    	<div class="col-md-4">
		      				<img src="/hifive/challengeImage/${dto.getCnum()}" class="card-img-top" alt="...">
				    	</div>
				    	<div class="col-md-8">
				      		<div class="card-body">
				        		<h5 class="card-title">${dto.getName()}</h5>
		        			<p class="card-text">${dto.getSday()} ~ ${dto.getEday()}<br/>참여인원: ${dto.getParticipant()}/${dto.getMpeople()}<br/>참가비: ${dto.getFee()}P<br/>${dto.getCnum()}</p>
								<c:choose>
									<c:when test="${tab == 'complete'}"><!-- 완료한 챌린지일 때-->
										<c:choose>
											<c:when test="${dto.getValidP() eq 0}"><!-- 아직 환급 받지 않은 챌린지 -->
												<button type="button" class="btn btn-primary pointBack" data-cnum="${dto.getCnum()}" data-unum="${unum}" data-sday="${dto.getSday()}" data-eday="${dto.getEday()}" data-comment="${dto.getCommentList()}" data-fee="${dto.getFee()}" data-bs-toggle="modal" data-bs-target="#pointBack${dto.getCnum()}">Point 환급 받기</button>
											</c:when>
											<c:when test="${dto.getValidP() eq 1}"><!-- 이미 환급받은 챌린지 -->
												<button type="button" class="btn btn-primary" disabled>환급 완료</button>
											</c:when>
										</c:choose>
									</c:when>
									<c:when test="${tab == 'wait'}"> <!-- 대기 중인 챌린지일 때-->
										<button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#cancle${dto.getCnum()}">챌린지 취소하기</button>
									</c:when>
									<c:when test="${tab == 'ing'}"> <!-- 참여 중인 챌린지일 때-->
										<c:choose>
							      			<c:when test="${dto.getTodayCheck() eq 1}"> <!-- 오늘 인증을 완료한 사람은 사진 올리기 기능을 사용할 수 없다-->
							      				<button type="button" class="btn btn-primary preUpload" data-bs-toggle="modal" data-bs-target="#upload${dto.getCnum()}" disabled>사진 인증하기</button>
							      			</c:when>
							      			<c:when test="${dto.getTodayCheck() eq 0}"><!-- 아직 당일 인증을 완료하지 않은 사람은 사진 올리기 기능을 사용할 수 있다-->
							      				<button type="button" class="btn btn-primary preUpload" data-bs-toggle="modal" data-bs-target="#upload${dto.getCnum()}">사진 인증하기</button>
							      			</c:when>
							      		</c:choose>
						      		</c:when>
						     	</c:choose>
				      		</div>
				   		</div>
					  	</div>
					  	</div>
					  	
					</div>
		  		
		  	<!-- card -->
<!-- 챌린지 취소하기 Modal -->	  
<div class="modal fade cancle" id="cancle${dto.getCnum()}" data-sday="${dto.getSday()}" data-eday="${dto.getEday()}" data-cnum="${dto.getCnum()}" data-unum="${unum}"  tabindex="-1" aria-labelledby="cancleMoal" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="cancleMoal">챌린지 취소하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <!-- 모달 바디 -->
      <div class="modal-body">
		<h4><span class="badge rounded-pill bg-dark">제목</span>&nbsp;&nbsp;${dto.getName()} </h4>			      
		<h4><span class="badge rounded-pill bg-dark">기간</span>&nbsp;&nbsp;${dto.getSday()} ~ ${dto.getEday()} </h4>			      
		<h4><span class="badge rounded-pill bg-dark">챌린지 번호</span>&nbsp;&nbsp;${dto.getCnum()} </h4>	
		<div class="mt-5" style = "text-align:center;"> 
			<span >지금 챌린지를 취소하면 포인트가 100% 환급됩니다. 챌린지를 취소하시겠습니까?</span><br/>
			<span >현재 참여 포인트 : ${dto.getFee()} </span><br/>
			<br/>
			<br/>
			<button type="button" class="btn btn-primary realCancle" id="realCancle${dto.getCnum() }" data-cnum="${dto.getCnum()}" data-unum="${unum}">취소하기</button>
		</div>
		</div> 			  	      
      </div>
      <!-- 모달 바디 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>
      </div>
    </div>
  </div>

<!-- 챌린지 취소하기 Modal -->	  	
<!-- 포인트 환급받기 Modal -->
<div class="modal fade cancle" id="pointBack${dto.getCnum()}" data-sday="${dto.getSday()}" data-eday="${dto.getEday()}" data-cnum="${dto.getCnum()}" data-unum="${unum}"  tabindex="-1" aria-labelledby="completeMoal" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="completeMoal">챌린지 완료하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <!-- 모달 바디 -->
      <div class="modal-body">
		<h4><span class="badge rounded-pill bg-dark">제목</span>&nbsp;&nbsp;${dto.getName()} </h4>			      
		<h4><span class="badge rounded-pill bg-dark">기간</span>&nbsp;&nbsp;${dto.getSday()} ~ ${dto.getEday()} </h4>			      
		<h4><span class="badge rounded-pill bg-dark">챌린지 번호</span>&nbsp;&nbsp;${dto.getCnum()} </h4>	
		<div class="mt-5" style = "text-align:center;"> 
			<span >챌린지가 종료되었습니다. 포인트를 환급 받으시겠습니까?</span><br/>
			<span >참여 포인트 : ${dto.getFee()} </span><br/>
			<span >참여 기간: <span id="a${dto.getCnum()}"></span></span><br/>
			<span >인증 횟수: <span id="b${dto.getCnum()}"></span> </span><br/>
			<span >달성률: <span id="c${dto.getCnum()}"></span> </span><br/>
			<span >환급 포인트: <span id="d${dto.getCnum()}"></span> </span><br/>
			<input type="hidden" class="realPointBack" id="realPointBack${dto.getCnum()}"/>
			<br/>
			<br/>
			<button type="button" class="btn btn-primary realPointBack" id="realPointBack${dto.getCnum()}" data-cnum="${dto.getCnum()}" data-unum="${unum}">환급받기</button>
		</div>
		</div> 			  	      
      </div>
      <!-- 모달 바디 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>
      </div>
    </div>
  </div>

<!-- 포인트 환급받기 Modal -->
 <!-- 인증 사진 모아보기 Modal -->
<div class="modal fade closely" id="closely${dto.getCnum()}" data-sday="${dto.getSday()}" data-eday="${dto.getEday()}" data-cnum="${dto.getCnum()}" data-unum="${unum}"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">참여하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <!-- 모달 바디 -->
      <div class="modal-body">
		<h4><span class="badge rounded-pill bg-dark">제목</span>&nbsp;&nbsp;${dto.getName()} </h4>			      
		<h4><span class="badge rounded-pill bg-dark">기간</span>&nbsp;&nbsp;${dto.getSday()} ~ ${dto.getEday()} </h4>			      
		<h4><span class="badge rounded-pill bg-dark">챌린지 번호</span>&nbsp;&nbsp;${dto.getCnum()} </h4>	
		
		<div id="carousel${dto.getCnum()}" class="carousel slide cPhotoZone" data-bs-ride="carousel">
		  <div class="carousel-inner" id="inner${dto.getCnum()}" >
		   <!-- 들어가야할 내용 --> 
		   <!-- 들어가야할 내용 -->    
		   
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carousel${dto.getCnum()}" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carousel${dto.getCnum()}" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div> 			  	      
      </div>
      <!-- 모달 바디 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
 <!-- 인증 사진 모아보기 Modal -->
<!-- 인증 사진 업로드 Modal -->
<div class="modal fade" id="upload${dto.getCnum()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">참여하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<!-- 인증 사진을 올리기 위한 form -->
		<form class="row g-3 needs-validation" method="post" action="/hifive/upload/${unum}" enctype="multipart/form-data" id="uploadForm${dto.getCnum()}" data-cnum="${dto.getCnum()}" novalidate>
			<div class="col-sm-12 pt-5 text-center">
		  		<div class="imageContainer ">
		  			<img src="/hifive/images/challenge/noImage.gif" class="rounded" alt="..." id="uploadPhotoImage${dto.getCnum()}">
		  		</div>
		  	</div>
		  	<div class="col-sm-3"></div>
		  <div class="col-sm-6 pb-3">
		  	<input class="form-control uploadPh" type="file" name="uploadPh" id="uploadPh" accept="image/*" required >
		  </div>
		  <div class="col-sm-3"></div>
		  <!--  -->
		   <div class="col-sm-1"></div>
		  <div class="col-sm-6">
		    <label for="comment" class="form-label">Comment</label>
		    <input type="text" class="form-control" id="c_comment" name="c_comment" aria-describedby="commentV1 commentV2" required >
		    <div id="commentV1" class="valid-feedback">
		      Good!
		    </div>
		    <div id="commentV2" class="invalid-feedback">
		      	한마디 적어주십쇼!
		    </div>
		  </div>
		  <div class="col-sm-4">
		     <label for="start_date" class="form-label">인증 날짜</label>
		    <input type="date" class="form-control today" id="today" name="today"  disabled >
		  </div>
		  <div class="col-sm-1"></div>
		  <!--  -->	
		 </form>
		 <!-- form -->
     </div>
     <div class="modal-footer">
       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
       <button type="button" class="btn btn-primary upload" data-cnum="${dto.getCnum()}" data-unum="${unum}">인증사진 올리기</button>
      </div>
    </div>
  </div>
</div>
<!-- 인증 사진 업로드 Modal -->
			</c:forEach>
		</div>
	</div>
</div>