<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<!-- Navigation -->
<div class="container-fluid" style="padding-left: 0px; padding-right: 0px">
<nav class="navbar navbar-expand-xl navbar-dark">
    <a class="navbar-brand" href="/main/main">���ñ���</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a href='#' class="nav-link">����</a>
        </li>
        <li class="nav-item">
          <a href='/theater/theaterList' class="nav-link">����</a>
        </li>
        <li class="nav-item">
          <a href='/movie/movieList' class="nav-link">�������</a>
        </li>
        <li class="nav-item">
          <a href='/ticket/ticket' class="nav-link">��ȭ����</a>
        </li>
        <li class="nav-item">
          <a href='/sboard/list' class="nav-link">��������</a>
        </li>
        <li class="nav-item">
          <a class="nav-link">���ǰԽ���</a>
        </li>
      </ul>
    </div>
    <div class="collapse navbar-collapse" id="navbarResponsive">
    	<ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <sec:authorize access="isAnonymous()">
        <li class="nav-item">
          <a href='/loginform' class="nav-link">�α���</a>
        </li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
        <li class="nav-item">
		<div>
			<a href="#" onclick="document.getElementById('logout-form').submit();"  class="nav-link">�α׾ƿ�</a>
			<form id="logout-form" action='<c:url value='/logout'/>' method="POST">
			   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			</form>
		</div>
		</li>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
		<li class="nav-item">
			<div><a href="/user/register" class="nav-link">ȸ������</a></div>
		</li>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
		<li class="nav-item">
			<div><a href="/myPage/myPage" class="nav-link">����������</a></div>
		</li>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
        <li class="nav-item">
          <a href='/admin' class="nav-link">������</a>
        </li>
        </sec:authorize>
        </ul>
    </div>
</nav>
</div>
