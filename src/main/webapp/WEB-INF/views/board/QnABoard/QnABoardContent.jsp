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
									<td id = "writeNum"colspan="3">${n.id}</td>
									<th>작성자</th>
									<td>${n.writerId}</td>		
									<th>작성일</th>
									<td colspan="3">${n.regdate}	</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3">${n.title}</td>
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
				<table>
					<tbody>								
						<tr>
							<th>다음글</th>
							<td colspan="3">다음글제목</td>
							<th>이전글</th>
							<td colspan="3"  ><a href="">이전글제목</a></td>
					
						</tr>								
					</tbody>					
				</table>					
			</div>
			
			<div>
				<span>
					<button id="ListButton">목록</button>
					<button id="DeleteButton">글 삭제</button>			
					<button id="UpdateButton">글 수정</button>				
				</span>
			</div>			
					
			</main>		
	
	<script>
	var ListButton = document.querySelector("#ListButton");
	function moveList(){
		location.href = "/hifive/board/QnABoardList?curPage=1";
	}              
	ListButton.addEventListener("click",moveList);
	
	var id = document.querySelector("#writeNum").innerText;
	console.log(id);
	var DeleteButton = document.querySelector("#DeleteButton");
	function moveDelete(){		
		location.href = `/hifive/board/QnABoardDelete?id=\${id}`;		
	}              
	DeleteButton.addEventListener("click",moveDelete);
	
	var UpdateButton = document.querySelector("#UpdateButton");
	function moveUpdate(){		
		location.href = `/hifive/board/noticeUpdate?id=\${id}`;		
	}              
	UpdateButton.addEventListener("click",moveUpdate);
	</script>