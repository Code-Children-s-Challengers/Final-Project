<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script>
 $(document).ready(function(){
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
				console.log(data);
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
				console.log(data);
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
				console.log(data);
				$("#content").html(data);
			}
		});
	});
	
	
 });

</script>