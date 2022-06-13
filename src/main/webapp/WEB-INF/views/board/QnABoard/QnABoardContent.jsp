<%@page import="com.ccc.dto.QnABoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<main>
				<h2>세부 문의내역</h2>				
				<div>
						<table>
							<% 
							QnABoardDTO n = (QnABoardDTO)request.getAttribute("dto");							
							pageContext.setAttribute("n", n);
							%>
							<tbody>
								<tr>
									<th>작성번호</th>
									<td id ="writeNum" colspan="3">${n.id}</td>
									<th>작성자</th>
									<td>${n.writerId}</td>		
									<th>작성일</th>
									<td colspan="3">${n.regdate}	</td>
								</tr>
								<tr>
									<th>제목</th>
									<td id ="writeTitle" colspan="3">${n.title}</td>
								</tr>
								<tr>
									
								</tr>
								<tr>
																
								</tr>
															
								<tr>
									<th>질문내용</th>
									<td colspan="4">${n.qcontent}</td>
								</tr>
								<tr>
									<th>답변내용</th>
									<td colspan="4">${n.acontent}</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3">${n.files}</td>
								</tr>
							</tbody>
						</table>
					</div>	
			<div>											
			
			
			<div>
									
			</div>
			
			<div>
				<span>
					<button id="ListButton">목록</button>
					<button id="DeleteButton">글 삭제</button>			
					<button id="UpdateQButton">글 수정(user)</button>
					<button id="UpdateAButton">답변 작성(admin)</button>						
				</span>
			</div>			
					
			</main>		
	
	<script>
	var id = document.querySelector("#writeNum").innerText;
	var title = document.querySelector("#writeTitle").innerText;
	
	
	var ListButton = document.querySelector("#ListButton");
	function moveList(){
		location.href = "/hifive/board/QnABoardList?curPage=1";
	}              
	ListButton.addEventListener("click",moveList);
	
	console.log(id);
	console.log(title);
	
	var DeleteButton = document.querySelector("#DeleteButton");
	function moveDelete(){		
		location.href = `/hifive/board/QnABoardDelete?id=\${id}`;		
	}              
	DeleteButton.addEventListener("click",moveDelete);
	
	var UpdateQButton = document.querySelector("#UpdateQButton");
	function moveQUpdate(){		
		location.href = `/hifive/board/QnABoardQUpdate?id=\${id}`;		
	}              
	UpdateQButton.addEventListener("click",moveQUpdate);
	
	var UpdateAButton = document.querySelector("#UpdateAButton");
	function moveAUpdate(){		
		location.href = `/hifive/board/QnABoardAUpdate?id=\${id}&title=\${title}`;		
	}              
	UpdateAButton.addEventListener("click",moveAUpdate);
	</script>