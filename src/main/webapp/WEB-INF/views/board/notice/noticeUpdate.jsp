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
			<h2>공지사항 수정하기</h2>
			</div>
			<div class="subject">
			<form id="noticeSave" method="GET">
			<input type="hidden" id="id" name = "id" value="${id}">	
				<table>
					<tbody>
						<tr>
							<th>글 번호</th>
							<td style="width:100%;">${id}</td>
							
						</tr>						
						<tr>
							<th>제목</th>
							<td><input type="text" id="title" name = "title" value=""  placeholder="제목을 입력하세요" placeholder="내용을 입력하세요" maxLength="30" style="width:100%;"></td>
						</tr>
						<tr>
							<th class="story">내용</th>
							<td><textarea id="content" name="content" placeholder="내용을 입력하세요" style="height:400px; width:100%;"></textarea></td>
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
				<button id="noticeSave" class="btn btn-secondary">글 수정</button>	
			</div>
			</form>
			</div>
			</div>
			</div>
		</main>			
		</div>
	</div> 	
	
	<script>
		var noticeSave = document.querySelector("#noticeSave");		

		function noticeInsert(event){			
			event.preventDefault();
			var mesg = "";
			
			
			var id = noticeSave[0].value;
			var title = noticeSave[1].value;
			var content = noticeSave[2].value;
			//var files = noticeSave[3].value;
			
			console.log(id);
			console.log(title);
			console.log(content);			
			
			mesg = "id=" + id + "&" + "title=" + title + "&" + "content=" + content;			
			location.href = `/hifive/board/noticeUpdateInsert?\${mesg}`;
			
		}		
		noticeSave.addEventListener("submit",noticeInsert);
		
		var listButton = document.querySelector("#listButton");
		function moveList(){
			location.href = "/hifive/board/noticeList?curPage";
		}             		
		
		listButton.addEventListener("click",moveList);
	</script>