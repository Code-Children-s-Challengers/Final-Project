<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		$("#yes").on("click",function(){	
			$.ajax({
				url:'challengeParticipate',
				type:'post',
				data:{
					cnum:${cnum}
				},
			dataType:'text',
			success:function(responseData, status, xhr){
				console.log(responseData);
				if(responseData == "success"){
					alert("참가됨");
					window.close();
				}else if(responseData == "already participated"){
					alert("이미 참가중");
					window.close();
				}else if(responseData == "nomoney"){
					alert("참가비 부족");
					window.close();
				}else if(responseData == "full"){
					alert("정원초과");
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
		});
		$("#no").on("click",function(){
			window.close();
		});
	});

</script>




<div id="photo">
<c:choose>
<c:when test="${photo eq 'challenge_sample'}">
	<img src="images/challenge/challenge_sample.jpg" border="0" align="center" width="120">
</c:when>
<c:when test="${photo eq 'challenge_sample.jpg'}">
	<img src="images/challenge/challenge_sample.jpg" border="0" align="center" width="120">
</c:when>
<c:otherwise>
	<img src="images/challenge/challenge_image/${photo}" border="0" align="center" width="120">
</c:otherwise>
</c:choose>
</div><br>
<div id="name">
Name: ${name}
</div><br>
<div id="date">
date: ${date}
</div><br>
<div id="people">
people: ${people}
</div><br>
<div id="fee">
fee: ${fee}
</div><br>
<div>
참가하시겠습니까?
</div><br>
<button id="yes">yes</button> <button id="no">no</button>







