$("#passwordCheck").blur(function(){
			var password = $("#password").val();
			if(password == "" || password.length < 4 || password.length > 12){
				$(".successPasswordChk2").text("비밀번호는 4자 이상 12자 이하로 설정해주세요 :)");
				$(".successPasswordChk2").css("color", "red");
				$("#passwordDoubleChk").val("false");
			}else if($("#passwordCheck").val() == $("#password").val()){
				$(".successPasswordChk2").text("비밀번호가 일치합니다.");
				$(".successPasswordChk2").css("color", "green");
				$("#passwordDoubleChk").val("true");
			}else{
				$(".successPasswordChk2").text("비밀번호가 일치하지 않습니다.");
				$(".successPasswordChk2").css("color", "red");
				$("#passwordDoubleChk").val("false");
			}
		});