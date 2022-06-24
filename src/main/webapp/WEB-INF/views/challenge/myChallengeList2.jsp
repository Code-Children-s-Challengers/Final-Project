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
		 $(".closely").on("click", function(){
			 
		 });
	 });
	</script>
<style>
	
	.card-img-top{
		width:100%;
		height:220px;';
	}
	div.card:hover{
		background-color:darkgray;
		transition-duration: 0.5s;
	}
	div.card:hover .card-img-top{
			opacity:0.5;
	}
		
	.imageContainer{
		display:inline-block;
		height:180px;
		width: 250px;
	}
	
	.imageContainer > img {
	  height: 100%;
	  width: 100%;
	  object-fit: fill;
	}
	.success{
		position:relative;
		bottom:10px;
	}
	.notYet{
		position:relative;
		bottom:10px;
	}
	.cPhotoZone{
		width:400px;
		object-fit: contain;
		text-align:center;
		margin:auto;
	}
	.cPhotoZone img{
		width:100%;
		height:300px;
	}
	
</style>	
</head>
<!-- 당일 인증 여부 -->
<c:forEach var="map" items="${chList}" varStatus="status2">	
	<input type="hidden" value="${map.values}" id="valid${map.cnum}"/>
</c:forEach>
<!-- 당일 인증 여부 -->

<div class="py-5 bg-light border border-5 justify-content-center"  >
    <div class="container justify-content-around"  style="width:901px;padding:0;">
	<!--  -->     	
		<div class="row row-cols-1 row-cols-md-1 g-4 justify-content-start align-self-center" style="width:100%;margin:0;">	
			<c:set var="list" value ="${PageDTO2.getList()}"></c:set>
			<c:forEach var="dto" items="${list}" varStatus="status">	
		  		<!-- card -->
		  		<div class="col" data-bs-toggle="modal" data-bs-target="#closely${dto.getCnum()}" >
		   			
		   			
		   			<c:choose>
		   			<c:when test="${dto.getTodayCheck() eq 1}">
		   			<div class="card mb-3 border border-3 border-success" id="myCh${dto.getCnum()}" data-sday="${dto.getSday()}" data-eday="${dto.getEday()}" data-cnum="${dto.getCnum()}" data-unum="${unum}" data-comment="${dto.getCommentList()}">
		   			<span class="badge rounded-pill bg-success success">Success</span>
		   			</c:when>
		   			<c:when test="${dto.getTodayCheck() eq 0}"> 
		   			<div class="card mb-3 border border-3 border-warning" id="myCh${dto.getCnum()}" data-sday="${dto.getSday()}" data-eday="${dto.getEday()}" data-cnum="${dto.getCnum()}" data-unum="${unum}" data-comment="${dto.getCommentList()}">
		   			<span class="badge rounded-pill bg-warning text-dark notYet">인증이 필요합니다</span>
		   			</c:when>
		   			</c:choose>
		   			
		   			
		   			  	
				  		<div class="row g-0 ">
				    	<div class="col-md-4">
		      				<img src="/hifive/challengeImage/${dto.getCnum()}" class="card-img-top" alt="...">
				    	</div>
				    	<div class="col-md-8">
				      		<div class="card-body">
				        		<h5 class="card-title">${dto.getName()}</h5>
		        			<p class="card-text">${dto.getSday()} ~ ${dto.getEday()}<br/>참여인원: ${dto.getParticipant()}/${dto.getMpeople()}<br/>참가비: ${dto.getFee()}P<br/>${dto.getCnum()}</p>
				      		<c:choose>
				      			<c:when test="${dto.getTodayCheck() eq 1}"> <!-- 오늘 인증을 완료한 사람은 사진 올리기 기능을 사용할 수 없다-->
				      				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#upload${dto.getCnum()}" disabled>사진 인증하기</button>
				      			</c:when>
				      			<c:when test="${dto.getTodayCheck() eq 0}"><!-- 아직 당일 인증을 완료한 사람은 사진 올리기 기능을 사용할 수 있다-->
				      				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#upload${dto.getCnum()}" >사진 인증하기</button>
				      			</c:when>
				      		</c:choose>
				      		</div>
				   		</div>
					  	</div>
					</div>
		  		</div>
		  	<!-- card -->
		  	<!-- Modal -->
			<div class="modal fade closely" id="closely${dto.getCnum()}" data-sday="${dto.getSday()}" data-eday="${dto.getEday()}" data-cnum="${dto.getCnum()}" data-unum="${unum}"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">참여하기</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
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
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
		 	<!-- Modal -->
		 	<!-- Modal -->
			<div class="modal fade" id="upload${dto.getCnum()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-xl">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">참여하기</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
