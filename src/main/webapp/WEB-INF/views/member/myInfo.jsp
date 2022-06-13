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
	#grid {
		display: grid;
		grid-template-columns: 300px 1fr;
	}
	#content {
	}
	.head{
		font-size: 45px;
		width:100%;
		display:block;
		border-bottom : 1px solid gray;
		margin : 0px;
		padding: 20px;
		margin-bottom:0;
	}

	h3{
		font-size: 25px;
		padding: 20px;
	}
	ul.menu{
	padding-left:0;
	}
	.form-control.phone{
		width : 120px;
		height : 40px;
		font-size : 30px;
	}
	
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../common/menu.jsp" flush="true"/><br>
	<span class="head">마이페이지 입니다</span>
	
	<div id="grid">
	
		<div><jsp:include page="../member/myPageMenu.jsp" flush="true"/><br></div>
		
		
		<div id="content"> 
 			<h3>개인정보 수정</h3>
 		
 			<div class="row">
		  	<div class="col-sm-2"></div>
    		<div class="col-sm-4">
 				<div class="accordion accordion-flush" id="accordionFlushExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingOne">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
				        EMAIL
				      </button>
				    </h2>
				    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body"><input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${email1}"></div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingTwo">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
				        PhoneNumber
				      </button>
				    </h2>
				    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body">
				          <div class="row">
				          <div class="col-sm-8">
				          <input id="originalPhoneNumber" class="form-control" type="text" value="${phoneNumber1}-${phoneNumber2}-${phoneNumber3}" aria-label="readonly input example" readonly >
				          </div>
				          <div class="col-sm-4">
				          <button  id="shutdownEvent"  class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
						 	수정하기
						  </button>
						  </div>
						  </div>
					  </div>
						  <div class="collapse" id="collapseExample">
							 <div class="card card-body">
								<table>
								<tr class="phoneNumber">
									
									<td>
										<p>
											<input id="phone1" type="text" name="phone1" placeholder="${phoneNumber1}" required size=3 />-
											<input id="phone2" type="text" name="phone2" placeholder="${phoneNumber2}" required size=4/>-
											<input id="phone3" type="text" name="phone3" placeholder="${phoneNumber1}3" required size=4/>
											<button type="button" id="phoneNumberSending" class="doubleCheck" >인증번호 보내기</button><br/>
											<br/>
											<input id="phoneNumber2" type="text" name="phoneNumber2" placeholder="인증번호 입력" disabled required/>
											<button type="button" id="phoneNumberChecking" class="doubleCheck" >인증번호 확인</button><br/>
											<span class="point phoneNumberSuccess">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
											<input type="hidden" id="phoneNumberChecker" value="true"/> 
										</p>
										<p class="tip">
											최초 가입 시에만 사용하고 있습니다. 따로 저장되지 않습니다.
										</p>
										<input class="btn btn-primary" type="button" value="완료" id="complete">
									</td>
								</tr>
								</table>
							 </div>
						  </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="flush-headingThree">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
						Password
				      </button>
				    </h2>
				    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
				      <div class="accordion-body"></div>
				    </div>
				  </div>
				</div>
			</div>
			<div class="col-sm-6">
    		</div>
 			
		</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="/hifive/js/checkPhoneNumber.js"></script>
<script>

	$(document).ready(function(){
		
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
			
		})
	
	});
</script>
</html>