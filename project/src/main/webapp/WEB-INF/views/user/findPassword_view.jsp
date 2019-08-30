<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
<title>아이디,패스워드 찾기 - 택택극장</title>
<!-- Bootstrap core CSS -->
<%-- <link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
<!-- Custom styles for this template -->
<link href="<%=KPath%>/css/small-business.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
<style>
	body {background-color: #e9e7e8;}	
	a:link { color: white; text-decoration: none;}	
	a:visited { color: white; text-decoration: none;}
	a:hover { color: white; text-decoration: none; font-weight: bold;}
	
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
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px; height: 745px;" id="bigDiv">
	<div style="width: 50%; float:none; margin:0 auto; padding-top: 50px;">
		<h4 style="font-weight: 700; padding-top: 35px;">
			아이디,비밀번호 찾기
		</h4><br>
		<label>아이디, 패스워드가 기억나지 않거나 로그인에 문제가 있나요?</label><br>
		<label>아래 입력란에 회원 정보에 기재하신 이메일 주소를 적어주시면 문제 해결 방법을 메일로 보내 드립니다.</label>
	</div><br>
	<div style="width: 50%; float:none; margin:0 auto">
		<div>
		<spring:hasBindErrors name="customUserDetails"/>
		<form:form method="post" commandName="customUserDetails" action="findPassword">
			 <label for="id" style="font-weight: bold;"> 이메일 </label>
			 <input type="text" class="form-control" name="email" placeholder="이메일을 작성해주세요" value="${customUserDetails.email}">
			 <br><input type="submit" value="문제 해결 메일 요청" class="btn btn-primary" style="cursor:pointer">
		</form:form>
		
		<div style="color: red"><form:errors path="customUserDetails.email"/><form:errors/></div>
		<div style="color: red"><form:errors path="customUserDetails"/></div>
		</div>
		<br>
		<div>
			<a href="/loginform" style="color: black">로그인 페이지로 돌아갑니다.</a>
		</div>
		<br>
		<div>
			<a href="/user/register2" style="color: black">아직 회원이 아니신가요? 지금 가입하세요.</a>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
<%-- <script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script> --%>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>