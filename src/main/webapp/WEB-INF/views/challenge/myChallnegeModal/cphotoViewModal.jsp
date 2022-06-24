<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 인증 사진 모아보기 Modal -->
<div class="modal fade closely" id="closely${dto.getCnum()}" data-sday="${dto.getSday()}" data-eday="${dto.getEday()}" data-cnum="${dto.getCnum()}" data-unum="${unum}"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">참여하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <!-- 모달 바디 -->
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
      <!-- 모달 바디 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
 <!-- 인증 사진 모아보기 Modal -->