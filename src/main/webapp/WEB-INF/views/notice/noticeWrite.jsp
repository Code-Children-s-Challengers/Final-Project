<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
	<!-- --------------------------- <body> --------------------------------------- -->
	<div>
		<div>
		<main>
			<h2>공지사항 작성하기</h2>
			<table>
				<tbody>
					<tr>
						<th>작성자</th>
						<td><input type="text" size="80"/></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" size="80"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><input type="text" size="80"></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file"></td>
					</tr>					
					
				</tbody>
			</table>		
			
			<div>
				<span>
					<button>목록</button>
					<button>글 저장</button>
				</span>
			</div>		
	
		</main>			
		</div>
	</div> 