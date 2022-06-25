//휴대폰 인증번호 발송
var code2 = "";
$("#phoneNumberSending").click(function(){
	var p1 = "" + $("#phone1").val();
	var p2 = "" + $("#phone2").val();
	var p3 = "" + $("#phone3").val();
	
	if(p1.length == 3 && p2.length == 4 && p3.length == 4 ){
		
		alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
		var recipientPhoneNumber = ""+ p1+p2+p3;
		$.ajax({
	        type:"post",
	        url:"/hifive/checkPhoneNumber",
	        data : JSON.stringify({
	        	"recipientPhoneNumber": "1"+recipientPhoneNumber
	        }),
	        contentType: 'application/json',
	        cache : false,
	        success:function(data){
	        	if(data == "error"){
	        		alert("휴대폰 번호가 올바르지 않습니다.")
					$(".phoneNumberSuccess").text("유효한 번호를 입력해주세요.");
					$(".phoneNumberSuccess").css("color","red");
					$("#phone1").attr("autofocus",true);
					$("#phone1").text("");
					$("#phone2").text("");
					$("#phone3").text("");
	        	}else{	        		
	        		$("#phoneNumber2").attr("disabled",false);
	        		$("#phoneNumberChecking").css("display","inline-block");
	        		$(".phoneNumberSuccess").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
	        		$(".phoneNumberSuccess").css("color","green");
	        		$("#phone1").attr("readonly",true);
	        		$("#phone2").attr("readonly",true);
	        		$("#phone3").attr("readonly",true);
	        		$("#phoneNumberChecking").attr("disabled",false);
	        		code2 = data.randomNumber;
	        		console.log(code2);
	        	}
	        }
	    });
		
	}else{
		alert("유효한 전화번호를 입력해주세요 :)");
	}
	
	
});


//휴대폰 인증번호 대조
$("#phoneNumberChecking").click(function(){
	if($("#phoneNumber2").val() == code2){
		$(".phoneNumberSuccess").text("인증번호가 일치합니다.");
		$(".phoneNumberSuccess").css("color","green");
		$("#phoneNumberChecker").val("true");
		$("#phoneNumber2").attr("disabled",true);
	}else{
		$(".phoneNumberSuccess").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$(".phoneNumberSuccess").css("color","red");
		$("#phoneNumberChecker").val("false");
		$(this).attr("autofocus",true);
	}
});
