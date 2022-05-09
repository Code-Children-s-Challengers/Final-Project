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


</script>




<form method="post" action="upload" enctype="multipart/form-data">
   <input type="text" name="theName" hidden="true"/>
   <img src="images/challenge/challenge_sample.jpg" border="0" align="center" width="200" id="thumbnail"><br>
   <input type="file" name="theFile" accept="image/*" onchange="setThumbnail(event)"/>
   <br>
	Name: <input type="text" name="name" id="name">
	<br>
	start date: <input type="date" name="start_date" id="start_date">
	<br>
	end date: <input type="date" name="end_date" id="end_date">
	<br>
	max participant: <input type="number" name="people" id="people">
	<br>
	fee: <input type="number" name="fee" id="fee">
	<br>
	생성하시겠습니까?
	<br>
	<button id="yes">yes</button> <button id="no">no</button>
	<input type="submit" value="업로드"/>
</form>







