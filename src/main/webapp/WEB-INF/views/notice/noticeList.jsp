<%@page import="java.util.List"%>
<%@page import="com.ccc.dto.NoticeDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
  	
	<!-- --------------------------- <body> --------------------------------------- -->
	<div>
		<div>
		<main>
			<h2>공지사항</h2>					
			<h3>공지사항 검색</h3>
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
					List<NoticeDTO> list = (List<NoticeDTO>)request.getAttribute("list");
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
			
			<div>
				<h3>현재 페이지</h3>
				<div><span>1</span> / 1 pages</div>
			</div>
		
			<div>					
				<span onclick="alert('이전 페이지가 없습니다.');">이전</span>				
			</div>
			<ul>
				<li><a href="?p=1&t=&q=" >1</a></li>						
			</ul>
			<div>				
				<span onclick="alert('다음 페이지가 없습니다.');">다음</span>				
			</div>
			
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