<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".ch").on("click",function(){
		var table = $(this).contents()[1].childNodes;
		
		var photo = table[0].childNodes[0].baseURI;
		
		var comment = table[4].childNodes[1].childNodes[1].innerText.substr(9);
		
		var date = table[8].childNodes[1].childNodes[0].textContent.substring(22,32);
		
		var unum = $("#unum").val();
		var cnum = $("#cnum").val();
		
		win = window.open("./myChallengeRetrievePhoto?cnum="+cnum+"&unum="+unum+"&photo="+photo+"&comment="+comment+"&date="+date,"Retrieve","width = 500, height = 500, top = 100, left = 200, location = no");

	});
	$("#upload").on("click",function(){
		var cnum = $("#cnum").text();
		win = window.open("./uploadCertificationPopup?cnum="+cnum,"upload certification","width = 500, height = 500, top = 100, left = 200, location = no");
	});
});
</script>

<input type="hidden" value="${unum}" id="unum"/>
<input type="hidden" value="${cnum}" id="cnum"/>

<button id="upload">upload certification</button>
<table width="100%" cellspacing="0" cellpadding="0" id="test">
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
				<tr>
				<td style="border:1px solid #444444;border-collapse: collapse" rowspan="100" width="200px">
				<table>
					<c:set var="cdto" value ="${cdto}"></c:set>
					<c:choose>
						<c:when test="${empty cdto.getPhoto()}">
							<img src="images/challenge/challenge_sample.jpg" border="0" align="center" width="120">
							<td class="td_red" align ="center" style="display:none">challenge_sample</td>
						</c:when>
						<c:otherwise>
							<img src="images/challenge/challenge_image/${cdto.getPhoto()}" border="0" align="center" width="120">
							<td class="td_red" align ="center" style="display:none">${cdto.getPhoto()}</td>
						</c:otherwise>
					</c:choose><td class="td_red" align ="center" style="display:none" id="cnum">${cdto.getCnum()}</td><br>
					Name: ${cdto.getName()}<br>
					Date: ${cdto.getSday()} ~ ${cdto.getEday()}<br>
					Participant: ${cdto.getParticipant()}/${cdto.getMpeople()}<br>
					Fee: ${cdto.getFee()}\
				</table>
				</td>
				</tr>
				<tr id='cTable'>
				    <c:set var="list" value ="${PageDTO.getList()}"></c:set>
				    <c:forEach var="dto" items="${list}" varStatus="status">
	    
					<td style="border:1px solid #444444;border-collapse: collapse">
						<table style='padding:15px;font-size: 12px' width="160px" height="200px" class="ch">
							<tr>
								<td>
									<img src="images/challenge/certification_image/${dto.getPhoto()}" border="0" align="center" width="120">
								</td>
							</tr>
							<tr>
								<td height="10">
							</tr>
							<tr>
								<td class= "td_default" align ="center">
									<a class= "a_black" href=""> 
									Comment: ${dto.getComent()}<br>
									</a>
								</td>
								
							</tr>
							<tr>
								<td height="10">
							</tr>
							<tr>
								<td class="td_gray" align ="center">
									UploadDate: ${dto.getUploaddate()}
								</td>
							</tr>
							<tr>
								<td height="10">
							</tr>
							<tr>
								<c:choose>
									<c:when test="${dto.getValidates() eq 1}">
										<td class="td_gray" align ="center">Validate: good</td>
									</c:when>
									<c:otherwise>
										<td class="td_gray" align ="center">Validate: bad</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</table>
					</td>
						<c:if test="${status.count % 4 == 0 }">
					     <tr>
							<td height="10">
						</tr>
						</c:if>
	    			</c:forEach>
	    		</tr>
			    <tr id='page'>
					<td height="10" colspan="100"><jsp:include page="page.jsp"></jsp:include></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>







