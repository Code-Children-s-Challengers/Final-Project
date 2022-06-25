<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </symbol>
</svg>

 		
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
          <!-- callapse -->
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
							<input id="phone1" class="form-control" type="text" name="phone1" placeholder="${phoneNumber1}" required maxLength=3 style="display:inline-block;width:13%"/>-
							<input id="phone2" class="form-control" type="text" name="phone2" placeholder="${phoneNumber2}" required maxLength=4 style="display:inline-block;width:15%"/>-
							<input id="phone3" class="form-control" type="text" name="phone3" placeholder="${phoneNumber1}3" required maxLength=4 style="display:inline-block;width:15%"/>
							<button type="button" id="phoneNumberSending" class="btn btn-primary doubleCheck" style="display:inline-block;width:15%;">확인</button><br/>
							<br/>
							<input id="phoneNumber2"  class="form-control" type="text" name="phoneNumber2" placeholder="인증번호 입력"  disabled required style="display:inline-block;width:60%"/>
							<button type="button" id="phoneNumberChecking" class="doubleCheck btn btn-primary " disabled >인증번호 확인</button><br/>
							<span class="point phoneNumberSuccess">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
							<input type="hidden" id="phoneNumberChecker" value="true"/> 
						</p>
						<input class="btn btn-primary" type="button" value="완료" id="complete" disabled>
					</td>
				</tr>
				</table>
			 </div>
		  </div>
		  <!-- callapse -->
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
		Password
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      	<!-- callapse -->
      	<p>
      	 <button id="pwAmmend" class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
		 	비밀번호 수정하기
		 </button><br/>
		 <span id="tip1"></span>
		 </p> 
      	<div class="collapse" id="collapseExample2">
		  <div class="card card-body">
			<div class="row">
				<div class="row" style="margin-bottom:10px;">
					<span> 현재 비밀번호 &nbsp; <button id="originalPwChecking" type="button" class="btn btn-warning btn-sm" style="width:100px;">확인</button></span>
				</div>
		  		<input id="originalPw" class="form-control form-control-sm" type="password"  aria-label=".form-control-sm example" >				
		  	</div><br/>
		  	<div class="row">
				<span>새로운 비밀번호</span><br/>
		  		<input id="newPw" class="form-control form-control-sm" type="password"  aria-label=".form-control-sm example" disabled >				  		
		  	</div><br/>
		  	<div class="row">
				<span>새로운 비밀번호 확인</span><br/>
		  		<input id="newPw2" class="form-control form-control-sm" type="password" aria-label=".form-control-sm example" disabled >				  		
		  	</div>
		  	<div id="tip2" class="alert alert-light" role="alert" style="margin-top:10px">
		  		<svg id="icon" class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
			  	 영문/숫자 조합, 공백 제외 4자 이상 12자 이하로 설정해주세요 :)
			</div>
		  	<div style="margin-top:10px;">
		  	<button type="button" id="pwSubmit" class="btn btn-primary" style="width:110px; float:right;" disabled>제출</button>
		  	</div>
		  </div>
		</div>
		<!-- callapse -->
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<div class="col-sm-6">
  		</div>
		
</div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	$(document).ready(function(){
		$("#tip2").hide();

		var provider = `${provider1}`		
		if(provider != ""){
			$("#pwAmmend").attr("disabled", true);
			$("tip1").text("SNS 계정은 비밀번호를 수정할 수 없습니다");
			$("tip1").css("color", "red");
		}
		
		$("#originalPwChecking").on("click", function(){
			var originalPw  = $("#originalPw").val();
			console.log(originalPw)
			$.ajax({
				type:"post",
				url:"/hifive/myInfo/originalPw/"+${myId},
				data: JSON.stringify({
					password:originalPw	
				}),
				contentType:"application/json",
				cashe: false,
				success:function(data){
					if(data == "success"){
						$("#originalPw").attr("disabled", true);
						$("#originalPwChecking").attr('class','btn btn-success');
						$("#originalPwChecking").attr('disabled',true);
						$("#originalPwChecking").text('Success');
						$("#newPw").attr("disabled", false);
						$("#newPw").attr("autofocus",true);
						$("#newPw2").attr("disabled", false);
						$("#pwSubmit").attr("disabled", false);
						$("#tip2").show();

					}else{
						alert("비밀번호가 일치하지 않습니다.")
					}
				}
			});
			
		});
		
		
		$("#pwSubmit").on("click", function(){
			console.log("hi");
			var newPw  = $("#newPw").val();
			var newPw2  = $("#newPw2").val();
			var password1RegExp2 = /^[a-zA-z0-9]{4,12}$/;
			
			if(!password1RegExp2.test(newPw) && !password1RegExp2.test(newPw2)  ){
				$("#tip2").attr("class", 'alert alert-danger d-flex align-items-center');
				$("#tip2").html("<svg id=\"icon\" class=\"bi flex-shrink-0 me-2\" width=\"24\" height=\"24\" role=\"img\" aria-label=\"Danger:\"><use xlink:href=\"#exclamation-triangle-fill\"/></svg>영문/숫자 조합, 공백 제외 4자 이상 12자 이하로 설정해주세요");
			
			}else if(newPw != newPw2){
				$("#tip2").attr("class", 'alert alert-danger d-flex align-items-center');
				$("#tip2").html("<svg id=\"icon\" class=\"bi flex-shrink-0 me-2\" width=\"24\" height=\"24\" role=\"img\" aria-label=\"Danger:\"><use xlink:href=\"#exclamation-triangle-fill\"/></svg>비밀번호가 일치하지 않습니다");
			}else{
				$.ajax({
					type:"post",
					url:"/hifive/myInfo/newPw/"+${myId},
					data: JSON.stringify({
						password:""+newPw	
					}),
					contentType:"application/json",
					cashe: false,
					success:function(data){
						if(data == 1){
							$("#originalPw").attr("disabled", false);
							$("#originalPw").val("");
							$("#originalPwChecking").attr('class','btn btn-warning');
							$("#originalPwChecking").attr('disabled',false);
							$("#originalPwChecking").text('확인');
							$("#newPw").attr("disabled", true);
							$("#newPw").val("");
							$("#newPw2").attr("disabled", true);
							$("#newPw2").val("");
							$("#pwSubmit").attr("disabled", true);
							$("#pwAmmend").trigger("click");
							alert("비밀번호가 수정되었습니다")
						}else{
							alert("비밀번호 수정에 실패했습니다")
						}
					}//end of success
				});//end of ajax
				
			}//end of else
			
		});//end of pwSubmit
		
		
		
		
		
	});
</script>