<!-- 인증 사진을 올리기 위한 form -->
<form class="row g-3 needs-validation" method="post" action="/hifive/upload/${unum}" enctype="multipart/form-data" id="uploadForm${dto.getCnum()}"  novalidate>
	<div class="col-sm-12 pt-5 text-center">
  		<div class="imageContainer ">
  			<img src="/hifive/images/challenge/noImage.gif" class="rounded" alt="..." id="uploadPhotoImage${dto.getCnum()}">
  		</div>
  	</div>
  	<div class="col-sm-3"></div>
  <div class="col-sm-6 pb-3">
  	<input class="form-control uploadPh" type="file" name="uploadPh" id="uploadPh" accept="image/*"  data-cnum="${dto.getCnum()}" required >
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
     <label for="realDate2" class="form-label">인증 날짜</label>
    <input type="date" class="form-control  today" id="today" name="today"  disabled>
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
		 	<!-- Modal -->
			</c:forEach>
		</div>
	</div>
</div>



<script>
	$(document).ready(function(){
		console.log(new Date().toISOString().substring(0, 10));
		$(".today").val(new Date().toISOString().substring(0, 10));
		
		//프로필 이미지 미리보기 기능
		$("form").on("change",".uploadPh", handleChPhoto);
		function handleChPhoto(e){
			var cnum = $(this).attr("data-cnum")
			console.log(cnum);
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				var reader = new FileReader();
				reader.onload = function(e){
					$("#uploadPhotoImage"+cnum).attr("src", e.target.result);
					}
					reader.readAsDataURL(f);
				});
		}
		
		
		
		// 클릭 이벤트 발생 시 ajax처리한다
		$(".upload").on("click",function(){
			// inValid라는 함수를 만들 수 있다!!
			$.fn.isValid = function(){
				  return this[0].checkValidity()
				}
			
			//form의 data-cnum
			var cnum = $(this).attr("data-cnum");
			console.log(cnum);
			console.log($("#uploadForm"+cnum));
			// 부트스트랩 유효성 검증  
			if (! $("#uploadForm"+cnum).isValid()) {
		          event.preventDefault()
		          event.stopPropagation()
		          console.log("why");
		          $("#uploadForm"+cnum).addClass('was-validated');
		        }else{
		        	//ajax로 formData를 전송한다, 전송 대상 : 사진, comment
					var formData = new FormData($("#uploadForm"+cnum)[0]);
					$.ajax({
						url: "/hifive/upload/"+cnum,
						type:"post",
						data : formData,
						cache: false,
						contentType: false,
						processData: false,
						dataType: 'text',
						success: function(data){
							alert(data);	
							$(".btn-close").click();
							window.location.reload();
						}
					});			
		        }			 
			 
		});
		
		
		$(".card").on("click",function(){
			
			var cnum = $(this).attr("data-cnum");
			var unum = $(this).attr("data-unum");
			var sday = $(this).attr("data-sday");
			var eday = $(this).attr("data-eday");
			var commentList = $(this).attr("data-comment");
			
			// 일단 안에 비우고 시작
			$("#inner"+cnum).html("");
			
			// 소요 기간 (ex 3일)
			var validDay = getDateDiff(sday, eday)+1;
			$("#a"+cnum).val(validDay);
			
			
			var commentList2 = commentList.slice(1,-1);
			console.log(commentList2);
			var commentList3 = commentList2.split(", ");
			console.log(commentList3.length);
			var commentList4 = [];
			
			for( var i2 =0 ;i2<commentList3.length; i2++){
				var a = commentList3[i2].slice(1,-1)
				console.log(a.split("="));
				commentList4.push(a.split("="));
			}
			
			
			console.log(commentList4);
			var commentDay = []; // 코멘트를 남긴 날들 ex) 2022-06-22, 2022-06-23...
			var realComment = []; //실제 코멘트 내용 ex)운동1, 운동2 ...
			for(var i3=0 ; i3<commentList4.length; i3++){
				commentDay.push(commentList4[i3][0]);
				realComment.push(commentList4[i3][1]);
			}
			
			for(var i = 0 ;i<validDay; i++){
				//어제날짜 구하기
				var today = new Date();
				today.setHours(0,0,0,0);
				
				//유효한 date들을 문자열로 만든다 => YYYY-MM-DD 형식의 문자열로 만들어줌
				var date = new Date(sday)
				date.setDate(date.getDate()+i); 
				var photoDay = dateToString(date); //실질적인 날짜				
				
				var commentChecker = commentDay.indexOf(photoDay); //일치하는 날이 있으면 그 위치(인덱스), 일치한 날이 없으면 -1
				
				//실질적으로 인증한 마지막 날
				var lastDay = new Date(commentDay[commentDay.length-1])
				
				if(commentChecker != -1){ //인증한 날이 있을 때					
					if(i==0){ //첫번째 슬라이드에는 active 추가
						$("#inner"+cnum).append('<div class="carousel-item active cPhotoImage" id="cPhotoImage'+i+'"><img src="/hifive/cPhotoImage/'+cnum+'/'+unum+'/'+photoDay+'" alt="..."><h3>'+photoDay+'&nbsp;<span class="badge rounded-pill bg-success">인증 성공</span></h3><div class="container">'+realComment[commentChecker]+'</div></div>');
					}else{ //두 번째 슬라이드부터는 active 추가X
						$("#inner"+cnum).append('<div class="carousel-item cPhotoImage" id="cPhotoImage'+i+'"><img src="/hifive/cPhotoImage/'+cnum+'/'+unum+'/'+photoDay+'"  alt="..."><h3>'+photoDay+'&nbsp;<span class="badge rounded-pill bg-success">인증 성공</span></h3><div class="container">'+realComment[commentChecker]+'</div></div>');
					}
				}else if( new Date(photoDay) > today ){ //인증할 날이 아직 다가오지 않았을 때 혹은 오늘까지 인증할 수 있을 때 
					if(i==0){ //첫번째 슬라이드에는 active 추가
						$("#inner"+cnum).append('<div class="carousel-item active cPhotoImage" id="cPhotoImage'+i+'"><img src="/hifive/cPhotoImage/'+cnum+'/'+unum+'/'+photoDay+'" alt="..."><h3>'+photoDay+'&nbsp;<span class="badge rounded-pill bg-warning text-dark">인증 예정</span></h3><div class="container">'+'해당 날짜에 인증해주세요'+'</div></div>');
					}else{ //두 번째 슬라이드부터는 active 추가X
						$("#inner"+cnum).append('<div class="carousel-item cPhotoImage" id="cPhotoImage'+i+'"><img src="/hifive/cPhotoImage/'+cnum+'/'+unum+'/'+photoDay+'"  alt="..."><h3>'+photoDay+'&nbsp;<span class="badge rounded-pill bg-warning text-dark">인증 예정</span></h3><div class="container">'+'해당 날짜에 인증해주세요'+'</div></div>');
					}
				}else{// 인증을 실패했을 때
					if(i==0){ //첫번째 슬라이드에는 active 추가
						$("#inner"+cnum).append('<div class="carousel-item active cPhotoImage" id="cPhotoImage'+i+'"><img src="/hifive/cPhotoImage/'+cnum+'/'+unum+'/'+photoDay+'" alt="..."><h3>'+photoDay+'&nbsp;<span class="badge rounded-pill bg-danger">인증 실패</span></h3><div class="container">'+'인증하지 못한 하루...'+'</div></div>');
					}else{ //두 번째 슬라이드부터는 active 추가X
						$("#inner"+cnum).append('<div class="carousel-item cPhotoImage" id="cPhotoImage'+i+'"><img src="/hifive/cPhotoImage/'+cnum+'/'+unum+'/'+photoDay+'"  alt="..."><h3>'+photoDay+'&nbsp;<span class="badge rounded-pill bg-danger">인증 실패</span></h3><div class="container">'+'인증하지 못한 하루...'+'</div></div>');
					}
				}
				
				
			}
			
			
		});
		//날짜 차이 계산 해주는 함수
		const getDateDiff = (d1, d2) => {
			  const date1 = new Date(d1);
			  const date2 = new Date(d2);
			  
			  const diffDate = date1.getTime() - date2.getTime();
			  
			  return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
		}
		
		//자바스크립트 날짜 => 문자열 포맷함수
		function dateToString(date)
		{
					var dd = date.getDate();
					var mm = date.getMonth()+1; //January is 0!
				
					var yyyy = date.getFullYear();
					if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm}
					
					yyyy = yyyy.toString();
					mm = mm.toString();
					dd = dd.toString();
				
					var s1 = yyyy+"-"+mm+"-"+dd;
					return s1;
		}
		
		
		
	});

	
</script>