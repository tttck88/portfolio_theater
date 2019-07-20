<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
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
<script>
	$(document).ready(function() {
		  $('#summernote').summernote();
	});
</script>
<body>
<form method="post">
<div>
title
<input type="text" name="title">
</div>
<div>
content
<textarea id="summernote" name="content" ></textarea>
</div>
<div>
id
<input type="text" name="id">
</div>
<div>
<button type="submit">submit</button>
</div>
</form>
</body>
</html>