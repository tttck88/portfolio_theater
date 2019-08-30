<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>회원가입 - 택택극장</title>
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
<!-- Page Content -->
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;" id="bigDiv">
<div style="width: 50%; float:none; margin:0 auto">
	<h4 style="font-weight: 700; padding-top: 35px; padding-bottom: 35px;">회원가입</h4>
</div>
<div style="width: 50%; float:none; margin:0 auto">

<form class="form-group" method="post" onsubmit="return formChk()">
	<div class="form-group" style="font-weight: bold;">
	  <label>로그인 정보</label>
	</div>
	<div class="form-group">
	  <label for="username">아이디</label>
	  <input type="text" class="form-control" id="username" name="username"><span id="userMessage" style="color: red; font-size: small;"></span>
	<div style="color: gray; font-size: small;">아이디는 4~12자의 영문 대소문자와 숫자로만 입력</div>
	</div>
	<div class="form-group">
	  <label for="pwd">패스워드</label>
	  <input type="password" class="form-control" id="password" name="password"><span id="passwordMessage" style="color: red; font-size: small;"></span>
	<div style="color: gray; font-size: small;">패스워드는 4~12자의 영문 대소문자와 숫자로만 입력</div>
	</div>
	<div class="form-group">
	  <label for="pwdChk">패스워드 확인</label>
	  <input type="password" class="form-control" id="pwdchk" name="pwdchk"><span id="pwdchkMessage" style="color: red; font-size: small;"></span>
	</div><br>
	<div class="form-group" style="font-weight: bold;">
	  <label style="font-size: larger;">개인 정보</label>
	</div>
	<div class="form-group">
	  <label for="name">이름</label>
	  <input type="text" class="form-control" id="name" name="name"><span id="nameMessage" style="color: red; font-size: small;"></span>
	</div>
	<div class="form-group">
	  <label for="phone">휴대전화번호</label>
	  <input type="text" class="form-control" id="phone" name="phone"><span id="phoneMessage" style="color: red; font-size: small;"></span>
	</div>
	<div class="form-group">
	  <label for="email">이메일</label>
	  <input type="email" class="form-control" id="email" name="email"><span id="emailMessage" style="color: red; font-size: small;"></span>
	</div>
	<!-- <div class="mt-5"><a class="btn btn-primary" href="javascript:void(0)" onclick="formChk(this.form)">회원가입</a></div> -->
	<input type="submit" value="회원가입" class="btn btn-primary" style="cursor:pointer">
	<input type="reset" value="취소" class="btn btn-primary"style="cursor:pointer">
</form>
</div>
</div>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<script>
	var idPwdChk = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    var phoneChk = /^[0-9]{8,11}$/; //전화번호 유효성 검사
    var nameChk = /^[가-힣]{2,4}$/;

function formChk() {
    var username = $("#username").val();
    var password = $("#password").val();
    var pwdchk = $("#pwdchk").val();
    var name = $("#name").val();
    var phone = $("#phone").val();
    var email = $("#email").val();
    
	if(username.length == 0){
		$("#userMessage").html("아이디를 입력해 주세요");
        $("#username").focus();
        return false;
    } else if(idChk(idPwdChk,username)) {
	    return false;
    } else if(checkId()) {
    	return false;
    }
	
    if(password.length == 0){
    	$("#passwordMessage").html("비밀번호를 입력해 주세요");
        $("#password").focus();
        return false;
    } else if(pwdChk(idPwdChk,password)) {
    	return false;
    }
    
    if(password != pwdchk){
    	$("#pwdchkMessage").html("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");
        $("#pwdchk").focus();
        return false; 
    }
 
    if(name.length == 0){
    	$("#nameMessage").html("이름을 입력해 주세요");
        $("#name").focus();
        return false;
    } else if(nameOkChk(nameChk,name)) {
        return false;
    }
    
    if(phone.length == 0){
    	$("#phoneMessage").html("전화번호를 입력해 주세요");
        $("#phone").focus();
        return false;
    } else if(phoneOkChk(phoneChk,phone)) {
    	return false;
    }
    
    if(email.length == 0){
    	$("#emailMessage").html("이메일을 입력해 주세요");
        $("#email").focus();
        return false;
    } else if(emailOkChk(emailChk,email)) {
        return false;
    } else if(checkEmail()) {
    	return false;
    }
    
    if(confirm("회원가입을 하시겠습니까?")){
        alert("회원가입을 축하합니다");
        return true;
    }
}
$('#username').on('change',function(){
	var username = $("#username").val();
	console.log(idPwdChk,username)
	idChk(idPwdChk,username)
	checkId();
});

