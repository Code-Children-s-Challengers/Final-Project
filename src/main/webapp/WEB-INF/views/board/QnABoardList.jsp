<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnABoard</title>
<!-- 부트스트랩 CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/hifive/css/qna_list.css" rel="stylesheet">
<style>
 
</style>
</head>
<body>
<div>
<jsp:include page="../common/header.jsp" flush="true"/><br> <!-- header -->
</div>
<div class="row">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<jsp:include page="QnABoard/QnABoardList.jsp" flush="true"/><br> <!-- 본문 -->
	</div>
	<div class="col-sm-1s"></div>
</div>
</body>
<!-- 부트스트랩 JS  CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>