<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
	<!-- --------------------------- <body> --------------------------------------- -->
	<div>
		<div>
		<main>
			<h2>문의사항 작성하기</h2>
			<form id="qnaboardSave" method="GET">
				<table>
					<tbody>						
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
							<td><button id="qnaboardSave">글 저장</button></td>
									
						</tr>	
						
					</tbody>
				</table>
			</form>		
			<td><button id="ListButton">목록</button></td>	
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