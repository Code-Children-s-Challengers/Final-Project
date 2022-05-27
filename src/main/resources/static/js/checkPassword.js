$("#passwordCheck").blur(function(){
			var password = $("#password").val();
			if(password == "" || password.length < 4 || password.length > 12){
				$(".passwordSuccess").text("비밀번호는 4자 이상 12자 이하로 설정해주세요 :)");
				$(".passwordSuccess").css("color", "red");
				$("#passwordChecker").val("false");
			}else if($("#checkPassword").val() == $("#password").val()){
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

$("#password").blur(function(){
	var password = $("#password").val();
	if(password == "" || password.length < 4 || password.length > 12){
		$(".passwordSuccess").text("비밀번호는 4자 이상 12자 이하로 설정해주세요 :)");
		$(".passwordSuccess").css("color", "red");
		$("#passwordChecker").val("false");
	}else{
		$(".passwordSuccess").text("사용가능한 비밀번호입니다.");
		$(".passwordSuccess").css("color", "green");
	}
});

$("#password2").blur(function(){
	var password = $("#password").val();
	if($("#password2").val() == $("#password").val()){
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