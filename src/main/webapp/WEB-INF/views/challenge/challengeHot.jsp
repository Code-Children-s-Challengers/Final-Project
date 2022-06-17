<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="css/challenge_table.css">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
	<script>
	$(document).ready(function(){
		$(".hot").on("click",function(){
			var table = $(this).contents()[1].childNodes;
			
			var photo = table[0].childNodes[2].innerText;
			
			var name = table[4].childNodes[1].childNodes[1].innerText.substr(6);
			
			var date = table[8].childNodes[1].childNodes[0].textContent.substring(17,40);
			//var start = date.substring(17,27);
			//var end = date.substring(30,40);
			
			var people = table[12].childNodes[1].innerText.substr(13);
			//var people = table[12].childNodes[1].innerText.substr(13).split("/");
			//var participant = people[0];
			//var maxpeople = people[1];
			
			var fee = table[16].childNodes[1].childNodes[0].childNodes[0].innerText.substr(5).split("\\")[0];
			var cnum = table[18].childNodes[1].childNodes[0].textContent;
	
			win = window.open("./participantPopup?cnum="+cnum+"&photo="+photo+"&name="+name+"&date="+date+"&people="+people+"&fee="+fee,"participant","width = 500, height = 500, top = 100, left = 200, location = no");
		});
	});
	
	</script>
</head>
<br>
<div>Hot List</div>
<table width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">
				
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<tr class="cTable">

    <c:set var="list" value ="${hotList}"></c:set>
    <c:forEach var="dto" items="${list}" varStatus="status">
    
						<td style="border:1px solid #444444;border-collapse: collapse">
						<table style='padding:15px;font-size: 12px' width="320px" height="200px" class="ch">
							<tr>
								<td>
									<c:choose>
										<c:when test="${empty dto.getPhoto()}">
											<img src="images/challenge/challenge_sample.jpg" border="0" align="middle" width="150" height="150">
											<td class="td_red" align ="center" style="display:none">challenge_sample</td>
										</c:when>
										<c:when test="${dto.getPhoto() == 'challenge_sample.jpg'}">
											<img src="images/challenge/challenge_sample.jpg" border="0" align="middle" width="150" height="150">
											<td class="td_red" align ="center" style="display:none">challenge_sample</td>
										</c:when>
										<c:otherwise>
											<img src="/hifive/challengeImage/${dto.getCnum()}" border="0" align="middle" width="150" height="150" style="">
											<td class="td_red" align ="center" style="display:none">${dto.getCnum()}</td>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
							
								<td height="10">
							</tr>
							<tr>
								<td class= "td_default" align ="center">
									<span class= "a_black" href=""> 
									${dto.getName()}<br>
									</span>
								</td>
								
							</tr>
							<tr>
								<td height="10">
							</tr>
							<tr>
								<td class="td_gray" align ="center">
									${dto.getSday()} ~ ${dto.getEday()}
								</td>
							</tr>
							<tr>
								<td height="10">
							</tr>
							<tr>
								<td class="td_gray" align ="center">
									참여인원: ${dto.getParticipant()}/${dto.getMpeople()}
								</td>
							</tr>
							<tr>
								<td height="10">
							</tr>
							<tr>
								<td class="td_red" align ="center"><font color="red"><strong>
								참가비: ${dto.getFee()}P	</strong></font></td>
							</tr>
							<tr>
								<td class="td_red" align ="center" style="display:none">${dto.getCnum()}</td>
							</tr>
						</table>
					</td>
	
						
	

	  						
	
	    			</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>







