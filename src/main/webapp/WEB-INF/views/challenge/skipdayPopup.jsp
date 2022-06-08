<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	
	$(document).ready(function(){
		$("#yes").on("click",function(){

			var date = $('#date').val();
			if(date == ''){
				alert("날짜를 입력해주세요");
			}else{
				alert("날짜가 추가되었습니다");
				opener.addskipday(date);
				opener.setskipday();
			}
			
		});
		$("#no").on("click",function(){
			window.close();
		});
	});


</script>




<input type="date" name="date" id="date"/>
<br>
<button id="yes">추가</button> <button id="no">닫기</button>







