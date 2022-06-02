<%@page import="com.ccc.dto.PageDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="width:800px; left:0; right:0;">
<c:set var="list" value ="${PageDTO.list}"></c:set>
<c:set var="totalRecord" value ="${PageDTO.totalRecord}"></c:set>
<c:set var="perPage" value ="${PageDTO.perPage}"></c:set>
<c:set var="totalPage" value ="${totalPage}"></c:set>

<c:forEach var="i" begin="1" end="${totalPage}">
	<c:if test="${i == PageDTO.curPage}">${i} </c:if>
	<c:if test="${i != PageDTO.curPage}"><a href="checkCertificationReport?curPage=${i}">${i}</a> </c:if>
</c:forEach>
<br>
</div>