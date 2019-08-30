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
	System.out.println("principal " + principal);
	System.out.println("auth.getName() " + auth.getName());
	if(principal != "anonymousUser") {
		name = auth.getName();
	} else {
		name = "guest";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

#bigDiv {
box-shadow: 0 0 5px rgba(0,0,0,.2);
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<div class="container" style="background-color: white;padding-top: 20px;
margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;background-color: #e9e7e8;">
	<form role="form" method="post">
		<input type="hidden" name="b_id" value="${boardVO.b_id}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
		<input type="hidden" name="searchType" value="${cri.searchType}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
	</form>
	<div style="width: 50%; float:none;">
		<h4 style="font-weight: 700; padding-top: 10px;">공지사항</h4>
	</div>
	<div id="bigDiv" style="background-color: white">
		<div style="background-color: #e9e7e870; font-weight: bold;">
			<div style="border-bottom: 1px solid #e9e7e8; padding-top: 15px;padding-bottom: 15px;padding-left: 30px;padding-right: 30px;">${boardVO.title}</div>
		</div>
		<div>
			<div style="border-bottom: 1px solid #e9e7e8; padding-top: 10px;padding-bottom: 10px;padding-left: 30px;padding-right: 30px;">
				<span style="font-weight: bold;">${boardVO.id}</span>
				<span style="float: right;">${boardVO.regdate}</span>
			</div>
		</div>
		<div>
			<div style="padding-top: 50px;padding-bottom: 50px;padding-left: 30px;padding-right: 30px;">${boardVO.content}</div>
		</div>
	</div>
	<div style="height: 40px;">
	</div>
	<div id="bigDiv" style="background-color: #e50914; margin-bottom: 10px;">
	<div style="border-bottom: 1px solid #e9e7e8;">
		<div style="padding-top: 10px; padding-bottom: 10px; padding-left: 30px; color:white">
			comment ${boardVO.replycnt}
		</div>
	</div>
	</div>
	<!-- <ul id="replies" style="padding-top: 15px;padding-bottom: 15px;padding-left: 30px;padding-right: 30px;"></ul> -->
	<span id="replies"></span>
	<div style="height: 40px;">
	</div>
	<div id="bigDiv" style="background-color: white">
	<span id="replyDiv"></span>
	<!-- <div style="padding-top: 15px;padding-bottom: 15px;padding-left: 30px;padding-right: 30px;" id="replyDiv">
		<div>
			REPLYER <input type='text' name='replyer' id='newReplyWriter'>
		</div>
		<div>
			REPLY TEXT <input type='text' name='replytext' id='newReplyText'>
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div> -->
	</div>
	<div id='modDiv' style="display: none;">
		<div class='modal-title'></div>
		<div>
			<input type='text' id='replytext'>
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">DELETE</button>
			<button type="button" id='closeBtn' data-dismiss="modal">Close</button>
		</div>
	</div>
	<div style="height: 40px;">
	</div>
	<div>
		<button type="submit" class="modify btn btn-primary" id="modify">수정</button>
		<button type="submit" class="remove btn btn-primary" id="remove">삭제</button>
		<button type="submit" class="listAll btn btn-primary">목록</button>
	</div>
	<script>
	var name;
	name = "<%=name%>";
	var id = "${boardVO.id}";
	console.log("name ---- "+name);
	console.log("id ---- "+id);
	if(name != id) {
		console.log("name // id " + name + "//" + id)
		$("#modify").hide();
		$("#remove").hide();
	}
	if(name != "guest") {
/* 		$("#replyDiv").hide(); */
		var str = "";
		
		str += "<div style='padding-top: 15px; padding-bottom: 15px; padding-left: 30px; padding-right: 30px;' id='replyDiv'>"
		+ "<div><input type='text' name='replyer' id='newReplyWriter' value='" + <%=name%> + "' style='display:none'>"
		+ "</div>"
		+ "<div><textarea class='form-control 'name='replytext' id='newReplyText' rows='5' required wrap='hard' style='resize: none;'></textarea></div>"
		+ "<div style='height: 40px;'>"
		+ "<button id='replyAddBtn' class='btn btn-primary' style='float: right; margin-top: 10px;'>등록</button></div>"
		+ "</div>"
		
		$("#replyDiv").html(str);
	}
	
	
	var b_id = "${boardVO.b_id}";
	
	$.getJSON("/replies/all/" + b_id, function(data) {
		
		var str = "";
		console.log(data.length);
		console.log(data);
		if(data.length==0) {
			str += "<div id='bigDiv' style='background-color: white'>"
				+ "<div style='padding-top: 15px;padding-bottom: 15px;padding-left: 30px;padding-right: 30px;margin-bottom: 10px;'>"
				+ "아직까지 남겨진 코멘트가 없습니다. "
				+ "${boardVO.id}"
				+ "님의 글에 코멘트를 남겨주세요!"
				+ "</div>"
				+ "</div>"
			
		}
		if(data.length!=0) {
		$(data).each(function(){
			str += "<div id='bigDiv' style='background-color: white'>"
			+ "<div style='border-bottom: 1px solid #e9e7e8; background-color: #e9e7e870;'>"
			+ "<div style='padding-top: 10px; padding-bottom: 10px; padding-left: 30px;'>"
			+ "<span style='font-weight: bold;'>"
			+ this.replyer
			+ "</span>"
			+ "<span style='float: right; padding-right: 10px;'>"
			+ this.regdate
			+ "</span>"
			+ "</div>"
			+ "</div>"
			+ "<div data-r_id='"+this.r_id+"' class='replyLi' + style='padding-top: 15px;padding-bottom: 15px;padding-left: 30px;padding-right: 30px;margin-bottom: 10px;'>"
			+ this.replytext
			console.log(name);
			if(name == this.replyer) {
				console.log(name + "====" + this.replyer)
				str += "<button id='mod' class='btn btn-primary' value='" + this.replyer + "' style='margin-left: 10px;'>MOD</button></div></div>"
			}
			if(name != this.replyer) {
				str += "</div></div>"
			}
		});
		
		}
		$("#replies").html(str);
	})
	
	function getAllList(){
		
		$.getJSON("/replies/all/" + b_id, function(data) {
			
			var str = "";
			console.log(data.length);
			if(data.length==0) {
				str += "<div id='bigDiv' style='background-color: white'>"
					+ "<div style='padding-top: 15px;padding-bottom: 15px;padding-left: 30px;padding-right: 30px;margin-bottom: 10px;'>"
					+ "아직까지 남겨진 코멘트가 없습니다. "
					+ "${boardVO.id}"
					+ "님의 글에 코멘트를 남겨주세요!"
					+ "</div>"
					+ "</div>"
				
			}
			if(data.length!=0) {
			$(data).each(function(){
				str += "<div id='bigDiv' style='background-color: white'>"
				+ "<div style='border-bottom: 1px solid #e9e7e8; background-color: #e9e7e870;'>"
				+ "<div style='padding-top: 10px; padding-bottom: 10px; padding-left: 30px;'>"
				+ this.replyer
				+ "</div>"
				+ "</div>"
				+ "<div data-r_id='"+this.r_id+"' class='replyLi' + style='padding-top: 15px;padding-bottom: 15px;padding-left: 30px;padding-right: 30px;margin-bottom: 10px;'>"
				+ this.replytext
				console.log(name);
				if(name == this.replyer) {
					console.log(name + "====" + this.replyer)
					str += "<button id='mod' class='btn btn-primary' value='" + this.replyer + "' style='margin-left: 10px;'>MOD</button></div></div>"
				}
				if(name != this.replyer) {
					str += "</div></div>"
				}
			});
			}
			
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
	
/* 	$("#replyModBtn").on("click",function(){
		  
		  var r_id = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage );
					}
			}});
	}); */
	
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
		$(document).ready(function(){
			
			$('#summernote').summernote();
			
			var formObj = $("form[role='form']");
			
			console.log(formObj);
			
			$(".modify").on("click", function(){
				formObj.attr("action", "/sboard/modifyPage");
				formObj.attr("method", "get");		
				formObj.submit();
			});
			
			$(".remove").on("click", function(){
				formObj.attr("action", "/sboard/removePage");
				formObj.submit();
			});
			
			$(".listAll").on("click", function(){
				formObj.attr("method", "get");
				formObj.attr("action", "/sboard/list");
				formObj.submit();
			});
			
		});		
	</script>
</div>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<!-- Bootstrap core JavaScript -->
<%-- <script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script> --%>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>