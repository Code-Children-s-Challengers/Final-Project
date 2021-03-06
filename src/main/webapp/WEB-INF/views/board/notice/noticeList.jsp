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
			<div class="container2">
			<div class="content">
			<div class="title">
			<select id = "selectBoard">
				<option value="notice" selected><h2>공지사항</h2></option>
				<option value="QnABoard"><h2>문의사항</h2></option>								
			</select><br/>					
			<h3>공지사항 검색</h3>
			</div>
			<form id="searchButton">
				<fieldset>					
					<label>검색분류</label>
					<select name="type">
						<option  value="title">제목</option>
						<option  value="writerId">작성자</option>
					</select> 
					<label>검색어</label>
					<input type="text" name="keyword" value="" />
					<input type="date"><input type="date" />
					<input type="submit" value="검색"  />
				</fieldset>
			</form>			
			</div>
			
			
			<div class="content" style="margin-top:40px;">
			<div class="title">	
			<h3>공지사항 목록</h3>
			</div>	
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th id="titleList">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					
					<tbody>							
					<c:set var="totalRecord" value ="${pDTO.totalRecord}"></c:set>
					<c:set var="perPage" value ="${pDTO.perPage}"></c:set>
					<c:set var="totalPage" value ="${totalPage}"></c:set>
					<c:set var="curPage" value ="${curPage}"></c:set>
					
					<% 
					NoticePageDTO pDTO = (NoticePageDTO)request.getAttribute("list");
					List<NoticeDTO> list = pDTO.getList();
					int i = 0;
					for(NoticeDTO n : list) {
						pageContext.setAttribute("n", n);
						if(i == 0){
							%><c:set var="i" value ="1"></c:set><%
						} else if(i == 1){
							%><c:set var="i" value ="2"></c:set><%
						} else if(i == 2){
							%><c:set var="i" value ="3"></c:set><%
						} else if(i == 3){
							%><c:set var="i" value ="4"></c:set><%
						} else if(i == 4){
							%><c:set var="i" value ="5"></c:set><%
						}
					%>
					<tr>
						<td style="text-align:center">${(curPage-1)*5 + i}</td>						
						<td style="text-align:center"><a href="noticeContent?id=${n.id}">${n.title}</a></td>
						<td style="text-align:center">${n.writerId}</td>
						<td style="text-align:center">${n.regdate}</td>
						<td style="text-align:center">${n.hit}</td>
					</tr>					
						
					<% i ++;} %>
					
					</tbody>
				</table>
					
			<div class="bottom">
				<c:forEach var="i" begin="1" end="${totalPage}">
				<a href="noticeList?curPage=${i}">${i}</a><span>  </span>
				</c:forEach><br/><br/>
			
				<button id="writeButton" class="btn btn-secondary">글쓰기</button>
			</div>
		</div>
		</div>
	
		</main>			
		</div>
	</div> 
	
	<script>
	var writeButton = document.querySelector("#writeButton");
	function moveWrite(){
		location.href = "noticeWrite";
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
		
		if (date2 == ""){
			console.log("나오니?");			
		} else if (date1 > date2){
			var temp = date1;
			date1 = date2;
			date2 = temp;			
		} 
		
		
		console.log(type);
		console.log(keyword);
		console.log(date1);
		console.log(date2);
		mesg = "type=" + type + "&keyword=" + keyword + "&date1=" + date1 + "&date2=" + date2;
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