var originalNickname = $("#nickname").val();
				
$("#nicknameOverraping").on("click",function(){
	var nickname = $("#nickname").val();
	if(nickname =="" || nickname.length < 2){
		alert("닉네임은 2자 이상 8자 이하로 설정해주세요 :");
		$(".nicknameSuccess").text("닉네임은 2자 이상 8자 이하로 설정해주세요 :)");
		$(".nicknameSuccess").css("color", "red");
		$("#nicknameChecker").val("false");
	}else if(nickname == originalNickname){
		$(".nicknameSuccess").text("사용가능한 닉네임입니다");
		$(".nicknameSuccess").css("color", "green");
		$("#nicknameChecker").val("true");
		$("#nickname").attr('disabled','true');
		$("#nicknameOverraping").attr('disabled','true');
	}else{
		$.ajax({
			//url : '${pageContext.request.contextPath}/checkNickname?nickname='+ nickname,
			url : '/hifive/checkNickname?nickname='+ nickname,
			type : 'get',
			cache : false,
			success : function(data) {
				if (data == 0) {
					$(".nicknameSuccess").text("사용가능한 닉네임입니다");
					$(".nicknameSuccess").css("color", "green");
					$("#nicknameChecker").val("true");
					$("#nickname").attr('disabled','true');
					$("#nicknameOverraping").attr('disabled','true');
				} else {
					$(".nicknameSuccess").text("사용 중인 닉네임입니다 ");
					$(".nicknameSuccess").css("color", "red");
					$("#nicknameChecker").val("false");
				}
			}, 
			error : function() {
				console.log("실패");
			}
		});
	}				
});


$("#submit").on("click", function(){
if($("#nicknameChecker").val() == "true"){
}else{
	alert("닉네임을 확인해주세요");
		return false;
	}
});
				
				