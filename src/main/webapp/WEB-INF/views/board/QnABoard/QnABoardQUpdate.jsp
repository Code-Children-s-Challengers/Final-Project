<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
	<!-- --------------------------- <body> --------------------------------------- -->
	<div>
		<div>
		<c:set var="id" value ="${id}"></c:set>
		
		<main>
			<h2>문의사항 수정하기</h2>
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
							<td><input type="text" id="title" name = "title" value=""  placeholder="제목을 입력하세요" size="30"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea id="qcontent" name="qcontent" placeholder="내용을 입력하세요" style="height:100px; width:100%"; ></textarea>
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

		function noticeInsert(event){			
			event.preventDefault();
			var mesg = "";
			
			
			var id = QnABoardSave[0].value;
			var title = QnABoardSave[1].value;
			var content = QnABoardSave[2].value;
			//var files = noticeSave[3].value;
			
			console.log(id);
			console.log(title);
			console.log(content);			
			
			mesg = "id=" + id + "&" + "title=" + title + "&" + "qcontent=" + qcontent;			
			location.href = `/hifive/board/QnABoardQUpdateInsert?\${mesg}`;
			
		}		
		QnABoardSave.addEventListener("submit",QnABoardInsert);
		
		var listButton = document.querySelector("#listButton");
		function moveList(){
			location.href = "/hifive/board/QnABoardList";
		}             		
		
		listButton.addEventListener("click",moveList);
	</script>