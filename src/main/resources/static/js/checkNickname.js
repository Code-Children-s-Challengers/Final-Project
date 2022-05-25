$("#nickname").on("blur",function(){
			var nickname = $("#nickname").val();
			if(nickname == "" || nickname.length < 2){
				$(".successNicknameChk").text("닉네임은 2자 이상 8자 이하로 설정해주세요 :)");
				$(".successNicknameChk").css("color", "red");
				$("#nicknameDoubleChk").val("false");
			}else{
				$.ajax({
					//url : '${pageContext.request.contextPath}/checkNickname?nickname='+ nickname,
					url : '/hifive/checkNickname?nickname='+ nickname,
					type : 'post',
					cache : false,
					success : function(data) {
						if (data == 0) {
							$(".successNicknameChk").text("사용가능한 닉네임입니다.");
							$(".successNicknameChk").css("color", "green");
							$("#nicknameDoubleChk").val("true");
						} else {
							$(".successNicknameChk").text("사용중인 닉네임입니다 ");
							$(".successNicknameChk").css("color", "red");
							$("#nicknameDoubleChk").val("false");
						}
					}, error : function() {
						console.log("실패");
					}
				});
			}
		});
	