<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
	<!-- --------------------------- <body> --------------------------------------- -->
	<div>
		<div>
		<c:set var="id" value ="${id}"></c:set>
		
		<main>
			<div class="container2">
			<div class="content">
			<div class="title">
			<h2>문의사항 수정하기</h2>
			</div>
			<form id="QnABoardSave" method="GET">
			<input type="hidden" id="id" name = "id" value="${id}">
				<table>
					<tbody>
						<tr>
							<th>글 번호</th>
							<td style="width:100%;">${id}</td>
						</tr>						
						<tr>
							<th>제목</th>
							<td><input type="text" id="title" name = "title" value=""  placeholder="제목을 입력하세요" maxLength="30" style="width:100%;"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea id="qcontent" name="qcontent" placeholder="내용을 입력하세요" style="height:400px; width:100%"; ></textarea>
					 	</td>
						</tr>
						<!-- 
						<tr>
							<th>첨부파일</th>
							<td><input type="file"></td>
						</tr>
						 -->				
					</tbody>
				</table>
			<div class="bottom">
				<button type="button" id="listButton"  class="btn btn-primary">목록</button>	
				<button id="QnABoardSave"  class="btn btn-secondary">글 수정</button>		
			</div>
			</form>
			</div>
			</div>	
		</main>			
		</div>
	</div> 	
	
	<script>
		var QnABoardSave = document.querySelector("#QnABoardSave");		

		function QnABoardUpdate(event){			
			event.preventDefault();
			var mesg = "";
			
			
			var id = QnABoardSave[0].value;
			var title = QnABoardSave[1].value;
			var qcontent = QnABoardSave[2].value;
			//var files = noticeSave[3].value;
			
			console.log(id);
			console.log(title);
			console.log(qcontent);			
			
			mesg = "id=" + id + "&" + "title=" + title + "&" + "qcontent=" + qcontent;			
			location.href = `/hifive/board/QnABoardQUpdateInsert?\${mesg}`;
			
		}		
		QnABoardSave.addEventListener("submit",QnABoardUpdate);
		
		var listButton = document.querySelector("#listButton");
		function moveList(){
			location.href = "/hifive/board/QnABoardList";
		}             		
		
		listButton.addEventListener("click",moveList);
	</script>