<%@page import="com.ccc.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<main>
				<h2>공지사항</h2>				
				
				<div>
						<h3>공지사항 내용</h3>
						<table>
						
							<tbody>
								<tr>
									<th>제목</th>
									<tdcolspan="3">${n.title}</td>
								</tr>
								<tr>
									<th>작성일</th>
									<td colspan="3">${n.regdate}	</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${n.writer_id}</td>
									<th>조회수</th>
									<td>${n.hit}</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3">${n.files}</td>
								</tr>
								<tr class="content">
									<td colspan="4">${n.content}</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div>
						<a>목록</a>
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