<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
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
<title>회원가입</title>
<!-- Bootstrap core CSS -->
<link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=KPath%>/css/small-business.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	body {background-color: #e9e7e8;}	
	a:link { color: white; text-decoration: none;}	
	a:visited { color: white; text-decoration: none;}
	a:hover { color: white; text-decoration: none; font-weight: bold;}
	
	ul{
   list-style:none;
   padding-left:0px;
   }

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<!-- Page Content -->
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;">
<div style="width: 50%; float:none; margin:0 auto">
	<h4 style="font-weight: 700; padding-top: 35px; padding-bottom: 35px;">회원가입</h4>
</div>
<div style="width: 50%; float:none; margin:0 auto">
<form class="form-group" method="post">
	<div class="form-group" style="font-weight: bold;">
	  <label>로그인 정보</label>
	</div>
	<div class="form-group">
	  <label for="username">아이디</label>
	  <input type="text" class="form-control" id="username">fasdasd
	</div>
	<div class="form-group">
	  <label for="pwd">패스워드</label>
	  <input type="password" class="form-control" id="password">
	</div>
	<div class="form-group">
	  <label for="pwdChk">패스워드 확인</label>
	  <input type="password" class="form-control" id="pwdchk">
	</div><br>
	<div class="form-group" style="font-weight: bold;">
	  <label>개인 정보</label>
	</div>
	<div class="form-group">
	  <label for="name">이름</label>
	  <input type="text" class="form-control" id="name">
	</div>
	<div class="form-group">
	  <label for="phone">휴대전화번호</label>
	  <input type="text" class="form-control" id="phone">
	</div>
	<div class="form-group">
	  <label for="email">이메일</label>
	  <input type="email" class="form-control" id="email">
	</div>
	<div class="mt-5"><a class="btn btn-primary" href="javascript:void(0)" onclick="formChk()">회원가입</a></div>
</form>
</div>
</div>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<script>
function formChk() {
    
    var username = $("#username").val();
    var password = $("#password").val();
    var pwdchk = $("#pwdchk").val();
    var name = $("#name").val();
    var phone = $("#phone").val();
    var email = $("#email").val();
    
    if(username.length == 0){
        alert("아이디를 입력해 주세요"); 
        $("#username").focus();
        return false;
    }
    
    if(password.length == 0){
        alert("비밀번호를 입력해 주세요"); 
        $("#password").focus();
        return false;
    }
    if(password != pwdchk){
        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
        $("#pwdchk").value() = "";
        $("#pwdchk").focus();
        return false; 
    }
 
    if(name.length == 0){
        alert("이름을 입력해주세요");
        $("#name").focus();
        return false;
    }
    
    if(phone.length == 0){
        alert("휴대전화번호를 입력해주세요");
        $("#phone").focus();
        return false;
    }
    
    if(email.length == 0){
        alert("이메일을 입력해주세요");
        $("#email").focus();
        return false;
    }
    
    if(confirm("회원가입을 하시겠습니까?")){
        alert("회원가입을 축하합니다");
        return true;
    }
    
}
</script>
<!-- Bootstrap core JavaScript -->
<script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>