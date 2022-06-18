<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Challenge</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	.list-group-item:hover{
		background-color:darkgray;
		transition-duration: 0.5s;
	}
</style>
</head>
<body>

<hr>
<!--  헤더  -->
<section class="text-center container">
<jsp:include page="common/menu.jsp" flush="true"/><br>
    <div class="row py-lg-4">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">새로운 도전을 즐기세요!</h1>
        <p class="lead text-muted">나를 죽이지 못한 고통은 나를 더 강하게 만들 뿐</p>
        <p>
          <a id="chMaking" class="btn btn-primary my-2" style="display:inline-block">챌린지 만들기</a>
          <a id="myCh" class="btn btn-primary my-2" style="display:inline-block">내 챌린지 보기</a>
        </p>
      </div>
    </div>
</section>
<hr/>
<!--  헤더  -->
<!-- 본문 -->
<div class ="row">
	<div class="col-sm-2">
	</div>
	<div class="col-sm-8" style="">
	<jsp:include page="challenge/categoryTab.jsp" flush="true"/><br>		
	<jsp:include page="challenge/challengeHot2.jsp" flush="true"/><br>	
	<jsp:include page="challenge/challengeList2.jsp" flush="true"/><br>
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

//스크롤이 생기도록 <br> 을 여러게 넣은 부분..
$(document).ready(function(){
	$("#chMaking").on("click", function(){
		win = window.open("./makeChallengePopup","makechallengepopup","width = 600, height = 700, top = 100, left = 200, location = no");
		$("#chMaking").attr("class", "list-group-item active" );
		$("#chHome").attr("class", "list-group-item" );
	});
		
});
</script>
</html>