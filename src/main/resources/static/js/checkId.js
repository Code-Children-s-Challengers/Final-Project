 var idRegExp = /^[a-zA-z0-9]{4,12}$/;
$("#username").on("blur",function(){	
			var username = $("#username").val();
			if(!idRegExp.test(username)){
				$(".usernameSuccess").text("id는 영문/숫자 조합, 공백 제외 4자 이상 12자 이하로 설정해주세요 :)");
				$(".usernameSuccess").css("color", "red");
				$("#usernameChecker").val("false");
			}else{
				$.ajax({
					//url : '${pageContext.request.contextPath}/checkUsername',
					url : '/hifive/checkUsername',
					type : 'post',
					data : username,
					cache : false,
					success : function(data) {
						if (data == 0) {
							$(".usernameSuccess").text("사용가능한 ID입니다.");
							$(".usernameSuccess").css("color", "green");
							$("#usernameChecker").val("true");
						} else {
							$(".usernameSuccess").text("사용중인 ID입니다 ");
							$(".usernameSuccess").css("color", "red");
							$("#usernameChecker").val("false");
						}
					}, error : function() {
						console.log("실패");
					}
				});
			}
		});
		