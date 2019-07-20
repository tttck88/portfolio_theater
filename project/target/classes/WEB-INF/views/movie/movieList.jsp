<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=KPath%>/css/small-business.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	 body {background-color: #e9e7e8;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;">
    <!-- Page Features -->
    <div class="row text-center">
	<c:forEach var="movieVO" items="${list}">
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="/resources/movieimg/${movieVO.poster }" alt="">
          <div class="card-body">
            <h4 class="card-title">${movieVO.title}</h4>
            <p class="card-text">감독 : ${movieVO.director}</p>
          </div>
          <div class="card-footer">
            <a href="/movie/readMovie?m_id=${movieVO.m_id}" class="btn btn-primary">상세보기</a>
            <a href="/ticket/ticketByMovie?m_id=${movieVO.m_id}" class="btn btn-primary">예매하기</a>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="/resources/movieimg/${movieVO.poster }" alt="">
          <div class="card-body">
            <h4 class="card-title">${movieVO.title}</h4>
            <p class="card-text">감독 : ${movieVO.director}</p>
          </div>
          <div class="card-footer">
            <a href="/movie/readMovie?m_id=${movieVO.m_id}" class="btn btn-primary">상세보기</a>
            <a href="/ticket/ticketByMovie?m_id=${movieVO.m_id}" class="btn btn-primary">예매하기</a>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="/resources/movieimg/${movieVO.poster }" alt="">
          <div class="card-body">
            <h4 class="card-title">${movieVO.title}</h4>
            <p class="card-text">감독 : ${movieVO.director}</p>
          </div>
          <div class="card-footer">
            <a href="/movie/readMovie?m_id=${movieVO.m_id}" class="btn btn-primary">상세보기</a>
            <a href="/ticket/ticketByMovie?m_id=${movieVO.m_id}" class="btn btn-primary">예매하기</a>
          </div>
        </div>
      </div>
	</c:forEach>
    </div>
    <!-- /.row -->
</div>
<!-- /.container -->
<button id="register">영화등록</button>
	<script>
		$(document).ready(
			function() {
				$('#register').on("click", function(evt) {
					
					self.location = "registerMovie";
				});
		});
	</script>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
<script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>