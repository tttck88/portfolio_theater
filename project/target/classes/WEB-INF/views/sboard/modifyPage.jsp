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
<title>${boardVO.title} - 택택극장</title>

<!-- Bootstrap core CSS -->
<%-- <link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
<!-- Custom styles for this template -->
<link href="<%=KPath%>/css/small-business.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
 -->
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
    border-color: #fffdfd;
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

.note-editing-area {
    position: relative;
    font-weight: normal;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<form role="form" method="post" action="modifyPage">
<div class="container" style="background-color: white;padding-top: 20px;
margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;" id="bigDiv">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		<input type="hidden" name="searchType" value="${cri.searchType}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
		<input type="hidden" name="b_id" value="${boardVO.b_id}">
<div style="width: 50%; float:none;">
	<h4 style="font-weight: 700; padding-top: 10px; padding-bottom: 35px;">글 수정</h4>
</div>
	<div>
		<%-- <div>B_ID <input type="text" name="b_id" value="${boardVO.b_id}" readonly="readonly"></div> --%>
		<div class="form-group" style="font-weight: bold;">
			<label for="title">제목</label>
			<input type="text" id="title" name="title" class="form-control" value="${boardVO.title}">
		</div>
		<div class="form-group" style="font-weight: bold;">
			<label for="title">내용</label>
			<textarea id="summernote" name="content" class="form-control">
				${boardVO.content}
			</textarea>
		</div>
		<%-- <div>id <input type="text" name="id" value="${boardVO.id}" readonly="readonly"></div> --%>
	</div>
	<div style="height: 30px">
	<span class="float-right my-7">
		<button type="submit" class="save btn btn-primary" id="save">저장</button>
		<button type="submit" class="cancel btn btn-primary" id="cancel">취소</button>
	</span>
	</div>
	
</div>
</form>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
	<script>
		$(document).ready(function(){
			
			$('#summernote').summernote({
				height: 400,
			});
			
			var formObj = $("form[role='form']");
			
			console.log(formObj);
			
			$("#save").on("click", function(){
				formObj.submit();
			});
			
			$("#cancel").on("click", function(){
				self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}" + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});
			
		});		
	</script>
<!-- Bootstrap core JavaScript -->
<%-- <script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script> --%>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>