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
<meta charset="EUC-KR">
<title>소통창구 - 택택극장</title>
<!-- Bootstrap core CSS -->
<%-- <link href="<%=KPath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
<!-- Custom styles for this template -->
<link href="<%=KPath%>/css/small-business.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 데이트피커 -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->
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
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/main/header.jsp"%>
<div class="container" style="background-color: white;padding-top: 20px;margin-top: 40px;margin-bottom: 40px;padding-bottom: 20px;" id="bigDiv">
	<div style="width: 50%; float:none;">
		<h4 style="font-weight: 700; padding-top: 10px;">공지사항</h4>
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
</div>
<%@ include file="/WEB-INF/views/main/footer.jsp"%>
<script>
$('.window .close').click(function (e) {
    e.preventDefault();
}); 

   
$(document).ready(
		
		function() {
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
<!-- Bootstrap core JavaScript -->
<%-- <script src="<%=KPath%>/vendor/jquery/jquery.slim.min.js"></script> --%>
<script src="<%=KPath%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>