<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<select name="searchType">
			<option value="n"
				<c:out value="${cri.searchType == null?'selected':''}"/>>
				---</option>
			<option value="t"
				<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
				Title</option>
			<option value="c"
				<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
				Content</option>
			<option value="w"
				<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
				Writer</option>
			<option value="tc"
				<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
				Title OR Content</option>
			<option value="cw"
				<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
				Content OR Writer</option>
			<option value="tcw"
				<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
				Title OR Content OR Writer</option>			
		</select>
		<input type="text" name='keyword' id="keywordInput"	value='${cri.keyword }'>
		<button id='searchBtn'>Search</button>
		<button id='newBtn'>New Board</button>
	</div>
	<table>
	<tr>
		<th>b_id</th>
		<th>title</th>
		<th>id</th>
		<th>regdate</th>
		<th>hit</th>
	</tr>
	<c:forEach var="boardVO" items="${list}">
		<tr>
			<td>${boardVO.b_id}</td>
			<td><a
				href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&b_id=${boardVO.b_id}'>
					${boardVO.title} </a><strong>[ ${boardVO.replycnt} ]</strong></td>
			<td>${boardVO.id}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
					value="${boardVO.regdate}" /></td>
			<td><span class="badge bg-red">${boardVO.hit }</span></td>
		</tr>
	</c:forEach>
	</table>
		<div class="text-center">
			<ul class="pagination">

				<c:if test="${pageMaker.prev}">
					<li><a
						href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
				</c:if>

			</ul>
		</div>
<script>
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
</body>
</html>