<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ccc.dto.QnABoardDTO"%>
<%@page import="com.ccc.dto.QnABoardPageDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
  	
	<!-- --------------------------- <body> --------------------------------------- -->
	<div>
		<div>
		<main>
			<select id = "selectBoard">
				<option value="notice" selected><h2>공지사항</h2></option>
				<option value="QnABoard" selected disabled><h2>문의사항</h2></option>								
			</select>	
			
			<h3>문의사항 검색</h3>
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
							<th>답변달기</th>
						</tr>
					</thead>
					
					<tbody>							

					<% 
					QnABoardPageDTO pDTO = (QnABoardPageDTO)request.getAttribute("searchList");
					List<QnABoardDTO> list = pDTO.getList();
					ArrayList<String> answers = (ArrayList<String>)request.getAttribute("resultAnswer");
					int i = 0;
					
					for(QnABoardDTO n : list) {
						pageContext.setAttribute("n", n);
												
					%>
					<tr>
						<td style="text-align:center">${n.id}</td>						
						<td style="text-align:center"><a href="QnABoardContent?id=${n.id}">${n.title}</a></td>
						<td style="text-align:center">${n.writerId}</td>
						<td style="text-align:center">${n.regdate}</td>
						<td style="text-align:center">${n.hit}</td>
						<%
						int j = 0;
							for(String answer : answers){
								pageContext.setAttribute("answer", answer);
							
								if(j == i){
								%>
									<td>${answer}</td>
								<%		
								System.out.println(j);																
							}
							j ++;
						}%>
					</tr>											
					<% 
					i++;} %>
					
					</tbody>
				</table>
			</div>			
			
			<c:set var="totalRecord" value ="${pDTO.totalRecord}"></c:set>
			<c:set var="perPage" value ="${pDTO.perPage}"></c:set>
			<c:set var="totalPage" value ="${totalPage}"></c:set>
			
			<c:forEach var="i" begin="1" end="${totalPage}">
				<a href="QnABoardSearch?curPage=${i}&type=${type}&keyword=${keyword}">${i}</a><span>  </span>
			</c:forEach>
			
			
			<div>
				<button id="writeQButton">글쓰기</button>
			</div>
	
		</main>			
		</div>
	</div> 
	<script>
	var writeQButton = document.querySelector("#writeQButton");
	function moveQWrite(){
		location.href = "/hifive/board/QnABoardQWrite";
	}              
	writeQButton.addEventListener("click",moveQWrite);
	
	var writeAButton = document.querySelector("#writeAButton");
	function moveAWrite(){
		location.href = "/hifive/board/QnABoardAWrite";
		// 글 id 전달되야함.
	}  
	
	function moveSearch(event){		
		event.preventDefault();
		var mesg = "";
		
		
		var type = searchButton[1].value;
		var keyword = searchButton[2].value;
		mesg = "type=" + type + "&" + "keyword=" + keyword;
		var date1 = searchButton[3].value;
		var date2 = searchButton[4].value;
		
		if (date2 == ""){
						
		} else if (date1 > date2){
					
			var temp = date1;
			date1 = date2;
			date2 = temp;			
		} 
		mesg = "type=" + type + "&keyword=" + keyword + "&date1=" + date1 + "&date2=" + date2;
		
		location.href = `QnABoardSearch?\${mesg}`;
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