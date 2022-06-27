var code = "";
$("#emailSending").click(function(){
	var email = $("#email").val();
	$.ajax({
        type:"GET",
        url:"/hifive/checkEmail?email=" + email,
        cache : false,
        success:function(data){
        	if(data == "error"){
        		alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
				$("#email").attr("autofocus",true);
				$(".emailSuccess").text("유효한 이메일 주소를 입력해주세요.");
				$(".emailSuccess").css("color","red");
        	}else{	        		
				alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
        		$("#email2").attr("disabled",false);
        		$("#emailChecking").css("display","inline-block");
        		$(".emailSuccess").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
        		$(".emailSuccess").css("color","green");
        		$("#emailChecking").attr("disabled", false);
        		code = data;
        	}
        }
    });
});

//이메일 인증번호 대조
$("#emailChecking").click(function(){
	if($("#email2").val()==""){
		$(".emailSuccess").text("이메일을 입력 후 인증번호를 요청해주세요");
		$(".emailSuccess").css("color","red");
		$("#emailChecker").val("false")
	}else if($("#email2").val() == code){
		$(".emailSuccess").text("인증번호가 일치합니다.");
		$(".emailSuccess").css("color","green");
		$("#emailChecker").val("true");
		$("#email2").attr("disabled",true);
		//$("#sm_email").attr("disabled",true);
	}else{
		$(".emailSuccess").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$(".emailSuccess").css("color","red");
		$("#emailChecker").val("false");
		$("#email2").attr("autofocus",true);
	}
});