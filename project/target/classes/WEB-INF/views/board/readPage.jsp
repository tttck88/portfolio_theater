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
<style>
#modDiv {
	width: 300px;
	height: 100px;
	background-color: gray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}
</style>
</head>
<body>
	<form role="form" method="post">
		<input type="hidden" name="b_id" value="${boardVO.b_id}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
	</form>
	<div>
		<div>title <input type="text" name="title" value="${boardVO.title}" readonly="readonly"></div>
		<div>${boardVO.content}</div>
		<div>id <input type="text" name="id" value="${boardVO.id}" readonly="readonly"></div>
	</div>
	<div>
		<button type="submit" class="modify">����</button>
		<button type="submit" class="remove">����</button>
		<button type="submit" class="listAll">���</button>
	</div>
	<div id='modDiv' style="display: none;">
		<div class='modal-title'></div>
		<div>
			<input type='text' id='replytext'>
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">DELETE</button>
			<button type="button" id='closeBtn'>Close</button>
		</div>
	</div>
	<ul id="replies"></ul>
	<div>
		<div>
			REPLYER <input type='text' name='replyer' id='newReplyWriter'>
		</div>
		<div>
			REPLY TEXT <input type='text' name='replytext' id='newReplyText'>
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	
	<ul id="replies">
	
	</ul>
	<script>
	var b_id = 1;
	
	$.getJSON("/replies/all/" + b_id, function(data) {
		
		var str = "";
		console.log(data.length);
		
		$(data).each(function(){
			str += "<li data-r_id='"+this.r_id+"' class='replyLi'>"
			+ this.r_id
			+ ":"
			+ this.replytext
			+ "<button>MOD</button></li>";
		});
		
		$("#replies").html(str);
	})
	
	function getAllList(){
		
		$.getJSON("/replies/all/" + b_id, function(data) {
			
			var str = "";
			console.log(data.length);
			
			$(data).each(function(){
				str += "<li data-r_id='"+this.r_id+"' class='replyLi'>"
				+ this.r_id
				+ ":"
				+ this.replytext
				+ "<button>MOD</button></li>";
			});
			
			$("#replies").html(str);
		});
	}
	
	$("#replyAddBtn").on("click", function() {

		var replyer = $("#newReplyWriter").val();
		var replytext = $("#newReplyText").val();

		$.ajax({
			type : 'post',
			url : '/replies',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				b_id : b_id,
				replyer : replyer,
				replytext : replytext
			}),
			success : function(result) {

				if (result == 'SUCCESS') {

					alert("��� �Ǿ����ϴ�.");
					getAllList();

				}
			}
		});
	});
	
	$("#replies").on("click", ".replyLi button", function() {

		var reply = $(this).parent();

		var r_id = reply.attr("data-r_id");
		var replytext = reply.text();
		
			$(".modal-title").html(r_id);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow");

	});
	
	$("#replyDelBtn").on("click", function() {

		var r_id = $(".modal-title").html();
		var replytext = $("#replytext").val();

		$.ajax({
			type : 'delete',
			url : '/replies/' + r_id,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				console.log("result: " + result);
				if (result == 'SUCCESS') {
					alert("���� �Ǿ����ϴ�.");
					$("#modDiv").hide("slow");
					getAllList();
				}
			}
		});
	});
		$(document).ready(function(){
			
			$('#summernote').summernote();
			
			var formObj = $("form[role='form']");
			
			console.log(formObj);
			
			$(".modify").on("click", function(){
				formObj.attr("action", "/board/modifyPage");
				formObj.attr("method", "get");		
				formObj.submit();
			});
			
			$(".remove").on("click", function(){
				formObj.attr("action", "/board/removePage");
				formObj.submit();
			});
			
			$(".listAll").on("click", function(){
				formObj.attr("method", "get");
				formObj.attr("action", "/board/listPage");
				formObj.submit();
			});
			
		});		
	</script>
</body>
</html>