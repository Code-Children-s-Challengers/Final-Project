
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!--  헤더  -->
<hr>
<section class="text-center container">
<jsp:include page="./menu.jsp" flush="true"/><br>
    <div class="row py-lg-3">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">새로운 도전을 즐기세요!</h1>
        <p class="lead text-muted">나를 죽이지 못한 고통은 나를 더 강하게 만들 뿐</p>
        <p>
          <a id="chHome" class="btn btn-success my-2" style="display:inline-block">챌린지 시작하기</a>
        </p>
        <p>
        <sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.user.nickname" var="nickname"/>
		     <span class="badge bg-light text-dark">환영합니다 ${nickname}님!</span>
		</sec:authorize>
    	<sec:authorize access="isAnonymous()">
		     <span class="badge bg-light text-dark">로그인 하시면 더 많은 컨텐츠를 즐길 수 있습니다!</span>
		</sec:authorize>
        <p>
      </div>
    </div>
</section>
<hr/>
<!--  헤더  -->