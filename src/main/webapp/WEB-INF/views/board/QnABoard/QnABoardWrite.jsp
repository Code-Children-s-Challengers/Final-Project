<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
	<!-- --------------------------- <body> --------------------------------------- -->
	<div>
		<div>
		<main>
			<h2>공지사항 작성하기</h2>
			<form id="noticeSave" method="GET">
				<table>
					<tbody>
						<tr>
							<th>작성자</th>
							<td><input type="text" value="" size="80"/></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" value="" size="80"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><input type="text" value="" size="80"></td>
						</tr>
						<!-- 
						<tr>
							<th>첨부파일</th>
							<td><input type="file"></td>
						</tr>
						 -->				
						
						<tr>
							<td><button id="noticeSave">글 저장</button></td>
						</tr>	
						
					</tbody>
				</table>
			</form>		
			
			<div>
				<span>
					<button id="ListButton">목록</button>					
				</span>
			</div>		
	
		</main>			
		</div>
	</div> 
	<script>
		var noticeSave = document.querySelector("#noticeSave");		
		
		function noticeInsert(event){			
			event.preventDefault();
			var mesg = "";
			var writerId = noticeSave[0].value;
			var title = noticeSave[1].value;
			var content = noticeSave[2].value;
			//var files = noticeSave[3].value;
			console.log(writerId);
			console.log(title);
			console.log(content);			
			
			mesg = "writerId=" + writerId + "&" + "title=" + title + "&" + "content=" + content;			
			location.href = `/hifive/noticeWriteInsert?\${mesg}`;
			
		}		
		noticeSave.addEventListener("submit",noticeInsert);
		
		var ListButton = document.querySelector("#ListButton");
		function moveList(){
			location.href = "/hifive/noticeList";
		}              
		ListButton.addEventListener("click",moveList);
	</script>