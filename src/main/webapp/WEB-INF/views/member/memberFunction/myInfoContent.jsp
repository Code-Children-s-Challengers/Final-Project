<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 		
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
				      	 <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
						 	비밀번호 수정하기
						 </button>
						 </p> 
				      	<div class="collapse" id="collapseExample2">
						  <div class="card card-body">
							<div class="row">
								<span> 현재 비밀번호</span><br/>
						  		<input class="form-control form-control-sm" type="text" placeholder=".form-control-sm" aria-label=".form-control-sm example">				  		
						  	</div><br/>
						  	<div class="row">
								<span>새로운 비밀번호</span><br/>
						  		<input class="form-control form-control-sm" type="text" placeholder=".form-control-sm" aria-label=".form-control-sm example">				  		
						  	</div><br/>
						  	<div class="row">
								<span>새로운 비밀번호 확인</span><br/>
						  		<input class="form-control form-control-sm" type="text" placeholder=".form-control-sm" aria-label=".form-control-sm example">				  		
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