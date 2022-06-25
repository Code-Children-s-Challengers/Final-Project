 var idRegExp = /^[a-zA-z0-9]{4,12}$/;
$("#usernameChecking2").on("click",function(){	
			var username = $("#username2").val();
			if(!idRegExp.test(username)){
				$(".usernameSuccess2").text("유효한 ID를 입력해주세요 :)");
				$(".usernameSuccess2").css("color", "red");
				$("#usernameChecker").val("false");
				$("#usernameUsing").attr("disabled",true);
			}else{
				$.ajax({
					//url : '${pageContext.request.contextPath}/checkUsername',
					url : '/hifive/checkUsername',
					type : 'post',
					data : JSON.stringify({
						username:""+username
					}),
					cache : false,
					contentType: 'application/json',
					success : function(data) {
						if (data == 0) {
							$(".usernameSuccess2").text("사용 가능한 ID입니다.'사용하기'를 눌러주세요!");
							$(".usernameSuccess2").css("color", "green");
							//$("#usernameChecker").val("true");
							$("#usernameUsing").attr("disabled",false);
						} else {
							$(".usernameSuccess2").text("사용 중인 ID입니다 ");
							$(".usernameSuccess2").css("color", "red");
							$("#usernameChecker").val("false");
							$("#usernameUsing").attr("disabled",true);
						}
					}, error : function() {
						console.log("실패");
					}
				});
			}
		});

$("#username2").on("click",function(){
	$("#usernameUsing").attr("disabled",true);
});


$("#usernameUsing").on("click",function(){
	var username = $("#username2").val();
	$("#username").val(username);
	$("#usernameChecker").val("true");
	$(".usernameSuccess").text("ID 중복확인 완료되었습니다");
	$(".usernameSuccess").css("color", "green");
	$("#usernameChecking").attr("disabled",true);
	$("#usernameCancle").attr("disabled",false);
	$(".btn-close").click();
});

$("#realCancle").on("click",function(){
	$("#username").val("");
	$("#usernameChecker").val("false");
	$(".usernameSuccess").text("");
	$("#usernameChecking").attr("disabled",false);
	$("#usernameCancle").attr("disabled",true);
	$(".btn-close").click();
});