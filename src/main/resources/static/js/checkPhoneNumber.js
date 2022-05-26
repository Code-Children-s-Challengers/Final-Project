//휴대폰 인증번호 발송
var code2 = "";
$("#checkPhoneNumber").click(function(){
	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
	var phoneNumber = $("#phoneNumber").val();
	$.ajax({
        type:"post",
        url:"/hifive/checkPhoneNumber",
        data : phoneNumber
        cache : false,
        success:function(data){
        	if(data == "error"){
        		alert("휴대폰 번호가 올바르지 않습니다.")
				$(".successPhoneNumberChk").text("유효한 번호를 입력해주세요.");
				$(".successPhoneNumberChk").css("color","red");
				$("#phoneNumber").attr("autofocus",true);
        	}else{	        		
        		$("#phoneNumber2").attr("disabled",false);
        		$("#checkPhoneNumber2").css("display","inline-block");
        		$(".successPhoneNumberChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
        		$(".successPhoneNumberChk").css("color","green");
        		$("#phone").attr("readonly",true);
        		code2 = data;
        	}
        }
    });
});


//휴대폰 인증번호 대조
$("#checkPhoneNumber2").click(function(){
	if($("#phoneNumber2").val() == code2){
		$(".successPhoneNumberChk").text("인증번호가 일치합니다.");
		$(".successPhoneNumberChk").css("color","green");
		$("#phoneNumberDoubleChk").val("true");
		$("#phoneNumber2").attr("disabled",true);
	}else{
		$(".successPhoneNumberChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$(".successPhoneNumberChk").css("color","red");
		$("#phoneNumebrDoubleChk").val("false");
		$(this).attr("autofocus",true);
	}
});
