<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources";
	
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	
	String name = "";
	if(principal != null) {
		name = auth.getName();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${movieVO.title } - 택택극장</title>
<!-- Bootstrap core CSS -->
<%-- <link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
<!-- Custom styles for this template -->
<link href="<%=KPath%>/css/small-business.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	body {background-color: #e9e7e8;}	
	a:link { color: black; text-decoration: none;}	
	a:visited { color: black; text-decoration: none;}
	a:hover { color: black; text-decoration: none; font-weight: bold;}
	
	ul{
   list-style:none;
   padding-left:0px;
   }
   
.btn-primary {
	color: #fff;
	background-color: #e50914;
	border-color: #e50914
}

.btn-primary:hover {
	color: #fff;
	background-color: #f40612;
	border-color: #f40612
}

.btn-primary.focus, .btn-primary:focus {
	box-shadow: 0 0 0 .2rem rgba(38, 143, 255, .5)
}

#bigDiv {
box-shadow: 0 0 5px rgba(0,0,0,.2);
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<!-- Page Content -->
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;" id="bigDiv">
  <!-- Heading Row -->
  <div class="row">
    <div class="col-lg-5" style="height: 140%">
      <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/movieimg/${movieVO.poster }"
										alt="service thumb" style="height:639.797px; width:100%">
    </div>
    <!-- /.col-lg-8 -->
    <div class="col-lg-6">
      <h1 style="font-weight: 700;">${movieVO.title }</h1>
      <br>
      <ul>
      	<li><strong>감독</strong> ${movieVO.director }</li><br>
      	<li><strong>상영시간</strong> ${movieVO.runningtime }</li><br>
      	<li><strong>장르</strong> ${movieVO.gnr }</li>
      </ul><br>
    	<div style="height:329px">
    		${movieVO.img5}
    	</div><br>
      <div class="mt-50"><a href="/ticket/ticketByMovie?m_id=${movieVO.m_id}" class="btn btn-primary btn-block btn-lg" style="color: white">예매하기</a></div><br>
    </div>
    <!-- /.col-md-4 -->
  </div>
  <!-- /.row -->
  <!-- Content Row -->
  <div class="my-5">
	<ul class="nav nav-tabs">
	  <li class="nav-item">
	    <a class="nav-link active" data-toggle="tab" href="#qwe">작품소개</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab" href="#asd">스틸컷</a>
	  </li>
	</ul>
	
	<div class="tab-content border border-top-0">
	  <div class="tab-pane fade show active text-center" id="qwe">
	  <br><br><br>
	    <p style="color: #757575">${movieVO.content }</p>
	  <br><br><br>
	  </div>
	  <div class="tab-pane fade" id="asd">
		<div class="row">
		    <div class="col-md-4 mb-5">
		      <div class="card h-100">
		        <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/movieimg/${movieVO.img2 }"
											alt="service thumb" style="height:231.375px">
		     </div>
		   </div>
		   <!-- /.col-md-4 -->
		   <div class="col-md-4 mb-5">
		     <div class="card h-100">
		       <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/movieimg/${movieVO.img3 }"
											alt="service thumb" style="height:231.375px">
		     </div>
		   </div>
		   <div class="col-md-4 mb-5">
		     <div class="card h-100">
		       <img class="img-fluid rounded mb-4 mb-lg-0" src="/resources/movieimg/${movieVO.img4 }"
											alt="service thumb" style="height:231.375px">
		     </div>
		   </div>
		   <!-- /.col-md-4 -->
		</div>
	  </div>
	</div>
  <div class="float-right my-3">
  	<a href="/movie/movieList" class="btn btn-primary" style="color: white">목록</a>
  </div>
  </div>
  <!-- /.row -->
<!-- /.container -->
<%--<div>
		<button type="submit" class="modify">수정</button>
		<button type="submit" class="remove">삭제</button>
	</div> --%>
<script>
$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".modify").on("click", function(){
		formObj.attr("action","/movie/modifyMovie");
		formObj.attr("method","get");
		formObj.submit();
	})
	
	$(".remove").on("click", function(){
		formObj.attr("action","/movie/removeMovie");
		formObj.submit();
	})
});
</script>
</div>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
<script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>