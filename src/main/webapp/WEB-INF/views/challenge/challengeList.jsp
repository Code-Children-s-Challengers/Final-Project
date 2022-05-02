<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ccc.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<table width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">
				
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>
				<tr>

    <c:set var="list" value ="${allList}"></c:set>
    <c:forEach var="dto" items="${list}" varStatus="status">
    
						<td style="border:1px solid #444444;border-collapse: collapse">
							<table style='padding:15px'>
								<tr>
									<td>
										<a href=""> 
											${dto.getCnum()}
										</a>
									</td>
								</tr>
								<tr>
								
									<td height="10">
								</tr>
								<tr>
									<td class= "td_default" align ="center">
										<a class= "a_black" href=""> 
										${dto.getName()}<br>
										</a>
										<font color="gray">
										 --------------------
										</font>
									</td>
									
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_gray" align ="center">
										${dto.getSday()}
									</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_red" align ="center"><font color="red"><strong>
									${dto.getFee()}	</strong></font></td>
								</tr>
							</table>
						</td>

  					

  					<c:if test="${status.count % 4 == 0 }">
  					
						     <tr>
								<td height="10">
							</tr>
  					</c:if>
  						

    </c:forEach>
    
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>







