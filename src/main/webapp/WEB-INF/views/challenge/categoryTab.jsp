<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<!-- 카테고리 탭 -->
<ul class="nav nav-tabs nav-fill">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" id="study">Study</a>
  </li>
  <li class="nav-item" >
    <a class="nav-link" id="exercise">Exercise</a>
  </li>
  <li class="nav-item" >
    <a class="nav-link" id="others">Others...</a>
  </li>
</ul>

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
 $(document).ready(function(){
	// 카테고리 선택 과정//
	 $("#study").on("click",function(){
		console.log("study");	
		$("#study").attr("class", "nav-link active");
		$("#exercise").attr("class", "nav-link");
		$("#others").attr("class", "nav-link");
		//ajax를 통한 비동기 방법
		$.ajax({
			type:"get",
			url:"/hifive/challengesAjax?category=study",
			cache : false,
			success : function(data) {
				$("#content").html(data);
			}
		});
		
	});
	
	$("#exercise").on("click",function(){
		console.log("exercise");	
		$("#study").attr("class", "nav-link");
		$("#exercise").attr("class", "nav-link active");
		$("#others").attr("class", "nav-link");
		//ajax를 통한 비동기 방법
		$.ajax({
			type:"get",
			url:"/hifive/challengesAjax?category=fitness",
			cache : false,
			success : function(data) {
				$("#content").html(data);
			}
		});
	});
	
	
	$("#others").on("click",function(){
		console.log("others");	
		$("#study").attr("class", "nav-link");
		$("#exercise").attr("class", "nav-link");
		$("#others").attr("class", "nav-link active");
		//ajax를 통한 비동기 방법
		$.ajax({
			type:"get",
			url:"/hifive/challengesAjax?category=others",
			cache : false,
			success : function(data) {
				$("#content").html(data);
			}
		});
	});
	// 카테고리 선택 과정//
	
	
 });

</script>
