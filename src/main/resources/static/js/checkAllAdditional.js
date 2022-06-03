//최종 틍록하기 버튼 클릭시 각 부분별 입력값 맞는지 확인
$("#button1").click(function(){
    if($("#agreement1").prop("checked") 
    		&& $("#agreement2").prop("checked") 
    		&& $("#nicknameChecker").val() == "true" 
    		&& $("#phoneNumberChecker").val() == "true"
    			){
 
    	
    }else{
    	alert("회원가입을 완료할 수 없습니다. 다시한번 확인해주십시오.");
    	if(!$("#agreement1").prop("checked")){
    		$("label[for=agreement1]").text("동의 해주시기 바랍니다.");
    		$("label[for=agreement1]").css("color","red");
    	}
    	if(!$("#agreement2").prop("checked")) {
    		$("label[for=agreement2]").text("동의 해주시기 바랍니다.");
    		$("label[for=agreement2]").css("color","red");
    	}
    	if($("#nicknameChecker").val() != "true"){
    		$(".nicknameSuccess").text("닉네임을 입력해주세요 :)");
			$(".nicknameSuccess").css("color", "red");
    	}
    	if($("#phoneNumberChecker").val() != "true"){
    		$(".phoneNumberSuccess").text("휴대폰 인증을 완료해주세요 :)");
			$(".phoneNumberSuccess").css("color", "red");	    		
    	}
    	return false
    }    	    	
});

$("#button2").click(function(){
	$("#nicknameChecker").val("false");
	$("#phoneNumberChecker").val("false");
	$("#phoneNumber").attr("readonly",false);
});

