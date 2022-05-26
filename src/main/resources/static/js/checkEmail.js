var code = "";
$("#checkEmail").click(function(){
	var email = $("#email").val();
	$.ajax({
        type:"GET",
        url:"/hifive/checkEmail?email=" + email,
        cache : false,
        success:function(data){
        	if(data == "error"){
        		alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
				$("#email").attr("autofocus",true);
				$(".successEmailCheck").text("유효한 이메일 주소를 입력해주세요.");
				$(".successEmailCheck").css("color","red");
        	}else{	        		
				alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
        		$("#email2").attr("disabled",false);
        		$("#checkEmail2").css("display","inline-block");
        		$(".successEmailCheck").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
        		$(".successEmailCheckk").css("color","green");
        		code = data;
        		console.log(data);
        	}
        }
    });
});

//이메일 인증번호 대조
$("#checkEmail2").click(function(){
	if($("#email2").val() == code){
		$(".successEmailCheck").text("인증번호가 일치합니다.");
		$(".successEmailCheck").css("color","green");
		$("#emailDoubleCheck").val("true");
		$("#email2").attr("disabled",true);
		//$("#sm_email").attr("disabled",true);
	}else{
		$(".successEmailCheck").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$(".successEmailCheck").css("color","red");
		$("#emailDoubleCheck").val("false");
		$("#email2").attr("autofocus",true);
	}
});