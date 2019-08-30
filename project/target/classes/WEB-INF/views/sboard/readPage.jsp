<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
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
	<!-- <div id='modDiv' style="display: none;">
		<div class='modal-title'></div>
		<div>
			<input type='text' id='replytext'>
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">DELETE</button>
			<button type="button" id='closeBtn' data-dismiss="modal">Close</button>
		</div>
	</div> -->
	<div style="height: 40px;">
	</div>
	<div>
		<button type="submit" class="modify btn btn-primary" id="modify">수정</button>
		<button type="submit" class="remove btn btn-primary" id="remove">삭제</button>
		<!-- <button type="submit" class="listAll btn btn-primary">목록</button> -->
	</div>
</div>

<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;" id="bigDiv">
<div style="width: 50%; float:none;">
		<h4 style="font-weight: 700; padding-top: 10px;"></h4>
	</div>
	<div class="input-group  float-right" class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" 
		style="width: 400px;padding-bottom: 15px;padding-top: 0px;">
		<select name="searchType" class="form-control">
			<option value="n"
				<c:out value="${cri.searchType == null?'selected':''}"/>>
				---</option>
			<option value="t"
				<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
				제목</option>
			<option value="c"
				<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
				내용</option>
			<option value="w"
				<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
				작성자</option>
			<option value="tc"
				<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
				제목 OR 내용</option>
			<%-- <option value="cw"
				<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
				내용 OR 작성자</option>
			<option value="tcw"
				<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
				제목 OR 내용 OR 작성자</option>	 --%>		
		</select>
		<input type="text" name='keyword' id="keywordInput"	value='${cri.keyword }' class="form-control">
		<button id='searchBtn' class="btn btn-primary" style="margin-left: 5px;">검색</button>
	</div>
	<table class="table table-hover">
	<thead>
	<tr class="text-center">
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="boardVO" items="${list}">
		<tr>
			<td style="width: 8%;" class="text-center">${boardVO.b_id}</td>
			<td style="width: 60%;"><a
				href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&b_id=${boardVO.b_id}'>
					${boardVO.title} </a><strong>[ ${boardVO.replycnt} ]</strong></td>
			<td style="width: 10%; font-weight: bold;" class="text-center">${boardVO.id}</td>
			<td style="width: 15%;" class="text-center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
					value="${boardVO.regdate}" /></td>
			<td style="width: 8%;" class="text-center"><span class="badge bg-red">${boardVO.hit }</span></td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	<div style="height: 30px">
	<span class="float-right">
		<button id='newBtn' class="btn btn-primary">글 작성</button>
	</span>
	</div>
	<div class="center-block">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }" class="page-link">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<%-- <li	<c:out value="${pageMaker.cri.page == idx?'class =page-item active':'class =page-item'}"/> id="${idx}" value="${idx}">
					<a href="list${pageMaker.makeSearch(idx)}" class="page-link">${idx}</a>
				</li> --%>
				<li	id="${idx}" value="${idx}">
				<c:if test="${pageMaker.cri.page == idx}">
					<li class="page-item active">
						<a href="list${pageMaker.makeSearch(idx)}" class="page-link">${idx}</a>
					</li>
				</c:if>
				<c:if test="${pageMaker.cri.page != idx}">
					<li class="page-item">
						<a href="list${pageMaker.makeSearch(idx)}" class="page-link">${idx}</a>
					</li>
				</c:if>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item"><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }" class="page-link">&raquo;</a></li>
			</c:if>
		</ul>
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
	if(name != "anonymousUser") {
/* 		$("#replyDiv").hide(); */
		var str = "";
		
		str += "<div style='padding-top: 15px; padding-bottom: 15px; padding-left: 30px; padding-right: 30px;' id='replyDiv'>"
		+ "<div><input type='text' name='replyer' id='newReplyWriter' value='" + name + "' style='display:none'>"
		+ "</div>"
		+ "<div><textarea class='form-control 'name='replytext' id='newReplyText' rows='5' required wrap='hard' style='resize: none;'></textarea></div>"
		+ "<div style='height: 40px;'>"
		+ "<button id='replyAddBtn' class='btn btn-primary' style='float: right; margin-top: 10px;'>등록</button></div>"
		+ "</div>"
		
		$("#replyDiv").html(str);
	}
	
	
	var b_id = "${boardVO.b_id}";
	
	$.getJSON("/replies/all/" + b_id, function(data) {
		
		var originid = "";
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
				+ "<div style='padding-top: 10px; padding-bottom: 10px; padding-left: 30px; font-weight: bold;font-size: large;'>"
				+ this.replyer
				if(name == this.replyer && name != "anonymousUser") {
					str += "<span><button id='mod' onclick='replyMod(" + this.r_id + ")' class='btn btn-primary btn-sm' value='" + this.replyer + "' style='margin-left: 10px;'>수정</button>"
					+ "<button id='delete' onclick='replyDel(" + this.r_id + ")' class='btn btn-primary btn-sm' value='" + this.replyer + "' style='margin-left: 10px;'>삭제</button>"
					+ "<button id='replyAdd' onclick='replyAdd(" + this.r_id + ")' class='btn btn-primary btn-sm' value='" + this.r_id + "' style='margin-left: 10px;'>답글달기</button></span>"
				}
				if(name != this.replyer && name != "anonymousUser") {
					str +=  "<button id='replyAdd' onclick='replyAdd(" + this.r_id + ")' class='btn btn-primary btn-sm' value='" + this.r_id + "' style='margin-left: 10px;'>답글달기</button>"
				}
				str += "<span style='float: right;margin-right: 10px;font-weight: normal;'>" + this.regdate + "</span>"
				+ "</div>"
				+ "</div>"
				+ "<div data-r_id='"+this.r_id+"' id='text" + this.r_id + "'" + "class='replyLi' + style='padding-top: 15px;padding-bottom: 15px;padding-left: 30px;padding-right: 30px;margin-bottom: 10px;'>"
				+ this.replytext
				+ "</div></div>"
				+ "<span id=" + this.r_id + ">"
				+ "</span>"
				+ "<span id=replyreply" + this.originId + ">"
				+ "</span>"
				
				console.log("this " + this);
				console.log("this.originid " + this.originId);
				
				originId = this.originId;
				$.ajax({
					url: '/replies/allReply',
					data: {"originId": originId},
					dataType:'json',
					type: 'POST',
					success: function(result){
							var replyStr = "";
						$(result).each(function(){
							console.log("replyreply " +this.originId);
							
							replyStr += "<div id='bigDiv' style='background-color: white; margin-left: 30px;'>"
								+ "<div style='border-bottom: 1px solid #e9e7e8; background-color: #e9e7e870;'>"
								+ "<div style='padding-top: 10px; padding-bottom: 10px; padding-left: 30px; font-weight: bold;font-size: large;'>"
								+ "<span>"
								+ "답글 : " + this.replyer
								+ "</span>"
								+ "<span style='float: right;margin-right: 10px;font-weight: normal;'>" + this.regdate + "</span>"
								+ "</div>"
								+ "</div>"
								+ "<div data-r_id='"+this.r_id+"' class='replyLi' + style='padding-top: 15px;padding-bottom: 15px;padding-left: 30px;padding-right: 30px;margin-bottom: 10px;'>"
								+ this.replytext
								+"</div></div>"
								
							$("#replyreply" + this.originId).html(replyStr);
						})
					},
					error : function(request, status, error ){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
				})
			});
		}
		$("#replies").html(str);
	})
	
	function getAllList(){
		
		$.getJSON("/replies/all/" + b_id, function(data) {
			
			var originid = "";
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
					+ "<div style='padding-top: 10px; padding-bottom: 10px; padding-left: 30px; font-weight: bold;font-size: large;'>"
					+ this.replyer
					if(name == this.replyer && name != "anonymousUser") {
						str +=  "<span><button id='mod' onclick='replyMod(" + this.r_id + ")' class='btn btn-primary' value='" + this.replyer + "' style='margin-left: 10px;'>수정</button>"
						+ "<button id='delete' onclick='replyDel(" + this.r_id + ")' class='btn btn-primary' value='" + this.replyer + "' style='margin-left: 10px;'>삭제</button>"
						+ "<button id='replyAdd' onclick='replyAdd(" + this.r_id + ")' class='btn btn-primary' value='" + this.r_id + "' style='margin-left: 10px;'>답글달기</button></span>"
					}
					if(name != this.replyer && name != "anonymousUser") {
						str +=  "<button id='replyAdd' onclick='replyAdd(" + this.r_id + ")' class='btn btn-primary' value='" + this.r_id + "' style='margin-left: 10px;'>답글달기</button>"
					}
					str += "<span style='float: right;margin-right: 10px;font-weight: normal;'>" + this.regdate + "</span>"
					+ "</div>"
					+ "</div>"
					+ "<div data-r_id='"+this.r_id+"' id='text" + this.r_id + "'" + "class='replyLi' + style='padding-top: 15px;padding-bottom: 15px;padding-left: 30px;padding-right: 30px;margin-bottom: 10px;'>"
					+ this.replytext
					+ "</div></div>"
					+ "<span id=" + this.r_id + ">"
					+ "</span>"
					+ "<span id=replyreply" + this.originId + ">"
					+ "</span>"
					
					console.log("this " + this);
					console.log("this.originid " + this.originId);
					
					originId = this.originId;
					$.ajax({
						url: '/replies/allReply',
						data: {"originId": originId},
						dataType:'json',
						type: 'POST',
						success: function(result){
								var replyStr = "";
							$(result).each(function(){
								console.log("replyreply " +this.originId);
								
								replyStr += "<div id='bigDiv' style='background-color: white; margin-left: 30px;'>"
									+ "<div style='border-bottom: 1px solid #e9e7e8; background-color: #e9e7e870;'>"
									+ "<div style='padding-top: 10px; padding-bottom: 10px; padding-left: 30px; font-weight: bold;font-size: large;'>"
									+ "답글 : " + this.replyer
									+ "</div>"
									+ "</div>"
									+ "<div data-r_id='"+this.r_id+"' class='replyLi' + style='padding-top: 15px;padding-bottom: 15px;padding-left: 30px;padding-right: 30px;margin-bottom: 10px;'>"
									+ this.replytext
									+"</div></div>"
									
								$("#replyreply" + this.originId).html(replyStr);
							})
						},
						error : function(request, status, error ){
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

						}
					})
				});
			}
			$("#replies").html(str);
		});
	}
	
	function close() {
		$(".reply_Mod").html("");
	}
	
	function replyAdd(r_id) {
		close();
		console.log("replyAdd" + r_id);
		var r_id = r_id;
		
		$.ajax({
			url: '/replies/replyAdd',
			data: {"r_id": r_id},
			dataType:'json',
			type: 'POST',
			success: function(data){
				console.log(data);
				console.log(data.originId);
				console.log(data.groupOrd);
				console.log(data.groupLayer);
				console.log(data.replyer);
				var r_id = data.r_id;
				var str = "";
				
				str += "<div class='reply_Mod' id='reply" + data.r_id + "' style='background-color: white; box-shadow: 0 0 5px rgba(0,0,0,.2);'>"
					+ "<div style='padding-top: 15px; padding-bottom: 15px; padding-left: 30px; padding-right: 30px; margin-bottom: 30px;' id='replyDiv'>"
					+ "<div><input type='text' name='replyReplyWriter' id='replyReplyWriter' value='" + name + "' style='display:none'>"
					+ "</div>"
					+ "<div><input type='text' name='originId' id='originId' value='" + data.originId + "' style='display:none'>"
					+ "</div>"
					
					+ "<div style='padding-top: 10px; padding-bottom: 10px; padding-left: 30px; font-weight: bold;font-size: large;'>"
					+ data.replyer + "님에게 답글 달기"
					+ "</div>"
					
					+ "<div><textarea class='form-control 'name='replyReplytext' id='replyReplytext' rows='5' required wrap='hard' style='resize: none;'></textarea></div>"
					+ "<div style='height: 40px;'>"
					+ "<button id='replyreplyAddBtn' onclick='replyreplycancel(" + data.r_id + ")' class='btn btn-primary' style='float: right; margin-top: 10px; margin-left : 10px;'>취소</button>"
					+ "<button id='replyreplyAddBtn' onclick='replyreply()' class='btn btn-primary' style='float: right; margin-top: 10px;'>등록</button></div>"
					+ "</div>"
					+ "</div>"
					
					$("#"+r_id).html(str);
			}
		})
	}
	
	
	$("#replyAddBtn").on("click", function() {
		
		var replyer = $("#newReplyWriter").val();
		var replytext = $("#newReplyText").val();
		
		if(replytext.length == 0){
			alert("내용을 입력해주시기 바랍니다.");
			return false;
		}

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
					$("#newReplyText").val("");
					getAllList();

				}
			}
		});
	});
	
	function replyreply() {
		console.log("replyreply");

		var replyer = $("#replyReplyWriter").val();
		var replytext = $("#replyReplytext").val();
		var originId = $("#originId").val();
		
		if(replytext.length == 0){
			alert("내용을 입력해주시기 바랍니다.");
			return false;
		}
		
		console.log("replyer " + replyer);
		console.log("replytext " + replytext);
		console.log("originId " + originId);

		$.ajax({
			type : 'post',
			url : '/replies/replyRegister',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				b_id : b_id,
				originId : originId,
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
	}
	
	function replyreplycancel(r_id){
		$("#reply"+r_id).html("");
	}
	
	
	function replyMod(r_id) {
		close();
		
		var reply = $(this).parent();
		
		console.log($(this).parent());
		console.log(this);
		console.log(r_id);
		console.log(reply.attr("data-r_id"));
		console.log($("#text"+r_id).html());
		console.log($("#text"+r_id).text());
		var arr = reply.text().split("수정");
		arr[0];
		console.log(arr[0]);


		var r_id = r_id;
		var replytext = $("#text"+r_id).text();
		
		var str = "";
		
		str += "<div class='reply_Mod' id='reply" + r_id + "' style='background-color: white; box-shadow: 0 0 5px rgba(0,0,0,.2);'>"
		+ "<div style='padding-top: 15px; padding-bottom: 15px; padding-left: 30px; padding-right: 30px; margin-bottom: 30px;' id='replyDiv'>"
		+ "<div><textarea class='form-control 'name='replyReplytext' id='replytext' rows='5' required wrap='hard' style='resize: none;'>"
		+ replytext
		+ "</textarea></div>"
		+ "<div style='height: 40px;'>"
		+ "<button id='replyreplyAddBtn' onclick='replyreplycancel(" + r_id + ")' class='btn btn-primary' style='float: right; margin-top: 10px; margin-left : 10px;'>취소</button>"
		+ "<button id='replyreplyAddBtn' onclick='replyModBtn(" + r_id + ")' class='btn btn-primary' style='float: right; margin-top: 10px;'>등록</button></div>"
		+ "</div>"
		+ "</div>"
		
		$("#"+r_id).html(str);
		
		
		$(".modal-title").html(r_id);
		$("#replytext").val(replytext);
		$("#modDiv").show("slow");

	};
	
	function replyModBtn(r_id) {
		var r_id = r_id;
		var replytext = $("#replytext").val();
		
		$.ajax({
			type:'put',
			url:'/replies/'+r_id,
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "PUT" },
			data:JSON.stringify({replytext:replytext}), 
			dataType:'text', 
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("수정 되었습니다.");
					getAllList()
				}
		}});
		
	}
	
		
	function replyDel(r_id) {

		var r_id = r_id;
		
		var ok = confirm("삭제 하시겠습니까?")
		if(ok == true){

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
					getAllList();
				}
			}
		});
	}
	};
	
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
				var ok = confirm("삭제 하시겠습니까?");
				if(ok == true) {
					
				formObj.attr("action", "/sboard/removePage");
				formObj.submit();
				}
			});
			
			$(".listAll").on("click", function(){
				formObj.attr("method", "get");
				formObj.attr("action", "/sboard/list");
				formObj.submit();
			});
			
			$('#searchBtn').on(
					"click",
					function(event) {

						str = "list"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
								
						console.log(str);
						
						self.location = str;

					});

			$('#newBtn').on("click", function(evt) {

				self.location = "register";

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