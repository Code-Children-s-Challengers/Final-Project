<%@page import="java.util.List"%>
<%@page import="com.ccc.dto.NoticeDTO"%>
<%@page import="com.ccc.dto.NoticePageDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
  	
	<!-- --------------------------- <body> --------------------------------------- -->
	<div>
		<div>
		<main>
			<h2>공지사항</h2>					
			<a href="noticeList?curPage=1"><h3>리스트로 돌아가기</h3></a>			
			
			<div>
				<h3>공지사항 목록</h3>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					
					<tbody>							

					<% 
					List<NoticeDTO> list = (List<NoticeDTO>)request.getAttribute("searchList");
					
					for(NoticeDTO n : list) {
						pageContext.setAttribute("n", n);
					%>
					<tr>
						<td>${n.id}</td>						
						<td><a href="noticeContent?id=${n.id}">${n.title}</a></td>
						<td>${n.writerId}</td>
						<td>${n.regdate}</td>
						<td>${n.hit}</td>
					</tr>							
					<% } %>
					
					</tbody>
				</table>
			</div>			
			
			<c:set var="totalRecord" value ="${pDTO.totalRecord}"></c:set>
			<c:set var="perPage" value ="${pDTO.perPage}"></c:set>
			<c:set var="totalPage" value ="${totalPage}"></c:set>
			
			<c:forEach var="i" begin="1" end="${totalPage}">
				<a href="noticeList?curPage=${i}">${i}</a><span>  </span>
			</c:forEach>
			
			
			<div>
				<button id="writeButton">글쓰기</button>
			</div>
	
		</main>			
		</div>
	</div> 
	<script>
	var writeButton = document.querySelector("#writeButton");
	function moveWrite(){
		location.href = "/hifive/noticeWrite";
	}              
	writeButton.addEventListener("click",moveWrite);
	
	
	
	
	</script>