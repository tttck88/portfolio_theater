<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
	
	<h2>Test</h2>
	
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

						alert("등록 되었습니다.");
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
						alert("삭제 되었습니다.");
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			});
		});
	</script>
</body>
</html>