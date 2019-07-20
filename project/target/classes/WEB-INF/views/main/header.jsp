<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<!-- Navigation -->
<style>
nav {
	background-color: black;
	}
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
.dropdown-menu {background-color: black}
.dropdown .dropdown-menu a{color: rgba(255,255,255,.5); text-decoration: none;}
.dropdown .btn:hover {background: cyan; color:#000;}
.dropdown .btn:active {background: cyan; color:#000;}
.dropdown .btn:focus {background: cyan; color:#000;}
.dropdown-menu .dropdown-item {display: inline-block; width: 100%; padding: 10px 5px;}
.container .dropdown .dropdown-menu a:hover
{
  color: #fff;
  background-color: #2d2c2c;
  border-color: #fff;
}
</style>
<script>
$.getJSON("/theater/theaterList_ajax", function(data) {
	
	var str = "";
	console.log(data);
	
	$(data).each(function(){
		console.log(this.name);
		str += '<a class="dropdown-item" href="/theater/theaterOne?t_id=' + this.t_id + '">' + this.name + '</a>'
	});
	
	$("#theaterList_drop").html(str).trigger("create");
	
})
</script>
<div class="container">
<nav class="navbar navbar-expand-xl navbar-dark fixed-top">
    <a class="navbar-brand" href="/main/main">���ñ���</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a href='#' class="nav-link">����</a>
        </li>
        
		<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		  	����
		</a>
		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<span id="theaterList_drop"></span>
		</div>
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
			<div><a href="/user/register2" class="nav-link">ȸ������</a></div>
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
