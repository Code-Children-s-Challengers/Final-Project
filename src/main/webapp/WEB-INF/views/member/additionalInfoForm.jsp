<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>추가 회원가입 페이지</h1>
<hr/>
<form action="/hifive/additionalInfo" method="POST">
	<fieldset class="fieldarea f1" >
	<legend><span>회원</span>추가 정보</legend>
	<table>
		<tr>
		  <th>
		  	<label for="nickname">닉&emsp;네&emsp;임</label>
		  </th>
		  <td>
		    <input id="nickname" type="text" name="nickname" placeholder="닉네임을 설정해주세요." maxlength="8" title="8자 까지 입력" required autofocus/>
		    <span class="point nicknameSuccess"></span> <br/>
		    <span class="point"> ※닉네임은 2자 이상 8자 이하로 설정해주시기 바랍니다.</span>
		    <input type="hidden" id="nicknameChecker"/>
		  </td>
		</tr>
		
		<tr class="phoneNumber">
			<th>
				<label>휴대폰 번호</label>
			</th>
			<td>
				<p>
					<input id="phone1" type="text" name="phone1" placeholder="전화번호 입력" required size=3 />
					<input id="phone2" type="text" name="phone2" placeholder="전화번호 입력" required size=4/>
					<input id="phone3" type="text" name="phone3" placeholder="전화번호 입력" required size=4/>
					<button type='button' id="phoneNumberSending" class="doubleCheck" >인증번호 보내기</button><br/>
					<input id="phoneNumber2" type="text" name="phoneNumber2" placeholder="인증번호 입력" disabled required/>
					<button type='button' id="phoneNumberChecking" class="doubleCheck" >인증번호 확인</button><br/>
					<span class="point phoneNumberSuccess">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
					<input type="hidden" id="phoneNumberChecker"/>
				</p>
				<p class="tip">
					최초 가입 시에만 사용하고 있습니다. 따로 저장되지 않습니다.(번호만 입력해주세요.)
				</p>
			</td>
		</tr>
	</table>
		</fieldset>
	
	<fieldset class="fieldarea f2">
		<legend><span>이용</span>약관</legend>
		<p class="agreeText">
			<label for="agreement1">아래 사항에 동의 합니다.</label>
			<input id="agreement1" type="checkbox" name="agreement1"/>
			<textarea id="text1" readonly>
				이용약관
			</textarea>
		</p>
	</fieldset>
	<fieldset class="fieldarea f3">
		<legend><span>개인정보</span>취급방침</legend>
		<p class="agreeText">
			<label for="agreement2">아래 사항에 동의 합니다.</label>
			<input id="agreement2" type="checkbox" name="agreement2"/>
			<textarea id="text2" readonly>
				개인정보 방침 및 안내
			</textarea>
		</p>
	</fieldset>
	
	<div class="btnCenter">
		<input type="submit" id="button1" value="등록하기" title="등록하기 버튼"/>
		<input type="reset" id="button2" value="다시쓰기" title="다시쓰기 버튼"/>
	</div>
</form>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/hifive/js/checkNickname.js"></script>
<script src="/hifive/js/checkPhoneNumber.js"></script>
<script src="/hifive/js/checkAgreement.js"></script>
<script src="/hifive/js/checkAllAdditional.js"></script>
<script>

	$(document).ready(function(){
		console.log("why");
		

	});
	
</script>