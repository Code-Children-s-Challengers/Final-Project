<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
	<!-- --------------------------- <body> --------------------------------------- -->
	<div>
		<div>
		<c:set var="id" value ="${id}"></c:set>
		<c:set var="title" value ="${title}"></c:set>
		
		<main>
			<h2>답변 작성하기</h2>
			<h3>*답변이 완료된 경우 답변내용이 수정됨</h3>
			<form id="QnABoardSave" method="GET">
				<table>
					<tbody>
						<tr>
							<th>글 번호</th>
							<td>${id}</span></td>
							<input type="hidden" id="id" name = "id" value="${id}"></td>
						</tr>						
						<tr>
							<th>제목</th>
							<td>${title}</span></td>
							<input type="hidden" id="title" name = "title" value="${title}"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea id="acontent" name="acontent" placeholder="내용을 입력하세요" style="height:100px; width:100%"; ></textarea>
					 </div></td>
						</tr>
						<!-- 
						<tr>
							<th>첨부파일</th>
							<td><input type="file"></td>
						</tr>
						 -->				
						
						<tr>
							<td><button id="QnABoardSave">글 수정</button></td>
												
						</tr>	
						
					</tbody>
				</table>
			</form>
				<td><button id="listButton">목록</button></td>		
			
		</main>			
		</div>
	</div> 	
	
	<script>
		var QnABoardSave = document.querySelector("#QnABoardSave");		

		function QnABoardUpdate(event){			
			event.preventDefault();
			var mesg = "";
			
			
			var id = QnABoardSave[0].value;			
			var acontent = QnABoardSave[2].value;
			//var files = noticeSave[3].value;
			
			console.log(id);			
			console.log(acontent);			
			
			mesg = "id=" + id + "&" + "acontent=" + acontent;			
			location.href = `/hifive/board/QnABoardAUpdateInsert?\${mesg}`;
			
		}		
		QnABoardSave.addEventListener("submit",QnABoardUpdate);
		
		var listButton = document.querySelector("#listButton");
		function moveList(){
			location.href = "/hifive/board/QnABoardList";
		}             		
		
		listButton.addEventListener("click",moveList);
	</script>