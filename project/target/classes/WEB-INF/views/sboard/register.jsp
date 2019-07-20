<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	$(function(){
		$('#summernote').summernote({
                height: 400,
                /* callbacks: {
    				onImageUpload: function(files, editor, welEditable) {
    					sendFile(files[0], editor, welEditable);
    		        }
    			} */
		});
	});
	
	function sendFile(file, editor, welEditable) {
		formData = new FormData();
		formData.append("file", file);
		console.log(file);
		var sss = "/2019/06/20/aa.png";
	    $.ajax({
	    	url: 'uploadAjax',
			data: formData,
			dataType:'text',
			processData: false,
			contentType: false,
			type: 'POST',
	        success : function(data) {
	        	console.log(data);
	        	console.log(data.url);
	            /* editor.insertImage(welEditable, data.url); */
	        }
	    });
	}

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