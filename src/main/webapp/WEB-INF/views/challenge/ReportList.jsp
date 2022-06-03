<%@page import="java.util.List"%>
<%@page import="com.ccc.dto.ReportDTO"%>
<%@page import="com.ccc.dto.ReportPageDTO"%>
<%@page import="com.ccc.dto.CPhotoDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".delete").on("click",function(){
		var table = $(this).parent().prevAll();
		
		var date = table[1].textContent;
		var unum = table[2].textContent;
		var cnum = table[3].textContent;
		
		$.ajax({
			url:'reportDelete', // Controller의 요청매핑값
			type:'post',
			data:{
				cnum:cnum,
				unum:unum,
				date:date
			},
		dataType:'text', // 응답 데이터는 간단한 숫자나 영문자로 주는게 좋다
		success:function(responseData, status, xhr){
			if(responseData == "success"){
				alert("요청 제거 완료");
				location.reload();
			}else{
				alert("오류 발생");
			}
		},
		error:function(xhr, status, e){
			console.log("Error: "+e);
		}
		});
	});
	$(".check").on("click",function(){
		var table = $(this).parent().prevAll();
		
		var date = table[0].textContent;
		var unum = table[1].textContent;
		var cnum = table[2].textContent;

		win = window.open("./reportCheck?cnum="+cnum+"&unum="+unum+"&date="+date,"width = 500, height = 500, top = 100, left = 200, location = no");
	});
});
</script>


	<div>
		<div>
		<main>
			<h2>잘못된 사진 신고</h2>					
			
			<div>
				<h3>문의사항 목록</h3>
				<table>
					<thead>
						<tr>
							<th>cnum</th>
							<th>unum</th>
							<th>uploaddate</th>
							<th>확인</th>
							<th>삭제</th>
						</tr>
					</thead>
					
					<tbody>							

					<c:set var="list" value ="${PageDTO.getList()}"></c:set>
				    <c:forEach var="dto" items="${list}" varStatus="status">
					<tr>
						<td>${dto.getCnum()}</td>						
						<td>${dto.getUnum()}</td>
						<td>${dto.getUploaddate()}</td>
						<td><input type="button" class="check" name="check" value="확인"/></td>
						<td><input type="button" class="delete" name="delete" value="삭제"/></td>
					</tr>
					</c:forEach>
					
					</tbody>
				</table>
			</div>			
			
			<c:set var="totalRecord" value ="${dto.totalRecord}"></c:set>
			<c:set var="perPage" value ="${dto.perPage}"></c:set>
			<c:set var="totalPage" value ="${totalPage}"></c:set>
			
			<jsp:include page="reportPage.jsp"></jsp:include>
	
		</main>			
		</div>
	</div> 