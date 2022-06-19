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

<form class="row g-3" method="post" action="makeChallenge" enctype="multipart/form-data" id="chMaking">
  <div class="col-sm-12 pt-5 text-center">
  	<div class="imageContainer ">
  		<img src="/hifive/images/challenge/noImage.gif" class="rounded" alt="..." id="chPhotoImage">
  	</div>
  </div>
  <div class="col-sm-3"></div>
  <div class="col-sm-6 pb-3">
  	<input class="form-control" type="file" name="photo" id="chPhoto" accept="image/*">
  </div>
  <div class="col-sm-3"></div>
  <!--  -->
  <div class="col-sm-1"></div>
  <div class="col-sm-6">
    <label for="name" class="form-label">제목</label>
    <input type="text" class="form-control" id="name" name="name" required aria-describedby="titleV1 titleV2">
    <div id="titleV1" class="valid-feedback">
      Good!
    </div>
    <div id="titleV2" class="invalid-feedback">
      	제목을 입력해주세요
    </div>
  </div>
  <div class="col-sm-4">
    <label for="category" class="form-label">카테고리</label>
    <select class="form-select" id="category" name="category" aria-describedby="CategoryV1 CategoryV2" required>
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
    <input type="date" class="form-control" id="start_date" name="start_date" aria-describedby="StartV1 StartV2" required>
    <div id="StartV1" class="valid-feedback">
      Good!
    </div>
    <div id="StartV2" class="invalid-feedback">
         시작일을 선택해주세요
    </div>
  </div>
  <div class="col-sm-5">
    <label for="end_date" class="form-label">최종일</label>
    <input type="date" class="form-control" id="end_date" name="end_date" aria-describedby="EndV1 EndV2" required>
    <div id="EndV1" class="valid-feedback">
      Good!
    </div>
    <div id="EndV2" class="invalid-feedback">
        최종일을 선택해주세요
    </div>
  </div>
  <div class="col-sm-1"></div>
    <!--  -->
  <div class="col-sm-1"></div>
  <div class="col-sm-5">
    <label for="people" class="form-label">최대 참여자 수</label>
    <input type="number" class="form-select" id="people" name="people" aria-describedby="peopleV1 peopleV2" required >
    <div id="peopleV1" class="valid-feedback">
      Good!
    </div>
    <div id="peopleV2" class="invalid-feedback">
        최대 참여자 수를 선택해주세요
    </div>
  </div>
  <div class="col-sm-5">
    <label for="fee" class="form-label">포인트</label>
    <input type="number" class="form-control" id="fee" name="fee" aria-describedby="pointV1 pointV2" required>
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
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="1" name="holiday" id="holiday">
      <label class="form-check-label" for="holiday">
        	휴일(주말, 공휴일)에는 인증을 제외하시겠습니까?
      </label>
    </div> 
  </div>
  <div class="col-sm-1"></div> 
  <!--  -->
  <div class="col=sm-12">
    <button class="btn btn-primary" type="submit">Submit form</button>
  </div>
</form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

var skiparray = new Array();



$(document).ready(function(){
	
	var sel_file2;
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
			sel_file2 = f;
			var reader = new FileReader();
			reader.onload = function(e){
				$("#chPhotoImage").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
	}

	
	
	
	$("#yes").on("click",function(){
		console.log("1차성공");

		var form = $('#make')[0];
		var data = new FormData(form);
		
		var name = $('#name').val();
		var category = $('#category').val();
		var start_date = $('#start_date').val();
		var end_date = $('#end_date').val();
		var people = $('#people').val();
		var fee = $('#fee').val();
		var today = new Date();
		
		if(name == "" || category == "" || start_date == "" || end_date == "" || people == "" || fee == ""){
			alert("모든 항목을 채워주세요");
		}else if(people < 1){
			alert("최소 인원은 1입니다");
		}else if(people < 0){
			alert("최소 비용은 0입니다");
		}else if(start_date >= end_date){
			alert("종료 날짜는 시작 날짜 이전일 수 없습니다");
		}else if(start_date <= today.toISOString().substr(0,10)){
			alert("시작 날짜는 오늘날짜 이후일 수 없습니다");
		}else{
			console.log("2차 성공");
			$.ajax({
				url:'makeChallenge',
				type:'post',
				enctype:'multipart/form-data',
				data:data,
				processData: false,
			    contentType: false,
			dataType:'text',
			success:function(responseData, status, xhr){
				if(responseData == "success"){
					alert("챌린지를 등록했습니다");
					opener.location.reload();
					window.close();
				}else{
					alert("오류 발생");
					window.close();
				}
			},
			error:function(xhr, status, e){
				console.log("Error: "+e);
			}
			});
		}
		return false;
		
	});
	$("#no").on("click",function(){
		window.close();
	});
	$("#skip").on("click",function(){
		win = window.open("./skipdayPopup", "_blank","width = 500, height = 300, top = 100, left = 200, location = no, status = no, fullscreen = no");
		return false;
	});
});

function addskipday(str){
	skiparray.push(str);
}
function setskipday(){
	var skipday = document.querySelector("#skipday");
	var hidden = document.querySelector("#skiphidden");
	skipday.innerHTML = ``;
	hidden.value = "";
	
	var set = new Set(skiparray);
	for(var i of set){
		skipday.innerHTML += i + `<br>`;
		hidden.value += i+" "
	}
}
</script>





