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
			<select id = "selectBoard">
				<option value="notice" selected><h2>공지사항</h2></option>
				<option value="QnABoard"><h2>문의사항</h2></option>								
			</select>					
			<h3>공지사항 검색</h3>
			<form id="searchButton">
				<fieldset>					
					<label>검색분류</label>
					<select name="type">
						<option  value="title">제목</option>
						<option  value="writerId">작성자</option>
					</select> 
					<label>검색어</label>
					<input type="text" name="keyword" value=""/>
					<input type="date"><input type="date">
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
					NoticePageDTO pDTO = (NoticePageDTO)request.getAttribute("searchList");
					List<NoticeDTO> list = pDTO.getList();
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
				<a href="noticeSearch?curPage=${i}&type=${type}&keyword=${keyword}">${i}</a><span>  </span>
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
	
	var searchButton = document.querySelector("#searchButton");
	function moveSearch(event){
		event.preventDefault();
		var mesg = "";
		
		
		var type = searchButton[1].value;
		var keyword = searchButton[2].value;
		var date1 = searchButton[3].value;
		var date2 = searchButton[4].value;
		
		if (date1 > date2){
			var temp = date1;
			date1 = date2;
			date2 = temp;			
		}
		mesg = "type=" + type + "&keyword=" + keyword + "&date1=" + date1 + "&date2=" + date2;
		console.log(type);
		console.log(keyword);
		
		location.href = `noticeSearch?\${mesg}`;
	}
	searchButton.addEventListener("submit",moveSearch);
	
	var selectBoard = document.querySelector("#selectBoard");
	
	function moveBoard(){
		if (selectBoard.value == "notice"){
			location.href = `noticeList`;
		}
		if (selectBoard.value == "QnABoard"){
			location.href = `QnABoardList`;
		}		
		
	}	
	selectBoard.addEventListener("change",moveBoard)
	
	
	</script>