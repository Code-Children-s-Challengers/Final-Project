<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>회원가입 페이지</h1>
<form action="/hifive/join" method="POST">
	<fieldset class="fieldarea f1">
	<legend><span>회원</span>정보</legend>
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
		<tr>
			<th>
				<label for="username">아이디</label>
			</th>
			<td>
				<input id="username" type="text" name="username" placeholder="아이디를 입력해주세요." required maxlength="14"/>
				<span class="point usernameSuccess"></span><br/>
				<span class="point">※ 영문자, 소문자 입력가능, 최소 4자 이상, 최대 12자 까지 입력</span>
				<input type="hidden" id="usernameChecker"/>
			</td>
		</tr>
		<tr>
			<th>
				<label for="password">비밀번호</label>
			</th>
			<td>
				<input id="password" type="password" name="password"  required maxlength="14" autocomplete="off"/>
				<span class="point passwordSuccess"></span><br/>
				<span class="point">※ 영문자, 소문자 입력가능, 최소 4자 이상, 최대 12자 까지 입력</span>
			</td>
		</tr>
		<tr>
			<th>
				<label for="password2">비밀번호 확인</label>
			</th>
			<td>
				<input id="password2" type="password" name="password2" placeholder="동일하게 입력해주세요." required maxlength="14" autocomplete="off"/>
				<span class="point passwordSuccess2"></span>
				<input type="hidden" id="passwordChecker"/>
			</td>
		</tr>
		<tr class="email">
			<th>
				<label for="email">이메일</label>
			</th>
			<td>
				<p>
					<input id="email" type="text" name="email" placeholder="이메일 주소를 입력해주세요." required/>
					<span id="emailSending" class="doubleCheck">인증번호 보내기</span><br/>
					<input id="email2" type="text" name="email2" placeholder="인증번호 입력" disabled required/>
					<span id="emailChecking" class="doubleCheck">이메일인증</span><br/>
					<span class="point emailSuccess">이메일 입력후 인증번호 보내기를 해주십시오.</span>
					<input type="hidden" id="emailChecker"/>
				</p>
				<p class="tip">
					아이디 비밀번호 분실시 필요한 정보이므로, 정확하게 기입해 주십시오.
				</p>
			</td>
		</tr>
		<tr class="phoneNumber">
			<th>
				<label>휴대폰 번호</label>
			</th>
			<td>
				<p>
					<input id="phone1" type="text" name="phone1" placeholder="전화번호 입력" required/>
					<input id="phone2" type="text" name="phone2" placeholder="전화번호 입력" required/>
					<input id="phone3" type="text" name="phone3" placeholder="전화번호 입력" required/>
					<span id="phoneNumberSending" class="doubleChk">인증번호 보내기</span><br/>
					<input id="phoneNumber2" type="text" name="phoneNumber2" placeholder="인증번호 입력" disabled required/>
					<span id="phoneNumberChecking" class="doubleChk">본인인증</span><br/>
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
<script src="/hifive/js/checkId.js"></script>
<script src="/hifive/js/checkPassword.js"></script>
<script src="/hifive/js/checkNickname.js"></script>
<script src="/hifive/js/checkEmail.js"></script>
<script src="/hifive/js/checkPhoneNumber.js"></script>
<script src="/hifive/js/checkAgreement.js"></script>
<script src="/hifive/js/checkAll.js"></script>
<script>

	$(document).ready(function(){

	
	});
	
</script>