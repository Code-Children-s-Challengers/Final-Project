<%@page import="com.ccc.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<main>
				<div class="container2">
				<div class="content">
				<div class="title">
				<h2>세부 공지사항</h2>
				</div>			
				<div class="subject">
						<table>
							<% 
							NoticeDTO n = (NoticeDTO)request.getAttribute("dto");							
							pageContext.setAttribute("n", n);
							%>
							<tbody>
								<tr>
									<th>작성번호</th>
									<td id = "writeNum"colspan="3">${n.id}</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3">${n.title}</td>
								</tr>
								<tr>
									<th>작성일</th>
									<td colspan="3">${n.regdate}	</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${n.writerId}</td>									
								</tr>
															
								<tr>
									<th class="story">내용</th>
									<td colspan="4">${n.content}</td>
								</tr>
								
							</tbody>
						</table>
					</div>
					
					<div class="bottom">
							<button id="ListButton" class="btn btn-primary">목록</button>
							<button id="DeleteButton" class="btn btn-secondary">글 삭제</button>
							<button id="UpdateButton" class="btn btn-secondary">글 수정</button>
					</div>		
					
				</div>	
				</div>	
			</main>		
			
	
	<script>
	var ListButton = document.querySelector("#ListButton");
	function moveList(){
		location.href = "/hifive/board/noticeList?curPage=1";
	}              
	ListButton.addEventListener("click",moveList);
	var id = document.querySelector("#writeNum").innerText;
	console.log(id);
	
	var DeleteButton = document.querySelector("#DeleteButton");
	function moveDelete(){		
		location.href = `/hifive/board/noticeDelete?id=\${id}`;		
	}              
	DeleteButton.addEventListener("click",moveDelete);
	
	var UpdateButton = document.querySelector("#UpdateButton");
	function moveUpdate(){		
		location.href = `/hifive/board/noticeUpdate?id=\${id}`;		
	}              
	UpdateButton.addEventListener("click",moveUpdate);
	
	
	</script>