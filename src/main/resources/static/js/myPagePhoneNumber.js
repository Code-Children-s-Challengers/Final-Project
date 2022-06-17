$("#complete").on("click", function(){
			if($("#phoneNumberChecker").val()== "true"){
				var recipientPhoneNumber = ""+ $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
				console.log(recipientPhoneNumber);
				$.ajax({
			        type:"post",
			        url:"/hifive/phoneNumberChange/"+${myId},
			        data : JSON.stringify({
			        	"recipientPhoneNumber": "1"+recipientPhoneNumber
			        }),
			        contentType: 'application/json',
			        cache : false,
			        success:function(data){
						console.log("good");
						$("#originalPhoneNumber").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
						$("#shutdownEvent").trigger("click");
						alert("전화번호가 변경되었습니다.");
			        }
			    });
			}else{
				console.log("bye")
			}
			
		})