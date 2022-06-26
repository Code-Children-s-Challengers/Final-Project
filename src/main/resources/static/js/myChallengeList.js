		$(".today").val(new Date().toISOString().substring(0, 10));
		
		//프로필 이미지 미리보기 기능
		$("form").on("change",".ploadPh", handleChPhoto);
		function handleChPhoto(e){
			var cnum = $(this).attr("data-cnum");
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				var reader = new FileReader();
				reader.onload = function(e){
					$("#uploadPhotoImage"+cnum).attr("src", e.target.result);
					}
					reader.readAsDataURL(f);
				});
		}
		
		// 클릭 이벤트 발생 시 ajax처리한다
		$(".upload").on("click",function(){
			//여기다가 설정해주어야 되는 군...
			$.fn.isValid = function(){
				  return this[0].checkValidity()
				}
			
			//form의 data-cnum
			var cnum = $(this).attr("data-cnum");
			console.log(cnum);
			console.log($("#uploadForm"+cnum));
			// 부트스트랩 유효성 검증  
			if (! $("#uploadForm"+cnum).isValid()) {
		          event.preventDefault()
		          event.stopPropagation()
		          console.log("why");
		          $("#uploadForm"+cnum).addClass('was-validated');
		        }else{
		        	//ajax로 formData를 전송한다, 전송 대상 : 사진, comment
					var formData = new FormData($("#uploadForm"+cnum)[0]);
					$.ajax({
						url: "/hifive/upload/"+cnum,
						type:"post",
						data : formData,
						cache: false,
						contentType: false,
						processData: false,
						dataType: 'text',
						success: function(data){
							alert(data);	
							$(".btn-close").click();
							window.location.reload();
						}
					});			
		        }			 
			 
		});
		
		
		$(".card").on("click",function(){
			
			var cnum = $(this).attr("data-cnum");
			var unum = $(this).attr("data-unum");
			var sday = $(this).attr("data-sday");
			var eday = $(this).attr("data-eday");
			var commentList = $(this).attr("data-comment");
			
			// 일단 안에 비우고 시작
			$("#inner"+cnum).html("");
			
			// 소요 기간 (ex 3일)
			var validDay = getDateDiff(sday, eday)+1;
			$("#a"+cnum).val(validDay);
			
			
			var commentList2 = commentList.slice(1,-1);
			console.log(commentList2);
			var commentList3 = commentList2.split(", ");
			var commentList4 = [];
			
			for( var i2 =0 ;i2<commentList3.length; i2++){
				var a = commentList3[i2].slice(1,-1)
				console.log(a.split("="));
				commentList4.push(a.split("="));
			}
			
			
			console.log(commentList4);
			var commentDay = []; // 코멘트를 남긴 날들 ex) 2022-06-22, 2022-06-23...
			var realComment = []; //실제 코멘트 내용 ex)운동1, 운동2 ...
			for(var i3=0 ; i3<commentList4.length; i3++){
				commentDay.push(commentList4[i3][0]);
				realComment.push(commentList4[i3][1]);
			}
			
			for(var i = 0 ;i<validDay; i++){
				//어제날짜 구하기
				var today = new Date();
				today.setHours(0,0,0,0);
				
				//유효한 date들을 문자열로 만든다 => YYYY-MM-DD 형식의 문자열로 만들어줌
				var date = new Date(sday)
				date.setDate(date.getDate()+i); 
				var photoDay = dateToString(date); //실질적인 날짜				
				
				var commentChecker = commentDay.indexOf(photoDay); //일치하는 날이 있으면 그 위치(인덱스), 일치한 날이 없으면 -1
				
				//실질적으로 인증한 마지막 날
				var lastDay = new Date(commentDay[commentDay.length-1])
				
				if(commentChecker != -1){ //인증한 날이 있을 때					
					if(i==0){ //첫번째 슬라이드에는 active 추가
						$("#inner"+cnum).append('<div class="carousel-item active cPhotoImage" id="cPhotoImage'+i+'"><img src="/hifive/cPhotoImage/'+cnum+'/'+unum+'/'+photoDay+'" alt="..."><h3>'+photoDay+'&nbsp;<span class="badge rounded-pill bg-success">인증 성공</span></h3><div class="container">'+realComment[commentChecker]+'</div></div>');
					}else{ //두 번째 슬라이드부터는 active 추가X
						$("#inner"+cnum).append('<div class="carousel-item cPhotoImage" id="cPhotoImage'+i+'"><img src="/hifive/cPhotoImage/'+cnum+'/'+unum+'/'+photoDay+'"  alt="..."><h3>'+photoDay+'&nbsp;<span class="badge rounded-pill bg-success">인증 성공</span></h3><div class="container">'+realComment[commentChecker]+'</div></div>');
					}
				}else if( new Date(photoDay) > today){ //인증할 날이 아직 다가오지 않았을 때 
					if(i==0){ //첫번째 슬라이드에는 active 추가
						$("#inner"+cnum).append('<div class="carousel-item active cPhotoImage" id="cPhotoImage'+i+'"><img src="/hifive/cPhotoImage/'+cnum+'/'+unum+'/'+photoDay+'" alt="..."><h3>'+photoDay+'&nbsp;<span class="badge rounded-pill bg-warning text-dark">인증 예정</span></h3><div class="container">'+'해당 날짜에 인증해주세요'+'</div></div>');
					}else{ //두 번째 슬라이드부터는 active 추가X
						$("#inner"+cnum).append('<div class="carousel-item cPhotoImage" id="cPhotoImage'+i+'"><img src="/hifive/cPhotoImage/'+cnum+'/'+unum+'/'+photoDay+'"  alt="..."><h3>'+photoDay+'&nbsp;<span class="badge rounded-pill bg-warning text-dark">인증 예정</span></h3><div class="container">'+'해당 날짜에 인증해주세요'+'</div></div>');
					}
				}else{// 인증을 실패했을 때
					if(i==0){ //첫번째 슬라이드에는 active 추가
						$("#inner"+cnum).append('<div class="carousel-item active cPhotoImage" id="cPhotoImage'+i+'"><img src="/hifive/cPhotoImage/'+cnum+'/'+unum+'/'+photoDay+'" alt="..."><h3>'+photoDay+'&nbsp;<span class="badge rounded-pill bg-danger">인증 실패</span></h3><div class="container">'+'인증하지 못한 하루...'+'</div></div>');
					}else{ //두 번째 슬라이드부터는 active 추가X
						$("#inner"+cnum).append('<div class="carousel-item cPhotoImage" id="cPhotoImage'+i+'"><img src="/hifive/cPhotoImage/'+cnum+'/'+unum+'/'+photoDay+'"  alt="..."><h3>'+photoDay+'&nbsp;<span class="badge rounded-pill bg-danger">인증 실패</span></h3><div class="container">'+'인증하지 못한 하루...'+'</div></div>');
					}
				}
				
				
			}
			
			
		});
		//날짜 차이 계산 해주는 함수
		var getDateDiff = (d1, d2) => {
			  const date1 = new Date(d1);
			  const date2 = new Date(d2);
			  
			  const diffDate = date1.getTime() - date2.getTime();
			  
			  return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
		}
		
		//자바스크립트 날짜 => 문자열 포맷함수
		function dateToString(date)
		{
					var dd = date.getDate();
					var mm = date.getMonth()+1; //January is 0!
				
					var yyyy = date.getFullYear();
					if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm}
					
					yyyy = yyyy.toString();
					mm = mm.toString();
					dd = dd.toString();
				
					var s1 = yyyy+"-"+mm+"-"+dd;
					return s1;
		}
		
		//환급받기
		$(".pointBack").on("click",function(){
			
			var cnum = $(this).attr("data-cnum");
			var unum = $(this).attr("data-unum");
			var sday = $(this).attr("data-sday");
			var eday = $(this).attr("data-eday");
			var fee = $(this).attr("data-fee");
			var commentList = $(this).attr("data-comment");
			console.log(cnum);
			console.log(unum);
			console.log(sday);
			console.log(eday);
			console.log(commentList);
			
			// 소요 기간 (ex 3일)
			var validDay = getDateDiff(sday, eday)+1;
			$("#a"+cnum).text(validDay);
			
			
			var commentList2 = commentList.slice(1,-1);
			var commentList3 = commentList2.split(", ");
			var commentList4 = [];
			
			for( var i2 =0 ;i2<commentList3.length; i2++){
				var a = commentList3[i2].slice(1,-1)
				console.log(a.split("="));
				commentList4.push(a.split("="));
			}
			
			
			var commentDay = []; // 코멘트를 남긴 날들 ex) 2022-06-22, 2022-06-23...
			var realComment = []; //실제 코멘트 내용 ex)운동1, 운동2 ...
			for(var i3=0 ; i3<commentList4.length; i3++){
				commentDay.push(commentList4[i3][0]);
				realComment.push(commentList4[i3][1]);
			}
			
			// 실제 인증횟수
			var cphotoCount = commentDay.length;
			$("#b"+cnum).text(cphotoCount);
			
			// 달성률
			var aRate = ((cphotoCount/validDay) * 100).toFixed(2);
			$("#c"+cnum).text(aRate+"%");
			
			//환급 포인트
			var returnP 
			if(aRate < 80){
				returnP = fee*(cphotoCount/validDay);
				console.log(returnP);
			}else{
				returnP = fee + fee*0.1*cphotoCount;
			}
			$("#d"+cnum).text(returnP);
			$("#realPointBack"+cnum).val(returnP);
			
		});
		
		$(".realPointBack").on("click",function(){
			var cnum = $(this).attr("data-cnum");
			var unum = $(this).attr("data-unum");
			var realPoint = $("#realPointBack"+cnum).val();
			$.ajax({
				url: "/hifive/pointBack/"+cnum+"/"+unum+"/"+realPoint,
				type:"get",
				contentType:"text",
				dataTypoe:"text",
				success:function(data){
					$(".btn-close").click();
					alert(data);
					window.location.reload();
				}
			});
			
		});		