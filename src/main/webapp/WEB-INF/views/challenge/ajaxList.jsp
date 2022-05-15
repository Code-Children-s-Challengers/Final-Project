<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<tr id='cTable'>
    <c:set var="list" value ="${PageDTO.getList()}"></c:set>
    <c:forEach var="dto" items="${list}" varStatus="status">
 
	<td style="border:1px solid #444444;border-collapse: collapse">
		<table style='padding:15px;font-size: 12px' width="160px" height="200px" class="ch">
			<tr>
				<td>
					<c:choose>
						<c:when test="${empty dto.getPhoto()}">
							<img src="images/challenge/challenge_sample.jpg" border="0" align="center" width="100">
							<td class="td_red" align ="center" style="display:none">challenge_sample</td>
						</c:when>
						<c:otherwise>
							<img src="images/challenge/challenge_image/${dto.getPhoto()}" border="0" align="center" width="100">
							<td class="td_red" align ="center" style="display:none">${dto.getPhoto()}</td>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
			
				<td height="10">
			</tr>
			<tr>
				<td class= "td_default" align ="center">
					<a class= "a_black" href=""> 
					Name: ${dto.getName()}<br>
					</a>
				</td>
				
			</tr>
			<tr>
				<td height="10">
			</tr>
			<tr>
				<td class="td_gray" align ="center">
					Date: ${dto.getSday()} ~ ${dto.getEday()}
				</td>
			</tr>
			<tr>
				<td height="10">
			</tr>
			<tr>
				<td class="td_gray" align ="center">
					Participant: ${dto.getParticipant()}/${dto.getMpeople()}
				</td>
			</tr>
			<tr>
				<td height="10">
			</tr>
			<tr>
				<td class="td_red" align ="center"><font color="red"><strong>
				Fee: ${dto.getFee()}\	</strong></font></td>
			</tr>
			<tr>
				<td class="td_red" align ="center" style="display:none">${dto.getCnum()}</td>
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
	<td class="td_red" align ="center" style="display:none"><input type="hidden" id="nowcategory" value="${category}"/></td>
</tr>

<script>
	$(document).ready(function(){
		$(".ch").on("click",function(){
			var table = $(this).contents()[1].childNodes;
			
			var photo = table[0].childNodes[2].innerText;
			
			var name = table[4].childNodes[1].childNodes[1].innerText.substr(6);
			
			var date = table[8].childNodes[1].childNodes[0].textContent.substring(17,40);
			
			var people = table[12].childNodes[1].innerText.substr(13);
			
			var fee = table[16].childNodes[1].childNodes[0].childNodes[0].innerText.substr(5).split("\\")[0];
			var cnum = table[18].childNodes[1].childNodes[0].textContent;
	
			win = window.open("./participantPopup?cnum="+cnum+"&photo="+photo+"&name="+name+"&date="+date+"&people="+people+"&fee="+fee,"participant","width = 500, height = 500, top = 100, left = 200, location = no");
		});
	});
</script>








