<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		
		var getParameters = function (paramName) {
		    // 리턴값을 위한 변수 선언
		    var returnValue;

		    // 현재 URL 가져오기
		    var url = location.href;

		    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
		    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

		    // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
		    for (var i = 0; i < parameters.length; i++) {
		        var varName = parameters[i].split('=')[0];
		        if (varName.toUpperCase() == paramName.toUpperCase()) {
		            returnValue = parameters[i].split('=')[1];
		            return decodeURIComponent(returnValue);
		        }
		    }
		};
		
		
		$("#yes").on("click",function(){
			console.log(getParameters("date"));
			$.ajax({
				url:'reportUpdate',
				type:'post',
				data:{
					cnum:getParameters("cnum"),
					unum:getParameters("unum"),
					date:getParameters("date")
				},
			dataType:'text',
			success:function(responseData, status, xhr){
				if(responseData == "success"){
					alert("invalidate success");
					window.close();
				}else{
					alert("오류 발생");
					window.close();
				}
			},
			error:function(xhr, status, e){
				console.log("Error: "+e);
			}
			});
		});
		$("#close").on("click",function(){
			window.close();
		});
	});

</script>


<c:set var="date" value ="${dto.getUploaddate()}"></c:set>
<div id="photo">
<img src="images/challenge/certification_image/${dto.getPhoto()}" border="0" align="center" width="120">
</div><br>
<div id="comment">
Comment: ${dto.getComent()}
</div><br>
<div id="date">
date: ${dto.getUploaddate()}
</div><br>
<button id="yes">change validate</button> <button id="close">close</button>