$('#password').on('change',function(){
	var password = $("#password").val();
	console.log(idPwdChk,password)
	pwdChk(idPwdChk,password)
});

$('#pwdchk').on('change',function(){
	var password = $("#password").val();
	var pwdchk = $("#pwdchk").val();
	console.log(password,pwdchk)
	samePwd(password,pwdchk)
});

$('#name').on('change',function(){
	var name = $("#name").val();
	console.log(nameChk,name)
	nameOkChk(nameChk,name)
});

$('#phone').on('change',function(){
	var phone = $("#phone").val();
	console.log(phoneChk,phone)
	phoneOkChk(phoneChk,phone)
});

$('#email').on('change',function(){
	var email = $("#email").val();
	console.log(emailChk,email)
	emailOkChk(emailChk,email)
	checkEmail();
});

function idChk(idPwdChk,username) {
	if(!check(idPwdChk,username,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
		$("#userMessage").html("아이디는 4~12자의 영문 대소문자와 숫자로만 입력");
	    $("#username").focus();
	    return true;
	}
	$("#userMessage").html("");
}

function checkId() {
	
	var rtn = true;
	var username = $("#username").val();
	$.ajax({
		url: 'checkId',
		data: {"username": username},
		dataType:'text',
		type: 'POST',
		async:false,
		success: function(data){
			console.log("data " + data);
			var str = "";
			if(data == "fail") {
				$("#userMessage").html("이미 존재하는 아이디입니다.");
				$("#username").focus();
			} else {
				rtn = false;
			}
		}
	})
	console.log(rtn);
	return rtn;
}

function pwdChk(idPwdChk,password) {
	if(!check(idPwdChk,password,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
		$("#passwordMessage").html("패스워드는 4~12자의 영문 대소문자와 숫자로만 입력");
	    $("#password").focus();
	    return true;
	}
	$("#passwordMessage").html("");
}

function samePwd(password,pwdchk) {
	if(password != pwdchk) {
		$("#pwdchkMessage").html("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요");
	    $("#pwdchk").focus();
	    return true;
	}
	$("#pwdchkMessage").html("");
}

function nameOkChk(nameChk,name) {
	if(!check(nameChk,name,"적합하지 않은 이름 형식입니다.")) {
		$("#nameMessage").html("적합하지 않은 이름 형식입니다.");
	    $("#name").focus();
	    return true;
	}
	$("#nameMessage").html("");
}

function phoneOkChk(phoneChk,phone) {
	if(!check(phoneChk,phone,"적합하지 않은 휴대전화번호 형식입니다.")) {
		$("#phoneMessage").html("적합하지 않은 휴대전화번호 형식입니다.");
	    $("#phone").focus();
	    return true;
	}
	$("#phoneMessage").html("");
}

function emailOkChk(emailChk,email) {
	if(!check(emailChk,email,"적합하지 않은 이메일 형식입니다.")) {
		$("#emailMessage").html("적합하지 않은 이메일 형식입니다.");
	    $("#email").focus();
	    return true;
	}
	$("#emailMessage").html("");
}

function checkEmail() {
	
	var rtn = true;
	var email = $("#email").val();
	$.ajax({
		url: 'checkEmail',
		data: {"email": email},
		dataType:'text',
		type: 'POST',
		async:false,
		success: function(data){
			console.log("data " + data);
			var str = "";
			if(data == "fail") {
				$("#emailMessage").html("이미 존재하는 이메일입니다..");
				$("#email").focus();
			} else {
				rtn = false;
			}
		}
	})
	console.log(rtn);
	return rtn;
}


function check(re, what, message) {
    if(re.test(what)) {
        return true;
    }
    alert(message);
    console.log(what)
}
</script>
<!-- Bootstrap core JavaScript -->
<%-- <script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script> --%>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>