<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>회원가입 페이지</h1>
<form action="/hifive/join" method="POST">
	<input type="text" name="username" placeholder="Username"/><br>
	<input type="password" name="password" placeholder="Password"/><br>	
	<input type="email" name="email" placeholder="Email"/><br>	
	<input type="text" name="nickname" placeholder="nickname"/><br>	
	<input type="text" name="phoneNumber" placeholder="phoneNumber"/><br>	
	<br>
	<br>
	<br>
	<br>
	<table>
		<tr>
		  <th>
		  	<label for="nickname">닉&emsp;네&emsp;임</label>
		  </th>
		  <td>
		    <input id="nickname" type="text" name="nickname" placeholder="닉네임을 설정해주세요." maxlength="8" title="8자 까지 입력" required autofocus/>
		    <span class="point successNicknameChk"></span> <br/>
		    <span class="point"> ※닉네임은 2자 이상 8자 이하로 설정해주시기 바랍니다.</span>
		    <input type="hidden" id="nicknameDoubleChk"/>
		  </td>
		</tr>
		<tr>
			<th>
				<label for="username">아이디</label>
			</th>
			<td>
				<input id="username" type="text" name="username" placeholder="아이디를 입력해주세요." required maxlength="14"/>
				<span class="point successUsernameChk"></span><br/>
				<span class="point">※ 영문자, 소문자 입력가능, 최소 4자 이상, 최대 12자 까지 입력</span>
				<input type="hidden" id="usernameDoubleChk"/>
			</td>
		</tr>
		<tr>
			<th>
				<label for="password">비밀번호</label>
			</th>
			<td>
				<input id="password" type="password" name="password"  required maxlength="14" autocomplete="off"/>
				<span class="point successPasswordChk2"></span><br/>
				<span class="point">※ 영문자, 소문자 입력가능, 최소 4자 이상, 최대 12자 까지 입력</span>
			</td>
		</tr>
		<tr>
			<th>
				<label for="passwordCheck">비밀번호 확인</label>
			</th>
			<td>
				<input id="passwordCheck" type="password" name="password2" placeholder="동일하게 입력해주세요." required maxlength="14" autocomplete="off"/>
				<span class="point successPasswordChk2"></span>
				<input type="hidden" id="passwordDoubleChk"/>
			</td>
		</tr>
		<tr class="email">
			<th>
				<label for="email">이메일</label>
			</th>
			<td>
				<p>
					<input id="email" type="text" name="email" title="이메일 주소를 입력해주세요." required/>
					<span id="checkEmail" class="doubleCheck">인증번호 보내기</span><br/>
					<input id="email2" type="text" name="email2" title="인증번호 입력" disabled required/>
					<span id="checkEmail2" class="doubleCheck">이메일인증</span><br/>
					<span class="point successEmailCheck">이메일 입력후 인증번호 보내기를 해주십시오.</span>
					<input type="hidden" id="emailDoubleChk"/>
				</p>
				<p class="tip">
					아이디 비밀번호 분실시 필요한 정보이므로, 정확하게 기입해 주십시오.
				</p>
			</td>
	</tr>
	</table>
	
</form>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/hifive/js/checkId.js"></script>
<script src="/hifive/js/checkPassword.js"></script>
<script src="/hifive/js/checkNickname.js"></script>
<script src="/hifive/js/checkEmail.js"></script>
<script>

	$(document).ready(function(){

	
	});
	
</script>