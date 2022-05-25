$("#username").on("blur",function(){
			var username = $("#username").val();
			if(username == "" || username.length < 4 || username.length > 12){
				$(".successUsernameChk").text("id는 4자 이상 12자 이하로 설정해주세요 :)");
				$(".successUsernameChk").css("color", "red");
				$("#usernameDoubleChk").val("false");
			}else{
				$.ajax({
					//url : '${pageContext.request.contextPath}/checkUsername',
					url : '/hifive/checkUsername',
					type : 'post',
					data : username,
					cache : false,
					success : function(data) {
						if (data == 0) {
							$(".successUsernameChk").text("사용가능한 ID입니다.");
							$(".successUsernameChk").css("color", "green");
							$("#usernameDoubleChk").val("true");
						} else {
							$(".successUsernameChk").text("사용중인 ID입니다 ");
							$(".successUsernameChk").css("color", "red");
							$("#usernameDoubleChk").val("false");
						}
					}, error : function() {
						console.log("실패");
					}
				});
			}
		});
		