<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

	var skiparray = new Array();
	
	function setThumbnail(event) { 
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("#thumbnail").src = event.target.result;
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	
	$(document).ready(function(){
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




<form method="post" action="makeChallenge" enctype="multipart/form-data" id="make">
   <input type="text" name="theName" hidden="true"/>
   <input type="text" name="skiphidden" id="skiphidden" value="" hidden="true"/>
   <img src="images/challenge/challenge_sample.jpg" border="0" align="center" width="200" id="thumbnail"><br>
   <input type="file" name="photo" id="photo" accept="image/*" onchange="setThumbnail(event)"/>
   <br>
	Name: <input type="text" name="name" id="name">
	<br>
	category: <select name="category" id="category">
				<option value="study">study</option>
				<option value="fitness">fitness</option>
				<option value="others">others</option>
			</select>
	<br>
	start date: <input type="date" name="start_date" id="start_date">
	<br>
	end date: <input type="date" name="end_date" id="end_date">
	<br>
	max participant: <input type="number" name="people" id="people" placeholder="개인 challenge의 경우 1입력">
	<br>
	fee: <input type="number" name="fee" id="fee" placeholder="개인 challenge의 경우 0입력">
	<br>
	rest on holiday: <select name="holiday" id="holiday">
				<option value="1">yes</option>
				<option value="0">no</option>
			</select>
	<br>
	<button id="skip">쉬는날 추가</button><br><span id="skipday"></span>
	생성하시겠습니까?
	<br>
	<button id="yes">yes</button> <button id="no">no</button>
</form>







