<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 인증 사진 업로드 Modal -->
<div class="modal fade" id="upload${dto.getCnum()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">참여하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<!-- 인증 사진을 올리기 위한 form -->
		<form class="row g-3 needs-validation" method="post" action="/hifive/upload/${unum}" enctype="multipart/form-data" id="uploadForm${dto.getCnum()}" data-cnum="${dto.getCnum()}" novalidate>
			<div class="col-sm-12 pt-5 text-center">
		  		<div class="imageContainer ">
		  			<img src="/hifive/images/challenge/noImage.gif" class="rounded" alt="..." id="uploadPhotoImage${dto.getCnum()}">
		  		</div>
		  	</div>
		  	<div class="col-sm-3"></div>
		  <div class="col-sm-6 pb-3">
		  	<input class="form-control uploadPh" type="file" name="uploadPh" id="uploadPh" accept="image/*" required >
		  </div>
		  <div class="col-sm-3"></div>
		  <!--  -->
		   <div class="col-sm-1"></div>
		  <div class="col-sm-6">
		    <label for="comment" class="form-label">Comment</label>
		    <input type="text" class="form-control" id="c_comment" name="c_comment" aria-describedby="commentV1 commentV2" required >
		    <div id="commentV1" class="valid-feedback">
		      Good!
		    </div>
		    <div id="commentV2" class="invalid-feedback">
		      	한마디 적어주십쇼!
		    </div>
		  </div>
		  <div class="col-sm-4">
		     <label for="start_date" class="form-label">인증 날짜</label>
		    <input type="date" class="form-control today" id="today" name="today"  disabled >
		  </div>
		  <div class="col-sm-1"></div>
		  <!--  -->	
		 </form>
		 <!-- form -->
     </div>
     <div class="modal-footer">
       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
       <button type="button" class="btn btn-primary upload" data-cnum="${dto.getCnum()}" data-unum="${unum}">인증사진 올리기</button>
      </div>
    </div>
  </div>
</div>
<!-- 인증 사진 업로드 Modal -->