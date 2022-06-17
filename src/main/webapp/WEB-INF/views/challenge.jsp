<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge</title>
<script>
	function makeChallengePopup(){
		win = window.open("./makeChallengePopup","makechallengepopup","width = 600, height = 700, top = 100, left = 200, location = no");

	}

</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div>
<jsp:include page="common/menu.jsp" flush="true"/><br>
</div>
<hr>
<div class ="row">
	<div class="col-sm-2">
	<ul class="list-group" id="scroll">
	  <li class="list-group-item active" aria-current="true">챌린지 홈</li>
	  <li class="list-group-item">챌린지 만들기</li>
	  <li class="list-group-item">내 챌린지</li>
	</ul>	
	</div>
	<div class="col-sm-7">
	<button onclick="makeChallengePopup()" style="width:250px;
	  height: 50px;
	  border: 0;
	  outline: none;
	  border-radius: 40px;
	  background: rgb(190, 210, 204);
	  color: white;
	  font-size: 1.2em;
  	  letter-spacing: 2px;">challenge 생성</button>
	<jsp:include page="challenge/challengeHot2.jsp" flush="true"/><br>
	
	<nav class="navbar navbar-light bg-light">
	  <form class="container-fluid justify-content-start">
	      <a class="navbar-brand" href="#">Category</a>
	    <button class="btn btn-outline-dark me-2" type="button">Study</button>
	    <button class="btn btn-outline-dark me-2" type="button">Fitness</button>
	    <button class="btn btn-outline-dark me-2" type="button">Others...</button>
	  </form>
	</nav>
	
	<jsp:include page="challenge/challengeList2.jsp" flush="true"/><br>
	</div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

//스크롤이 생기도록 <br> 을 여러게 넣은 부분..
$(document).ready(function(){

	function scroll_follow(id)
	{
	  $(window).scroll(function( )  //스크롤이 움직일때마다 이벤트 발생
	  { 
	      var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
	      $(id).stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
	  });
	}
	
	 scroll_follow( "#scroll" );

		
	
});
</script>
</html>