<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<!-- nav -->
<ul class="nav nav-tabs nav-fill">
  <li class="nav-item">
    <a class="nav-link active" id="ing">참여 중인 챌린지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="wait">대기 중인 챌린지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="complete">완료된 챌린지</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" id="manage">챌린지 관리하기</a>
  </li>
</ul>
<!-- nav -->
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
 $(document).ready(function(){
	// 탭 선택 과정//
	 $("#ing").on("click",function(){
		$("#ing").addClass("active");
		$("#wait").removeClass("active");
		$("#complete").removeClass("active");
		$("#manage").removeClass("active");
		
		//ajax를 통한 비동기 방법
		$.ajax({
			type:"get",
			url:"/hifive/myChallengeTab?tab=ing",
			cache : false,
			success : function(data) {
				$("#content").html(data);
			}
		});
		
	});
	
	 $("#wait").on("click",function(){
			$("#wait").addClass("active");
			$("#ing").removeClass("active");
			$("#complete").removeClass("active");
			$("#manage").removeClass("active");
			
			//ajax를 통한 비동기 방법
			$.ajax({
				type:"get",
				url:"/hifive/myChallengeTab?tab=wait",
				cache : false,
				success : function(data) {
					$("#content").html(data);
				}
			});
			
		});
	
	
	 $("#complete").on("click",function(){
			$("#complete").addClass("active");
			$("#wait").removeClass("active");
			$("#ing").removeClass("active");
			$("#manage").removeClass("active");
			
			//ajax를 통한 비동기 방법
			$.ajax({
				type:"get",
				url:"/hifive/myChallengeTab?tab=complete",
				cache : false,
				success : function(data) {
					$("#content").html(data);
				}
			});
			
		});
	
	
	// 탭 선택 과정//
	
	
 });

</script>
