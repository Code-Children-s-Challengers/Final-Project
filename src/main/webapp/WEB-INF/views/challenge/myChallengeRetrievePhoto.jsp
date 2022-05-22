<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		$("#report").on("click",function(){	
			$.ajax({
				url:'challengeReport',
				type:'post',
				data:{
					cnum:$("#cnum").val(),
					unum:$("#unum").val(),
					date:$("#date").val()
				},
			dataType:'text',
			success:function(responseData, status, xhr){
				if(responseData == "success"){
					alert("신고요청이 발송되었습니다");
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
		$("#photodelete").on("click",function(){	
			$.ajax({
				url:'photoDelete',
				type:'post',
				data:{
					cnum:$("#cnum").val(),
					unum:$("#unum").val(),
					date:$("#date").val()
				},
			dataType:'text',
			success:function(responseData, status, xhr){
				if(responseData == "success"){
					alert("인증사진 삭제완료");
					opener.location.reload();
					window.close();
				}else{
					alert("오류 발생");
					opener.location.reload();
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


<input type="hidden" value="${cnum}" id="cnum"/>
<input type="hidden" value="${unum}" id="unum"/>
<input type="hidden" value="${date}" id="date"/>
<div>
<button id="report">잘못된 사진 신고</button>
</div><br>
<div id="photo">
<img src="images/challenge/certification_image/${photo}" border="0" align="center" width="120">
</div><br>
<div id="comment">
comment: ${comment}
</div><br>
<div id="date">
date: ${date}
</div><br>
<button id="photodelete">사진 삭제</button> <button id="close">닫기</button>







