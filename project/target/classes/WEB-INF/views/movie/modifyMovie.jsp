<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form role="form" method="post">
		<input type="hidden" name="m_id" value="${movieVO.m_id }">
		<div>
			<input type="text" name='m_id' class="form-control" 
			value="${movieVO.m_id }" readonly="readonly">
		</div>
		<div>
			<input type="text" name='title' class="form-control" 
			value="${movieVO.title }">
		</div>
		<div>
			<button type="submit" class="modify">완료</button>
			<button type="submit" class="cancel">취소</button>
		</div>
	</form>
	<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".modify").on("click", function(){
			/* formObj.attr("action","/movie/modifyMovie") */;
			/* formObj.attr("method","post"); */
			formObj.submit();
		})
		
		$(".cancel").on("click", function(){
			formObj.attr("method","get");
			formObj.attr("action","/movie/movieList");
			formObj.submit();
		})
	});
	</script>
</body>
</html>