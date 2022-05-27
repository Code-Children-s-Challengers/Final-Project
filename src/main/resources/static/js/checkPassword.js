var password1RegExp = /^[a-zA-z0-9]{4,12}$/;

$("#password").blur(function(){
	var password = $("#password").val();
	if(!password1RegExp.test(password)){
		$(".passwordSuccess").text("비밀번호는 영문/숫자 조합, 공백 제외 4자 이상 12자 이하로 설정해주세요 :)");
		$(".passwordSuccess").css("color", "red");
		$("#passwordChecker").val("false");
	}else{
		$(".passwordSuccess").text("사용가능한 비밀번호입니다.");
		$(".passwordSuccess").css("color", "green");
	}
});

$("#password2").blur(function(){
	var password = $("#password").val();
	if(password1RegExp.test(password) && $("#password2").val() == $("#password").val()){
		$(".passwordSuccess").text("비밀번호가 일치합니다.");
		$(".passwordSuccess2").text("비밀번호가 일치합니다.");
		$(".passwordSuccess2").css("color", "green");
		$("#passwordChecker").val("true");
	}else{
		$(".passwordSuccess2").text("비밀번호가 일치하지 않습니다.");
		$(".passwordSuccess2").css("color", "red");
		$("#passwordChecker").val("false");
	}
});