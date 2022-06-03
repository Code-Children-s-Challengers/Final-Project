<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>


	
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
			var form = $('#cert')[0];
			var data = new FormData(form);
			
			$.ajax({
				url:'uploadCertification',
				type:'post',
				enctype:'multipart/form-data',
				data:data,
			dataType:'text',
			success:function(responseData, status, xhr){
				console.log(responseData);
			},
			error:function(xhr, status, e){
				console.log("Error: "+e);
			}
			});
		});
		$("#no").on("click",function(){
			window.close();
		});
	});


</script>




<form method="post" action="uploadCertification" enctype="multipart/form-data" id="cert">
	<input type="hidden" name="cnum" id="cnum" value="${cnum}">
   <img src="images/challenge/challenge_sample.jpg" border="0" align="center" width="200" id="thumbnail"><br>
   <input type="file" name="photo" id="photo" accept="image/*" onchange="setThumbnail(event)"/>
   <br>
	Comment: <input type="text" name="comment" id="comment">
	<br>
	생성하시겠습니까?
	<br>
	<button id="yes">yes</button> <button id="no">no</button>
</form>







