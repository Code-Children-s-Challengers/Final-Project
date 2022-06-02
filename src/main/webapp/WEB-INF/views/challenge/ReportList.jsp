<%@page import="java.util.List"%>
<%@page import="com.ccc.dto.ReportDTO"%>
<%@page import="com.ccc.dto.ReportPageDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
  	<script>
		var writeQButton = document.querySelector("#writeQButton");
		function moveWrite(){
			location.href = "/hifive/noticeWrite";
		}              
		writeQButton.addEventListener("click",moveWrite);
		
		var writeAButton = document.querySelector("#writeQButton");
		function moveWrite(){
			location.href = "/hifive/noticeWrite";
		}              
		writeAButton.addEventListener("click",moveWrite);
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