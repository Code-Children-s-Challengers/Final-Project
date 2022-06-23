<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	
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
	
</style>

<form class="row g-3 needs-validation" method="post" action="/hifive/makeChallenge/${id}" enctype="multipart/form-data" id="chMakingForm" novalidate>
  <div class="col-sm-12 pt-5 text-center">
  	<div class="imageContainer ">
  		<img src="/hifive/images/challenge/noImage.gif" class="rounded" alt="..." id="chPhotoImage">
  	</div>
  </div>
  <div class="col-sm-3"></div>
  <div class="col-sm-6 pb-3">
  	<input class="form-control" type="file" name="photo" id="chPhoto" accept="image/*" >
  </div>
  <div class="col-sm-3"></div>
  <!--  -->
  <div class="col-sm-1"></div>
  <div class="col-sm-6">
    <label for="name" class="form-label">제목</label>
    <input type="text" class="form-control" id="name" name="name" aria-describedby="titleV1 titleV2" required >
    <div id="titleV1" class="valid-feedback">
      Good!
    </div>
    <div id="titleV2" class="invalid-feedback">
      	제목을 입력해주세요
    </div>
  </div>
  <div class="col-sm-4">
    <label for="category" class="form-label">카테고리</label>
    <select class="form-select" id="category" name="category" aria-describedby="CategoryV1 CategoryV2" required >
      <option selected disabled value="">Choose...</option>
      <option value="study">Study</option>
      <option value="fitness">Exercise</option>
      <option value="others">Others...</option>
    </select>
    <div id="CategoryV1" class="valid-feedback">
      Good!
    </div>
    <div id="CategoryV2" class="invalid-feedback">
      	카테고리를 선택해주세요
    </div>
  </div>
  <div class="col-sm-1"></div>
  <!--  -->
  <div class="col-sm-1"></div>
  <div class="col-sm-5">
    <label for="start_date" class="form-label">시작일</label>
    <input type="date" class="form-control" id="start_date" name="start_date" aria-describedby="StartV1 StartV2" required >
    <div id="StartV1" class="valid-feedback">
      Good!
    </div>
    <div id="StartV2" class="invalid-feedback">
         시작일을 선택해주세요
    </div>
  </div>
  <div class="col-sm-5">
    <label for="end_date" class="form-label">종료일</label>
    <input type="date" class="form-control" id="end_date" name="end_date" aria-describedby="EndV1 EndV2"  required >
    <div id="EndV1" class="valid-feedback">
      Good!
    </div>
    <div id="EndV2" class="invalid-feedback">
        종료일을 선택해주세요
    </div>
  </div>
  <div class="col-sm-1"></div>
    <!--  -->
  <div class="col-sm-1"></div>
  <div class="col-sm-5">
    <label for="people" class="form-label">최대 참여자 수</label>
    <input type="number" class="form-select" id="people" name="people" aria-describedby="peopleV1 peopleV2"  min="1" required >
    <div id="peopleV1" class="valid-feedback">
      Good!
    </div>
    <div id="peopleV2" class="invalid-feedback">
        최대 참여자 수를 선택해주세요
    </div>
  </div>
  <div class="col-sm-5">
    <label for="fee" class="form-label"><span class="badge rounded-pill bg-dark">P</span>&nbsp;포인트 &nbsp;&nbsp;</label>
    <input type="number" class="form-control" id="fee" name="fee" aria-describedby="pointV1 pointV2"  min="0" required>
     <div id="pointV1" class="valid-feedback">
      Good!
    </div>
    <div id="pointV2" class="invalid-feedback">
        포인트를 선택해주세요
    </div>
  </div>
  <div class="col-sm-1"></div>
  <!--  -->
  <div class="col-sm-1"></div>   
  <div class="col-sm-10">
   		<label for="restOnHoliday" class="form-label">휴일에는 인증을 쉬시겠습니까?</label>
    	<div class="form-check" id="restOnHoliday">
		    <input type="radio" class="form-check-input" id="holiday1" name="holiday" required value="1">
		    <label class="form-check-label" for="holiday1">Yes</label>
		  </div>
		  <div class="form-check mb-3">
		    <input type="radio" class="form-check-input" id="holiday2" name="holiday" required value="0">
		    <label class="form-check-label" for="holiday2">No</label>
		    <div class="invalid-feedback">Yes를 체크하면 휴일에는 인증을 쉴 수 있습니다</div>
		  </div>
  </div>
  <div class="col-sm-1"></div> 
  <!--  -->
  <div class="col=sm-12 text-center">
    <button class="btn btn-primary submit" type="button" id="chSubmit" >Submit form</button>
  </div>
</form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>


$(document).ready(function(){
	
	
	//프로필 이미지 미리보기 기능
	$("form").on("change","#chPhoto", handleChPhoto);
	function handleChPhoto(e){
		console.log("hi");
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			var reader = new FileReader();
			reader.onload = function(e){
				$("#chPhotoImage").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
	}
	

	
	
	//submit 시 유효성 체크
	$(".submit").on("click" ,function(event){
		$.fn.isValid = function(){
			  return this[0].checkValidity()
			}
		console.log($("#chMaking"))
		if (! $("#chMakingForm").isValid()) {
	          event.preventDefault()
	          event.stopPropagation()
	          console.log("why");
	          $("#chMakingForm").addClass('was-validated');
		}else{
			
			//ajax로 formData를 전송한다
	 		var formData = new FormData($("#chMakingForm")[0]);
	 		$.ajax({
	 			url: "/hifive/makeChallenge",
	 			type:"post",
	 			data : formData,
	 			cache: false,
	 			contentType: false,
	 			processData: false,
	 			dataType: 'text',
	 			success: function(data){
	 				if(data == "fail"){
	 					alert("포인트가 부족합니다.");
	 				}else if (data = "success"){
	 					alert("챌린지를 만들었습니다.");	
		 				$(".btn-close").click();
		 				window.location.reload();
	 				}
	 				
	 			}
	 		});	
		}
	
    	
	});
	 
	
	
	$("#start_date").on("change", function(){
		var today = new Date();
		var start_date= $("#start_date").val();
		if(start_date <= today.toISOString().substr(0,10)){
			alert("시작일은 오늘 날짜보다 빠를 수 없습니다");
			$("#start_date").val("");
		}
	});
	
	$("#end_date").on("change", function(){
		var start_date= $("#start_date").val();
		var end_date= $("#end_date").val();
		if(start_date >= end_date){
			alert("종료일은 시작일보다 빠를 수 없습니다");
			$("#end_date").val("");
		}
	});
	
	$("#people").on("change",function(){
		if($("#people").val()<1){
			alert("참여자 수는 1보다 작을 수 없습니다")
			$("#people").val(1);
		}
	})
	
	$("#point").on("change",function(){
		if($("#point").val()<0){
			alert("포인트는 0보다 작을 수 없습니다")
			$("#point").val(0);
		}
	})

});

</script>





