<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// ��� /biz ���� ����  [http://localhost:8080/biz/ @@.do ��û �ϱ� ����]
	String contextPath = request.getContextPath();
	// theme ���� ���� ��� 
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
<title>ȸ������</title>
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
	<h4 style="font-weight: 700; padding-top: 35px; padding-bottom: 35px;">ȸ������</h4>
</div>
<div style="width: 50%; float:none; margin:0 auto">
<form class="form-group" method="post">
	<div class="form-group" style="font-weight: bold;">
	  <label>�α��� ����</label>
	</div>
	<div class="form-group">
	  <label for="username">���̵�</label>
	  <input type="text" class="form-control" id="username">fasdasd
	</div>
	<div class="form-group">
	  <label for="pwd">�н�����</label>
	  <input type="password" class="form-control" id="password">
	</div>
	<div class="form-group">
	  <label for="pwdChk">�н����� Ȯ��</label>
	  <input type="password" class="form-control" id="pwdchk">
	</div><br>
	<div class="form-group" style="font-weight: bold;">
	  <label>���� ����</label>
	</div>
	<div class="form-group">
	  <label for="name">�̸�</label>
	  <input type="text" class="form-control" id="name">
	</div>
	<div class="form-group">
	  <label for="phone">�޴���ȭ��ȣ</label>
	  <input type="text" class="form-control" id="phone">
	</div>
	<div class="form-group">
	  <label for="email">�̸���</label>
	  <input type="email" class="form-control" id="email">
	</div>
	<div class="mt-5"><a class="btn btn-primary" href="javascript:void(0)" onclick="formChk()">ȸ������</a></div>
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
        alert("���̵� �Է��� �ּ���"); 
        $("#username").focus();
        return false;
    }
    
    if(password.length == 0){
        alert("��й�ȣ�� �Է��� �ּ���"); 
        $("#password").focus();
        return false;
    }
    if(password != pwdchk){
        alert("��й�ȣ�� ���� �ٸ��ϴ�. ��й�ȣ�� Ȯ���� �ּ���."); 
        $("#pwdchk").value() = "";
        $("#pwdchk").focus();
        return false; 
    }
 
    if(name.length == 0){
        alert("�̸��� �Է����ּ���");
        $("#name").focus();
        return false;
    }
    
    if(phone.length == 0){
        alert("�޴���ȭ��ȣ�� �Է����ּ���");
        $("#phone").focus();
        return false;
    }
    
    if(email.length == 0){
        alert("�̸����� �Է����ּ���");
        $("#email").focus();
        return false;
    }
    
    if(confirm("ȸ�������� �Ͻðڽ��ϱ�?")){
        alert("ȸ�������� �����մϴ�");
        return true;
    }
    
}
</script>
<!-- Bootstrap core JavaScript -->
<script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>