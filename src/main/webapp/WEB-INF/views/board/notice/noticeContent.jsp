<%@page import="com.ccc.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<main>
				<h2>세부 공지사항</h2>				
				<div>
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
									<th>내용</th>
									<td colspan="4">${n.content}</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3">${n.files}</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div>
						<span>
							<button id="ListButton">목록</button>
							<button id="DeleteButton">글 삭제</button>
						</span>
					</div>					
					
					<div>
						<table>
							<tbody>								
								<tr>
									<th>다음글</th>
									<td colspan="3">다음글제목</td>
								</tr>							
								
								
								<tr>
									<th>이전글</th>
									<td colspan="3"  ><a href="">이전글제목</a></td>
								</tr>								
							</tbody>					
						</table>
						
					
					</div>			
					
			</main>		
			
		</div>
	</div>
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
	
	
	</script>