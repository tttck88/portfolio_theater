<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<!-- Navigation -->
<div class="container-fluid" style="padding-left: 0px; padding-right: 0px">
<nav class="navbar navbar-expand-xl navbar-dark">
    <a class="navbar-brand" href="/main/main">택택극장</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a href='#' class="nav-link">택택</a>
        </li>
        <li class="nav-item">
          <a href='/theater/theaterList' class="nav-link">극장</a>
        </li>
        <li class="nav-item">
          <a href='/movie/movieList' class="nav-link">현재상영작</a>
        </li>
        <li class="nav-item">
          <a href='/ticket/ticket' class="nav-link">영화예매</a>
        </li>
        <li class="nav-item">
          <a href='/sboard/list' class="nav-link">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link">문의게시판</a>
        </li>
      </ul>
    </div>
    <div class="collapse navbar-collapse" id="navbarResponsive">
    	<ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <sec:authorize access="isAnonymous()">
        <li class="nav-item">
          <a href='/loginform' class="nav-link">로그인</a>
        </li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
        <li class="nav-item">
		<div>
			<a href="#" onclick="document.getElementById('logout-form').submit();"  class="nav-link">로그아웃</a>
			<form id="logout-form" action='<c:url value='/logout'/>' method="POST">
			   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			</form>
		</div>
		</li>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
		<li class="nav-item">
			<div><a href="/user/register" class="nav-link">회원가입</a></div>
		</li>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
		<li class="nav-item">
			<div><a href="/myPage/myPage" class="nav-link">마이페이지</a></div>
		</li>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
        <li class="nav-item">
          <a href='/admin' class="nav-link">관리자</a>
        </li>
        </sec:authorize>
        </ul>
    </div>
</nav>
</div>
