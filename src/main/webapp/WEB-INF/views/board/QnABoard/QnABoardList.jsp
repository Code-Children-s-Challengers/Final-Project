<%@page import="java.util.List"%>
<%@page import="com.ccc.dto.QnABoardDTO"%>
<%@page import="com.ccc.dto.QnABoardPageDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
  	
	<!-- --------------------------- <body> --------------------------------------- -->
	<div>
		<div>
		<main>
			<h2>문의하기 게시판</h2>					
			<h3>문의사항 검색</h3>
			<form>
				<fieldset>					
					<label>검색분류</label>
					<select name="f">
						<option  value="title">제목</option>
						<option  value="writerId">작성자</option>
					</select> 
					<label>검색어</label>
					<input type="text" name="q" value=""/>
					<input type="submit" value="검색" />
				</fieldset>
			</form>			
			
			<div>
				<h3>문의사항 목록</h3>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>답변여부</th>
						</tr>
					</thead>
					
					<tbody>							

					<% 
					QnABoardPageDTO pDTO = (QnABoardPageDTO)request.getAttribute("list");
					List<QnABoardDTO> list = pDTO.getList();
					for(QnABoardDTO n : list) {
						pageContext.setAttribute("n", n);
					%>
					<tr>
						<td>${n.id}</td>						
						<td><a href="QnABoardContent?id=${n.id}">${n.title}</a></td>
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
				<a href="QnABoardList?curPage=${i}">${i}</a><span>  </span>
			</c:forEach>
			
			
			<div>
				<button id="writeQButton">문의글 작성</button>
				
			</div>
	
		</main>			
		</div>
	</div> 
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