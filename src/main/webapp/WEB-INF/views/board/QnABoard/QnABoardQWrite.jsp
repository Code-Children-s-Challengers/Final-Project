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
			<h2>문의사항 작성하기</h2>
			</div>
			<form id="qnaboardSave" method="GET">
				<table>
					<tbody>						
						<tr>
							<th>제목</th>
							<td><input type="text" id="title" name = "title" value=""  placeholder="제목을 입력하세요" maxLength="30" style="width:100%"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea id="qcontent" name="qcontent" placeholder="내용을 입력하세요" style="height:200px; width:100%"; ></textarea></td>
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
					<button type="button" id="ListButton" class="btn btn-primary">목록</button>	
					<button id="qnaboardSave" class="btn btn-secondary">글 저장</button>
				</div>
			</form>		
			
			</div>
			</div>
		</main>			
		</div>
	</div> 
	<script>
		var qnaboardSave = document.querySelector("#qnaboardSave");		
		
		function QnABoardInsert(event){			
			event.preventDefault();
			var mesg = "";			
			var title = qnaboardSave[0].value;
			var qcontent = qnaboardSave[1].value;
			//var files = qnaboardSave[2].value;			
			console.log(title);
			console.log(qcontent);			
			
			mesg = "title=" + title + "&" + "qcontent=" + qcontent;			
			location.href = `/hifive/board/QnABoardQWriteInsert?\${mesg}`;
			
		}		
		qnaboardSave.addEventListener("submit",QnABoardInsert);
		
		var ListButton = document.querySelector("#ListButton");
		function moveList(){
			location.href = "/hifive/board/QnABoardList";
		}              
		ListButton.addEventListener("click",moveList);
	</script>