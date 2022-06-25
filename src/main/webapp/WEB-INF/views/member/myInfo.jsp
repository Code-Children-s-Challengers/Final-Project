<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!--로그인한 클라이언트의 정보를 jsp에 가져올 수 있다-->
<sec:authentication property="principal.user.nickname" var="nickname"/>
<sec:authentication property="principal.user.email" var="email"/>
<sec:authentication property="principal.user.phoneNumber" var="phoneNumber"/>
<sec:authentication property="principal.user.point" var="point"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	.mt-5{
		border-bottom: 1px solid gray;
		padding-bottom: 20px;
		margin-bottom:0;
	}
	.miniHead{
		padding-top:20px;
	}
	.form-control.phone{
		width : 120px;
		height : 40px;
		font-size : 30px;
	}
	a.nav-link:hover{
		background-color:darkgray;
		transition-duration: 0.5s;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<!--  헤더  -->
<hr>
<section class="text-center container">
<jsp:include page="../common/menu.jsp" flush="true"/><br>
    <div class="row py-lg-3">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">새로운 도전을 즐기세요!</h1>
        <p class="lead text-muted">나를 죽이지 못한 고통은 나를 더 강하게 만들 뿐</p>
        <p>
          <a id="chHome" class="btn btn-success my-2" style="display:inline-block">챌린지 시작하기</a>
        </p>
        <p>
        <sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.user.nickname" var="nickname"/>
		     <span class="badge bg-light text-dark">환영합니다 ${nickname}님!</span>
		</sec:authorize>
    	<sec:authorize access="isAnonymous()">
		     <span class="badge bg-light text-dark">로그인 하시면 더 많은 컨텐츠를 즐길 수 있습니다!</span>
		</sec:authorize>
        <p>
      </div>
    </div>
</section>
<hr/>
<!--  헤더  -->

<div class="row">
	<div class="col-sm-3">
		<jsp:include page="memberFunction/myPageMenu_myInfo.jsp" flush="true"/>
	</div>
	<div class="col-sm-9">
		<h2 class="miniHead mb-4">개인정보 수정</h2>
			<jsp:include page="memberFunction/myInfoContent.jsp" flush="true"/>
	</div>
</div>
	
	
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> 
<script>

	$(document).ready(function(){
		$("#chHome").on("click", function(){
			location.href="/hifive/challenges"
		});	
		
		$("#complete").on("click", function(){
			if($("#phoneNumberChecker").val()== "true"){
				var recipientPhoneNumber = ""+ $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
				console.log(recipientPhoneNumber);
				$.ajax({
			        type:"post",
			        url:"/hifive/phoneNumberChange/"+${myId},
			        data : JSON.stringify({
			        	"recipientPhoneNumber": "1"+recipientPhoneNumber
			        }),
			        contentType: 'application/json',
			        cache : false,
			        success:function(data){
						console.log("good");
						$("#originalPhoneNumber").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
						$("#shutdownEvent").trigger("click");
						alert("전화번호가 변경되었습니다.");
			        }
			    });
			}else{
				console.log("bye")
			}
			
		});
		
		//휴대폰 인증번호 발송
		var code2 = "";
		$("#phoneNumberSending").click(function(){
			var p1 = "" + $("#phone1").val();
			var p2 = "" + $("#phone2").val();
			var p3 = "" + $("#phone3").val();
			
			if(p1.length == 3 && p2.length == 4 && p3.length == 4 ){
				
				alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
				var recipientPhoneNumber = ""+ p1+p2+p3;
				$.ajax({
			        type:"post",
			        url:"/hifive/checkPhoneNumber",
			        data : JSON.stringify({
			        	"recipientPhoneNumber": "1"+recipientPhoneNumber
			        }),
			        contentType: 'application/json',
			        cache : false,
			        success:function(data){
			        	if(data == "error"){
			        		alert("휴대폰 번호가 올바르지 않습니다.")
							$(".phoneNumberSuccess").text("유효한 번호를 입력해주세요.");
							$(".phoneNumberSuccess").css("color","red");
							$("#phone1").attr("autofocus",true);
							$("#phone1").text("");
							$("#phone2").text("");
							$("#phone3").text("");
			        	}else{	        		
			        		$("#phoneNumber2").attr("disabled",false);
			        		$("#phoneNumberChecking").css("display","inline-block");
			        		$(".phoneNumberSuccess").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
			        		$(".phoneNumberSuccess").css("color","green");
			        		$("#phone1").attr("readonly",true);
			        		$("#phone2").attr("readonly",true);
			        		$("#phone3").attr("readonly",true);
			        		$("#phoneNumberChecking").attr("disabled",false);
			        		code2 = data.randomNumber;
			        		console.log(code2);
			        	}
			        }
			    });
				
			}else{
				alert("유효한 전화번호를 입력해주세요 :)");
			}
			
			
		});


		//휴대폰 인증번호 대조
		$("#phoneNumberChecking").click(function(){
			if($("#phoneNumber2").val() == code2 && $("#phoneNumber2").val()!=""){
				$(".phoneNumberSuccess").text("인증번호가 일치합니다.");
				$(".phoneNumberSuccess").css("color","green");
				$("#phoneNumberChecker").val("true");
				$("#phoneNumber2").attr("disabled",true);
				$("#complete").attr("disabled",false);
			}else{
				$(".phoneNumberSuccess").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
				$(".phoneNumberSuccess").css("color","red");
				$("#phoneNumberChecker").val("false");
				$(this).attr("autofocus",true);
			}
		});
	
	});
</script>
</html>