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
		var cnum = table[18].childNodes[1].childNodes[0].textContent;
		
		location.href = "./myChallengeRetrieve?cnum="+cnum;

	});
});
</script>


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

				<tr id='cTable'>
				    <c:set var="list" value ="${PageDTO.getList()}"></c:set>
				    <c:forEach var="dto" items="${list}" varStatus="status">
	    
					<td style="border:1px solid #444444;border-collapse: collapse">
						<table style='padding:15px;font-size: 12px' width="160px" height="200px" class="ch">
							<tr>
								<td>
									<c:choose>
										<c:when test="${empty dto.getPhoto()}">
											<img src="images/challenge/challenge_sample.jpg" border="0" align="center" width="120">
											<td class="td_red" align ="center" style="display:none">challenge_sample</td>
										</c:when>
										<c:otherwise>
											<img src="images/challenge/challenge_image/${dto.getPhoto()}" border="0" align="center" width="120">
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
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>







