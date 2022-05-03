<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".category").on("click",function(){
		$.ajax({
			url:'challengescategory', // Controller의 요청매핑값
			type:'get',
			data:{
				category:this.innerText
			},
		dataType:'text', // 응답 데이터는 간단한 숫자나 영문자로 주는게 좋다
		success:function(responseData, status, xhr){
			console.log(responseData); // 이 데이터를 사용한다
			var html = `<table style='padding:15px;font-size: 12px'>`
			html += `</table>`
			$("#cTable").html(html);
		},
		error:function(xhr, status, e){
			console.log("Error: "+e);
		}
		});
	});
});
</script>


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
	<td style="border:1px solid #444444;border-collapse: collapse" rowspan="100" width="100px">
	<a class="category">study</a><br><br>
	<a class="category">fitness</a><br><br>
	<a class="category">others</a>
	</td>
				<tr>

    <c:set var="list" value ="${cList}"></c:set>
    <c:forEach var="dto" items="${list}" varStatus="status">
    
						<td style="border:1px solid #444444;border-collapse: collapse" id="cTable">
							<table style='padding:15px;font-size: 12px'>
								<tr>
									<td>
										<a href=""> 
											${dto.getCnum()}
										</a>
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
							</table>
						</td>

  					

  					<c:if test="${status.count % 4 == 0 }">
  					
						     <tr>
								<td height="10">
							</tr>
  					</c:if>
  						

    </c:forEach>
    <tr>
		<td height="10">1 2 3 4 5 6</td>
	</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>







