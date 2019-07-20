<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form role="form" method="post">
		<input type="hidden" name="b_id" value="${boardVO.b_id}">
	</form>
	<div>
		<div>title <input type="text" name="title" value="${boardVO.title}" readonly="readonly"></div>
		<div>${boardVO.content}</div>
		<div>id <input type="text" name="id" value="${boardVO.id}" readonly="readonly"></div>
	</div>
	<div>
		<button type="submit" class="modify">수정</button>
		<button type="submit" class="remove">삭제</button>
		<button type="submit" class="listAll">목록</button>
	</div>
	<script>
		$(document).ready(function(){
			
			$('#summernote').summernote();
			
			var formObj = $("form[role='form']");
			
			console.log(formObj);
			
			$(".modify").on("click", function(){
				formObj.attr("action", "/board/modify");
				formObj.attr("method", "get");		
				formObj.submit();
			});
			
			$(".remove").on("click", function(){
				formObj.attr("action", "/board/remove");
				formObj.submit();
			});
			
			$(".listAll").on("click", function(){
				self.location = "/board/listAll";
			});
			
		});		
	</script>
</body>
</html>