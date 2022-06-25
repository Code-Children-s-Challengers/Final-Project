<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>notice</title>
<!-- 부트스트랩 CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	form{
		width:700px;
	}
	h2{
		display:inline-block;
	}
	
	th{
		width:20%;
		background-color:	#AECDFF;
		text-align:center;
	}
	table{
		margin-top:10px;
		width:100%;
		border-collapse: separate;
	}
	.content{
		width:800px;
		margin:auto;
	}
	btn{
		display:inline-block;
	}
	.bottom{
		margin-top:15px;
		text-align:center;
	}

</style>
</head>
<body>
<div>
<jsp:include page="../common/header.jsp" flush="true"/><br> <!-- header -->
</div>
<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
		<jsp:include page="notice/noticeWrite.jsp" flush="true"/><br> <!-- 본문 -->
	</div>
	<div class="col-sm-2"></div>
</div>

</body>
<!-- 부트스트랩 JS  CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>